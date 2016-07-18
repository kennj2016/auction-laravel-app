@extends('front._master')

@section('css')

@endsection

@section('js')
<script src="{{ asset('templates/js/pignose.layerslider.js') }}"></script>
<script src="{{ asset('templates/js/easyResponsiveTabs.js') }}"></script>
<script type="text/javascript">
$(window).load(function() {
	$('#visual').pignoseLayerSlider({
		play    : '.btn-play',
		pause   : '.btn-pause',
		next    : '.btn-next',
		prev    : '.btn-prev'
	});
});
$(document).ready(function () {
	$('#horizontalTab').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion           
		width: 'auto', //auto or any width like 600px
		fit: true   // 100% fit in a container
	});
});
							
</script>
@endsection

@section('js-init')

@endsection

@section('content')
<!-- banner -->
<div class="banner-grid">
	<div id="visual">
			<div class="slide-visual">
				<!-- Slide Image Area (1000 x 424) -->
				<ul class="slide-group">
					<li><img class="img-responsive" src="{{ asset('templates/images/ba1.jpg') }}" alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="{{ asset('templates/images/ba2.jpg') }}" alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="{{ asset('templates/images/ba3.jpg') }}" alt="Dummy Image" /></li>
				</ul>

				<!-- Slide Description Image Area (316 x 328) -->
				<div class="script-wrap">
					<ul class="script-group">
						<li><div class="inner-script"><img class="img-responsive" src="{{ asset('templates/images/baa1.jpg') }}" alt="Dummy Image" /></div></li>
						<li><div class="inner-script"><img class="img-responsive" src="{{ asset('templates/images/baa2.jpg') }}" alt="Dummy Image" /></div></li>
						<li><div class="inner-script"><img class="img-responsive" src="{{ asset('templates/images/baa3.jpg') }}" alt="Dummy Image" /></div></li>
					</ul>
					<div class="slide-controller">
						<a href="#" class="btn-prev"><img src="{{ asset('templates/images/btn_prev.png') }}" alt="Prev Slide" /></a>
						<a href="#" class="btn-play"><img src="{{ asset('templates/images/btn_play.png') }}" alt="Start Slide" /></a>
						<a href="#" class="btn-pause"><img src="{{ asset('templates/images/btn_pause.png') }}" alt="Pause Slide" /></a>
						<a href="#" class="btn-next"><img src="{{ asset('templates/images/btn_next.png') }}" alt="Next Slide" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>

</div>
<!-- //banner -->
<!-- content -->

<div class="new_arrivals">
	<div class="container">
		<h3><span>new </span>arrivals</h3>
		<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium</p>
		<div class="new_grids">
			<div class="col-md-4 new-gd-left">
				<img src="{{ asset('templates/images/wed1.jpg') }}" alt=" " />
				<div class="wed-brand simpleCart_shelfItem">
					<h4>Wedding Collections</h4>
					<h5>Flat 50% Discount</h5>
					<p><i>$250</i> <span class="item_price">$500</span><a class="item_add hvr-outline-out button2" href="#">Participate </a></p>
				</div>
			</div>
			<div class="col-md-4 new-gd-middle">
				<div class="new-levis">
					<div class="mid-img">
						<img src="{{ asset('templates/images/levis1.png') }}" alt=" " />
					</div>
					<div class="mid-text">
						<h4>up to 40% <span>off</span></h4>
						<a class="hvr-outline-out button2" href="product.html">Shop now </a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="new-levis">
					<div class="mid-text">
						<h4>up to 50% <span>off</span></h4>
						<a class="hvr-outline-out button2" href="product.html">Shop now </a>
					</div>
					<div class="mid-img">
						<img src="{{ asset('templates/images/dig.jpg') }}" alt=" " />
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-4 new-gd-left">
				<img src="{{ asset('templates/images/wed2.jpg') }}" alt=" " />
				<div class="wed-brandtwo simpleCart_shelfItem">
					<h4>Spring / Summer</h4>
					<p>Shop Men</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //content -->

<!-- content-bottom -->

