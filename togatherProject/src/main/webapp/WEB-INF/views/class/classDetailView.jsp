<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- jQuery -->
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- kakao map api -->


<title>${ c.classTitle }</title>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<!-- Preloader-->
	<div class="page-loader">
		<div class="loader"></div>
	</div>
	<!-- Preloader end-->

	<!-- Wrapper-->
	<div class="wrapper">

		<!-- Hero-->
		<section class="module-cover parallax fullscreen" id="home"
			data-background="${ atList[0].filePath }" data-overlay="1"
			data-gradient="1">
			<div class="container">
				<div class="row">
					<div class="col-md-12 m-auto">
						<div class="text-center">
							<h6 class="text-uppercase">
								<span class="vacancy" id="class_info">&nbsp;잔여 ${ c.peopleLimit - c.vacancy }
									자리&nbsp;</span><span id="class_info">&nbsp;${ c.clName }&nbsp;</span>
							</h6>
							<h3 class="display-1">${ c.classTitle }</h3>
							<div class="space" data-mY="40px"></div>
							<c:if
								test="${ loginMember ne null and loginMember.memNo ne c.memNo}">
								<button class="btn btn-white enter-btn" onclick="enterClass();"
									style="color: black;">✍ 모임 참가하기</button>
							</c:if>
							<!--  
							<input type="text" id="id">
							<button type="button" onclick="sse();">테스트</button>-->
							<div id="sseTest2"></div>
							<br>
							<button type="button" class="btn btn-outline btn-sm btn-brand" id="payment" onclick="requestPay();"	style="/*display: none;*/ text-align: center">카카오 페이</button>
						</div>
					</div>
				</div>
			</div>
		</section>

		<script>
		
		if('${loginMember}' != null){
			sse('${loginMember.memNo}');
		} else {
			swal("ㅎㅎ");
		}
		
			
				function requestPay() {
					
				    IMP.init("imp15430315"); 
					var amount = ${c.classPrice}
					var email = '${loginMember.email}'
					var name = '${loginMember.memId}'
					var tel = '${loginMember.phone}'
					
					  IMP.request_pay({
					    pg: "kakao",
					    pay_method: "card",
					    merchant_uid : 'merchant_'+new Date().getTime(),
					    name : '(주)ToGather',
					    amount : amount,
					    buyer_email : email,
					    buyer_name : name,
					    buyer_tel : tel,
					  }, function (rsp) { // callback

						  $.ajax({
							  type:"POST",
							  url:"verifyIamport/" + rsp.imp_uid
						  }).done(function(data){
							  if(rsp.paid_amount == data.response.amount){
								  if (rsp.success) {
								        $.ajax({
								        	url:"pay.cl",
								        	data:{
								        		classNo : '${c.classNo}',
								        		memNo : '${loginMember.memNo}',
								        		payEmail : email,
								        		iUid : rsp.imp_uid,
								        		mUid : rsp.merchant_uid
								        	}, success:result=>{
								        		if(result == "success"){
									        		//location.href="detail.cl?classNo=${c.classNo}&clType=1"
									        		checkStatus();
									        		swal("결제가 완료되었습니다!","모임을 즐기러 가볼까요?", "success");
								        		} else {
									        		swal("결제가 실패하였습니다.","다시한번 확인 후 결제해주세요!", "error");
								        		}
								        	}, error:()=>{
								        		swal("결제가 실패하였습니다.","다시한번 확인 후 결제해주세요!", "error");
								        	}
								        })
								      } else {
								        console.log("실패");
								      }
							  }else {
								  console.log("결제 및 검증 실패")
							  }
						  });
					  });
					}
			
			/* 잔여자리에 따른 css 변경*/
			let vac = ${ c.peopleLimit - c.vacancy }
			let limit = ${ c.peopleLimit }
			if( vac <= limit * 0.2 ){ // 숫자 수정
				$(".vacancy").css("background-color","red");
			}
			</script>
		<!-- Hero end-->

		<!-- Our Story-->
		<section class="module" id="story">
			<div class="container">
				<div class="row">
					<div class="col-md-16 m-auto text-center">
						<c:choose>
							<c:when test="${ loginMember.memNo eq c.memNo }">
								<a href="mypage.me"> <span id="profile"><img src="${ atList[1].filePath }"></span> <br> <span class="subtitle" id="profile_nickname">${ c.nickName }</span> <br>
									<br>
								</a>
							</c:when>
							<c:when test="${ loginMember eq null }">
								<a href="javascript:loginAlert()"> <span id="profile"><img
										src="${ atList[1].filePath }"></span> <br> <span
									class="subtitle" id="profile_nickname">${ c.nickName }</span> <br>
									<br>
								</a>
							</c:when>
							<c:when test="${ loginMember ne null }">
		                        <a href="searchUserPage.fe?searchNo=${c.memNo}"> <span id="profile"><img
		                              src="${ atList[1].filePath }"></span> <br> <span
		                           class="subtitle" id="profile_nickname">${ c.nickName }</span> <br>
		                           <br>
		                        </a>
		                    </c:when>
						</c:choose>
						<p>
							<c:choose>
								<c:when test="${ c.classApproval eq '승인제' }">
									<img src="resources/assets/images/detail/approval.png"
										id="detail_icon">${ c.classApproval } &nbsp;&nbsp;
									</c:when>
								<c:otherwise>
									<img src="resources/assets/images/detail/clock.png"
										id="detail_icon">${ c.classApproval } &nbsp;&nbsp;
									</c:otherwise>
							</c:choose>
							<img src="resources/assets/images/detail/calender.png"
								id="detail_icon">${ c.classDate } &nbsp; ${ c.classTime }
						</p>
						<div class="divider-border"></div>
						<p class="lead" style="text-align: left;">${ c.classContent }</p>
						<div class="divider-border"></div>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="20px"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="space" data-mY="20px"></div>
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
						<p class="subtitle">Feed List</p>
						<h1 class="display-1"> 👍 모임 후기</h1>
						<p class="lead">
							이 모임에 대한 후기를 구경해요 <br />
						</p>
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
						<div class="owl-carousel menu-carousel"	data-carousel-options="{&quot;nav&quot;: false}">
							<c:forEach var="f" items="${ fList }">
								<div class="menu-classic-item">
									<div class="menu-classic-item-img">
										<c:forEach var="ftn" items="${ ftnList }">
											<c:if test="${ f.feNo eq ftn.refFno }">
												<a class="photo" href="feedDetail.fe?feNo=${ f.feNo }"></a>
												<img src="${ ftn.filePath }" alt="">
											</c:if>
										</c:forEach>
										<div class="menu-classic-item-price">
											<c:forEach var="fpf" items="${ fpfList }">
												<c:if test="${ f.feWriter eq fpf.refFno }">
													<img src="${ fpf.filePath }">
												</c:if>
											</c:forEach>
										</div>
									</div>
									<div class="menu-classic-item-inner">
										<h6>${ f.nickName }</h6>
										<p>${ f.feDate }</p>
										<p>${ f.feContent }</p>
									</div>
								</div>
							</c:forEach>
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
						<p class="subtitle">Our Class Member</p>
						<h1 class="display-1">👨‍👩‍👦‍👦 멤버 소개</h1>
						<p class="lead">현재 ${ c.vacancy }명이 가입 중 입니다!</p>
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
							<c:forEach var="m" begin="0" end="4">
								<div class="menu-simple-item">
									<div class="menu-simple-item-img">
										<img src="${ list[m].img }" alt="">
									</div>
									<div class="menu-simple-item-inner">
										<h6>
											<span>${ list[m].nickName }</span>
										</h6>
										<p>${ list[m].msg }</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-6">
						<div class="menu-simple">
							<c:forEach var="m" begin="5" end="9">
								<div class="menu-simple-item">
									<div class="menu-simple-item-img">
										<img src="${ list[m].img }" alt="">
									</div>
									<div class="menu-simple-item-inner">
										<h6>
											<span>${ list[m].nickName }</span>
										</h6>
										<p>${ list[m].msg }</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="60px"></div>
						<p class="text-center">
							<!--  <a class="btn btn-black" href="#">멤버 더 보기</a> -->
						</p>
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
										<h1 class="display-1"> 📸 All Photos</h1>
										<p class="lead">
											추억이 담긴 이 곳 <br>
											즐거웠던 사진을 남겨주세요!
										</p>
										<div class="divider-border"></div>
										<div class="space" data-mY="60px"></div>
										<c:if test="${ loginMember ne null }">
											<a class="btn btn-black" href="http://localhost:8012/togather/mypage.me"> 👉 추억 남기러 가기</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-8 col-lg-12">
						<div class="gallery gallery-shorcode">
						<c:forEach var="f" items="${ ftnList }">
							<div class="gallery-item">
								<div class="gallery-image"
									data-background="${ f.filePath }"></div>
								<a href="${ f.filePath }"></a>
							</div>
						</c:forEach>
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
						<p class="subtitle">Summary of instructions</p>
						<h1 class="display-1"> 📘 안내사항 요약</h1>
						<p class="lead">자세한 정보를 알려드릴게요.</p>
						<div class="divider-border"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="pie-chart">
							<div class="chart"
								data-percent="${ c.vacancy / c.peopleLimit * 100 }">
								<span class="chart-text"><span><i
										class="icon-telescope"></i></span></span>
							</div>
							<div class="chart-title">
								<span>${ c.vacancy } / ${ c.peopleLimit }명 · ${ c.classApproval }</span>
							</div>
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
							<div class="chart"
								data-percent="${ c.classPrice / c.avgPrice * 100 }">
								<span class="chart-text"><span><i
										class="icon-circle-compass"></i></span></span>
							</div>
							<div class="chart-title">
								<span><fmt:formatNumber value="${ c.classPrice }"
										type="currency" /> 원</span>
							</div>
							<div class="chart-content">
								<p>
									운영비 - 콘텐츠 제작, 호스트 수고비 <br> 모임비 - 대관료, 재료비 <br> 기타 -
									플랫폼 수수료 등을 합산하여 호스트가 지정한 금액입니다.
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="pie-chart">
							<div class="chart" data-percent="${ (c.hour - 12) * 8.4 }">
								<span class="chart-text"><span><i
										class="icon-strategy"></i></span></span>
							</div>
							<div class="chart-title">
								<span>${ c.classDate } &nbsp; ${ c.classTime }</span>
							</div>
							<div class="chart-content">
								<p>해당 시간에 잊지말고 참석해 주세요!</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="pie-chart">
							<div class="chart" data-percent="90">
								<span class="chart-text"><span><i
										class="icon-circle-compass"></i></span></span>
							</div>
							<div class="chart-title">
								<span>${ c.classLocation }</span>
							</div>
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
							개인 계좌 입금 유도, 개인 정보 요구, 저희 멤버가 아닌 외부 인원 초대 등 가이드를 위반하는 경우 저희에게 <a
								href="#신고 url">신고</a>해 주세요!
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
						<h1 class="display-1">  😉 댓글</h1>
						<p class="lead">
							호스트에게 궁금한 점 또는 하고 싶은 말을 자유롭게 남겨보세요! <br />
						</p>
						<div class="divider-border"></div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="menu-simple">
							<c:choose>
								<c:when test="${ not empty loginMember }">
									<div class="menu-simple-item">
										<div class="menu-simple-item-img">
											<img src="${ loginMember.img }" alt="">
										</div>
										<div class="menu-simple-item-inner" style="padding: 0px;">
											<h6 style="text-align: center; width: 100%;">
												<input type="text" name="reply" id="reply"
													class="form-control" placeholder="댓글달기"
													style="background-color: #f4f1ea; width: 700px; display: inline-block;">
												<button class="btn btn-gray" id="enroll-btn1"
													onclick="addReply();" style="display: inline-block;">댓글
													등록</button>
											</h6>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									댓글작성을 하시려면 로그인해주세요.<br>
									<br>
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
														       	
														 reply += '<div class="comment">'
																+	'<div class="comment-author"><img class="avatar" src="' + rlist[i].img + '"></div>'
																+	'<div class="comment-body replybox">'
																+		'<div class="comment-meta">'
																+			'<div class="comment-meta-author"><a href="#">' + rlist[i].nickName + '</a></div>'
																+			'<div class="comment-meta-date"><a href="#">' + rlist[i].rvDate + '</a></div>'
																+		'</div>'
																+		'<div class="comment-content">'
																+			'<p>' + rlist[i].rvContent + '</p>'
																+		'</div>'
																+		'<div class="comment-reply"><a><span id="rreply' + rvNo + '">답글달기</span></a></div>'
																+ 		'<div id="'+ rvNo + '" class="' + rvNo + '"></div>'
													       		+ 		'<h6 class="rereply' + rvNo + '"style="display:none;">'
													        	+ 			'<input type="text" name="reply" id="rereply' + rvNo + '" class="form-control rereply' + rvNo + '"placeholder="답글달기" style="background-color: #f4f1ea; width:700px; display:inline-block;">'
													       	 	+ 			'<button class="btn btn-gray" id="enroll-btn" style="display :inline-block;">답글등록</button>'
														        + 		'</h6>'
																+	'</div>'
																+	'</div>';
														
														/*
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
														*/
														
													}    
												}
			
												$(".comments-title").text("댓글수 : " + rlist.length);
												
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
															       + '<h6><span>' + rlist[j].nickName + '</span></h6>'
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
													classTitle:'${c.classTitle}',
													nickName:'${loginMember.nickName}',
													receiver:'${c.memNo}',
													},success:result=>{
													if(result == "success"){
														$("#reply").val("");
														selectReplyList();
														alarmList();
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
													classTitle:'${c.classTitle}',
													nickName:'${loginMember.nickName}',
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
										
									$(document).on("click", ".replybox>div>a>span", function(){
										
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
						<div class="comments-area">
							<h5 class="comments-title"></h5>
							<div class="comment-list replylist"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="space" data-mY="60px"></div>
					<p class="text-center">
						<!--  <a class="btn btn-black" href="#">멤버 더 보기</a> -->
					</p>
				</div>
			</div>
	</div>
	</section>
	<!-- Popular Dishes End-->

	<!-- Testimonials-->
	<!--
	<section class="module parallax"data-background="${ atList[0].filePath }" data-overlay="0.7">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="space" data-mY="80px"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="owl-carousel review-slides"
						data-carousel-options="{&quot;autoPlay&quot;: &quot;5000&quot;}">
						<div class="review">
							<div class="review-icons">
								<img
									src="https://s3.amazonaws.com/uifaces/faces/twitter/rem/128.jpg"
									alt="">
							</div>
							<div class="review-content">
								<blockquote>
									<p class="display-2">모임 후기 글만</p>
								</blockquote>
							</div>
							<div class="review-author">
								<span>Albert Einstein</span>
							</div>
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
	-->
	<!-- Testimonials end-->

	<!-- Chef-->
	<section class="module">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<p class="subtitle">Introduce Host</p>
					<h1 class="display-1">😀 호스트는 이런 사람이에요!</h1>
					<p class="lead">
						🎁 안녕하세요 여러분 <br> 모임을 좋아해서 호스트를 하는 지경까지 이른 모임에 미친 사람이에요! 🎉
					<p>
					<div class="divider-border-left"></div>
					<div class="space" data-mY="60px"></div>
				</div>
				<div class="col-md-6">
					<img src="${ atList[1].filePath }" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- Chef End-->

	<!-- News-->
	<section class="module bg-gray p-b-0" id="news">
		<div class="container">
			<div class="row map">
				<div class="col-md-6 m-auto text-center">
					<p class="subtitle">From the blog</p>
					<h1 class="display-1">상세지도</h1>
					<div id="map" style="width: 500px; height: 400px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9be07910948b6a467fe99fca4953cf06"></script>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9be07910948b6a467fe99fca4953cf06&libraries=LIBRARY"></script>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9be07910948b6a467fe99fca4953cf06&libraries=services"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(${ c.latitude }, ${ c.longitude }),
							level: 3
						};
				
						var map = new kakao.maps.Map(container, options);
						
						var markerPosition = new kakao.maps.LatLng(${ c.latitude }, ${ c.longitude });
						
						var marker = new kakao.maps.Marker({
							position: markerPosition
						});
						
						marker.setMap(map);
						
						console.log(${c.placeId});
						
					</script>
					<br> <a href="https://map.kakao.com/link/map/${ c.placeId }">카카오맵으로
						상세보기</a> <br> <a
						href="roadView.cl?latitude=${ c.latitude }&longitude=${ c.longitude }">로드뷰
						상세보기</a>

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
					<div class="owl-carousel menu-carousel"
						data-carousel-options="{&quot;nav&quot;: false}">
						<c:forEach var="c" items="${ cList }">
							<div class="menu-classic-item">
								<div class="menu-classic-item-img">
									<c:forEach var="ctn" items="${ ctnList }">
										<c:if test="${ c.classNo eq ctn.refFno }">
											<a class="photo" href="detail.cl?classNo=${ c.classNo }&clType=1"></a>
											<img src="${ ctn.filePath }" alt="">
										</c:if>
									</c:forEach>
								</div>
								<div class="menu-classic-item-inner">
									<h6>${ c.classTitle }</h6>
									<p>📆 ${ c.classDate } ⏰ ${ c.classTime }</p> 
									<p>🚗 ${ c.classLocation }</p>
								</div>
							</div>
						</c:forEach>
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
					<div class="text-center">
					</div>
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

	<svg class="footer-circle" xmlns="http://www.w3.org/2000/svg"
		version="1.1" width="100%" height="100" viewbox="0 0 100 100"
		preserveaspectratio="none">
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
							<p>
								<img src="assets/images/logo-light.png" width="74px" alt="">
							</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor.</p>
							<ul class="icon-list">
								<li><i class="ti-email"></i> info@themebusiness.com</li>
								<li><i class="ti-headphone-alt"></i> 1-444-123-4559</li>
								<li><i class="ti-location-pin"></i> Raymond Boulevard 224,
									New York</li>
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
							<li><a href="#">Matcha Portuguese Egg Tarts</a> <span
								class="post-date">May 8, 2016</span></li>
							<li><a href="#">Camp Cooking: One Pan Yaki Udon</a> <span
								class="post-date">April 7, 2016</span></li>
							<li><a href="#">Chicken & Spring Vegetable Lasagna</a> <span
								class="post-date">April 7, 2016</span></li>
							<li><a href="#">Mini California Sushi Cones</a> <span
								class="post-date">April 7, 2016</span></li>
						</ul>
					</aside>
				</div>
				<div class="col-md-3">
					<!-- Twitter-->
					<aside class="widget twitter-feed-widget">
						<div class="widget-title">
							<h5>Twitter Feed</h5>
						</div>
						<div class="twitter-feed" data-twitter="345170787868762112"
							data-number="2"></div>
					</aside>
				</div>
				<div class="col-md-3">
					<!-- Recent portfolio widget-->
					<aside class="widget widget_recent_works">
						<div class="widget-title">
							<h5>Instagram</h5>
						</div>
						<ul>
							<li><a href="#"><img src="assets/images/widgets/1.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/2.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/3.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/4.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/5.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/6.jpg"
									alt=""></a></li>
						</ul>
					</aside>
				</div>
			</div>
		</div>
		<div class="small-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="copyright">
							© 2017 <a href="http://2the.me/">2theme</a>, All Rights Reserved.
						</div>
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
	<div class="off-canvas-sidebar"
		data-background="assets/images/sidebar.jpg">
		<div class="off-canvas-sidebar-wrapper">
			<div class="off-canvas-header">
				<a class="close-offcanvas" href="#"><span
					class="arrows arrows-arrows-remove"></span></a>
			</div>
			<div class="off-canvas-content">
				<!-- Text widget-->
				<aside class="widget widget_text">
					<div class="textwidget">
						<p>
							<img src="assets/images/logo-light.png" width="74px" alt="">
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor.</p>
						<ul class="icon-list">
							<li><i class="ti-email"></i> info@themebusiness.com</li>
							<li><i class="ti-headphone-alt"></i> 1-444-123-4559</li>
							<li><i class="ti-location-pin"></i> Raymond Boulevard 224,
								New York</li>
						</ul>
					</div>
				</aside>
				<!-- Recent portfolio widget-->
				<aside class="widget widget_recent_works">
					<div class="widget-title">
						<h5>Instagram</h5>
					</div>
					<ul>
						<li><a href="#"><img src="assets/images/widgets/1.jpg"
								alt=""></a></li>
						<li><a href="#"><img src="assets/images/widgets/2.jpg"
								alt=""></a></li>
						<li><a href="#"><img src="assets/images/widgets/3.jpg"
								alt=""></a></li>
						<li><a href="#"><img src="assets/images/widgets/4.jpg"
								alt=""></a></li>
						<li><a href="#"><img src="assets/images/widgets/5.jpg"
								alt=""></a></li>
						<li><a href="#"><img src="assets/images/widgets/6.jpg"
								alt=""></a></li>
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
					<div class="twitter-feed" data-twitter="345170787868762112"
						data-number="2"></div>
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
	<div class="space" data-mY="40px"></div>
	<a class="likeClass"><span class="icon_heart_alt"
		onclick="likeClass();"></span></a>
	<a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	<c:if test="${ loginMember.memNo eq c.memNo }">
		<a class="classOption" href="classUpdateForm.cl?classNo=${ c.classNo }">
			<span class="icon-gears"></span>
		</a>
	</c:if>
	<c:if test="${ loginMember.memNo ne c.memNo }">
		<span class="classOption quit_option" style="display: none">
			<span class="ti-more-alt"></span>
		</span>
	</c:if>
	<div class="quitClassContainer btn btn-outline btn-sm btn-brand"
		onclick="location.href='quitClassForm.cl?classNo=${c.classNo}&memNo=${ loginMember.memNo }'">클럽 탈퇴하기</div>
	<div id="noti-form">
		<span class="notification"><img
			src="resources/assets/images/detail/notification.png"></span> <span
			class="notification-num"></span>
	</div>

	<!-- 알람창 display none -->
	<div class="alarm-container">
		<div class="alarm-box" style="margin-top: 15px;">
			<ul>
			</ul>
		</div>
	</div>
	<script>
		function alarmList(){
			
			$.ajax({
				url:"alarm.al",
				data:{receiveNo:'${loginMember.memNo}'},
				success:alist=>{
					
					let value = "";
					
					if(alist.length == 0){
						value = "알림이 없습니다.";
					} 
					
					for(let i in alist){
						value += "<a href='" + alist[i].url + "'>"
						 	   + "<li data-ano='" + alist[i].aNo + "' data-re='" + alist[i].receiver.receiver + "'>" + alist[i].happen + "... 에 <b style='color:blue'>" + alist[i].nickName + "</b>님의" + alist[i].content + "</li><hr>"
						 	   + "</a>"
					}
					
					
					$(".alarm-box>ul").html(value);
					$(".notification-num").text(alist.length);
					
				}, error:()=>{
					console.log("알람 ajax 실패")
				}
			})
		}
		
		alarmList();
		
		
		$(document).on("click", ".alarm-box li", function(){
			
			var ano = $(this).data("ano");
			
			$.ajax({
				url:"delete.al",
				data:{aNo:ano},
				success:()=>{
					alarmList();
					console.log("알림 삭제 ajax 성공");
				},error:()=>{
					console.log("알림 삭제 ajax 실패");
				}
			})
			
		});
		
		
		  function quitClass(){
			  $.ajax({	
					url:"quitClass.cl",
					data:{
						memNo:'${loginMember.memNo}',
						classNo:'${c.classNo}',
					}, success:result=>{
						swal("모임 탈퇴가 완료되었습니다.","", "success");
					}, error:()=>{
						swal("모임 탈퇴에 실패하였습니다.","", "error");
					}
				})
		  }	
		  
		  
		  $(".quit_option").on('click', function() {
			  const quitClass = $(".quitClassContainer");
		    if (quitClass.css('display') === 'none') {
		    	quitClass.css('display', 'block');
		    } else {
		    	quitClass.css('display', 'none');
		    }
		  });
		  
				
		  $("#noti-form").on('click', function() {
			  const alarm = $(".alarm-container");
		    if (alarm.css('display') === 'none') {
		      alarm.css('display', 'block');
		    } else {
		      alarm.css('display', 'none');
		    }
		  });
		  
			function checkStatus(){
				
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
								case 1 : $(".enter-btn").text("참가중인 모임 입니다."); 
										 $(".enter-btn").attr("disabled", true); 
										 $(".quit_option").css("display", "block");
										 $("#payment").css("display", "none"); break;
								case 2 : $(".enter-btn").text("호스트 승인 대기중 입니다."); break;
								case 3 : $(".enter-btn").text("빈자리가 나오기를 대기중입니다."); break;
								case 4 : $(".enter-btn").text("결제 후 참가가 완료됩니다!"); 
										 $(".enter-btn").attr("disabled", true); 
										 $("#payment").css("display", "inline"); break;
								case 5 : $(".enter-btn").text("탈퇴한 모임입니다."); 
										 $(".enter-btn").attr("disabled", true);							 
							}
						}, error:()=>{
							console.log("가입상태 ajax 실패");
						}
					})
				}
			}
			
			checkStatus();
		
			function enterClass(){
				
				let lm = "${loginMember}";
				let seat = "${ c.peopleLimit - c.vacancy }";
				let cl_type = '${c.classApproval}';
				let cl_typeNo = 0;
				
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
							swal("모임 신청이 완료되었습니다.","", "success");
							checkStatus();
						}, error:()=>{
							swal("모임 신청이 실패하였습니다.","", "error");
						}
					})
				}
			}
			
			
			/* 모임 즐겨찾기 함수 시작 */
			
			/* 모임 즐겨찾기 확인 함수 */
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
			
			/* 모임 즐겨찾기 삽입/삭제 함수 */
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
								swal("찜 😍 등록 완료했습니다!", "", "success");
							} else if(result == "delete"){
								$(".likeClass>span").attr("class", "icon_heart_alt");
								checkLike();
								swal("찜 😥 삭제 완료했습니다!", "", "success");
							}
						}, error:()=>{
							console.log("즐겨찾기 ajax실패");
						}
					})
				}
			}
			
			function loginAlert(){
				swal({
					  title: "로그인 후 이용하실 수 있습니다.",
					  text: "로그인 하시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willLogin) => {
					  if (willLogin) {
						location.href="loginForm.me";
					  } else {
					    swal("로그인을 취소합니다!");
					  }
					});
			}
				
		</script>

</body>
</html>