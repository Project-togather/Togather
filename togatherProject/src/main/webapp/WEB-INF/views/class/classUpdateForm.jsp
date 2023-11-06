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
		<title>${ c.classTitle }</title>
		<link rel="shortcut icon" href="assets/images/detail/favicon.ico">
	</head>
	<body>
	
	<jsp:include page="../common/menubar.jsp"/>
			<!-- Brunch-->
			<br>
			<section class="module parallax" data-background="${ atList[0].filePath }" data-overlay="0.7">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto">
							<div class="text-center">
								<h1 class="display-1">${ c.classTitle }</h1>
								<p class="lead">반갑습니다. <br> 호스트 ${ c.nickName }님, <br>여기선 해당 클럽에 대한 정보를 수정하실 수 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Brunch End-->

			<!-- Brunch Menu-->
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-md-8 m-auto">
							<div class="menu-simple">
								<div class="menu-simple-item">
									<div class="menu-simple-item-inner" onclick="location.href='classDetailUpdateForm.cl?classNo=${c.classNo}';" style="cursor:pointer;">
										<h6><span style="font-size:20px;">클럽 수정하기</span><span class="pull-right">></span></h6>
										<p>클럽에 대한 기본 정보를 수정하실 수 있어요!</p>
									</div>
								</div>
								<div class="menu-simple-item">
									<div class="menu-simple-item-inner" onclick="location.href='memberListPage.cl?classNo=${c.classNo}'" style="cursor:pointer;">
										<h6><span style="font-size:20px;">클럽 멤버 관리</span><span class="pull-right">></span></h6>
										<p>가입되어있는 멤버, 승인 대기중인 멤버 등을 확인하실 수 있어요!</p>
									</div>
								</div>
								<!--
								<div class="menu-simple-item">
									<div class="menu-simple-item-inner" onclick="location.href='';" style="cursor:pointer;">
										<h6><span style="font-size:20px;">활동비 정산 내역</span><span class="pull-right">></span></h6>
										<p>Bacon, Rice, Vegetables</p>
									</div>
								</div>
								-->
								<div class="menu-simple-item">
									<div class="menu-simple-item-inner" onclick="deleteConfirm();" style="cursor:pointer;">
										<h6><span style="font-size:20px;">클럽 삭제</span><span class="pull-right">></span></h6>
										<p>이 클럽을 아예 삭제하실 수 있어요.</p>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
					<script>
						function deleteConfirm(){
							
							cNo = '${c.classNo}';
							
							swal({
								  title: "모임을 정말 삭제하시겠습니까??",
								  text: "한번 삭제하게되면, 복구가 절대 불가능합니다. 확인 후 선택해 주세요.",
								  icon: "warning",
								  buttons: true,
								  dangerMode: true,
								})
								.then((willDelete) => {
								  if (willDelete) {
									location.href="deleteClass.cl?cNo="+cNo;
								  } else {
								    swal("모임 삭제를 취소합니다!");
								  }
								});
							
							
							/*
							$.ajax({
								url:"deleteClass.cl",
								data:{
									classNo:'${c.classNo}',
								}, success:result=>{
									console.log("삭제 ajax성공" + );
								}, error:()=>{
									console.log("삭제 ajax실패");
								}
							})
							*/
						}
					</script>
			</section>
			<!-- Brunch Menu End-->
		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	</body>
</html>