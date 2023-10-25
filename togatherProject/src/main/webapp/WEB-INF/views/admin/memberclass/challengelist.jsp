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
							aria-expanded="false">모임 목록 다운로드</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="btn" href="">모임목록 다운로드</a></li>
							
						</ul>
					</div>
					<br>
					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">모임번호</th>
								<th scope="col">호스트 번호</th>
								<th scope="col">모임명</th>
								<th scope="col">모임타입 번호</th>
								<th scope="col">모임 위치</th>
								<th scope="col">폐쇄여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${list}">
								<tr>
									<th scope="row">${c.classNo}</th>
									<td>${c.memNo }</td>
									<td>${c.classTitle }</td>
									<td>${c.clCaName }</td>
									<td>${c.classLocation }</td>
									<td>${c.status }</td>
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
</body>
</html>