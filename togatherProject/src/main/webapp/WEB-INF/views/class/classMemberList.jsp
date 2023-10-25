<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Tavern - Responsive Restaurant Template(Bootstrap 4)</title>
	</head>
	<body>
	
		<jsp:include page="../common/menubar.jsp"/>
		
		<section class="module" style="padding-bottom:10px">
			<div class="container" style="margin-top:50px">
				<div class="row blog-masonry">
					<div class="col-md-4 post-item">
						<article class="post" style="cursor:pointer" onclick="memberList(1);">
							<div class="post-wrapper">
								<div class="post-header">
									<h2 class="post-title display-1" style="text-align: center;">참가 중인 멤버 목록</h2>
								</div>
							</div>
						</article>
					</div>
					<div class="col-md-4 post-item">
						<article class="post" style="cursor:pointer" onclick="memberList(2);">
							<div class="post-wrapper">
								<div class="post-header">
									<h2 class="post-title display-1" style="text-align: center;">승인 대기 중인 멤버 목록</h2>
								</div>
							</div>
						</article>
					</div>
					<div class="col-md-4 post-item">
						<article class="post" style="cursor:pointer" onclick="memberList(3);">
							<div class="post-wrapper">
								<div class="post-header">
									<h2 class="post-title display-1" style="text-align: center;">공석 대기중인 멤버 목록</h2>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</section>
		
			<!-- Brunch Menu-->
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">Tasty and crunchy</p>
							<h1 class="display-1">참가중인 멤버 목록</h1>
							<p class="lead"></p>
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
							<div class="menu-simple first">
							<!--  
								<c:forEach var="m" begin="0" end="4">
									<div class="menu-simple-item">
										<div class="menu-simple-item-img"><img src="${ list[m].img }" alt=""></div>
										<div class="menu-simple-item-inner">
											<h6><span>${ list[m].nickName }</span></h6>
											<p>${ list[m].msg }</p>
										</div>
									</div>
								</c:forEach>
							-->
							</div>
						</div>
						<div class="col-md-6">
							<div class="menu-simple second">
							<!-- 
								<c:forEach var="m" begin="5" end="9">
									<div class="menu-simple-item">
										<div class="menu-simple-item-img"><img src="${ list[m].img }" alt=""></div>
										<div class="menu-simple-item-inner">
											<h6><span>${ list[m].nickName }</span></h6>
											<p>${ list[m].msg }</p>
										</div>
									</div>
								</c:forEach>
							 -->
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
				
				<script>
					function memberList(num){
						
						var clType;
						if(num == 1){
							clType = 1;
						} else if(num == 2){
							clType = 2;
						} else if(num == 3){
							clType = 3;
						}
						
						$.ajax({
							url:"classMemberList.cl",
							data:{
								classNo:'${classNo}',
								clType:clType
							}, success:list=>{
								
								console.log(list);
								
								$(".lead").text("현재" + list.length + "명이 가입되어 있습니다!");
								let value = "";
								
								for(let i = 0; i<list.length; i++){
									value += '<div class="menu-simple-item">'
										   + '<div class="menu-simple-item-img"><img src="' + list[i].img + '" alt=""></div>'
										   + '<div class="menu-simple-item-inner">'
										   + '<h6><span>' + list[i].nickName + '</span></h6>'
										   + '<p>' + list[i].msg + '</p>'
										   + '</div>'
										   + '</div>';
								}
								
								$(".first").html(value);
								
							}, error:()=>{
								console.log("멤버조회 ajax 실패");
							}
						})
					}
					
					memberList(1);
				</script>
			<!-- Brunch Menu End-->
			
			<!-- 승인 대기중 멤버 -->
			<!--  
			<section class="module" id="popular">
				<div class="container" style="margin-top:50px">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">Tasty and crunchy</p>
							<h1 class="display-1">호스트의 승인 대기 중인 멤버 목록</h1>
							<p class="lead">현재 ${ list.size() }명이 승인 대기중입니다!</p>
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
										<div class="menu-simple-item-img"><img src="${ list[m].img }" alt=""></div>
										<div class="menu-simple-item-inner">
											<h6><span>${ list[m].nickName }</span></h6>
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
										<div class="menu-simple-item-img"><img src="${ list[m].img }" alt=""></div>
										<div class="menu-simple-item-inner">
											<h6><span>${ list[m].nickName }</span></h6>
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
							<p class="text-center"><a class="btn btn-black" href="#">멤버 더 보기</a></p>
						</div>
					</div>
				</div>
			</section>

			<section class="module" id="popular">
				<div class="container" style="margin-top:50px">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<p class="subtitle">Tasty and crunchy</p>
							<h1 class="display-1">모임의 빈자리를 대기중인 멤버 목록입니다.</h1>
							<p class="lead">현재 ${ list.size() }명이 빈 자리 대기중입니다!</p>
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
										<div class="menu-simple-item-img"><img src="${ list[m].img }" alt=""></div>
										<div class="menu-simple-item-inner">
											<h6><span>${ list[m].nickName }</span></h6>
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
										<div class="menu-simple-item-img"><img src="${ list[m].img }" alt=""></div>
										<div class="menu-simple-item-inner">
											<h6><span>${ list[m].nickName }</span></h6>
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
							<p class="text-center"><a class="btn btn-black" href="#">멤버 더 보기</a></p>
						</div>
					</div>
				</div>
			</section>
			-->
		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	</body>
</html>