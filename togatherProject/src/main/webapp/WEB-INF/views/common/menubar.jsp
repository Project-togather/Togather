<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!-- Favicons-->
<link rel="shortcut icon" href="assets/images/favicon.png">
<link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="assets/images/apple-touch-icon-114x114.png">
<!-- Web Fonts-->
<link href="https://fonts.googleapis.com/css?family=PT+Serif%7cSignika:300,400,600,700" rel="stylesheet">
<!-- Bootstrap core CSS-->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Plugins and Icon Fonts-->
<link href="assets/css/plugins.min.css" rel="stylesheet">
<!-- Template core CSS-->
<link href="assets/css/template.css" rel="stylesheet">
<style>
.menu-item-span{
	font-size: 17px;
	font-weight: bold;
}

.top-bar{
	height: 70px;
}
</style>
</head>
<body>
	<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->

		<!-- Header-->
		<header class="header header-transparent">
			<!-- Top bar-->
			<div class="top-bar" style="background-color: orange;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<ul class="list-left-align">
								<li>Mon - Fri: 07:00 am - 05:00 pm</li>
								<li><abbr title="Phone">P:</abbr> +39 02 87 21 43 19</li>
								<li><a href="start.html" data-color="#e1be64">Demos</a></li>
							</ul>
						</div>
						<div class="col-md-6">
							<ul class="top-bar-tools">
								<li><a class="open-offcanvas" href="#"><i class="ti-menu fa-2x"></i></a></li>
								<li><a href="sign-in.html"><i class="ti-search fa-2x"></i></a></li>
								<li><a href="sign-in.html"><i class="ti-user fa-2x"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="navigation navigation-center">
				<div class="container-fluid">
					<!-- Brand-->
					<div class="inner-header"><a class="inner-brand" href="index.html"><img class="brand-dark" src="assets/images/logo.png" width="74px" alt=""><img class="brand-light" src="assets/images/logo-light.png" width="74px" alt=""></a></div>
					<!-- Navigation-->
					<div class="inner-navigation collapse">
						<div class="inner-nav onepage-nav">
							<ul>
								<li><a href="#home"><span class="menu-item-span">Home</span></a></li>
								<li><a href="#story"><span class="menu-item-span">소셜링</span></a></li>
								<li><a href="#special"><span class="menu-item-span">클럽</span></a></li>
								<li><a href="#popular"><span class="menu-item-span">챌린지</span></a></li>
								<li><a href="#gallery"><span class="menu-item-span">원데이클래스</span></a></li>
								<li><a href="#services"><span class="menu-item-span">라운지</span></a></li>
								<li><a href="#news"><span class="menu-item-span">내모임</span></a></li>
								
								<li><a href="mypage.me"><span class="menu-item-span">마이페이지</span></a></li>
								
								<li><a href="#news"><span class="menu-item-span">관리자페이지</span></a></li>
							</ul>
						</div>
					</div>

					<!-- Mobile menu-->
					<div class="nav-toggle"><a href="#" data-toggle="collapse" data-target=".inner-navigation"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a></div>
				</div>
			</div>
		</header>
		<!-- Header end-->
		
		<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="assets/js/plugins.min.js"></script>
		<script src="assets/js/custom.min.js"></script>
</body>
</html>