<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>FeedDetailView</title>
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

			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-lg-11 m-auto">
							<div class="row">
								<div class="col-lg-8">
									<!-- Post-->
									<article class="post">
										<div class="post-preview"><img src="http://piquant.mikado-themes.com/wp-content/uploads/2015/11/b-grilled-chorizo-with-spicy-sauce.jpg" alt=""></div>
										<div class="post-wrapper">
											<div class="post-header">
												<h1 class="post-title display-1">Try some healthy crackers for snacks</h1>
												<ul class="post-meta">
													<li>November 18, 2016</li>
													<li>In <a href="#">Branding</a>, <a href="#">Design</a></li>
													<li><a href="#">3 Comments</a></li>
												</ul>
											</div>
											<div class="post-content">
												<p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
												<p>Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum.</p>
												<!--blockquotep To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.
												-->
												<p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
												<p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
												<!--ol
												li Digital Strategy
												li Software Development
												li Interaction Design
												-->
												<p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
												<p>Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa eiusmod Pinterest in do umami readymade swag.</p>
											</div>
											<div class="post-footer">
												<div class="post-tags"><a href="#">Lifestyle</a><a href="#">Music</a><a href="#">News</a><a href="#">Travel</a></div>
											</div>
										</div>
									</article>
									<!-- Post end-->
									<!-- Comments area-->
									<div class="comments-area">
										<h5 class="comments-title">3 Comments</h5>
										<div class="comment-list">
											<!-- Comment-->
											<div class="comment">
												<div class="comment-author"><img class="avatar" src="assets/images/avatar/1.jpg" alt=""></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author"><a href="#">Jason Ford</a></div>
														<div class="comment-meta-date"><a href="#">May 5, 2015 at 4:51 am</a></div>
													</div>
													<div class="comment-content">
														<p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud.</p>
													</div>
													<div class="comment-reply"><a href="#">Reply</a></div>
												</div>
												<!-- Subcomment-->
												<div class="children">
													<div class="comment">
														<div class="comment-author"><img class="avatar" src="assets/images/avatar/2.jpg" alt=""></div>
														<div class="comment-body">
															<div class="comment-meta">
																<div class="comment-meta-author"><a href="#">Harry Benson</a></div>
																<div class="comment-meta-date"><a href="#">May 5, 2015 at 4:51 am</a></div>
															</div>
															<div class="comment-content">
																<p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud.</p>
															</div>
															<div class="comment-reply"><a href="#">Reply</a></div>
														</div>
													</div>
												</div>
											</div>
											<!-- Comment-->
											<div class="comment">
												<div class="comment-author"><img class="avatar" src="assets/images/avatar/3.jpg" alt=""></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author"><a href="#">Henry Cain</a></div>
														<div class="comment-meta-date"><a href="#">May 5, 2015 at 4:51 am</a></div>
													</div>
													<div class="comment-content">
														<p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud.</p>
													</div>
													<div class="comment-reply"><a href="#">Reply</a></div>
												</div>
											</div>
										</div>
										<div class="comment-respond">
											<h5 class="comment-reply-title">Leave a Reply</h5>
											<p class="comment-notes">Your email address will not be published. Required fields are marked</p>
											<form class="comment-form row">
												<div class="form-group col-md-4">
													<input class="form-control" type="text" placeholder="Name">
												</div>
												<div class="form-group col-md-4">
													<input class="form-control" type="text" placeholder="Email">
												</div>
												<div class="form-group col-md-4">
													<input class="form-control" type="url" placeholder="Website">
												</div>
												<div class="form-group col-md-12">
													<textarea class="form-control" rows="8" placeholder="Comment"></textarea>
												</div>
												<div class="form-submit col-md-12">
													<button class="btn btn-black" type="submit">Post Comment</button>
												</div>
											</form>
										</div>
									</div>
									<!-- Comments area end-->
								</div>

								<div class="col-lg-4">
									<div class="sidebar">
										<!-- Search widget-->
										<aside class="widget widget_search">
											<form>
												<input class="form-control" type="search" placeholder="Type search here">
												<button class="search-button" type="submit"><span class="fa fa-search"></span></button>
											</form>
										</aside>

										<!-- Text widget-->
										<aside class="widget widget_text">
											<div class="widget-title">
												<h6>About Us</h6>
											</div>
											<div class="textwidget">
												<p><img src="assets/images/module-1.jpg" alt=""></p>
												<p>See how your users experience your website in realtime or view trends to see any changes in performance over time.</p>
											</div>
										</aside>

										<!-- Recent entries widget-->
										<aside class="widget widget_recent_entries_custom">
											<div class="widget-title">
												<h6>Recent Posts</h6>
											</div>
											<ul>
												<li class="clearfix">
													<div class="wi"><a href="#"><img src="assets/images/widgets/1.jpg" alt=""></a></div>
													<div class="wb"><a href="#">Brazilian Burger With Egg</a><span class="post-date">May 8, 2016</span></div>
												</li>
												<li class="clearfix">
													<div class="wi"><a href="#"><img src="assets/images/widgets/2.jpg" alt=""></a></div>
													<div class="wb"><a href="#">Mini California Sushi Cones</a><span class="post-date">May 8, 2016</span></div>
												</li>
												<li class="clearfix">
													<div class="wi"><a href="#"><img src="assets/images/widgets/3.jpg" alt=""></a></div>
													<div class="wb"><a href="#">Matcha Portuguese Egg Tarts</a><span class="post-date">May 8, 2016</span></div>
												</li>
											</ul>
										</aside>

										<!-- Twitter widget-->
										<aside class="widget twitter-feed-widget">
											<div class="widget-title">
												<h6>Twitter Feed</h6>
											</div>
											<div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
										</aside>

										<!-- Tags widget-->
										<aside class="widget widget_tag_cloud">
											<div class="widget-title">
												<h6>Tags</h6>
											</div>
											<div class="tagcloud"><a href="#">e-commerce</a><a href="#">portfolio</a><a href="#">responsive</a><a href="#">bootstrap</a><a href="#">business</a><a href="#">corporate</a></div>
										</aside>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

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