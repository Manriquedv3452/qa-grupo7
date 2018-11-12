
<!-- Header Main -->
<div class="top_bar">
	<div class="container">
		<div class="row">
			<div class="col d-flex flex-row">

				<div class="top_bar_content ml-auto">
					<div class="top_bar_menu">
						<ul class="standard_dropdown top_bar_dropdown">
							<li>
								<a href="#">$ Dólares<i class="fas fa-chevron-down"></i></a>
							</li>
						</ul>
					</div>
					<div class="top_bar_user">
						@if($usuario == 'NULL')
							<div class="user_icon"><img src="{{asset('images/user.svg')}}" alt=""></div>
							<div><a href="#">Registrarse</a></div>
							<div><a href="{{url('/usuarios/inicioSesionRegistro')}}">Iniciar Sesión</a></div>
						@else
							<div class="user_icon"><img src="{{asset('images/user.svg')}}" alt=""></div>
							<div><a href="#">Bienvenido {{$usuario->name}}</a></div>
							<div><a href="{{URL::action('UsuarioController@cerrarSesion')}}">Cerrar Sesión</a></div>
						@endif
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="header_main">
	<div class="container">
		<div class="row">

			<!-- Logo -->
			<div class="col-lg-2 col-sm-3 col-3 order-1">
				<div class="logo_container">
					<div class="logo"><a href="#">OneTech</a></div>
				</div>
			</div>

			<!-- Search -->
			<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
				<div class="header_search">
					<div class="header_search_content">
						<div class="header_search_form_container">
						{!! Form::open(array('action' => 'ClienteController@search', 'method' =>'GET', 'autocomplete' => 'off','role' => 'search','class' => 'header_search_form clearfix'))!!}
								<input type="search" name="buscador" required="required" class="header_search_input" placeholder="Buscar..." >
								<div class="custom_dropdown" hidden="false">
									<div class="custom_dropdown_list">
										<span class="custom_dropdown_placeholder clc">Todas las categorías</span>
										<i class="fas fa-chevron-down"></i>
										<ul class="custom_list clc"></ul>
									</div>
								</div>
								<button type="submit" class="header_search_button trans_300" value="Submit"><img src="{{asset('images/search.png')}}" alt=""></button>
						{{Form::close()}}
						</div>
					</div>
				</div>
			</div>

			<!-- Wishlist -->
			<div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
				<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
					<!-- Cart -->
					<div class="cart">
						<div class="cart_container d-flex flex-row align-items-center justify-content-end">
							<div class="cart_icon">
								<img src="{{asset('images/cart.png')}}" alt="">
								<div class="cart_count"><span>{{$carritoLen}}</span></div>
							</div>
							<div class="cart_content">
								<div class="cart_text"><a href="{{url('/cliente/cart')}}">Carrito</a></div>
								<div class="cart_price">${{$total}}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Main Navigation -->

<nav class="main_nav">
	<div class="container">
		<div class="row">
			<div class="col">

				<div class="main_nav_content d-flex flex-row">

					<!-- Categories Menu -->

					<div class="cat_menu_container">
						<div class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
							<div class="cat_burger"><span></span><span></span><span></span></div>
							<div class="cat_menu_text">Categorías</div>
						</div>

						<ul class="cat_menu">
						@foreach($categorias as $cat)
							@if($cat->condicion != 0)
								<li><a href="{{URL::action('ClienteController@filtrar',$cat->idCategoria)}}">{{$cat->nombre}}<i class="fas fa-chevron-right ml-auto"></i></a></li>
							@endif
						@endforeach
						</ul>
					</div>

					<!-- Main Nav Menu -->

					<div class="main_nav_menu ml-auto">
						<ul class="standard_dropdown main_nav_dropdown">
							<li><a href="{{URL::action('ClienteController@index')}}">Inicio<i class="fas fa-chevron-down"></i></a></li>
						</ul>
					</div>

					<!-- Menu Trigger -->

					<div class="menu_trigger_container ml-auto">
						<div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
							<div class="menu_burger">
								<div class="menu_trigger_text">menú</div>
								<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</nav>

<!-- Menu -->

<div class="page_menu">
	<div class="container">
		<div class="row">
			<div class="col">

				<div class="page_menu_content">

					<div class="page_menu_search">
						<form action="#">
							<input type="search" required="required" class="page_menu_search_input" placeholder="Search for products...">
						</form>
					</div>
					<ul class="page_menu_nav">
						<li class="page_menu_item has-children">
							<a href="#">Moneda<i class="fa fa-angle-down"></i></a>
							<ul class="page_menu_selection">
								<li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a></li>
							</ul>
						</li>
						<li class="page_menu_item">
							<a href="{{URL::action('ClienteController@index')}}">Inicio<i class="fa fa-angle-down"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
