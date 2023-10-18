<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>searchFeedPage</title>
		
		<!-- jQuery 라이브러리 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
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

		<link
		rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

		<!-- Include Bootstrap JS and jQuery (optional) -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	  
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
			  integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	  
		<!-- 요기에 구글 머티리얼 아이콘 -->
		<link
		  href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
		  rel="stylesheet">

<style>
.top-bar {
	position: relative;

	height: 130px;
	border-bottom: 1px solid lightgray;
}

.search-box {

	position: absolute;
	top: 30%;
	left: 35%;
	
	height: 60px;

	background-color: #f5f5f5;
	border-radius: 30px;
}

.search-txt{
	display: flex;
	padding: 0;
	width: 600px;
	border:none;
	background: none;
	outline: none;
	float: left;

	font-size: 1rem;
	line-height: 50px;
	margin-top: 1%;
	margin-left: 2%;

	position: relative;
}

.search-btn{
	/*
	box-sizing: border-box;
	border: 1px solid black;
	*/

	margin-left: 90%;
	margin-bottom: 50px;

	position: absolute;
	bottom: 75%;
}

.post-title {
	font-size: 1px;
}




.open-offcanvas {

}

.ti-user fa-2x {

}

/* 피드 디자인 */

.feed {
	display: flex;
	flex-wrap: wrap;
	justify-content: center; /* 가로 중앙 정렬 */
  	align-items: center; /* 세로 중앙 정렬 */
	gap: 0; /* No gap between feed items */
}

.row {
	display: flex;
	flex: 1; /* Equal distribution of available space */
}

.feed-item {
	width: 480px; /* 변경: 너비를 480px로 설정 */
	background-color: white;
	height: 480px;
	margin: 0; /* Remove margin */
	display: flex; /* 내부 요소 중앙 정렬을 위해 내부 요소에도 flex를 적용 */
	justify-content: center; /* 내부 요소 가로 중앙 정렬 */
	align-items: center; /* 내부 요소 세로 중앙 정렬 */
}

.feed-box {

	padding: 5%;

}

@media (max-width: 768px) { /* 미디어 쿼리 화면 폭 조건을 설정 */
	.feed-item {
		width: 100%; /* 화면 폭이 768px 이하일 때 feed-item 하나씩 표시 */
	}
}




.feed_img{
    width: 100%;
    object-fit: contain;
}

.feed_content{
    padding: 10px;
}


.feed_like{
    padding: 0px 10px;
}

.feed_reply{
    padding: 0px 10px;
    display: flex;
    flex-direction: column;
}


.feed_txt{
    font-size: 14px;
}

.feed_icon{
    padding: 5px 5px 0px 5px;
    display: flex;
    justify-content: space-between;
}span{
     padding-right: 5px;
 }
</style>

