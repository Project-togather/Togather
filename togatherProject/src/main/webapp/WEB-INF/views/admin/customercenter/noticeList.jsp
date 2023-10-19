<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="../common/leftnav.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<jsp:include page="../common/topvar.jsp"></jsp:include>
				<div class="container-fluid ">
					<div>공지사항</div>


					<!-- Button trigger modal -->
					<button type="button" class="btn btn-warning btn-sm float-right"
						onclick="noticeWriter();">공지사항 추가하기</button>

					<br> <br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">공지사항_No</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
								<th scope="col">게시상태</th>
								<th scope="col">?</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${list}">
								<tr id="noticetr">
									<th scope="row" id="noticeTh">${n.noticeNo}</th>
									<td>${n.noticeTitle }</td>
									<td>${n.noticeDate }</td>
									<td>${n.noticeViews }</td>
									<td>${n.noticeStatus }</td>
									<td>
										<button type="button" class="btn btn-warning"
											data-bs-toggle="modal" data-bs-target="#cancel">글삭제</button>
									</td>
								</tr>
								<!-- Modal -->
								<div class="modal fade" id="blackcancel" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">블랙리스트
													해제하기</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div id="modalbody" class="modal-body"></div>
											<div class="modal-footer">
												<button type="button" class="btn btn-warning" id="deletebtn">해제하기</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">취소하기</button>
											</div>
										</div>
									</div>
								</div>
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
										href="notice.list?cpage=${pi.currentPage -1}">Previous</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="notice.list?cpage=${p }">${p }</a></li>
							</c:forEach>
							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="notice.list?cpage=${pi.currentPage +1}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		function noticeWriter(){
			location.href="insertno.pa"
			}
	</script>
	<script>
		$(function(){
			$(document).on("click","#noticetr",function(){
				let num = $(this).find("#noticeTh").text();
				location.href='detail.no?noticeNo='+num
			})
		})
	</script>

</body>
</html>