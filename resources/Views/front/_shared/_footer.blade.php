<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-left">
			<h2><a href="{{ url('/') }}"><img class="img-responsive" src="{{ asset('logo.png') }}" alt=" " /></a></h2>
			<p>An auction is a process of buying and selling goods or services by offering them up for bid, taking bids, and then selling the item to the highest bidder. The open ascending price auction is arguably the most common form of auction in use today</p>
		</div>
		<div class="col-md-9 footer-right">
			<div class="col-sm-6 newsleft">
				<h3>SIGN UP FOR NEWSLETTER !</h3>
			</div>
			<div class="col-sm-6 newsright">
				<form id="subscribe">
					<input type="text" id="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required>
					<input type="submit" value="Submit">
				</form>
			</div>
			<div class="clearfix"></div>
			<div class="sign-grds">
				<div class="col-md-4 sign-gd">
					<h4>Information</h4>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="mens.html">Men's Wear</a></li>
						<li><a href="womens.html">Women's Wear</a></li>
						<li><a href="electronics.html">Electronics</a></li>
						<li><a href="codes.html">Short Codes</a></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</div>
				
				<div class="col-md-4 sign-gd-two">
					<h4>Store Information</h4>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Address : {{ $CMSSettings['address'] or '' }}</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : <a href="mailto:{{ $CMSSettings['email'] or '' }}">{{ $CMSSettings['email'] or '' }}</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone : {{ $CMSSettings['hot_line'] or '' }}</li>
					</ul>
				</div>
				<div class="col-md-4 sign-gd flickr-post">
					<h4>Flickr Posts</h4>
					<ul>
						<li><a href="single.html"><img src="{{ asset('templates/images/b15.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b16.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b17.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b18.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b15.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b16.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b17.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b18.jpg') }}" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="{{ asset('templates/images/b15.jpg') }}" alt=" " class="img-responsive" /></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<p class="copy-right">{!! $CMSSettings['footer_copyright'] or '' !!}</p>
	</div>
</div>