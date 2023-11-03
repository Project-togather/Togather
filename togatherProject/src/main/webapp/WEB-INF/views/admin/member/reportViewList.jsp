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
					<div>블랙리스트</div>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-warning btn-sm float-right"
						data-bs-toggle="modal" data-bs-target="#blackinsert"
						data-bs-whatever="@mdo">블랙리스트 추가하기</button>
					<button type="button" class="btn btn-warning btn-sm float-right"
					onclick="inputblacklist();">사용자페이지 블랙리스트 신고</button>
					<button type="button" class="btn btn-warning btn-sm float-right"
					onclick="selectblacklist();">블랙리스트 신고확인</button>
						
					<div class="modal fade" id="blackinsert" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title" id="exampleModalLabel">블랙리스트 추가하기</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="mb-3">
										<form class="row g-3" id="enrollForm" action="insert.bl"
											>
											<div class="col-md-12">
												<label for="validationServer01" class="form-label">회원아이디:</label>
												<input type="text" class="form-control " id="idInput"
													name="userId" required>
												<div id="checkDiv" style="margin-top: 10px;"></div>
											</div>
									</div>
								</div>
								<div class="modal-footer" id="enroll-btn">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소하기</button>
									<button type="submit" class="btn btn-warning">등록하기</button>
								</div>
								</form>
							</div>
						</div>
					</div>


					<br> <br>
					<table class="table table-hover" id="blacktable">
						<thead>
							<tr>
								<th scope="col">신고번호</th>
								<th scope="col">신고자</th>
								<th scope="col">피신고자</th>
								<th scope="col">피신고자 신고누적횟수</th>
								<th scope="col">신고 날짜</th>
								<th scope="col">처리결과</th>
								<th scope="col">신고분류</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="r" items="${list}">
								<tr id="reportList">
									<th scope="row" id="reportNo">${r.reNo}</th>
									<td id="blackId">${r.reMem}</td>
									<td >${r.rePmem}</td>
									<td >${r.rpCount}</td>
									<td >${r.reDate}</td>
									<td>${r.reResult}</td>
									<td>${r.reName }</td>
								</tr>
									<!-- Modal -->
										<div class="modal fade" id="blackcancel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">블랙리스트 해제하기</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div id="modalbody"  class="modal-body">
										        
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-warning" id="deletebtn">해제하기</button>
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
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
										href="blacklist.bo?cpage=${pi.currentPage -1}">Previous</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="blacklist.bo?cpage=${p }">${p }</a></li>
							</c:forEach>
							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="blacklist.bo?cpage=${pi.currentPage +1}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<script>
			//블랙리스트 아이디 실제 존재하는지 검사
			$(function() {

				const $idInput = $("#enrollForm input[name=userId]");

				$idInput.keyup(function() {
					console.log($idInput.val());

					//최소 3글자 이상으로 입력되어 있을때만 ajax 요청해서 중복체크 하도록
					if ($idInput.val().length >= 1) {

						$.ajax({
							type : "POST",
							url : "idCheck.bl",
							data : {
								checkId : $idInput.val()
							},
							success : function(result) {
								if (result == "NNNNN") {
									$("#idInput").removeClass("is-invalid");
									$("#idInput").addClass("is-valid")
									$("#checkDiv").text("추가 가능한 아이디 입니다.")
									$("#enroll-btn :submit").removeAttr(
											"disabled");

								} else {
									$("#idInput").removeClass("is-valid");
									$("#idInput").addClass("is-invalid")
									$("#checkDiv").text("존재하지 않는 아이디 입니다.")
									$("#enroll-btn :submit").attr("disabled",
											true);
								}
							},
							error : function() {
								console.log("아이디 중복체크용 ajax 통신 실패");
							}
						})
					} else {
						$("#enroll-btn :submit").attr("disabled", true);
					}
				})
			})
		</script>
		
		
		
 
		<script>
		 $(function() {
			    $(document).on("click", "#blackbtn", function () {
			      let userId = $(this).closest("tr").find("#blackId").text();
			      $("#modalbody").html(userId + " ID를 가진 회원을 블랙리스트에서 해제 하시겠습니까?");
			    });
			  });
		</script>
	
		<!--  
		<script>
			$(function(){
			  $("#blackbtn").click(function(){
			    let username = $(this).closest("tr").find("#blackname").text();
			    $("#modalbody").html(username);
			  });
			});
		</script>
		-->
		
		<script>
			$(function(){
				$(document).on("click", "#deletebtn", function () {
				     let content = $("#modalbody").text().split('I',1)[0];
					 location.href='black.de?memId='+content;
				})
			})
		</script>
		
		<script>
			function inputblacklist(){
				location.href='complain.bl'
			}
		</script>
		<script>
			function selectblacklist(){
				location.href='select.bl'
			}
		</script>
		
		<script>
		$(function(){
			$(document).on("click","#reportList",function(){
				let num = $(this).find("#reportNo").text();
				console.log(num)
				location.href='detail.re?reNo='+num
			})
		})
	</script>
		
		
</body>
</html>