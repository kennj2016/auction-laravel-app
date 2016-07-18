<div class="header">
    <div class="container">
        <ul>
            <li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>Free and Fast Delivery</li>
            <li><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Free shipping On all orders</li>
            @if(isset($loggedInUser))
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">{{ $loggedInUser->getUserName() }} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/user/my-account">My account</a></li>
                        <li><a href="/user/password">Change password</a></li>
                        <li><a href="/auth/logout">Logout</a></li>
                    </ul>
                </li>
            @else
                <li>
                    <a href="#" data-toggle="modal" data-target="#myModal4">Login</a> or <a href="#" data-toggle="modal" data-target="#myModal4">Register</a>
                </li>
            @endif
        </ul>
    </div>
</div>
<div class="header-bot">
    <div class="container">
        <div class="col-md-3 header-left">
            <h1><a href="{{ url('/') }}"><img src="{{ asset('logo.png') }}"></a></h1>
        </div>
        <div class="col-md-6 header-middle">
            <form>
                <div class="search">
                    <input type="search" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}" required="">
                </div>
                <div class="section_room">
                    <select id="country" onchange="change_country(this.value)" class="frm-field required">
                        @foreach($SearchCategory as $cat)
                        <option value="{{ $cat->id }}">{{ $cat->global_title }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="sear-sub">
                    <input type="submit" value=" ">
                </div>
                <div class="clearfix"></div>
            </form>
        </div>
        <div class="col-md-3 header-right footer-bottom">
            <ul>
                <li><a class="fb" href="#"></a></li>
                <li><a class="twi" href="#"></a></li>
                <li><a class="insta" href="#"></a></li>
                <li><a class="you" href="#"></a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- banner -->
<div class="ban-top">
    <div class="container">
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
                     {!! $CMSMenuHtml or '' !!}
                </div>
              </div>
            </nav>  
        </div>
        <div class="top_nav_right">
            <div class="cart box_1">
                <a href="checkout.html">
                    <h3> <div class="total">
                        <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                        <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div>
                        
                    </h3>
                </a>
                <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>   
            </div>  
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //banner-top -->