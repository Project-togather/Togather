<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menu-classic-item-img img {
	width: 349.99px;
	height: 204.07px;
	object-fit: cover;
}
</style>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="col-md-6 m-auto text-center">
		<h1 class="display-1">회원신고 게시판</h1>
		<p class="lead">정확한 내용으로 신고 해 주세요</p>
		<div class="divider-border"></div>
	</div>
	
		<div class="container" style="margin-top: 50px" >
			<form action="throwComplain.bl" method="post">
			<input type="hidden" name="memId" value="${loginMember.memId}">
			<div class="mb-3">
			  <h4 >신고 제목 </h4>
			  <input type="text" class="form-control" id="exampleFormControlInput1" name="complainTitle">
			</div>
			<div class="mb-3">
			  <h4>신고할 유저 아이디 </h4>
			  <input type="text" class="form-control" id="exampleFormControlInput1" name="respondent">
			</div>
			<div class="mb-3">
			  <h4>신고 내용 </h4>
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="20" name="complainContent"></textarea>
			</div>
			
			<div class="mb-3">
			  <h4>첨부파일 </h4>
			  <input class="form-control" type="file" id="formFile" >
			</div>
			<input type="submit" class="btn btn-warining" value="신고하기">
		</form>
		</div>
		
		

		<div class="col-md-12">
			<div class="space" data-my="100px" style="margin-top: 100px;"></div>
		</div>
		



	<!-- To top button-->
	<a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>

	<jsp:include page="../../common/footer.jsp" />

	<!-- Scripts-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script
		src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
	<script src="assets/js/plugins.min.js"></script>
	<script src="assets/js/custom.min.js"></script>

	
</body>
</html>