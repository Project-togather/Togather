<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>${ c.classTitle }</title>
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
</head>
<body>

		<jsp:include page="../common/menubar.jsp"/>
		
		<!-- Wrapper-->
		<div class="wrapper">

			<!-- Hero-->
			<section class="module-cover parallax fullscreen" id="home" data-background="assets/images/module-6.jpg" data-overlay="1" data-gradient="1">
				<div class="container">
					<div class="row">
						<div class="col-md-12 m-auto">
							<div class="text-center">
								<h6 class="text-uppercase">Wine and Dine</h6>
								<h1 class="display-1">${ c.classTitle }</h1>
								<p>See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
								<div class="space" data-mY="40px"></div><a class="btn btn-white" href="#">Purchase now</a>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Hero end-->

			<!-- Our Story-->
			<section class="module" id="story">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">Discover our story</p>
							<h1 class="display-1">Welcome to Tavern</h1>
							<p class="lead">See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
							<div class="divider-border"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="40px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<p><a class="photo" href="assets/images/main/1.jpg"><img src="assets/images/main/1.jpg" alt=""></a></p>
						</div>
						<div class="col-md-6">
							<p><a class="photo" href="assets/images/main/3.jpg"><img src="assets/images/main/3.jpg" alt=""></a></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="40px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-9 m-auto">
							<div class="text-justify">
								<p>
									모임소개란
								</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="text-center"><img src="assets/images/main/sign.png" alt=""></div>
						</div>
					</div>
				</div>
			</section>
			<!-- Our Story End-->

			<!-- Special Offers-->
			<section class="module bg-gray" id="special">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">This is Vela Cuisine</p>
							<h1 class="display-1">Special Offers</h1>
							<p class="lead">See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
							<div class="divider-border"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="owl-carousel menu-carousel" data-carousel-options="{&quot;nav&quot;: false}">
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/1.jpg"></a><img src="assets/images/menu/1.jpg" alt="">
										<div class="menu-classic-item-price">$15
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Masala-Spiced Chickpeas</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/2.jpg"></a><img src="assets/images/menu/2.jpg" alt="">
										<div class="menu-classic-item-price">$18
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Kung Pao Chicken</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/3.jpg"></a><img src="assets/images/menu/3.jpg" alt="">
										<div class="menu-classic-item-price">$13
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Sweet &amp; Spicy Pork</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/4.jpg"></a><img src="assets/images/menu/4.jpg" alt="">
										<div class="menu-classic-item-price">$12
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Chicken Stew</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/5.jpg"></a><img src="assets/images/menu/5.jpg" alt="">
										<div class="menu-classic-item-price">$21
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Jalapeno-Mango Salsa</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/6.jpg"></a><img src="assets/images/menu/6.jpg" alt="">
										<div class="menu-classic-item-price">$17
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Spicy Fried Rice &amp; Bacon</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/1.jpg"></a><img src="assets/images/menu/1.jpg" alt="">
										<div class="menu-classic-item-price">$15
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Masala-Spiced Chickpeas</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Special Offers End-->

			<!-- Popular Dishes-->
			<section class="module" id="popular">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">Tasty and crunchy</p>
							<h1 class="display-1">Popular Dishes</h1>
							<p class="lead">See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
							<div class="divider-border"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="menu-simple">
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/1.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Wild Mushroom Bucatini with Kale</span><span class="pull-right">$10</span></h6>
										<p>Cheese, Garlic, Potato, Pork</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/2.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Lemon and Garlic Green Beans</span><span class="pull-right">$12</span></h6>
										<p>Pork meat, Sauces, Potato</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/3.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>American Brunch Combo Menu</span><span class="pull-right">$21</span></h6>
										<p>Bacon, Rice, Vegetables</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/4.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Smoked Paprika Hummus</span><span class="pull-right">$18</span></h6>
										<p>Shrimp, Vegetables, Sauce</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/5.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Italian Source Mushroom</span><span class="pull-right">$21</span></h6>
										<p>Steak, Spices, Sauces</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="menu-simple">
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/6.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Lemon and Garlic Green Beans</span><span class="pull-right">$12</span></h6>
										<p>Pork meat, Sauces, Potato</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/1.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>American Brunch Combo Menu</span><span class="pull-right">$21</span></h6>
										<p>Bacon, Rice, Vegetables</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/2.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Smoked Paprika Hummus</span><span class="pull-right">$18</span></h6>
										<p>Shrimp, Vegetables, Sauce</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/3.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Italian Source Mushroom</span><span class="pull-right">$21</span></h6>
										<p>Steak, Spices, Sauces</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/4.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Wild Mushroom Bucatini with Kale</span><span class="pull-right">$10댓글</span></h6>
										<p>Cheese, Garlic, Potato, Pork</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
							<p class="text-center"><a class="btn btn-black" href="#">View our menu</a></p>
						</div>
					</div>
				</div>
			</section>
			<!-- Popular Dishes End-->

			<!-- Gallery-->
			<section class="module no-gutter p-0" id="gallery">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-4 col-lg-12 bg-gray">
							<div class="gallery-shorcode-desc">
								<div class="vertical-body">
									<div class="vertical">
										<div class="text-center">
											<p class="subtitle">Photos</p>
											<h1 class="display-1">Gallery</h1>
											<p class="lead">Map where your photos were taken and discover local <br> points of interest. Map where your photos.</p>
											<div class="divider-border"></div>
											<div class="space" data-mY="60px"></div><a class="btn btn-black" href="#">View Gallery</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-8 col-lg-12">
							<div class="gallery gallery-shorcode">
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/1.jpg"></div><a href="assets/images/portfolio/1.jpg" title="Title 1"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/5.jpg"></div><a href="assets/images/portfolio/5.jpg" title="Title 2"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/3.jpg"></div><a href="assets/images/portfolio/3.jpg" title="Title 3"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/4.jpg"></div><a href="assets/images/portfolio/4.jpg" title="Title 4"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/2.jpg"></div><a href="assets/images/portfolio/2.jpg" title="Title 5"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/6.jpg"></div><a href="assets/images/portfolio/6.jpg" title="Title 6"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Gallery end-->

			<!-- Services-->
			<section class="module" id="services">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">For your comfort</p>
							<h1 class="display-1">Stunning Things</h1>
							<p class="lead">See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
							<div class="divider-border"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row appear-childer">
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="icon-clock"></span></div>
								<div class="icon-box-title">
									<h5>Opened 24/7</h5>
								</div>
								<div class="icon-box-content">
									<p>Map where your photos were taken and discover local points of interest. Map where your photos.</p>
								</div>
								<div class="icon-box-link"><a href="#"></a></div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="icon-streetsign"></span></div>
								<div class="icon-box-title">
									<h5>Free Parking</h5>
								</div>
								<div class="icon-box-content">
									<p>Map where your photos were taken and discover local points of interest. Map where your photos.</p>
								</div>
								<div class="icon-box-link"><a href="#"></a></div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="icon-compass"></span></div>
								<div class="icon-box-title">
									<h5>Central Location</h5>
								</div>
								<div class="icon-box-content">
									<p>Map where your photos were taken and discover local points of interest. Map where your photos.</p>
								</div>
								<div class="icon-box-link"><a href="#"></a></div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="icon-linegraph"></span></div>
								<div class="icon-box-title">
									<h5>High Quality</h5>
								</div>
								<div class="icon-box-content">
									<p>Map where your photos were taken and discover local points of interest. Map where your photos.</p>
								</div>
								<div class="icon-box-link"><a href="#"></a></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 m-auto">
							<p class="text-center">* See how your users experience your website in realtime or view trends to see any changes in performance over time.</p>
						</div>
					</div>
				</div>
			</section>
			<!-- Services End-->

			<!-- Testimonials-->
			<section class="module parallax" data-background="assets/images/module-4.jpg" data-overlay="0.7">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="80px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="owl-carousel review-slides" data-carousel-options="{&quot;autoPlay&quot;: &quot;5000&quot;}">
								<div class="review">
									<div class="review-icons"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/rem/128.jpg" alt="">
									</div>
									<div class="review-content">
										<blockquote>
											<p class="display-2">Sea food and the best view. Nothing in excess.</p>
										</blockquote>
									</div>
									<div class="review-author"><span>Albert Einstein</span></div>
								</div>
								<div class="review">
									<div class="review-icons"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/dannpetty/128.jpg" alt="">
									</div>
									<div class="review-content">
										<blockquote>
											<p class="display-2">Perhaps the most romantic place in the city.</p>
										</blockquote>
									</div>
									<div class="review-author"><span>Ralph Waldo Emerson</span></div>
								</div>
								<div class="review">
									<div class="review-icons"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/walterstephanie/128.jpg" alt="">
									</div>
									<div class="review-content">
										<blockquote>
											<p class="display-2">I love this place!</p>
										</blockquote>
									</div>
									<div class="review-author"><span>Marilyn Monroe</span></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="80px"></div>
						</div>
					</div>
				</div>
			</section>
			<!-- Testimonials end-->

			<!-- Chef-->
			<section class="module bg-gray p-b-0">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-md-6">
							<p class="subtitle">Professional cook team</p>
							<h1 class="display-1">In the Kitchen</h1>
							<p class="lead">Professional chefs rely on a battery of tools and equipment. Chefs must be conscious of their kitchen tools when planning a menu and understand their use and production capacity.</p>
							<div class="divider-border-left"></div>
							<div class="space" data-mY="60px"></div><a class="btn btn-black" href="#">View our menu</a>
						</div>
						<div class="col-md-6"><img src="assets/images/chef-1.png" alt=""></div>
					</div>
				</div>
			</section>
			<!-- Chef End-->

			<!-- News-->
			<section class="module" id="news">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">From the blog</p>
							<h1 class="display-1">Special Recipes</h1>
							<p class="lead">See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
							<div class="divider-border"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row appear-childer blog-grid">
						<div class="col-md-4 post-item">

							<!-- Post-->
							<article class="post">
								<div class="post-preview"><a href="#"><img src="assets/images/menu/4.jpg" alt=""></a></div>
								<div class="post-wrapper">
									<div class="post-header">
										<h2 class="post-title display-1"><a href="blog-single-1.html">Which Lamb is the Best: American, Australian or New Zealand?</a></h2>
									</div>
									<div class="post-content">
										<p>See how your users experience your website in realtime or view trends to see any changes in performance over time...</p>
									</div>
									<div class="post-more"><a href="#">read more...</a></div>
								</div>
							</article>
							<!-- Post end-->
						</div>
						<div class="col-md-4 post-item">

							<!-- Post-->
							<article class="post">
								<div class="post-preview"><a href="#"><img src="assets/images/menu/5.jpg" alt=""></a></div>
								<div class="post-wrapper">
									<div class="post-header">
										<h2 class="post-title display-1"><a href="blog-single-1.html">The Caipirinha Is The Brazilian Cocktail You’ve Been Too Afraid To Pronounce</a></h2>
									</div>
									<div class="post-content">
										<p>See how your users experience your website in realtime or view trends to see any changes in performance over time...</p>
									</div>
									<div class="post-more"><a href="#">read more...</a></div>
								</div>
							</article>
							<!-- Post end-->
						</div>
						<div class="col-md-4 post-item">

							<!-- Post-->
							<article class="post">
								<div class="post-preview"><a href="#"><img src="assets/images/menu/6.jpg" alt=""></a></div>
								<div class="post-wrapper">
									<div class="post-header">
										<h2 class="post-title display-1"><a href="blog-single-1.html">The Plum Recipes That’ll Make You Fall In Love With This Stone Fruit</a></h2>
									</div>
									<div class="post-content">
										<p>See how your users experience your website in realtime or view trends to see any changes in performance over time...</p>
									</div>
									<div class="post-more"><a href="#">read more...</a></div>
								</div>
							</article>
							<!-- Post end-->
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="text-center"><a class="btn btn-circle btn-gray" href="#">All Recipes</a></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="100px"></div>
						</div>
					</div>
				</div>
			</section>
			<!-- News end-->

			<svg class="footer-circle" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100" viewbox="0 0 100 100" preserveaspectratio="none">
				<path d="M0 100 C40 0 60 0 100 100 Z"></path>
			</svg>
			<!-- Footer-->
			<footer class="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<!-- Text widget-->
							<aside class="widget widget_text">
								<div class="textwidget">
									<p><img src="assets/images/logo-light.png" width="74px" alt=""></p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
									<ul class="icon-list">
										<li><i class="ti-email"></i> info@themebusiness.com</li>
										<li><i class="ti-headphone-alt"></i> 1-444-123-4559</li>
										<li><i class="ti-location-pin"></i> Raymond Boulevard 224, New York</li>
									</ul>
								</div>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Recent entries widget-->
							<aside class="widget widget_recent_entries">
								<div class="widget-title">
									<h5>Recent Posts</h5>
								</div>
								<ul>
									<li><a href="#">Matcha Portuguese Egg Tarts</a> <span class="post-date">May 8, 2016</span></li>
									<li><a href="#">Camp Cooking: One Pan Yaki Udon</a> <span class="post-date">April 7, 2016</span></li>
									<li><a href="#">Chicken & Spring Vegetable Lasagna</a> <span class="post-date">April 7, 2016</span></li>
									<li><a href="#">Mini California Sushi Cones</a> <span class="post-date">April 7, 2016</span></li>
								</ul>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Twitter-->
							<aside class="widget twitter-feed-widget">
								<div class="widget-title">
									<h5>Twitter Feed</h5>
								</div>
								<div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Recent portfolio widget-->
							<aside class="widget widget_recent_works">
								<div class="widget-title">
									<h5>Instagram</h5>
								</div>
								<ul>
									<li><a href="#"><img src="assets/images/widgets/1.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/2.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/3.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/4.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/5.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/6.jpg" alt=""></a></li>
								</ul>
							</aside>
						</div>
					</div>
				</div>
				<div class="small-footer">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="copyright">© 2017 <a href="http://2the.me/">2theme</a>, All Rights Reserved.</div>
							</div>
							<div class="col-md-6">
								<ul class="social-links">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- Footer end-->
		</div>
		<!-- Wrapper end-->

		<!-- Off canvas-->
		<div class="off-canvas-sidebar" data-background="assets/images/sidebar.jpg">
			<div class="off-canvas-sidebar-wrapper">
				<div class="off-canvas-header"><a class="close-offcanvas" href="#"><span class="arrows arrows-arrows-remove"></span></a></div>
				<div class="off-canvas-content">
					<!-- Text widget-->
					<aside class="widget widget_text">
						<div class="textwidget">
							<p><img src="assets/images/logo-light.png" width="74px" alt=""></p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
							<ul class="icon-list">
								<li><i class="ti-email"></i> info@themebusiness.com</li>
								<li><i class="ti-headphone-alt"></i> 1-444-123-4559</li>
								<li><i class="ti-location-pin"></i> Raymond Boulevard 224, New York</li>
							</ul>
						</div>
					</aside>
					<!-- Recent portfolio widget-->
					<aside class="widget widget_recent_works">
						<div class="widget-title">
							<h5>Instagram</h5>
						</div>
						<ul>
							<li><a href="#"><img src="assets/images/widgets/1.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/2.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/3.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/4.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/5.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/6.jpg" alt=""></a></li>
						</ul>
					</aside>
					<!-- Text widget-->
					<!--aside.widget.widget_text
					.textwidget
						.up-logo
							p.text-center.m-b-50: img(src="assets/images/logo-light.png" width="100" alt="")
						.up-form
							form(method="post")
								.form-group
									input.form-control.form-control-lg(type="email" placeholder="Email")
								.form-group
									input.form-control.form-control-lg(type="password" placeholder="Pasword")
								.form-group
									button(type="submit" class="btn btn-block btn-lg btn-round btn-brand") Log in
						.up-help
							p: a(href="#") Forgot your password?
							p Don't have an account yet? <a href="#">Sign in</a>
					
					-->

					<!-- Twitter widget-->
					<aside class="widget twitter-feed-widget">
						<div class="widget-title">
							<h5>Twitter Feed</h5>
						</div>
						<div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
					</aside>
					<ul class="social-icons">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-vk"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Off canvas end-->

		<!-- Reserve Popup-->
		<div class="white-popup-block mfp-hide" id="test-form">
			<div class="container">
				<div class="row">
					<div class="col-md-4 p-0">
						<div class="qwert" data-background="assets/images/module-2.jpg"></div>
					</div>
					<div class="col-md-8">
						<div class="ddd"><a class="popup-modal-dismiss" href="#"><i class="ti-close"></i></a>
							<h1 class="display-1">Book a Table</h1>
							<p class="lead">See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
							<div class="divider-border-left"></div>
							<div class="space" data-mY="60px"></div>
							<form method="post" novalidate>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="name" placeholder="Name" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="name" placeholder="Phone" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="email" name="email" placeholder="E-mail" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="subject" placeholder="Persons" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="email" name="email" placeholder="Date" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="subject" placeholder="Time" required="">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" placeholder="Special Requests" rows="6" required=""></textarea>
										</div>
									</div>
									<div class="col-md-12">
										<input class="btn btn-black" type="submit" value="Reserve">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Reserve Popup end-->

		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>

		<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="assets/js/plugins.min.js"></script>
		<script src="assets/js/custom.min.js"></script>
</body>
</html>