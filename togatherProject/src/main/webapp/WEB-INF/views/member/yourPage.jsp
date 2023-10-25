<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title> ${targetMem.memName} 's Page</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		 <!-- 이거 필요한가?<script src="./bootstrapt/js/bootstrap.min.js"></script>-->

		<style>
			.gallery-item:hover{
				cursor:pointer
			}
			#newFeed :hover{
				cursor:pointer
			}
			
			

		</style>
	</head>
	<body>
	
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
	
	
	
	
	

		<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->


		<!-- Wrapper-->
		<div class="wrapper" >

			<!-- Hero-->
			<section class="module-cover parallax" data-background="assets/images/black.jpg" data-overlay="1" data-gradient="1">
				<div class="container">
				
				
					<div class="row">
						<div class="col-md-12">
							<div class="text-center">
								<h2 class="display-1"> ${targetMem.memName} 's Page</h2>
								<p>personal Page<br/> show who you are</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Hero end-->
			
			
			
			<div class="module">
				<div class="container">
					<div class="gallery-item">
						<div class="gallery-image" data-background="${targetMem.img}"  style ="width: 200px; border-radius: 100px;"></div><a href="assets/images/avatar/1.jpg" title="Title 1"></a>
						
						<br><br><br><br>
					</div>
				<table border="0" style="width: 800px; margin-top: 100px;" align="center">
					<thead>
					<tr>
						<th>${targetMem.memName} 님
							
						</th>
							
						<td>
							<c:choose>
								<c:when test="${followStatus eq 0}">
									<a  id="requestFollw">Request Follow</a>
								</c:when>
								<c:otherwise>
									<a  id="unFollow">unFollow</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td><a href="" id="testBtn" class="btn">search User</a></td>		
					</tr>		
					</thead>
						<tr>
							<th style="width: 100px;">FeedsCount</th>
							<td>
								<c:choose>
									<c:when test="${not empty fList }">
										${fn:length(fList)}
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>
							</td>
							
						</tr>
						<tr>
							<th>Following</th>
							<td>
								<c:choose>
									<c:when test="${not empty followingList }">
										<div> ${fn:length(followingList)}</div>
									</c:when>
									<c:otherwise>
											0
									</c:otherwise>
								</c:choose>	
							</td>
							
						</tr>
						<tr>
							<th>Follower</th>
							<td>
								<c:choose>
									<c:when test="${not empty followerList }">
										 <div> ${fn:length(followerList)}</div>
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>
							</td>
							
						</tr>
						<tr>
							<th>introduce</th>
							<td colspan="2">
								
								${targetMem.msg}
							</td>
						</tr>	
						<tr>
							<th>interest</th>
							<th>
								<c:forEach begin="0" end="${fn:length(interArr)}" step="1" var="i">
						          	${interArr[i]} 
						        </c:forEach>
							</th>
						</tr>
					<tbody>

					</tbody>
				</table>
						
				</div>
			</div>

		
			
			<!-- Menu-->
			<section class="module" >
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="gallery gallery-4-columns">
								
								
								
								<c:choose>
									<c:when test="${not empty fList}">

										<c:forEach var="i" begin="0" end="${ (fn:length(fList))-1}"  step="1">
											<div class="gallery-item">
												<input type="hidden" name="feNo" value="${fList[i].feNo}">	
												<img src="${fList[i].thumbnail}" style="width: 400px; height: 270px;">									
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="gallery-item">
											There is no Feed 
										</div>
									</c:otherwise>
									
								</c:choose>
								
								
								
								
								
								
							</div>
						</div>
					</div>
					<script>
						$(function(){
							$(".gallery-item").click(function(){
								var feNo =$(this).children().eq(0).val();
								location.href = "feedDetail.fe?feNo="+feNo ; 
						})
						})
						
					</script>

					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="50px"></div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="100px"></div>
						</div>
					</div>
				</div>
			</section>
			<!-- Menu end-->

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
		
		
		
		  <!-- 회원검색  Modal-->
			<div class="modal" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				
				<div class="modal-dialog" role="document" style="overflow-y: scroll; max-height:85%;  margin-top: 50px; margin-bottom:50px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" >
								<select id = "option">
								    <option value="id">id</option>
								    <option value="nickNmae">nickName</option>
								</select>
							</h5>
							
							<input class="form-control" id="searchUser" type="search" placeholder="search here">
										
								
						</div>
						<div id="searchResultSection" class="modal-body">
						
						
						
							   
							   
						</div>
							
						
			
						

						<div class="modal-footer">
							<button class="btn" type="button" data-dismiss="modal">close</button>
						</div>
					</div>
				</div>
			</div>
			
			<script>
			    //유저검색 모달 열기
				$('#testBtn').click(function(e){
					e.preventDefault();
					$('#testModal').modal("show");
				})
				
				//팔로우
				$('#requestFollw').click(function(){
					$.ajax({
						url: "requestFollw.me",
		    			data: {
		    				toMem : '${targetMem.memNo}'
		    			   ,fromMem : '${loginMember.memNo}'
		    			},
		    			success : function(result){
		    				if(result==1){
		    					swal("Follow!")
		    				}else if (result ==2){
		    					swal("you Already Follow this User");
		    				}
		    				
							
		    			},
		    			error :function(){
		    				  console.log("통신실패");
		    			}
					})
				})
				//언팔로우
				$('#unFollow').click(function(){
					$.ajax({
						url: "unFollow.me",
		    			data: {
		    				toMem : '${targetMem.memNo}'
		    			   ,fromMem : '${loginMember.memNo}'
		    			},
		    			success : function(result){
		    				if(result==1){
		    					swal("unFollow!")
		    				}else{
		    					swal("Please refresh first");
		    				}
		    			},
		    			error :function(){
		    				  console.log("통신실패");
		    			}
					})
				})
				
				
				
				
					
				
				
				//눌렀을때 회원페이지로 이동
				 $(function(){
				 
				    const $searchUser = $("#searchUser"); //
				    const $option = $("#option");
				    	$searchUser.keyup(function(){
							$.ajax({
								url: "userSearch.me",
				    			data: {
				    				searchKey : $searchUser.val(),
				    				searchType : $option.val()
				    			},
				    			success : function(searchList){
				    				  let value = "";
				    				 
				    				  for (let i = 0 ; i <searchList.length ; i++){
				    					 
				    					  let memNo = searchList[i].memNo;
				    					  value += 
				    						 "<div id ="+ memNo +">"	
				    						+ "<div class='comment-author'><img class='avatar' src="+ searchList[i].img +" ></div>"
											+"<div class='comment-body'>"
												+"<div class='comment-meta'>"
													+"<div class='comment-meta-author' onClick='searchUserPage(this);'><a href='#'> <input class='ref' type='hidden' value="+memNo +">"+searchList[i].memName + "</div>"
												+"</div>"
												+"<div class='comment-content'>"
														+"<p>"+searchList[i].msg+"</p>"
												+"</div>"
										    +"</div>"
										   +"</div>";
											   
				    				  }
				    				  
				    				  $("#searchResultSection").html(value);
				    				  
				    			},
				    			error :function(){
				    				  console.log("통신실패");
				    			}
							})
				    	})
				    	
				    	
				   })
				   
				   function searchUserPage(e){
						 var searchNo = ($(e).find(".ref").val());
						 location.href = "searchUserPage.fe?searchNo="+searchNo ; 
					}
				
				
				
			</script>
	 <!-- 회원검색 Modal-->
		
		
		
		
		
		
		
		
		
		
		
		<!-- Reserve Popup end-->

		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>

		<!-- Scripts-->
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="assets/js/plugins.min.js"></script>
		<script src="assets/js/custom.min.js"></script>
	</body>
</html>