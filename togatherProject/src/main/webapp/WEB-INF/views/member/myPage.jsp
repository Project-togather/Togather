<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>myPage</title>
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

			#subWayBtn2 :hover{
				cursor:pointer
			}
			#subwayBtn2{
				color: red;
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
								<h2 class="display-1"> ${loginMember.memName} 's Page</h2>
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
						<div class="gallery-image" data-background="${loginMember.img}"  style ="width: 200px; border-radius: 100px;"></div><a href="${loginMember.img}" title="Title 1"></a>
						
						<br><br><br><br>
					</div>
				<table border="0" style="width: 800px; margin-top: 100px;" align="center">
					<thead>
					<tr>
						<th>${loginMember.memName} 님
							
						</th>
							
						<td><a href="updateForm.me" class="btn">setMyProfile</a></td>
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
							<th id="followingBtn">Following</th>
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
							<th id="followerBtn">Follower</th>
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
								
								${loginMember.msg}
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
						<tr>
							<th colspan ="3" id ="subWayBtn"> 
								<div id="subWayBtn2" style="color: silver;">Are you going to go appointment? click here</div>
							</th>
						</tr>
					<tbody>

					</tbody>
				</table>
						
				</div>
			</div>

				<div class="container">
					<div id="newFeed" class="row" style="margin-left: 100px;">
						<img src="assets/images/new.png" onclick="test();">
					</div>
				</div>
				<script>
					function test(){
						location.href ="feedEnrollForm.me"
					}

				</script>
			
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
			
			<!-- 팔로잉 모달 -->
			<div class="modal" id="followingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				
				<div class="modal-dialog" role="document" style="overflow-y: scroll; max-height:85%;  margin-top: 50px; margin-bottom:50px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" >
								your following member
							</h5>
						</div>
						<div id="followingResultSection" class="modal-body">	
							<c:choose>
								<c:when test="${not empty followingList}">
									<c:forEach var="i" begin="0" end="${fn:length(followingList)-1}" step="1">
									    <div class="comment">
												<div class="comment-author"><img class="avatar" src="${followingList[i].img}"></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author" onClick="searchFollowingUserPage(this);"><input class="followingRef" type="hidden" value="${followingList[i].memNo}"> <a href="#">${followingList[i].memName}</a></div>
													</div>
													<div class="comment-content">
														<p>${followingList[i].msg}</p>
													</div>
												</div>
											</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
								🚫following List is empty
									
								</c:otherwise>	
							</c:choose>
						</div>
						<div class="modal-footer">
							<button class="btn" type="button" data-dismiss="modal">close</button>
						</div>
					</div>
				</div>
			</div>
			<!--이 아래는 팔로워모달 -->
			<div class="modal" id="followerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				
				<div class="modal-dialog" role="document" style="overflow-y: scroll; max-height:85%;  margin-top: 50px; margin-bottom:50px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" >
								your follower member
							</h5>
						</div>
						<div id="followingResultSection" class="modal-body">
							${followerList[0].memNo}	
							<c:choose>
								<c:when test="${not empty followerList}">
									
									<c:forEach var="i" begin="0" end="${fn:length(followerList)-1}" step="1">
									    <div class="comment">
												<div class="comment-author"><img class="avatar" src="${followerList[i].img}"></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author" onClick="searchFollowerUserPage(this);"><input class="followerRef" type="hidden" value="${followerList[i].memNo}"> <a href="#">${followerList[i].memName}</a></div>
													</div>
													<div class="comment-content">
														<p>${followerList[i].msg}</p>
													</div>
												</div>
											</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
								🚫follower List is empty
									
								</c:otherwise>	
							</c:choose>
						</div>
						<div class="modal-footer">
							<button class="btn" type="button" data-dismiss="modal">close</button>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 공공데이터용 모달 -->
			<div class="modal" id="subWayModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				
				<div class="modal-dialog" role="document" style="overflow-y: scroll; max-height:85%;  margin-top: 50px; margin-bottom:50px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" >
							
							</h5>
							<input class="form-control" id="stationName" type="search" placeholder="search station">	
						</div>
						<div id="subWayResultSection" class="modal-body">

						</div>
						<div class="modal-footer">
							<button class="btn" type="button" data-dismiss="modal">close</button>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<script>
				//검색 모달 onclick 으로 띄우기
				$('#testBtn').click(function(e){
					e.preventDefault();
					$('#testModal').modal("show");
				});
				//팔로잉 모달 click 으로 띄우기
				$('#followingBtn').click(function(e){
					e.preventDefault();
					$('#followingModal').modal("show");
				});
				//팔로워 모달 click으로 띄우기
				$('#followerBtn').click(function(e){
					e.preventDefault();
					$('#followerModal').modal("show");
				});
				//공공데이터 모달 click으로 띄우기
				$('#subWayBtn').click(function(e){
					e.preventDefault();
					$('#subWayModal').modal("show");
				});
				
				
				
				//검색할때 input 넣을때마다 db다녀오는 ajax
				 $(function(){
				    //아이디를 입력하는 input 요소 객체 변수에 담아두기
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
				    	
				    	//지하철 ajax
				    	const $station = $("#stationName");
				    	$station.keyup(function(){
				    		$.ajax({
				    			url : "subway.op",
				    			data : {station : $station.val()},
				    			success : function(data){
				    				console.log(data.realtimeArrivalList);
				    				let subArr = data.realtimeArrivalList;
				    				let value = "";
				    				for (let i = 0; i < subArr.length ; i ++ ){

				    					let line = "";

				    					if(subArr[i].subwayId == 1001){
				    						line = "1️호선";
				    					}else if(subArr[i].subwayId == 1002){
				    						line = "2️호선";
				    					}else if (subArr[i].subwayId == 1003){
				    						line = "3️호선";
				    					}else if (subArr[i].subwayId == 1004){
				    						line = "4️호선";
				    					}else if (subArr[i].subwayId == 1005){
				    						line = "5️호선";
				    					}else if (subArr[i].subwayId == 1006){
				    						line = "6️호선";
				    					}else if (subArr[i].subwayId == 1007){
				    						line = "7️호선";
				    					}else if (subArr[i].subwayId == 1008){
				    						line = "8️호선";
				    					}else if (subArr[i].subwayId == 1009){
				    						line = "9️호선";
				    					}else if (subArr[i].subwayId == 1061){
				    						line = "중앙선";
				    					}else if (subArr[i].subwayId == 1063){
				    						line = "경의중앙선";
				    					}else if (subArr[i].subwayId == 1065){
				    						line = "공항철도";
				    					}else if (subArr[i].subwayId == 1067){
				    						line = "경춘선";
				    					}else if (subArr[i].subwayId == 1075){
				    						line = "수인분당선";
				    					}else if (subArr[i].subwayId == 1077){
				    						line = "신분당선";
				    					}else if (subArr[i].subwayId == 1092){
				    						line = "우이실설선";
				    					}else if (subArr[i].subwayId == 1093){
				    						line = "서해선";
				    					}else if (subArr[i].subwayId == 1081){
				    						line = "경강선";
				    					}
				    					
										value +=
					    						 "<div class='comment-author'><img class='avatar' src='assets/images/subway.jpg' ></div>"
												+"<div class='comment-body'>"
													+"<div class='comment-meta'>"
														+"<div class='comment-meta-author' onClick='searchUserPage(this);'>"+
														line + "||"+ subArr[i].updnLine + "||" + subArr[i].btrainSttus

														+ "</div>"
													+"</div>"
													+"<div class='comment-content'>"
															+"<p> 열차방향 : "+subArr[i].trainLineNm +"</p>"
															+"<p> 이번열차 : "+subArr[i].arvlMsg2+"</p>"
													+"</div>"
											    +"</div>";
											 
											}
				    				$("#subWayResultSection").html(value);
				    				
				    			},error : function(){
				    				console.log("ajax통신실패");
				    			}
				    		})
				    	})
				    	
				    	

				   })
				
				
				
				
				
				   
					//검색결과 누르면 해당페이지로 이동
				   function searchUserPage(e){
						 var searchNo = ($(e).find(".ref").val());
						 location.href = "searchUserPage.fe?searchNo="+searchNo ; 
					}
					
				//팔로잉 리스트 누르면 해당페이지 이동
					 function searchFollowingUserPage(e){
						 var searchNo = ($(e).find(".followingRef").val());
						 location.href = "searchUserPage.fe?searchNo="+searchNo ; 
					}
				//팔로워 리스트 누르면 해당페이지 이동
					 function searchFollowerUserPage(e){
						 var searchNo = ($(e).find(".followerRef").val());
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