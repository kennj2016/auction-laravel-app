<?php

namespace App\Http\Controllers\Front;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Image;

class UserController extends BaseFrontController
{
    public function __construct(){
    	$this->middleware('auth');
    	parent::__construct();
    }

    public function getMyAccount(){
    	$userdata = '';
    	return $this->_viewFront('user.index', ['pageTitle' => 'My Account', 'userdata' => $userdata]);
    }

    public function postEdit(Request $request, User $object, $id = 0)
    {
        $data = $request->all();

        $data['id'] = $request->user()->id;

        if (isset($data['password']) && isset($data['old_password']) && isset($data['password_confirmation'])) {
        	if($data['password'] == $data['password_confirmation']){
        		if(Hash::check($data['old_password'], $request->user()->password)){
        			$data['password'] = bcrypt($data['password']);
        		}
        		else{
        			$this->_setFlashMessage('Wrong old password', 'error');
		            $this->_showFlashMessages();
		            return redirect()->back();
        		}
        	}
        	else
        	{
        		$this->_setFlashMessage("password doesn't match", 'error');
	            $this->_showFlashMessages();
	            return redirect()->back();
        	}
        }

        if($request->hasFile('avatar')){
    		$avatar = $request->file('avatar');
    		$filename = time() . '.' . $avatar->getClientOriginalExtension();
    		Image::make($avatar)->resize(300, 300)->save(public_path('/uploads/avatars/' . $filename));
    		$data['avatar'] = asset('uploads/avatars/' . $filename);
    	}

        unset($data['email']);
        unset($data['old_password']);
        unset($data['password_confirmation']);
        $result = $object->fastEdit($data, false, true);
  

        if ($result['error']) {
            $this->_setFlashMessage($result['message'], 'error');
            $this->_showFlashMessages();

            return redirect()->back();
        }

        $this->_setFlashMessage($result['message'], 'success');
        $this->_showFlashMessages();

        return redirect()->back();
    }
}
