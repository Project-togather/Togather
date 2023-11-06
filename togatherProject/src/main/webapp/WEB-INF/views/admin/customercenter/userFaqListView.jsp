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

.layout {
	max-width: 1000px;
	margin: 0 auto;
}

.qna {
	list-style: none;
	margin: 0;
	padding: 0;
}

.qna>li {
	padding: 10px 0;
	box-sizing: border-box;
}

.qna>li:nth-child(n+2) {
	border-top: 1px dashed lightgray;
}

.qna input {
	display: none;
}

.qna label {
	font-weight: bold;
	color: #000;
	margin: 20px 0 0;
	cursor: pointer;
}

.qna label::before {
	content: "▶";
	display: block;
	color: black;
	margin-right: 8px;
	float: left;
}

.qna input:checked+label::before {
	content: "▼";
}

.qna div {
	display: none;
	color: #666;
	font-size: 0.9375em;
	overflow: hidden;
	padding: 10px 0 10px 30px;
	box-sizing: border-box;
	transition: max-height 0.4s;
}

.qna input:checked+label+div {
	display: block;
}

.minibar {
	width: 1000px;
	margin: 0 auto;
}

.minibar2 {
	float: left;
	text-align: center;
}

.minibar2 li {
	display: inline-block;
	text-align: center;
	margin-left: 190px;
}

minibar3:hover {
	cursor: pointer;
	background-color: orange;
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
		 <div class="minibar">
    		<ul class="minibar2">
	        	<li class="minibar3" onclick="location.href='usnoticelist.pa'">공지사항</li>
	        	<li class="minibar3" onclick="location.href='usfaqlist.pa'">FAQ</li>
	        	<li class="minibar3" onclick="location.href='complain.bl'">회원신고</li>
	        </ul>
		</div>
		<br>
		<br>
		<h1 class="display-1">faq</h1>
		<p class="lead">Togather faq 입니다.</p>
		<div class="divider-border"></div>
	</div>
	<div class="container" style="margin-top: 50px" align="left">
		<div class="layout">
			<ul class="qna">
				<c:forEach var="f" items="${list}">
					<li><input type="checkbox" id="qna-${f.faqNo}"> <label
						for="qna-${f.faqNo}">${f.faqTitle}</label>
						<div>${f.faqContent }</div></li>
				</c:forEach>
			</ul>
		</div>
	</div>



	<!--  
			<table class="table table-hover ">
				<thead>
					<tr>
						<th scope="col">faq_No</th>
						<th scope="col">제목</th>
						<th scope="col"></th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="f" items="${list}">
						<tr id="noticetr">
							<th scope="row" id="noticeTh">${n.noticeNo}</th>
							<td>${n.noticeTitle }</td>
							<td>${n.noticeDate }</td>
							<td>${n.noticeViews }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			-->
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
						href="usfaqlist.pa?cpage=${pi.currentPage -1}">Previous</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<li class="page-item"><a class="page-link"
					href="usfaqlist.pa?cpage=${p }">${p }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage }">
					<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="usfaqlist.pa?cpage=${pi.currentPage +1}">Next</a></li>
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