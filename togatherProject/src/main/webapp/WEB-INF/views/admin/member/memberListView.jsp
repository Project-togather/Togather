<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="../common/leftnav.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<jsp:include page="../common/topvar.jsp"></jsp:include>
				<div class="container-fluid ">
					<div>회원통합관리</div>
					<div class="dropdown ">
						<button
							class="btn btn-sm btn-warning dropdown-toggle dropdown float-right"
							type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">회원 목록 다운로드</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="list.dl">회원목록 다운로드</a></li>
							<li><a class="dropdown-item" href="#">회원정보 수정</a></li>
						</ul>
					</div>
					<br>
					<br>
					<table class="table table-hover table table-sm " >
						<thead>
							<tr class="table-warning">
								<th scope="col">회원번호</th>
								<th scope="col">이름</th>
								<th scope="col">아이디</th>
								<th scope="col">닉네임</th>
								<th scope="col">나이</th>
								<th scope="col">가입일</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${list}">
								<tr class="table-light" id="memberlist">
									<th scope="row" id="memberNo">${ m.memNo }</th>
									<td>${ m.memName }</td>
									<td>${ m.memId }</td>
									<td>${ m.nickName }</td>
									<td>${ m.age }</td>
									<td>${ m.enrollDate }</td>
									<td>${ m.memStatus }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- 페이지바 -->
					<div id="pagingArea">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="list.mem?cpage=${pi.currentPage -1}">Previous</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="list.mem?cpage=${p }">${p }</a></li>
							</c:forEach>
							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="list.mem?cpage=${pi.currentPage +1}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		$(function(){
			$(document).on("click","#memberlist",function(){
				let num = $(this).find("#memberNo").text();
				console.log(num)
				location.href='detail.mem?memNo='+num
			})
		})
	</script>
</body>
</html>