</style>
	</head>
	<body>

		<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->

		<!-- Wrapper-->
		<div class="wrapper">

		<!-- Hero-->

		<div class="top-bar" style="background-color: white;">
			<div class="search-box">
				<input type="text" class="search-txt" name="keyword" placeholder="지금 생각나는 취미를 검색하세요.">
				<a class="search-btn" href="list.so">
				<i class="fa fa-search fa-3x" aria-hidden="true" type="submit" style="color: orange;"></i>
				</a>
			</div>
		</div>

		<!-- 네비바 영역 -->
		<jsp:include page="../common/searchMenubar.jsp"/>

		<!-- Hero end-->
		
		
		<!-- 피드 영역 -->
		<section class="module">
			<div class="container">
				<div class="feed">
					<div class="feed-item" style="border: 1px solid lightgray;">
						<div class="feed-box">
							<img class="feed_img " src="https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTFfMjc1/MDAxNDk3MTcyMDgyNzEw.ID5RyHWKvsVEW2NS9EQGyRYX7vUaXr7znQeuTrRRmdIg.gK7MD7VhNJPkV4_dueiWer2y-oH7NAAmEklF-6bbYyQg.JPEG.jejubyeol/%EC%97%AC%EB%A6%84%EC%97%90_%EC%A0%9C%EC%A3%BC%EB%8F%84_%EC%82%AC%EC%A7%84%EC%B0%8D%EA%B8%B0_%EC%A2%8B%EC%9D%80%EA%B3%B3.jpg?type=w800">
							<div class="feed_icon">
								<div>
								  <span class="material-icons-outlined">
									favorite_border
								  </span>
								  <span class="material-icons-outlined">
									mode_comment
								  </span>
								  <span class="material-icons-outlined">
									send
								  </span>
								</div>
								<div>
								  <span class="material-icons-outlined">
									turned_in_not
								  </span>
								</div>
							  </div>
							  <div class="feed_like">
								<p class="feed_txt"> <b>좋아요 10개</b></p>
							  </div>
							<div class="feed_content">
							  <p class="feed_txt">.</p>
							</div>
						</div>
					</div>


					<div class="feed-item" style="border: 1px solid lightgray;">
						<div class="feed-box">
							<img class="feed_img " src="https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTFfMjc1/MDAxNDk3MTcyMDgyNzEw.ID5RyHWKvsVEW2NS9EQGyRYX7vUaXr7znQeuTrRRmdIg.gK7MD7VhNJPkV4_dueiWer2y-oH7NAAmEklF-6bbYyQg.JPEG.jejubyeol/%EC%97%AC%EB%A6%84%EC%97%90_%EC%A0%9C%EC%A3%BC%EB%8F%84_%EC%82%AC%EC%A7%84%EC%B0%8D%EA%B8%B0_%EC%A2%8B%EC%9D%80%EA%B3%B3.jpg?type=w800">
							<div class="feed_icon">
								<div>
								  <span class="material-icons-outlined">
									favorite_border
								  </span>
								  <span class="material-icons-outlined">
									mode_comment
								  </span>
								  <span class="material-icons-outlined">
									send
								  </span>
								</div>
								<div>
								  <span class="material-icons-outlined">
									turned_in_not
								  </span>
								</div>
							  </div>
							  <div class="feed_like">
								<p class="feed_txt"> <b>좋아요 10개</b></p>
							  </div>
							<div class="feed_content">
							  <p class="feed_txt">.</p>
							</div>
						</div>
					</div>



					<div class="feed-item" style="border: 1px solid lightgray;">
						<div class="feed-box">
							<img class="feed_img " src="https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTFfMjc1/MDAxNDk3MTcyMDgyNzEw.ID5RyHWKvsVEW2NS9EQGyRYX7vUaXr7znQeuTrRRmdIg.gK7MD7VhNJPkV4_dueiWer2y-oH7NAAmEklF-6bbYyQg.JPEG.jejubyeol/%EC%97%AC%EB%A6%84%EC%97%90_%EC%A0%9C%EC%A3%BC%EB%8F%84_%EC%82%AC%EC%A7%84%EC%B0%8D%EA%B8%B0_%EC%A2%8B%EC%9D%80%EA%B3%B3.jpg?type=w800">
							<div class="feed_icon">
								<div>
								  <span class="material-icons-outlined">
									favorite_border
								  </span>
								  <span class="material-icons-outlined">
									mode_comment
								  </span>
								  <span class="material-icons-outlined">
									send
								  </span>
								</div>
								<div>
								  <span class="material-icons-outlined">
									turned_in_not
								  </span>
								</div>
							  </div>
							  <div class="feed_like">
								<p class="feed_txt"> <b>좋아요 10개</b></p>
							  </div>
							<div class="feed_content">
							  <p class="feed_txt">.</p>
							</div>
						</div>
					</div>




					<div class="feed-item" style="border: 1px solid lightgray;">
						<div class="feed-box">
							<img class="feed_img " src="https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTFfMjc1/MDAxNDk3MTcyMDgyNzEw.ID5RyHWKvsVEW2NS9EQGyRYX7vUaXr7znQeuTrRRmdIg.gK7MD7VhNJPkV4_dueiWer2y-oH7NAAmEklF-6bbYyQg.JPEG.jejubyeol/%EC%97%AC%EB%A6%84%EC%97%90_%EC%A0%9C%EC%A3%BC%EB%8F%84_%EC%82%AC%EC%A7%84%EC%B0%8D%EA%B8%B0_%EC%A2%8B%EC%9D%80%EA%B3%B3.jpg?type=w800">
							<div class="feed_icon">
								<div>
								  <span class="material-icons-outlined">
									favorite_border
								  </span>
								  <span class="material-icons-outlined">
									mode_comment
								  </span>
								  <span class="material-icons-outlined">
									send
								  </span>
								</div>
								<div>
								  <span class="material-icons-outlined">
									turned_in_not
								  </span>
								</div>
							  </div>
							  <div class="feed_like">
								<p class="feed_txt"> <b>좋아요 10개</b></p>
							  </div>
							<div class="feed_content">
							  <p class="feed_txt">.</p>
							</div>
						</div>
					</div>


					<!-- Add more items as needed -->
				</div>
			</div>
		</section>
		
		


		
		<script>
			$(function() {
				feedList();
				
				// var interval = setInterval( feedList, 100000);
				
				// clearInterval(interval);
				
			})
			
			function feedList() {
				$.ajax({
					url:"list.fe",
					success:function(list) {
						
						console.log(list);

					}, error:function() {
						
						console.log("ajax 통신 실패");
					}
				})
			}
			
		</script>



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