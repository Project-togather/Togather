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
										<div class="post-preview">
										
											<div class="col-md-12">
												<div class="image-slider owl-carousel">
													<c:forEach var="i" begin="0" end="${ (fn:length(atList))-1}"  step="1">
														<img src="${atList[i].filePath}" alt="">
													</c:forEach>
												</div>
											</div>
										
										</div>
										<div class="post-wrapper">
											<div class="post-header">
												<h1 class="post-title display-1">Feed Content..</h1>
												<ul class="post-meta">
													<li>${f.feDate}</li>
													<li><a href="#">Like : ${f.likeCount}</a>,</li>
													<li>3 Comments</li>
												</ul>
											</div>
											<div class="post-content">
												<p>${f.feContent}</p>
												
											</div>
											<div class="post-footer">
												<div class="post-tags">
												 	<c:forEach var="i" begin="0" end="${ (fn:length(interArr))-1}"  step="1">
												 		${interArr[i]} 
												 	</c:forEach>
												</div>
											</div>
										</div>
									</article>
									<!-- Post end-->
									<!-- Comments area-->
									<div class="comments-area">
										<h5 class="comments-title">3 Comments</h5>
										<div  class="comment-list">
											<div id="replySection" class="comment">
												
												<!-- Subcomment-->
												
												
												
											</div>
											<!-- 이건지울꺼임 -->
											<div id="replySection2" class="comment"> 
												
											</div>
											
											
										
										</div>
										<div class="comment-respond">
											<h5 class="comment-reply-title">Leave a Reply</h5>
											<p class="comment-notes">Required fields are marked</p>
											
												<div class="form-group col-md-12">
													<textarea id ="rvContent" class="form-control" rows="8" placeholder="Comment"></textarea>
												</div>
												<div class="form-submit col-md-12">
													<button type="button" class="btn btn-black" onClick="insertFeedReply();">Post Comment</button>
												</div>
												
										</div>
										
									</div>
									<script>
									$(function (){
										showFeedReply() ;
										
										
									
											
											
											
									})
									
									
									function test1(){
										alert("할루");
										let hello ="RE16"
											let value2 = "";
											value2 +=
												"<div class='children'>"
												+	"<div class='comment'>"
												+		"<div class='comment-author'><img class='avatar' src='assets/images/avatar/2.jpg' ></div>"
												+		"<div class='comment-body'>"
												+			"<div class='comment-meta'>"
												+				"<div class='comment-meta-author'><a href='#'>샘플답글 이름</a></div>"
												+				"<div class='comment-meta-date'><a href='#'>샘플답글 시간</a></div>"
												+			"</div>"
												+			"<div class='comment-content'>"
												+				"<p>샘플답글 내용.</p>"
												+			"</div>"
												+		"</div>"
												+	"</div>"
												+"</div>"
												console.log(value2);
												
												$("#replySection").find("#RE2").after(value2);

									}
									
									
									
									//댓글 보여주기 함수
									function showFeedReply(){
										$.ajax({
											url : "showFeedReply.re",
											data : {feNo : '${f.feNo}'},												
											success: function(rList){
												//console.log(rList);
												
												let value = "";
												for (let i = 0 ; i < rList.length ; i++){
													let rvNo = rList[i].rvNo;
													console.log(rvNo);
													value += 
													"<div id ="+ rvNo +">"	
														+"<div class='comment-author'><img class='avatar' src=" + rList[i].img  +"></div>" 
														+"<div class='comment-body'>"
														+"	<div class='comment-meta'>"
														+"		<div class='comment-meta-author'><a href='#'>"+ rList[i].nickname+ "</a></div>"
														+"		<div class='comment-meta-date'><a href='#'>"+rList[i].rvDate+"</a></div>"
														+"	</div> "
														+"	<div class='comment-content'>"
														+"		<p>"+rList[i].rvContent+"</p>"
														+"	</div>"
														+"	<div class='comment-reply'><a href='#'>Reply</a></div>"
														+"</div>"
													+"</div>";
												}
												$("#replySection").html(value);
												test1();
												
											},
											error : function(){
												console.log("댓글불러오기 ajax실패");
											}
										})
									}
									
									
									
										function insertFeedReply(){
											$.ajax({
												url : "insertFeedReply.re",
												data : {rvContent : $("#rvContent").val(),
														refFno : '${f.feNo}',
														memNo : '${loginMember.memNo}'
														},
												success : function (result){
													if(result == "YYYYY"){
														showFeedReply();
													}
													else{
														alert("댓글작성실패");
													}
													
												},
												error : function(){
													console.log("에이작 통신실패");
												}
											})
										}
									
										
										
									</script>
									
									
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
												<c:choose>
													<c:when test="${f.refCno eq 'example1'}">
														<h6>Personal Feed</h6>
													</c:when>
													<c:otherwise>
														<h6>${f.refCno}Club</h6>
														<div class="textwidget">
															<p><img src="assets/images/module-1.jpg" alt=""></p>
															<p>thisFeed is review of this Club</p>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
											
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