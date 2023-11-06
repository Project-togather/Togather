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
		<h1 class="display-1">공지사항</h1>
		<div class="divider-border"></div>
	</div>

	<div class="container" style="margin-top: 50px">

		<div>
			<h3>공지사항 제목</h3>
			<h6>${n.noticeTitle}</h6>
		</div>

		<div>
			<h6>조회수: ${n.noticeViews}</h6>
		</div>

		<div>
			<h4>공지사항 내용</h4>
			<h6>${n.noticeContent}</h6>
		</div>

		<hr>
		<div>
			<h5>댓글</h5>
			<c:forEach var="nr" items="${nr}">
				<h6>작성자 : ${nr.commentWriter}</h6>
				<h6>내용 : ${nr.noticeComment}</h6>
				<h6>작성일 : ${nr.commentCreateDate}</h6>
				<hr>
			</c:forEach>
			<div>

				<c:choose>
					<c:when test="${not empty loginMember}">
						<h5>답글달기</h5>
						<div class="form-floating">
							<form action="comment.no" method="post">
								<input type="hidden" name="noticeReplyNo" value="${n.noticeNo}">
								<input type="hidden" name="commentWriter"
									value="${loginMember.nickName}">
								<textarea class="form-control" placeholder="Leave a comment here"
									id="floatingTextarea2" style="height: 100px"
									name="noticeComment"></textarea>
								<input type="submit" class="btn-warning float-right" value="답글등록" />
					</c:when>
					<c:otherwise>
						<h5>답글달기</h5>
						<div class="form-floating">
								<textarea class="form-control" placeholder="로그인후 이용가능합니다."
									id="floatingTextarea2" style="height: 100px" disabled></textarea>
								<input type="submit" class="btn-warning float-right" value="답글등록" disabled />
					</c:otherwise>
				</c:choose>
						</form>
						<br>
					</div>

			</div>
		</div>



		<div class="col-md-12">
			<div class="space" data-my="100px" style="margin-top: 100px;"></div>
		</div>




		<!-- To top button-->
		<a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>



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