<?php

namespace App\Http\Controllers\Front;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\PackageHistory;
use Paypal;

class ChargeController extends BaseFrontController
{
    
    protected $plans = [
    	'plan1' => ['price' => 5, 'name' => 'Basic'],
    	'plan2' => ['price' => 10, 'name' => 'Standard'],
    	'plan3' => ['price' => 15, 'name' => 'Advance'],
    	'plan4' => ['price' => 25, 'name' => 'Professional']
    	];


    public function __construct()
    {
        $this->middleware('auth');
        $this->_apiContext = PayPal::ApiContext(
            config('services.paypal.client_id'),
            config('services.paypal.secret'));

        $this->_apiContext->setConfig(array(
            'mode' => 'sandbox',
            'service.EndPoint' => 'https://api.sandbox.paypal.com',
            'http.ConnectionTimeOut' => 30,
            'log.LogEnabled' => true,
            'log.FileName' => storage_path('logs/paypal.log'),
            'log.LogLevel' => 'FINE'
        ));

    }

    public function getCheckout(){
    	return redirect()->action('Front\PageController@_handle', ['slug' => 'price']);
    }

    public function postCheckout(Request $request){

    	$plan = isset($this->plans[$request->input('plan')]) ? $this->plans[$request->input('plan')] : $this->plans['plan1']; 

	    if($request->has('plan')){
		    $price = $plan['price'];
		    $payer = PayPal::Payer();
		    $payer->setPaymentMethod('paypal');

		    $amount = PayPal:: Amount();
		    $amount->setCurrency('USD');
		    $amount->setTotal($price); 

		    $transaction = PayPal::Transaction();
		    $transaction->setAmount($amount);
		    $transaction->setDescription('Buy Premium ' . $plan['name'] . ' Plan');

		    $redirectUrls = PayPal:: RedirectUrls();
		    $redirectUrls->setReturnUrl(action('Front\ChargeController@getDone'));
		    $redirectUrls->setCancelUrl(action('Front\ChargeController@getCancel'));

		    $payment = PayPal::Payment();
		    $payment->setIntent('sale');
		    $payment->setPayer($payer);
		    $payment->setRedirectUrls($redirectUrls);
		    $payment->setTransactions(array($transaction));

		    $response = $payment->create($this->_apiContext);
		    $redirectUrl = $response->links[1]->href;

		    return redirect($redirectUrl);
		}
		else
			return back();
	}

	public function getDone(Request $request)
	{
	    $id = $request->get('paymentId');
	    $token = $request->get('token');
	    $payer_id = $request->get('PayerID');

	    $payment = PayPal::getById($id, $this->_apiContext);

	    $paymentExecution = PayPal::PaymentExecution();

	    $paymentExecution->setPayerId($payer_id);
	    $executePayment = $payment->execute($paymentExecution, $this->_apiContext);
	    $total = $executePayment->transactions[0]->amount->total;
	    switch ($total) {
	    	case '5.00':
	    		$package_name = 'Basic Plan';
	    		$token = 10;
	    		break;
	    	case '10.00':
	    		$package_name = 'Standard Plan';
	    		$token = 21;
	    		break;
	    	case '15.00':
	    		$package_name = 'Advance Plan';
	    		$token = 34;
	    		break;
	    	case '25.00':
	    		$package_name = 'Professional Plan';
	    		$token = 56;
	    		break;
	    	
	    	default:
	    		$package_name = 'Basic Plan';
	    		$token = 10;
	    		break;
	    }

	    $pack_history = new PackageHistory;
	    $pack_history->user_id = auth()->user()->id;
	    $pack_history->package = $package_name;
	    $pack_history->save();
	    DB::table('users')->where('id', '=', auth()->user()->id)->increment('token', $token);

	    dd($executePayment);

	    return view('checkout.done');
	}

	public function getCancel()
	{
	    return redirect()->action('Front\PageController@_handle', ['slug' => 'price']);
	}
}
