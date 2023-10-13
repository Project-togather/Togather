<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Tavern - Responsive Restaurant Template(Bootstrap 4)</title>
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
		<!-- Header-->
		<jsp:include page="../common/menubar.jsp"/>

		<!-- Wrapper-->
		<div class="wrapper">

			<!-- Hero-->
			<section class="module-cover parallax" data-background="" data-overlay="0.7">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto">
							<div class="text-center">
								<div class="up-as">
									<h4>모임 등록하기</h4>
								</div>
								<div class="up-form">
									<form method="post">
										<div class="form-group">
											<input type="hidden" id="hidden">
											<h5>모임유형을 선택해주세요!</h5>
											<select name="" id="">
												<option value="">소셜링</option>
												<option value="">클럽</option>
												<option value="">챌린지</option>
											</select>
										</div>
										<div class="form-group">
											<div class="form-control" id="socialing" style="color: white;">소셜링</div>
										</div>
										<div class="form-group">
											<div class="form-control" id="club" style="color: white;">클럽</div>
										</div>
										<div class="form-group">
											<div class="form-control" id="challenge" style="color: white;">챌린지</div>
										</div>
										<hr>
										<h5>(소셜링, 클럽, 챌린지)주제를 선택해 볼까요?</h5>
										<div class="form-group">
											<select name="class_category" id="">
												<option>문화 예술</option>
												<option>액티비티</option>
												<option>푸드 드링크</option>
												<option>취미</option>
												<option>파티 소개팅</option>
												<option>동네 친목</option>
												<option>재테크</option>
												<option>외국어</option>
											</select>
										</div>
										<hr>
										<h5>(소셜링, 클럽, 챌린지)정보를 입력할 차례에요!</h5>
										<div class="form-group">
											<input class="form-control" type="text" placeholder="소셜링 제목을 작성해주세요!"> <!-- 글자수체크 추가 -->
										</div>
										<table>
											<tr>
												<td><img id="contentImg1" width="150" height="120" onclick="chooseFile(1);"></td>
												<td><img id="contentImg2" width="150" height="120" onclick="chooseFile(2);"></td>
												<td><img id="contentImg3" width="150" height="120" onclick="chooseFile(3);"></td>
												<td><img id="contentImg4" width="150" height="120" onclick="chooseFile(4);"></td>
												<td><img id="contentImg5" width="150" height="120" onclick="chooseFile(5);"></td>
											</tr>
										</table>
										<div style="display:none">
											<input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
											<input type="file" id="file2" name="file2" onchange="loadImg(this, 1);">
											<input type="file" id="file3" name="file3" onchange="loadImg(this, 1);">
											<input type="file" id="file4" name="file4" onchange="loadImg(this, 1);">
											<input type="file" id="file5" name="file5" onchange="loadImg(this, 1);">
										</div>
										<br>
										<div class="form-group">
											<input class="form-control" type="password" placeholder="Pasword">
										</div>
										<div class="form-group">
											<input class="form-control" type="password" placeholder="Confirm password">
										</div>
										<div class="form-group">
											<button class="btn btn-block btn-round btn-brand" type="submit">Sign Up</button>
										</div>
										
										<script>
											function chooseFile(num){
												$("#file" + num).click();
												console.log(num)
											}
									
											function loadImg(inputFile, num){
												if(inputFile.files.length == 1){
													const reader = new FileReader();
													reader.readAsDataURL(inputFile.files[0]);
													reader.onload = function(e){
														switch(num){
						        						case 1 : $("#contentImg1").attr("src", e.target.result); break;
						        						case 2 : $("#contentImg2").attr("src", e.target.result); break;
						        						case 3 : $("#contentIme3").attr("src", e.target.result); break;
						        						case 4 : $("#contentImg4").attr("src", e.target.result); break;
						        						case 4 : $("#contentImg5").attr("src", e.target.result); break;
														
														}
													}
												} else{
													switch(num){
					        						case 1 : $("#contentImg1").attr("src", null); break;
					        						case 2 : $("#contentImg2").attr("src", null); break;
					        						case 3 : $("#contentIme3").attr("src", null); break;
					        						case 4 : $("#contentImg4").attr("src", null); break;
					        						case 4 : $("#contentImg5").attr("src", null); break;
												}
											}
											
										</script>
										
									</form>		
								</div>
								<div class="up-help">
									<p>By clicking "Sign Up", you agree to our <br> <a href="#">software services agreement</a>.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Hero end-->

			<script>
				// 모임 유형 선택 (div)시 다른 div 체크해제 + 히든에 값주기
			</script>

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