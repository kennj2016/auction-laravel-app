@extends('front._master')

@section('css')

@endsection

@section('js')

@endsection

@section('js-init')

@endsection

@section('content')
<div class="page-head parallax-window" data-parallax="scroll" data-z-index="0" data-image-src="{{ asset('images/bg-head.jpg')}}">
</div>
<div class="page-head-title">
    <h3>Price</h3>
</div>
<div class="container">
	<div class="price-item">
		<div class="row">
		    <div class="col-md-3 col-sm-6 col-xs-12">
		    	<form method="POST" action="{{ action('Front\ChargeController@postCheckout') }}">
		    	<input type="hidden" name="plan" value="plan1"/>
		    	{{ csrf_field() }}
		        <div class="panel panel-default hover-1">
		            <div class="panel-heading">
		                <div class="price-value">
		                    <p>
		                        <span>
		                            $5
		                        </span>
		                    </p>
		                </div>
		            </div>
		            <div class="panel-body">
		                <h3>
		                    Basic
		                </h3>
		                <div class="price-content">
	                        <p class="token">10</p>token
	                        <div class="clearfix">
	                        	<p class="pull-right">
		                            +0 token
		                        </p>
	                        </div>
		                </div>
		            </div>
		            <div class="panel-footer">
		                <button type="submit" class="btn btn-flat btn-lg btn-primary">
		                    <i class="fa fa-shopping-cart">
		                    </i>
		                    Buy package
		                </button>
		            </div>
		        </div>
		        </form>
		    </div>
		    <div class="col-md-3 col-sm-6 col-xs-12">
		    	<form method="POST" action="{{ action('Front\ChargeController@postCheckout') }}">
		    	<input type="hidden" name="plan" value="plan2"/>
		    	{{ csrf_field() }}
		        <div class="panel panel-default hover-1">
		            <div class="panel-heading">
		                <div class="price-value">
		                    <p>
		                        <span>
		                            $10
		                        </span>
		                    </p>
		                </div>
		            </div>
		            <div class="panel-body">
		                <h3>
		                    Standard
		                </h3>
		                <div class="price-content">
	                        <p class="token">20</p>token
	                        <div class="clearfix">
	                        <p class="pull-right">
	                            +1 token
	                        </p>
	                        </div>
		                </div>
		            </div>
		            <div class="panel-footer">
		                <button type="submit" class="btn btn-flat btn-lg btn-primary">
		                    <i class="fa fa-shopping-cart">
		                    </i>
		                    Buy package
		                </button>
		            </div>
		        </div>
		        </form>
		    </div>
		    <div class="col-md-3 col-sm-6 col-xs-12">
		    	<form method="POST" action="{{ action('Front\ChargeController@postCheckout') }}">
		    	<input type="hidden" name="plan" value="plan3"/>
		    	{{ csrf_field() }}
		        <div class="panel panel-default hover-1">
		            <div class="panel-heading">
		                <div class="price-value">
		                    <p>
		                        <span>
		                            $15
		                        </span>
		                    </p>
		                </div>
		            </div>
		            <div class="panel-body">
		                <h3>
		                    Advance
		                </h3>
		                <div class="price-content">
	                        <p class="token">30</p>token
	                        <div class="clearfix">
	                        <p class="pull-right">
	                            +4 token
	                        </p>
	                        </div>
		                </div>
		            </div>
		            <div class="panel-footer">
		                <button type="submit" class="btn btn-flat btn-lg btn-primary">
		                    <i class="fa fa-shopping-cart">
		                    </i>
		                    Buy package
		                </button>
		            </div>
		        </div>
		        </form>
		    </div>
		    <div class="col-md-3 col-sm-6 col-xs-12">
		    	<form method="POST" action="{{ action('Front\ChargeController@postCheckout') }}">
		    	<input type="hidden" name="plan" value="plan4"/>
		    	{{ csrf_field() }}
		        <div class="panel panel-default hover-1">
		            <div class="panel-heading">
		                <div class="price-value">
		                    <p>
		                        <span>
		                            $25
		                        </span>
		                    </p>
		                </div>
		            </div>
		            <div class="panel-body">
		                <h3>
		                    Professional
		                </h3>
		                <div class="price-content">
	                        <p class="token">50</p>token
	                        <div class="clearfix">
	                        <p class="pull-right">
	                            +6 token
	                        </p>
	                        </div>
		                </div>
		            </div>
		            <div class="panel-footer">
		                <button type="submit" class="btn btn-flat btn-lg btn-primary">
		                    <i class="fa fa-shopping-cart">
		                    </i>
		                    Buy package
		                </button>
		            </div>
		        </div>
		        </form>
		    </div>
		</div>
	</div>
</div>
@endsection
