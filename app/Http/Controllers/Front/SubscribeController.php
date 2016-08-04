<?php

namespace App\Http\Controllers\Front;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\SubscribedEmails;

class SubscribeController extends Controller
{
    public function postIndex(Request $request){
    	$email = $request->input('email');
    	if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
		  return response()->json(['msg' => 'Invalid email format', 'status' => 'error']);
		}
		else
		{
			$exists = SubscribedEmails::where('email', '=', $email)->first();
			if(is_null($exists)){
				$sub = new SubscribedEmails;
				$sub->email = $email;
				$sub->save();
				return response()->json(['status' => 'success']);
			}
			else
			{
				return response()->json(['status' => 'error', 'msg' => 'Email already exists']);
			}
		}
    }
}
