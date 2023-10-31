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
		<p class="lead">Togather공지사항 입니다.</p>
		<div class="divider-border"></div>
	</div>
	
		<div class="container" style="margin-top: 50px">
			<table class="table table-hover ">
				<thead>
					<tr>
						<th scope="col">공지사항_No</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${list}">
						<tr id="noticetr">
							<th scope="row" id="noticeTh">${n.noticeNo}</th>
							<td>${n.noticeTitle }</td>
							<td>${n.noticeDate }</td>
							<td>${n.noticeViews}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 페이지바 -->
		<div id="pagingArea">
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="usnoticelist.pa?cpage=${pi.currentPage -1}">Previous</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<li class="page-item"><a class="page-link"
						href="usnoticelist.pa?cpage=${p }">${p }</a></li>
				</c:forEach>
				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="usnoticelist.pa?cpage=${pi.currentPage +1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
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

	<script>
		$(function(){
			$(document).on("click","#noticetr",function(){
				let num = $(this).find("#noticeTh").text();
				location.href='usdetail.no?noticeNo='+num
			})
		})
	</script>
</body>
</html>