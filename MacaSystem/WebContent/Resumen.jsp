
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ventas.dto.Pedido"%>
<%@page import="com.ventas.dto.DetallePedido"%>
<%@page import="com.ventas.dao.PedidoDao"%>
<%@page import="com.ventas.dao.Impl.PedidoDaoImpl"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Los Amigos de Maca</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
table {
	border: 3px solid #000;
	width: 80%;
	margin: 0 auto;
	padding: 0;
	border-collapse: collapse;
	border-spacing: 0;
	marg
}

table tr {
	border: 2px solid #000;
	padding: 5px;
}

table tr:nth-child(even) {
	background-color: FFE09E;
	color: black;
	
}

table td, table th {
	padding: 10px;
	text-align: center;
	border: 2px solid #000;
}

table th {
	text-transform: uppercase;
	font-family: 20px;
	letter-spacing: 1px;
	background-color: skyblue;
	font-size: 20px;
}

.busqueda{
    background-color: gray;
	margin-bottom: 20px;
	margin-top: 20px;
}

.texto {
	width: 250px;
	height: 40px;
	margin: 0 auto;
	border-radius: 15px;
	font-family: 'Exo 2', sans-serif;
}

.boton:hover {
	background: black;
}

.img {
	width: 30px;
}

.cabecera {
	font-size: 50px;
	margin-left: 400px;
	font-family: 'Exo 2', sans-serif;
}

.boton {
	width: 150px;
	height: 40px;
	margin: 0 auto;
	border-radius: 10px;
	font-weight: bold;
	font-size: 18px;
	background: #D10024;
	color: #FFF;
}

.loguin {
	width: 300px;
	padding-top: 40px;
	margin-left: 540px;
	text-align: center;
}
/* ESTILOS PARA EL POP UP */

.overlay{
	background: rgba(0,0,0,.4);
	position: fixed;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
	display: flex;
	align-items: center;
	justify-content: center;	
	visibility: hidden;
}

.overlay.active{
	visibility: visible;
}

.popup{
	background: #f8f8f8;
	box-shadow: 0px 0px 5px 0px rgba(0,0,0,.4);
	border-radius: 4px;
	font-family: 'Exo 2', sans-serif;
	padding: 20px;
	text-align: center;
	width: 700px;
	
	
}



/*-- Fin ESTILOS POP UP --*/
</style>

<script type="text/javascript">
	function mostrar() {
		var tipo = document.getElementById("clave");
		if (tipo.type == "password") {
			tipo.type = "text";
		} else {
			tipo.type = "password";
		}
	}
	
	
</script>

