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
							<h1 class="display-3"></h1>
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
								
							</div>
						</div>
						<div class="col-md-6">
							<div class="menu-simple second">

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
								classNo:'${c.classNo}',
								clType:clType
							}, success:list=>{
								if(clType == 1){
									$(".display-3").text("참가 중인 멤버 목록");									
								} else if(clType == 2){
									$(".display-3").text("승인 대기 중인 멤버 목록");																		
								} else {
									$(".display-3").text("빈 자리 대기 중인 멤버 목록");																		
								}
								$(".lead").text("현재" + list.length + "명이 가입되어 있습니다!");
								let value = "";
								let value2 = "";
								for(let i = 0; i<list.length; i++){
									if(i<5){
										value += '<div class="menu-simple-item">'
											   + '<div class="menu-simple-item-img"><img src="' + list[i].img + '" alt=""></div>'
											   + '<div class="menu-simple-item-inner">'
											   if(clType==2){
												value += '<button class="pull-right btn btn-white refuse" data-refuse="' + list[i].memNo + '"style="margin-left:20px; color:red;">거절</button>' 
												   	   + '<button class="pull-right btn btn-white admit" data-admit="' + list[i].memNo + '"style="color:blue;">승인</button>'												   
											   }
										value += '<h6><span>' + list[i].nickName + '</span></h6>'
											   + '<p>' + list[i].msg + '</p>'
											   + '</div>'
											   + '</div>';
									} else if(i>4){
										value2 += '<div class="menu-simple-item">'
											   + '<div class="menu-simple-item-img"><img src="' + list[i].img + '" alt=""></div>'
											   + '<div class="menu-simple-item-inner">'
											   + '<button class="pull-right btn btn-white" id="refuse" data-refuse="' + list[i].memNo + '"style="margin-left:20px; color:red;">거절</button>' 
											   + '<button class="pull-right btn btn-white" id="admit" data-admit="' + list[i].memNo + '"style="color:blue;">승인</button>'
											   + '<h6><span>' + list[i].nickName + '</span></h6>'
											   + '<p>' + list[i].msg + '</p>'
											   + '</div>'
											   + '</div>';
									}
								}
								
								
								$(".first").html(value);
								$(".second").html(value2);								
								
							}, error:()=>{
								console.log("멤버조회 ajax 실패");
							}
						})
					}
					
					memberList(1);
					
					$(document).on("click", ".admit", function(){
						
						var memNo = $(this).data("admit");
						
						$.ajax({
							url:"admitClass.me",
							data:{
								memNo:memNo,
								classNo:'${c.classNo}',
								price:'${c.classPrice}'
								},
							success:result=>{
								if(result>0){
									swal("참가 승인에 성공하였습니다!", "참가 희망자의 결제 후 최종 참가 됩니다.", "success");
									memberList(2);									
								} else {
									swal("참가 승인에 실패하였습니다!","","error");
									memberList(2);
								}
							}, error:()=>{
								swal("참가 승인에 실패하였습니다!","","error");
								memberList(2);
							}
						})
					});
					
					$(document).on("click", ".refuse", function(){
						
						var memNo = $(this).data("refuse");
						
						$.ajax({
							url:"refuseClass.me",
							data:{
								memNo:memNo,
								classNo:'${c.classNo}'
								},
							success:result=>{
								if(result>0){
									swal("참가 거절에 성공하였습니다!", "", "success");
									memberList(2);									
								} else {
									swal("참가 거절에 성공하였습니다!", "", "success");
									memberList(2);
								}
							}, error:()=>{
								swal("참가 거절에 성공하였습니다!", "", "success");
								memberList(2);
							}
						})
					});
					
					
					
				</script>
			
		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	</body>
</html>