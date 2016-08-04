@extends('front._master')

@section('css')

@endsection

@section('js')

@endsection

@section('js-init')

@endsection

@section('content')
<div class="container">
    <div class="col-md-12" style="padding-top: 40px;">
        <div class="login-grids">
            <div class="login">
                <div class="login-bottom">
                    <h3>Sign up for free</h3>
                    <form method="POST" action="{{ action('Front\AuthController@postRegister') }}">
                        {!! csrf_field() !!}
                        <div class="sign-up">
                            <h4>Email :</h4>
                            <input type="text" name="email" required>   
                        </div>
                        <div class="sign-up">
                            <h4>First Name :</h4>
                            <input type="text" name="first_name" required>  
                        </div>
                        <div class="sign-up">
                            <h4>Last Name :</h4>
                            <input type="text" name="last_name" required>   
                        </div>
                        <div class="sign-up">
                            <h4>Password :</h4>
                            <input type="password" name="password" required>
                            
                        </div>
                        <div class="sign-up">
                            <h4>Re-type Password :</h4>
                            <input type="password" name="password_confirmation" required>
                            
                        </div>
                        <div class="sign-up">
                            <input type="submit" value="REGISTER NOW" >
                        </div>
                        
                    </form>
                </div>
                <div class="login-right">
                    <h3>Sign in with your account</h3>
                    <form method="POST" action="{{ action('Front\AuthController@postLogin') }}">
                        {!! csrf_field() !!}
                        <div class="sign-in">
                            <h4>Email :</h4>
                            <input type="text" name="email" value="{{ old('email') }}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required>  
                        </div>
                        <div class="sign-in">
                            <h4>Password :</h4>
                            <input type="password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required>
                            <a href="#">Forgot password?</a>
                        </div>
                        <div class="single-bottom">
                            <input type="checkbox" name="remember" id="brand" value="">
                            <label for="brand"><span></span>Remember Me.</label>
                        </div>
                        <div class="sign-in">
                            <input type="submit" value="SIGNIN" >
                        </div>
                    </form>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
@endsection