<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>${ c.classTitle }</title>
</head>
<body>

		<jsp:include page="../common/menubar.jsp"/>
		
		<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->
		
		<!-- Wrapper-->
		<div class="wrapper">

			<!-- Hero-->
			<section class="module-cover parallax fullscreen" id="home" data-background="assets/images/module-6.jpg" data-overlay="1" data-gradient="1">
				<div class="container">
					<div class="row">
						<div class="col-md-12 m-auto">
							<div class="text-center">
								<h6 class="text-uppercase"><span class="vacancy" id="class_info">&nbsp;잔여 ${ c.vacancy } 자리&nbsp;</span><span id="class_info">&nbsp;${ c.clName }&nbsp;</span></h6>
								<h1 class="display-1">${ c.classTitle }</h1>
								<div class="space" data-mY="40px"></div><a class="btn btn-white enter-btn" onclick="enterClass();" style="color:black;">모임 참가하기</a>
							</div>
						</div>
					</div>
				</div>
			</section>

			<script>
				let vac = ${ c.vacancy }
				if( vac >= 28){ // 숫자 수정
					$(".vacancy").css("background-color","red");
				}
			</script>
			<!-- Hero end-->

			<!-- Our Story-->
			<section class="module" id="story">
				<div class="container">
					<div class="row">
						<div class="col-md-16 m-auto text-center">
							<a href="# 마이페이지">
								<span id="profile"><img src="resources/assets/images/detail/approval.png"></span> <br>
								<span class="subtitle" id="profile_nickname">${ c.nickname }</span> <br><br>
							</a>
							<p>
								<c:choose>
									<c:when test="${ c.classApproval eq '승인제' }">
										<img src="resources/assets/images/detail/approval.png" id="detail_icon">${ c.classApproval } &nbsp;&nbsp;
									</c:when>
									<c:otherwise>
										<img src="resources/assets/images/detail/clock.png" id="detail_icon">${ c.classApproval } &nbsp;&nbsp;
									</c:otherwise>
								</c:choose>
								<img src="resources/assets/images/detail/calender.png" id="detail_icon">${ c.classDate } &nbsp; ${ c.classTime }
							</p>
							<div class="divider-border"></div>
							<p class="lead" style="text-align:left;">${ c.classContent }</p>
							<div class="divider-border"></div>
						</div>

						<script>
							// 즐겨찾기 조회
							/*
							function checkFavorite(classNo){
								$.ajax({
									url:"checkFavorite.me",
									data:{
										classNo:${ c.classNo }
									},
									success:result=>{
										
									}, error:()=>{
										console.log("즐겨찾기 조회 ajax 실패");
									}
								})
							}
							
							checkFavorite();
							
							// 즐겨찾기 추가, 해제
							function updateFavorite(){
								$.ajax({
									url:"updateFavorite.me",
									data:{
										classNo:${ c.classNo }
									},
									success:result=>{
										
										checkFavorite(classNo);
									}, error:()=>{
										console.log("즐겨찾기 조회 ajax 실패");
									}
								})
							}
							*/
						</script>

					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="20px"></div>
						</div>
					</div>
					<!--** for문으로 사진넣기 -->
					<div class="row">
						<div class="col-md-3">
							<p><a class="photo" href="assets/images/main/1.jpg"><img src="assets/images/main/1.jpg" alt=""></a></p>
						</div>
						<div class="col-md-3">
							<p><a class="photo" href="assets/images/main/3.jpg"><img src="assets/images/main/3.jpg" alt=""></a></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="20px"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center">
							<div class="space" data-mY="20px"></div><a class="btn btn-white enter-btn" onclick="enterClass();">모임 참가하기</a>
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
							<h1 class="display-1">모임 후기 목록</h1>
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
										<div class="menu-classic-item-price">
											<img src="resources/assets/images/detail/gamst.PNG">
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<p>${ c.nickname }</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/2.jpg"></a><img src="assets/images/menu/2.jpg" alt="">
										<div class="menu-classic-item-price">
											<img src="resources/assets/images/detail/gamst.PNG">
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>Kung Pao Chicken</h6>
										<p>Vanilla, Various Fruit, Cookies</p>
									</div>
								</div>
								<div class="menu-classic-item">
									<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/3.jpg"></a><img src="assets/images/menu/3.jpg" alt="">
										<div class="menu-classic-item-price">
											<img src="resources/assets/images/detail/gamst.PNG">
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
							<h1 class="display-1">참가중인 멤버 목록</h1>
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
										<h6><span>Wild Mushroom Bucatini with Kale</span></h6>
										<p>Cheese, Garlic, Potato, Pork</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/2.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Lemon and Garlic Green Beans</span></h6>
										<p>Pork meat, Sauces, Potato</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/3.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>American Brunch Combo Menu</span></h6>
										<p>Bacon, Rice, Vegetables</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/4.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Smoked Paprika Hummus</span></h6>
										<p>Shrimp, Vegetables, Sauce</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/5.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Italian Source Mushroom</span></h6>
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
										<h6><span>Lemon and Garlic Green Beans</span></h6>
										<p>Pork meat, Sauces, Potato</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/1.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>American Brunch Combo Menu</span></h6>
										<p>Bacon, Rice, Vegetables</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/2.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Smoked Paprika Hummus</span></h6>
										<p>Shrimp, Vegetables, Sauce</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/3.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Italian Source Mushroom</span></h6>
										<p>Steak, Spices, Sauces</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/4.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Wild Mushroom Bucatini with Kale</span></h6>
										<p>Cheese, Garlic, Potato, Pork</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
							<p class="text-center"><a class="btn btn-black" href="#">멤버 더 보기</a></p>
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
											<h1 class="display-1">모임 관련 사진 다보기</h1>
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
							<p class="subtitle">Summary of instructions </p>
							<h1 class="display-1">안내사항 요약</h1>
							<p class="lead">자세한 정보를 알려드릴게요.</p>
							<div class="divider-border"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<div class="pie-chart">
								<div class="chart" data-percent="${ c.vacancy / c.peopleLimit * 100 }"><span class="chart-text"><span><i class="icon-telescope"></i></span></span></div>
								<div class="chart-title"><span>${ c.vacancy } / ${ c.peopleLimit }명 · ${ c.classApproval }</span></div>
								<div class="chart-content">
									<p>
										현재 ${ c.peopleLimit }명 중 ${ c.vacancy }명 가입되어 있으며 <br>
										<c:choose>
											<c:when test="${ c.classApproval eq '승인제' }">
												호스트의 승인에 의해 가입되는 승인제 입니다.
											</c:when>
											<c:otherwise>
												먼저 신청한 순으로 가입되는 선착순 입니다.
											</c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="pie-chart">
								<div class="chart" data-percent="${ c.classPrice / c.avgPrice * 100 }"><span class="chart-text"><span><i class="icon-circle-compass"></i></span></span></div>
								<div class="chart-title"><span><fmt:formatNumber value="${ c.classPrice }" type="currency"/> 원</span></div>
								<div class="chart-content">
									<p>
										운영비 - 콘텐츠 제작, 호스트 수고비 <br>
										모임비 - 대관료, 재료비 <br>
										기타 - 플랫폼 수수료 등을 합산하여 호스트가 지정한 금액입니다.
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="pie-chart">
								<div class="chart" data-percent="${ (c.hour - 12) * 8.4 }"><span class="chart-text"><span><i class="icon-strategy"></i></span></span></div>
								<div class="chart-title"><span>${ c.classDate } &nbsp; ${ c.classTime }</span></div>
								<div class="chart-content">
									<p>
										해당 시간에 잊지말고 참석해 주세요!
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="pie-chart">
								<div class="chart" data-percent="90"><span class="chart-text"><span><i class="icon-circle-compass"></i></span></span></div>
								<div class="chart-title"><span>${ c.classLocation }</span></div>
								<div class="chart-content">
									<p>
										<span class="moveMap">상세 위치</span>를 눌러주세요!
									</p>
								</div>
								<script>
									$(".moveMap").click(()=>{
										var offset = $(".map").offset();
										
										$('html').animate({scrollTop : offset.top}, 400);
									})
								</script>
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
							<p class="text-center ti-alert">
								개인 계좌 입금 유도, 개인 정보 요구, 저희 멤버가 아닌 외부 인원 초대 등 
								가이드를 위반하는 경우 저희에게 <a href="#신고 url">신고</a>해 주세요!								
							</p>
						</div>
					</div>
					
					<!--
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
						</div>
					</div>
					<div class="row appear-childer">
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="ti-user"></span></div>
								<div class="icon-box-title">
									<h5>${ c.vacancy } / ${ c.peopleLimit }명 · ${ c.classApproval }</h5>
								</div>
								<div class="icon-box-content">
									<p>
										현재 ${ c.peopleLimit }명 중 ${ c.vacancy }가입되어 있으며 <br>
										<c:choose>
											<c:when test="${ c.classApproval eq '승인제' }">
												호스트의 승인에 의해 가입되는 승인제 입니다.
											</c:when>
											<c:otherwise>
												먼저 신청한 순으로 가입되는 선착순 입니다.
											</c:otherwise>
										</c:choose>
									</p>
								</div>
								
							</div>
						</div>
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="ti-money"></span></div>
								<div class="icon-box-title">
									<h5>${ c.classPrice }원</h5>
								</div>
								<div class="icon-box-content">
									<p>
										운영비 - 콘텐츠 제작, 호스트 수고비 <br>
										모임비 - 대관료, 재료비 <br>
										기타 - 플랫폼 수수료 등을 합산하여 호스트가 지정한 금액입니다.
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="icon_calendar"></span></div>
								<div class="icon-box-title">
									<h5>${ c.classDate } &nbsp; ${ c.classTime }</h5>
								</div>
								<div class="icon-box-content">
									<p>
										해당 시간에 잊지말고 참석해주세요!
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="icon-box text-center">
								<div class="icon-box-icon"><span class="ti-map-alt"></span></div>
								<div class="icon-box-title">
									<h5>${ c.classLocation }</h5>
								</div>
								<div class="icon-box-content">
									<p>
										<a href="">상세 위치</a>를 눌러주세요!
									</p>
								</div>
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
							<p class="text-center ti-alert">
								개인 계좌 입금 유도, 개인 정보 요구, 저희 멤버가 아닌 외부 인원 초대 등 
								가이드를 위반하는 경우 저희에게 <a href="#신고 url">신고</a>해 주세요!								
							</p>
						</div>
					</div>
					-->
				</div>
			</section>
			<!-- Services End-->
			
			<!-- Popular Dishes-->
			<section class="module bg-gray" id="popular">
				<div class="container">
					<div class="row">
						<div class="col-md-7 m-auto text-center">
							<p class="subtitle">Reply</p>
							<h1 class="display-1">댓글</h1>
							<p class="lead">호스트에게 궁금한 점 또는 하고 싶은 말을 자유롭게 남겨보세요! <br/> </p>
							<div class="divider-border"></div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="menu-simple">
								<c:choose>
									<c:when test="${ not empty loginMember }">
										<div class="menu-simple-item">
											<div class="menu-simple-item-img"><img src="${ loginMember.img }" alt=""></div>
											<div class="menu-simple-item-inner" style="padding:0px;">
												<h6>
													<input type="text" name="reply" id="reply" class="form-control" placeholder="댓글달기" style="background-color: #f4f1ea; width:700px;">
													<button class="btn btn-gray" id="enroll-btn" onclick="addReply();">댓글 등록</button>
												</h6>
											</div>
										</div>
									</c:when>
									<c:otherwise>
									댓글작성을 하시려면 로그인해주세요.<br><br>
									</c:otherwise>
								</c:choose>
							</div>
								
								<script>
									$(()=>{
										selectReplyList();
										
									})
										
									function selectReplyList(){
										$.ajax({
											url:"rlist.cl",
											data:{cno:'${c.classNo}'},
											success:rlist=>{
												let reply = "";
												
												for(var i in rlist){
													
													let rvNo = rlist[i].rvNo;
													
													if(rlist[i].crNo == null){
														
														reply += '<div class="menu-simple-item">'
														       + '<div class="menu-simple-item-img"><img src="' + rlist[i].img + '" alt=""></div>'
														       + '<div class="menu-simple-item-inner replybox">'
														       + '<h6><span>' + rlist[i].nickname + '</span></h6>'
														       + '<p>' + rlist[i].rvContent + '</p>'
														       + '<p>' + rlist[i].rvDate + '<span class="addrere" id="rreply' + rvNo + '">답글달기</span>' + '</p><br>'
														       + '<div id="'+ rvNo + '" class="' + rvNo + '"></div>'
														       + '<h6 class="rereply' + rvNo + '"style="display:none;">'
														       + '<input type="text" name="reply" id="rereply' + rvNo + '" class="form-control rereply' + rvNo + '"placeholder="답글달기" style="background-color: #f4f1ea; width:700px;">'
														       + '<button class="btn btn-gray" id="enroll-btn">답글등록</button>'
														       + '</h6>'
														       + '</div>'
														       + '</div>';
													}    
												}
			
												
												$(".replylist").html(reply);
												
												selectCreplyList();
												
												//$("#creplylist").html(creply);
												
											}, error:()=>{
												console.log("댓글 조회 ajax 실패")
											}
										})
									}
									
									
									function selectCreplyList(){
										$.ajax({
											url:"crlist.cl",
											data:{cno:'${c.classNo}'},
											success:rlist=>{
												let reply = "";
												let creply = "";
												
												for(var i in rlist){
	
													creply = "";
													
													for(var j in rlist){
														
														var rvNo = rlist[i].rvNo;

														if(rlist[j].mrNo == rvNo){														
															
															creply += '<div class="menu-simple-item">'
															       + '<div class="menu-simple-item-img"><img src="' + rlist[j].img + '" alt=""></div>'
															       + '<div class="menu-simple-item-inner">'
															       + '<h6><span>' + rlist[j].nickname + '</span></h6>'
															       + '<p>' + rlist[j].rvContent + '</p>'
															       + '<p>' + rlist[j].rvDate + '<span id="rreply"></span>' + '</p>'
															       + '</div>'
															       + '</div>';

													        $('#' + rvNo).html(creply);

														}
														
													}
													
												}
												
												//$("#creplylist").html(creply);
												
											}, error:()=>{
												console.log("댓글 조회 ajax 실패")
											}
										})
												
												/*
												console.log(rlist);
												let value = "";
												for(var i in rlist){
													
													value = '<div class="menu-simple-item">'
													       + '<div class="menu-simple-item-img"><img src="' + rlist[i].img + '" alt=""></div>'
													       + '<div class="menu-simple-item-inner">'
													       + '<h6><span>' + rlist[i].nickname + '</span></h6>'
													       + '<p>' + rlist[i].rvContent + '</p>'
													       + '<p>' + rlist[i].rvDate + '<span id="rreply">답글달기</span>' + '</p>'
													       + '</div>'
													       + '</div>';
													
											       	
													       
													console.log($(".replybox").children().last().attr("id"));
													
													$("#RE4").html(value);
												       
												}
												
												$("#creplylist").html(value);
											}, error:()=>{
												console.log("댓글 조회 ajax 실패")
											}
										})
										*/
									}
									
								
								
									function addReply(){
										if($("#reply").val().trim().length != 0){
											$.ajax({
												url:"enroll.rv",
												data:{
													rvContent:$("#reply").val(),
													refFno:'${c.classNo}',
													memNo:'${loginMember.memNo}',												
													},success:result=>{
													if(result == "success"){
														$("#reply").val("");
														selectReplyList();
													}
												}, error:()=>{
													console.log("실패");
												}
											})
										}
									}
									
									$(document).on("click", ".replybox>h6>button", function(){
										
										let mr_no = $(this).parent().attr("class").substring(7);
										let rvContent = $("#rereply"+mr_no).val();

										if($("#rereply"+mr_no).val().trim().length != 0){
											
											$.ajax({
												url:"enrollRe.rv",
												data:{
													rvContent:$("#rereply"+mr_no).val(),
													refFno:'${c.classNo}',
													memNo:'${loginMember.memNo}',
													mrNo:mr_no,
													},success:result=>{
													if(result == "success"){
														$("#rereply").val("");
														selectReplyList();
													}
												}, error:()=>{
													console.log("실패");
												}
											})
										}
										
										
									})
										
									$(document).on("click", ".replybox>p>span", function(){
										
										let lm = "${loginMember}";
										
										if(lm == ""){
											swal("로그인해야 댓글을 등록하실 수 있습니다.");
										} else {
											
											let rvNo = $(this).attr("id").substring(6);
											let rvText = $(this).text();
											
											if(rvText == '답글달기'){
												$(".rereply"+rvNo).css("display","block");
												$(this).text("답글닫기");
											}
											
											if(rvText == '답글닫기'){
												$(".rereply"+rvNo).css("display","none");
												$(this).text("답글달기");
											}	
										}
										
										
									})										
								
								</script>
								<div class="menu-simple replylist">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="space" data-mY="60px"></div>
							<p class="text-center"><a class="btn btn-black" href="#">멤버 더 보기</a></p>
						</div>
					</div>
				</div>
			</section>
			<!-- Popular Dishes End-->

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
											<p class="display-2">모임 후기 글만</p>
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
							<h1 class="display-1">호스트 자기소개</h1>
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
					<div class="row map">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">From the blog</p>
							<h1 class="display-1">유사한 모임 (위치 or 카테고리) + 지도api</h1>
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
		<!-- Reserve Popup end-->

		<!-- To top button-->
		<div class="space" data-mY="40px"></div><a class="btn btn-white enterClass enter-btn" onclick="enterClass();">모임 참가하기</a>
		<a class="likeClass"><span class="icon_heart_alt" onclick="likeClass();"></span></a>
		<a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
		<c:if test="${loginMember.memNo eq c.memNo }">
		</c:if>
			<a class="classOption" href="#수정페이지"><span class="icon-gears"></span></a>		
		
		<script>
		
			let lm = "${loginMember}";
			
			if(lm != ""){
				$.ajax({
					url:"checkStatus.cl",
					data:{
						memNo:'${loginMember.memNo}',
						classNo:'${c.classNo}',
					}, success:result=>{
						switch (result){
							case 0 : ""; break;
							case 1 : $(".enter-btn").text("참가중인 모임 입니다."); break;
							case 2 : $(".enter-btn").text("호스트 승인 대기중 입니다."); break;
							case 3 : $(".enter-btn").text("빈자리가 나오기를 대기중입니다."); break;
						}
					}, error:()=>{
						console.log("가입상태 ajax 실패");
					}
				})
			}
				
		
			function enterClass(){
				
				let lm = "${loginMember}";
				let seat = "${c.vacancy}";
				let cl_type = '${c.classApproval}';
				let cl_typeNo = 0;
				
				console.log(seat);
				
				if(lm == ""){
					swal("로그인해야 모임에 가입하실 수 있습니다.");
				} else {
					
					if(cl_type == "승인제" && seat > 0){
						cl_typeNo = 2;
						console.log(cl_typeNo);
					} else if(cl_type == "승인제" && seat == 0){
						cl_typeNo = 3;
					} else if(cl_type == "선착순" && seat > 0){
						cl_typeNo = 1;
					} else if(cl_type == "선착순" && seat == 0){
						cl_typeNo = 2;
					}
				
					$.ajax({
						url:"enterClass.cl",
						data:{
							memNo:'${loginMember.memNo}',
							classNo:'${c.classNo}',
							clType:cl_typeNo,
						}, success:result=>{
							console.log(result);
						}, error:()=>{
							console.log("모임가입 ajax 실패");
						}
					})
				}
			}
			
			function checkLike(){
				$.ajax({
					url:"checkLike.cl",
					data:{
						memNo:'${loginMember.memNo}',
						classNo:'${c.classNo}',
					}, success:result=>{
						if(result>0){
							$(".likeClass>span").attr("class", "icon_heart");
						}
					}, error:()=>{
						console.log("즐겨찾기 ajax실패");
					}
				})
			}
			
			checkLike();
			
			function likeClass(){
				
				let lm = "${loginMember}";
				
				if(lm == ""){
					swal("로그인해야 모임을 즐겨찾기 하실 수 있습니다.");
				}else{
					$.ajax({
						url:"likeClass.cl",
						data:{
							memNo:'${loginMember.memNo}',
							classNo:'${c.classNo}',
						}, success:result=>{
							if(result == "insert"){
								$(".likeClass>span").attr("class", "icon_heart");
								checkLike();
								swal("찜 등록 완료했습니다!");
							} else if(result == "delete"){
								$(".likeClass>span").attr("class", "icon_heart_alt");
								checkLike();
								swal("찜 삭제 완료했습니다!");
							}
						}, error:()=>{
							console.log("즐겨찾기 ajax실패");
						}
					})
				}
			}
				
		</script>
		
</body>
</html>