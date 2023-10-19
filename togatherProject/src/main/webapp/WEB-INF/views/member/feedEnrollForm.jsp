<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	
	</head>
	<body>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
	
		<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->
		

		

		<!-- Wrapper-->
			<!-- Hero-->
			<section class="module-cover parallax" data-background="assets/images/black.jpg" data-overlay="1" data-gradient="1">
				<div class="container">
				
				
					<div class="row">
						<div class="col-md-12">
							<div class="text-center">
								<h2 class="display-1"> Write your Feed</h2>
								<p>you can write anything you want<br/>show your daily Life to EveryBody!</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Hero end-->
		<div class="wrapper">
		<section class="module">
					<div class="container">
						<div class="row">
						
						<div class="col-md-6 m-auto text-center">
							<h1 class="display-1">Feed Image preView</h1>
							<p class="lead">if you insert Images below insert tab<br/> you can check your images before enroll feed</p>
							<div class="divider-border"></div>
						</div>
						
							
							<div class="owl-carousel menu-carousel" data-carousel-options="{&quot;nav&quot;: false}">
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a id="first" class="photo" href="assets/images/insertImage2.png"></a>
									<img id = "titleImg"  src="assets/images/insertImage2.png" onclick="chooseFile(1);">
										<div class="menu-classic-item-price">Image1
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>ThumbNail Image</h6>
										<p>it will be your thumbnail image of this feed</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a id="second" class="photo" href="assets/images/insertImage2.png"></a>
									<img id = "contentImg1"  src="assets/images/insertImage2.png" onclick="chooseFile(2);">
										<div class="menu-classic-item-price">Image2
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Second Image</h6>
										
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a id="third" class="photo" href="assets/images/insertImage2.png"></a>
									<img id = "contentImg2"  src="assets/images/insertImage2.png" onclick="chooseFile(3);">
										<div class="menu-classic-item-price">Image3
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Third Image</h6>
										
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a id="forth" class="photo" href="assets/images/insertImage2.png"></a>
									<img id = "contentImg3"  src="assets/images/insertImage2.png" onclick="chooseFile(4);">
										<div class="menu-classic-item-price">Image4
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Fourth image</h6>
										
									</div>
								</div>
								
						</div>
							
					</div>
		</section>
		
			<div class="col-md-6 m-auto text-center">
					<h1 class="display-1">Insert Image</h1>
					<p class="lead">Click below insertImage section<br/>more than 1 image is required to wirte your new Feed</p>
					<div class="divider-border"></div>
			</div>
		
		
		
			<section class="module">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<img id = "titleImg1" width="250" height="170" src="assets/images/insertImage2.png" onclick="chooseFile(1);">
								<img id = "contentImg11" width="250" height="170" src="assets/images/insertImage2.png" onclick="chooseFile(2);">
								<img id = "contentImg21" width="250" height="170" src="assets/images/insertImage2.png" onclick="chooseFile(3);">
								<img id = "contentImg31" width="250" height="170" src="assets/images/insertImage2.png" onclick="chooseFile(4);">
								
							</div>
						</div>
					</div>
			</section>
			

			<section class="module">
				<div class="container">
					<div class="row">
						<div class="comment-respond">
							<h5 class="comment-reply-title">Write your Feed</h5>
							  	<p class="comment-notes">Add more than 1 picture and select yout thumbnail Image</p>
									<form action="insertFeed.me" method="post" class="comment-form row" enctype="multipart/form-data">
									
										<div class="form-group col-md-4">
											<div id="file-area" style = "display:none">
								                <input class="form-control" type="file" name="upfile" id = "file1" onchange ="loadImg(this,1)" required>
								                <input class="form-control" type="file" name="upfile" id = "file2" onchange ="loadImg(this,2)">
								                <input class="form-control" type="file" name="upfile" id = "file3" onchange ="loadImg(this,3)">
								                <input class="form-control" type="file" name="upfile" id = "file4" onchange ="loadImg(this,4)">
								            </div>
								         </div> 
							            
							            
										<div class="form-group col-md-4">
												  <input type="radio" id="option1" name="option" value="1" onclick="test1();">
												  <label for="option1">Personal Feed</label></br>
												  <input type="radio" id="option2" name="option" value="2" onclick="test2();">
												  <label for="option2">Review</label></br>

										</div>
										<script>
										
											function test1(){
												$("#checkTarget").css("display","none");
											}
											function test2(){
												$("#checkTarget").css("display","block");
											}
										
										</script>
										<div id="checkTarget" class="form-group col-md-4" style = "display:none">
											<select name="refCno" id="lang">
											    <option value="example1">example1</option>
											    <option value="example2">example2</option>
											    <option value="example3">example3</option>
											  </select>
										</div>
									

										<div class="form-group col-md-12">
											<textarea class="form-control" name="feContent" rows="8" placeholder="Comment"></textarea>
										</div>
											<div class="form-submit col-md-12">
												<button class="btn btn-black" type="submit">Post Feed</button>
											</div>
									</form>
						</div>
					</div>
				</div>
			</section>
			
			<script >
            	function chooseFile(num){
            		$("#file"+num).click();
            	}
            	function loadImg(inputFile , num){
            		console.log(inputFile);

            		if (inputFile.files.length == 1){
            			console.log("이거좀봐" + inputFile.files.length);
            			const reader = new FileReader();
            			reader.readAsDataURL(inputFile.files[0]);
            			reader.onload = function(e){
            				switch (num){
                                case 1: 
                                $("#titleImg").attr("src",e.target.result);
                                $("#titleImg1").attr("src",e.target.result);
                                $("#first").attr("href",e.target.result);
                                console.log(num);
                                break;
                                
                                case 2: $("#contentImg1").attr("src",e.target.result);
                                $("#contentImg11").attr("src",e.target.result);
                                $("#second").attr("href",e.target.result);
                                console.log(num);
                                break;
                               
                                case 3: $("#contentImg2").attr("src",e.target.result);
                                $("#contentImg21").attr("src",e.target.result);
                                $("#third").attr("href",e.target.result);
                                console.log(num);
                                break;
                                
                                case 4: $("#contentImg3").attr("src",e.target.result);
                                case 4: $("#contentImg31").attr("src",e.target.result);
                                $("#forth").attr("href",e.target.result);
                                console.log(num);
                                break;
                            }
            			}
            		}else{//파일이 빠졌을경우
                        switch (num){
                                case 1: $("#titleImg").attr("src","assets/images/insertImage2.png");
                                break;
                                case 2: $("#contentImg1").attr("src","assets/images/insertImage2.png");
                                break;
                                case 3: $("#contentImg2").attr("src","assets/images/insertImage2.png");
                                break;
                                case 4: $("#contentImg3").attr("src","assets/images/insertImage2.png");
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


	</body>
</html>