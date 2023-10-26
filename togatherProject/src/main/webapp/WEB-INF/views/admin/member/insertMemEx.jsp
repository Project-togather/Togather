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
							<li><a class="dropdown-item" href="updateMem.ex">회원정보 수정</a></li>
						</ul>
					</div>
					<br><br><br>
					
					<h1>메인입니당 엑셀 업로드 테스트~</h1>
					    <form action="update.ex" method="POST" enctype="multipart/form-data">
					      <input type="file" name="file">
					      <input type="submit" value="업로드 !" />
					    </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>