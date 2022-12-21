	@extends('user.layout.main')

	@section('content')

	<!-- hero area -->
	<div class="hero-area hero-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 offset-lg-2 text-center">
					<div class="hero-text">
						<div class="hero-text-tablecell">
							<p class="subtitle">Fresh & Original</p>
							<h1>Refreshing Coffee & Beverage For Everyone</h1>
							<div class="hero-btns">
								<a href="/shop" class="boxed-btn">Our Menu</a>
								<!-- <a href="#hot-menu" class="bordered-btn">Todays Fav's Menu</a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end hero area -->

	<!-- tag for smooth scrolling -->
	<div id="hot-menu"></div>
	<!-- end tag of smooth scrolling -->

	@if (count($favmenu) == 3)
		<!-- product section -->
	<div class="product-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">	
						<h3>Todays <span class="orange-text">Fav's</span> Menu</h3>
						<p>Our TODAY HOTTEST Menu, made by our people and you.</p>
					</div>
				</div>
			</div>
			<div class="row">
				@foreach ($favmenu as $data)
				{{ csrf_field() }}
				<div class="col-lg-4 col-md-6 text-center">
					<form action="/addtocart" method="POST" enctype="multipart/form-data">
						{{ csrf_field() }}
						@if (Session::get('id') != null) 
							<input type="hidden" name="id_user" value="{{ decrypt(Session::get('id')) }}">
							<input type="hidden" name="id_menu" value="{{ $data -> id_menu }}">
						@endif
						<div class="single-product-item">
							<div class="product-image">
								<a href="shop/details/{{ Crypt::encrypt($data -> id_menu); }}"><img src="{{ asset('img/'.$data -> picturl) }}" alt=""></a>
							</div>
							<h3>{{ $data -> name_menu }}</h3>
							<p class="product-price">{{ $data -> harga }}</p>
							@if ((Session::get('id') != null || Session::get('level') != null) )
                                @if (decrypt(Session::get('level')) == 1)
								<div class="input-group input-group-rounded p-custom">
									<input type="number" class="form-control round-left-input" value="1" readonly>
									<button class="btn btn-cart round-right-button" type="button" disabled><i class="fas fa-users-cog"></i> Admin Mode</button> 
								</div>
								@else
								<div class="input-group input-group-rounded p-custom">
									<input type="number" name="qty" class="form-control round-left-input" value="1">
									<button class="btn btn-cart round-right-button" type="submit"><i class="fas fa-shopping-cart"></i> Add to Cart</button> 
								</div>
								@endif
							@else
							<div class="input-group input-group-rounded p-custom">
								<input type="number" class="form-control round-left-input" value="1">
								<a class="login-menu btn btn-cart round-right-button" href="/login"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
							</div>
							@endif
						</div>
					</form>
				</div>
				@endforeach
			</div>
		</div>
	</div>
	<!-- end product section -->
	@endif
	@endsection