</head>
<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope-o"></i>
							email@email.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 1734
							Stonecoal Road</a></li>
				</ul>
				<ul class="header-links pull-right">
					<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
					<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo"> <img src="./img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">All Categories</option>
									<option value="1">Category 01</option>
									<option value="1">Category 02</option>
								</select> <input class="input" placeholder="Search here">
								<button class="search-btn">Search</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="#"> <i class="fa fa-heart-o"></i> <span>Your
										Wishlist</span>
									<div class="qty">2</div>
								</a>
							</div>
							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Your
										Cart</span>
									<div class="qty">3</div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product01.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">product name goes here</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">1x</span>$980.00
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>

										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product02.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">product name goes here</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">3x</span>$980.00
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>
									</div>
									<div class="cart-summary">
										<small>3 Item(s) selected</small>
										<h5>SUBTOTAL: $2940.00</h5>
									</div>
									<div class="cart-btns">
										<a href="Carrito?accion=productos">Productos</a> <a href="#">Detalle
											<i class="fa fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
							</div>
							<!-- /Cart -->

							<!-- Menu Toogle -->
							<div class="menu-toggle">
								<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
								</a>
							</div>
							<!-- /Menu Toogle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->




	<div class="Contenedor">

		<!-- DIV DE LOGUEO -->
		<br> <br> <label class="cabecera">LISTADO DE PEDIDOS</label>

		<div class="busqueda">
		
			<input class="codPedido" type="text"  placeholder="Codigo Pedido">
			<button class="btnAbrir" id="btnAbrir" >Detalles</button>
		</div>


		<div class="listado">

			<table border="1" class="text">
				<thead>
					<tr>
						<th>ID_PEDIDO</th>
						<th>FECHA_PEDIDO</th>
						<th>MONTO_TOTAL</th>
						<th>ID_USUARIO</th>


						
					</tr>
				</thead>
				<tbody>
					<%
						List<Pedido> lista = null;
					PedidoDao pdao = new PedidoDaoImpl();
					lista = pdao.listaPedido();

					for (Pedido p : lista) {
					%>

					<tr>

						<td><%=p.getCodigo_pedido()%></td>
						<td><%=p.getFecha_pedido()%></td>
						<td><%=p.getMonto_pedido()%></td>
						<td><%=p.getCodigo_usuario()%></td>

						

					</tr>
					<%
						}
					%>
				</tbody>

			</table>


		</div>

		<!-- / DIV DE TABLA-->
		
		
	</div>



	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>
							Sign Up for the <strong>NEWSLETTER</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> Subscribe
							</button>
						</form>
						<ul class="newsletter-follow">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /NEWSLETTER -->

	<!-- FOOTER -->
	<footer id="footer">
		<!-- top footer -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">About Us</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut.</p>
							<ul class="footer-links">
								<li><a href="#"><i class="fa fa-map-marker"></i>1734
										Stonecoal Road</a></li>
								<li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
								<li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Categories</h3>
							<ul class="footer-links">
								<li><a href="#">Hot deals</a></li>
								<li><a href="#">Laptops</a></li>
								<li><a href="#">Smartphones</a></li>
								<li><a href="#">Cameras</a></li>
								<li><a href="#">Accessories</a></li>
							</ul>
						</div>
					</div>

					<div class="clearfix visible-xs"></div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Information</h3>
							<ul class="footer-links">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Orders and Returns</a></li>
								<li><a href="#">Terms & Conditions</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Service</h3>
							<ul class="footer-links">
								<li><a href="#">My Account</a></li>
								<li><a href="#">View Cart</a></li>
								<li><a href="#">Wishlist</a></li>
								<li><a href="#">Track My Order</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->

		<!-- bottom footer -->
		<div id="bottom-footer" class="section">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="footer-payments">
							<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
							<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
						</ul>
						<span class="copyright"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bottom footer -->
	</footer>
	
	<!-- INICIO DIV DEL POP UP -->
	
	<div class="overlay" id="overlay">
	    <div class="popup" id="popup">
	    	<h3>DETALLE DEL PEDIDO</h3>
	    	<div>
	    		<table>
	    			<thead>
					<tr>
						<th>NOMBRE</th>
						<th>CANTIDAD</th>
						<th>PRECIO</th>
						<th>SUBTOTAL</th>
						


						
					</tr>
				</thead>
				<tbody>
					
					<%
						List<DetallePedido> listaDetalle = null;
					PedidoDao dpdao=new PedidoDaoImpl(); 
					listaDetalle = dpdao.listaDetalle(1);

					for (DetallePedido dp: listaDetalle) {
					%>
					<tr>
					
						<td><%=dp.getNombre_producto() %></td>
						<td><%=dp.getCantidad_pro_pedido() %></td>
						<td><%=dp.getPrecio_producto() %></td>
						<td><%=dp.getSubtotal_pro_pedido() %></td>
						

					</tr>
					<%} %>
				</tbody>
	    		</table>
	    		<br>
	    		
	    		<button class="boton" id="btnCerrar" >Cerrar</button>
	    	</div>
	    
	    
	    </div>
	
	
	</div>
	<!-- FIN / DIV DEL POP UP -->
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

<script type="text/javascript">
/* INICIO EVENTOS POPUP */

var abrirPopUp=document.getElementById("btnAbrir"),
	overlay=document.getElementById("overlay"),
	popup=document.getElementById("popup"),
	cerrarPopUp=document.getElementById("btnCerrar");	

	abrirPopUp.addEventListener('click',function(){
		
		overlay.classList.add('active');
	})
	
	cerrarPopUp.addEventListener('click',function(){
		
		overlay.classList.remove('active');
	})	


/* FIN EVENTOS POPUP */
</script>
</html>
