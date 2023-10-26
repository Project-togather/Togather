<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%
	//String str = (String)request.getAttribute("memNo");
	//System.out.println(str);
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<style >
		ul {
		  list-style-type: none;
		}
		
		li {
		  display: inline-block;
		}
		
		input[type="checkbox"][id^="myCheckbox"] {
		  display: none;
		}
		
		label {
		  border: 1px solid #fff;
		  padding: 10px;
		  display: block;
		  position: relative;
		  margin: 10px;
		  cursor: pointer;
		}
		
		label:before {
		  background-color: white;
		  color: white;
		  content: " ";
		  display: block;
		  border-radius: 50%;
		  border: 1px solid grey;
		  position: absolute;
		  top: -5px;
		  left: -5px;
		  width: 25px;
		  height: 25px;
		  text-align: center;
		  line-height: 28px;
		  transition-duration: 0.4s;
		  transform: scale(0);
		}
		
		label img {
		  height: 100px;
		  width: 220px;
		  transition-duration: 0.2s;
		  transform-origin: 50% 50%;
		}
		
		:checked + label {
		  border-color: #ddd;
		}
		
		:checked + label:before {
		  content: "✓";
		  background-color: grey;
		  transform: scale(1);
		}
		
		:checked + label img {
		  transform: scale(0.9);
		  /* box-shadow: 0 0 5px #333; */
		  z-index: -1;
}
	</style>
	
	
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>updateYourProfile</title>
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
		<jsp:include page="../common/menubar.jsp"></jsp:include>
		
	

		<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->

		

		<!-- Wrapper-->
		<div class="wrapper">
		
			<!-- Hero-->
			<section class="module-cover parallax" data-background="assets/images/black.jpg" data-overlay="1" data-gradient="1">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="text-center">
								<h1 class="display-1">update my Information</h1>
								<p>show your interest and tell me who you are <br/>if you set your profile detail, you can join club more easily  </p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Hero end-->

			<!---->
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">update my Information</p>
							<h1 class="display-1">MyProfile</h1>
							<p class="lead">show your interest and tell me who you are <br/> if you set your profile detail, you can join club more easily.</p>
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
							<form action="update.me" method="post" enctype="multipart/form-data" novalidate>
							<input type="hidden" name="memNo" value ="${memNo}"/>
								
							
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											 <div class="select">
											     <ul>
												  <li>
												    <input type="checkbox" id="myCheckbox1" name="interest" value="1" />
												    <label for="myCheckbox1"><img src="assets/images/interest/newMusic.png" /></label>
												  </li>
												  <li>
												
												    <input type="checkbox" id="myCheckbox2" name="interest" value="2"/>
												    <label for="myCheckbox2"><img src="assets/images/interest/newActivity.png" /></label>
												  </li>
												  <li>
												
												    <input type="checkbox" id="myCheckbox3" name="interest" value="3" />
												    <label for="myCheckbox3"><img src="assets/images/interest/newFood.png" /></label>
												  </li>
												  <li>
												
												    <input type="checkbox" id="myCheckbox4" name="interest" value="4" />
												    <label for="myCheckbox4"><img src="assets/images/interest/newHobby.png" /></label>
												  </li>
												  <li>
												
												    <input type="checkbox" id="myCheckbox5" name="interest" value="5"/>
												    <label for="myCheckbox5"><img src="assets/images/interest/newParty.png" /></label>
												  </li>
												  <li>
												
												    <input type="checkbox" id="myCheckbox6" name="interest" value="6"/>
												    <label for="myCheckbox6"><img src="assets/images/interest/newDate.png" /></label>
												  </li>
												  <li>
												
												    <input type="checkbox" id="myCheckbox7" name="interest" value="7"/>
												    <label for="myCheckbox7"><img src="assets/images/interest/newInvestment.png" /></label>
												  </li>
												  <li>
												    <input type="checkbox" id="myCheckbox8" name="interest" value="8"/>
												    <label for="myCheckbox8"><img src="assets/images/interest/newLanguage.png" /></label>
												  </li>
												</ul>
											</div>
										</div>
									</div>						
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="msg" placeholder="comment" rows="6"  required>${loginMember.msg}</textarea>
										</div>
									</div>

										<div class="col-md-12">
											<div class="form-group">
												newNickName
												<input class="form-control" name="nickName" type="text" placeholder="nickName" value="${loginMember.nickName}"  required>
												newProfileImg<br>
												<img src="${loginMember.img}"  id="titleImg" width="250" height="170" onclick="chooseFile(1);" style="border-radius: 150px;">
												  <div id="file-area" style = "display:none">
									                <input type="file" name="upfile" id = "file1" onchange ="loadImg(this,1)" required>
									             </div>
											</div>
										</div>
										
									
							                    
										
									
									
									<div class="col-md-12">
										<div class="text-center">
											<input class="btn btn-black" type="submit" value="Reserve">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="100px"></div>
						</div>
					</div>
				</div>
			</section>
			
			
			<script>
				 function chooseFile(num){
	          		$("#file"+num).click();
	          	}
	          	function loadImg(inputFile , num){
	          		if (inputFile.files.length == 1){//파일이 선택된경우 => 파일읽어들여서 미리보기
	          			
	          			const reader = new FileReader();
	          			reader.readAsDataURL(inputFile.files[0]);
	          			//해당파일을 읽어들이는 순간 해당 파일만이 가지고 있는 url 을 부여해줌
	          			//파일 읽어들이기가 완료가 되었다면 실행할 함수는?
	          			reader.onload = function(e){
	          			//e.target.result -> 읽어들인 파일의 고유한 url 이 들어가 있다	
	          				switch (num){
	                              case 1: $("#titleImg").attr("src",e.target.result);
	                              break; 
	                          }
	          			}
	          		}else{//파일이 빠졌을경우
	                      switch (num){
	                              case 1: $("#titleImg").attr("src",null);
	                              break;
	                          }
	          		}
	
	          		
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