<div class="content-bottom">
	<div class="col-md-7 content-lgrid">
		<div class="col-sm-6 content-img-left text-center">
			<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="{{ asset('templates/images/p1.jpg') }}" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
									<h4>Mobiles</h4>
									<span class="separator"></span>
									<p><span class="item_price">$500</span></p>
									<span class="separator"></span>
									<a class="item_add hvr-outline-out button2" href="#">Participate </a>
						</div>
					</div>
			</div>
		</div>
		<div class="col-sm-6 content-img-right">
			<h3>Special Offers and 50%<span>Discount On</span> Mobiles</h3>
		</div>
		
		<div class="col-sm-6 content-img-right">
			<h3>Buy 1 get 1  free on <span> Branded</span> Watches</h3>
		</div>
		<div class="col-sm-6 content-img-left text-center">
			<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="{{ asset('templates/images/p2.jpg') }}" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
							<h4>Watches</h4>
							<span class="separator"></span>
							<p><span class="item_price">$250</span></p>
							<span class="separator"></span>
							<a class="item_add hvr-outline-out button2" href="#">Participate </a>
						</div>
					</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="col-md-5 content-rgrid text-center">
		<div class="content-grid-effect slow-zoom vertical">
			<div class="img-box"><img src="{{ asset('templates/images/p4.jpg') }}" alt="image" class="img-responsive zoom-img"></div>
			<div class="info-box">
				<div class="info-content simpleCart_shelfItem">
					<h4>Shoes</h4>
					<span class="separator"></span>
					<p><span class="item_price">$150</span></p>
					<span class="separator"></span>
					<a class="item_add hvr-outline-out button2" href="#">Participate </a>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- //content-bottom -->
<!-- product-nav -->

<div class="product-easy">
	<div class="container">
		
		
		<div class="sap_tabs">
			<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
					<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Auctions</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Featured Auctions</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Recently closed</span></li> 
				</ul>				  	 
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a1.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a1.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Air Tshirt Black</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a8.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a8.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">1+1 Offer</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Next Blue Blazer</a></h4>
									<div class="info-product-price">
										<span class="item_price">$99.99</span>
										<del>$109.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/01</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a3.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a3.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Air Tshirt Black </a></h4>
									<div class="info-product-price">
										<span class="item_price">$119.99</span>
										<del>$120.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/07/22</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a4.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a4.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Maroon Puma Tshirt</a></h4>
									<div class="info-product-price">
										<span class="item_price">$79.99</span>
										<del>$120.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a5.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a5.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">Combo Pack</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Multicoloured TShirts</a></h4>
									<div class="info-product-price">
										<span class="item_price">$129.99</span>
										<del>$150.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a6.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a6.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Air Tshirt Black </a></h4>
									<div class="info-product-price">
										<span class="item_price">$129.99</span>
										<del>$150.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a7.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a7.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Dresses</a></h4>
									<div class="info-product-price">
										<span class="item_price">$129.99</span>
										<del>$150.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/a2.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/a2.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Wedding Blazers</a></h4>
									<div class="info-product-price">
										<span class="item_price">$129.99</span>
										<del>$150.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/w1.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/w1.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Wedges</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/w2.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/w2.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Sandals</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/mw1.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/mw1.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Casual Shoes</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/mw3.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/mw3.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Sport Shoes</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/08/15</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/ep2.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/ep2.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Watches</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/07/28</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/ep3.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/ep3.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Watches</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<div class="time-left">
										<div class="time-countdown">2016/07/25</div>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						
						<div class="clearfix"></div>						
					</div>
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/g1.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/g1.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Dresses</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/g2.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/g2.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample"> Shirts</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/g3.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/g3.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Shirts</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/mw2.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/mw2.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">T shirts</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/w4.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/w4.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Air Tshirt Black Domyos</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="col-md-3 product-men yes-marg">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="{{ asset('templates/images/w3.png') }}" alt="" class="pro-image-front">
									<img src="{{ asset('templates/images/w3.png') }}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/product/product-sample" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="/product/product-sample">Hand Bags</a></h4>
									<div class="info-product-price">
										<span class="item_price">$45.99</span>
										<del>$69.71</del>
									</div>
									<a href="/product/product-sample" class="item_add single-item hvr-outline-out button2">Participate</a>									
								</div>
							</div>
						</div>
						<div class="clearfix"></div>		
					</div>	
				</div>	
			</div>
		</div>
	</div>
</div>
<!-- //product-nav -->

<div class="coupons">
	<div class="container">
		<div class="coupons-grids text-center">
			<div class="col-md-6 col-md-offset-3 coupons-gd title">
				<h3>How to auctions</h3>
			</div>
			<div class="col-md-4 coupons-gd">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<h4>CREATE YOUR ACCOUNT</h4>
			</div>
			<div class="col-md-4 coupons-gd">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
				<h4>SELECT YOUR ITEM</h4>
			</div>
			<div class="col-md-4 coupons-gd">
				<span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
				<h4>PARTICIPATES AUCTION</h4>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
@endsection