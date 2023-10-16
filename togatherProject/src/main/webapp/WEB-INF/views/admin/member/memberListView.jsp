<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				     	<div class="dropdown ">
						  <button class="btn btn-sm btn-warning dropdown-toggle dropdown float-right" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
						    	회원 목록 다운로드
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						    <li><a class="dropdown-item" href="list.dl">회원목록 다운로드</a></li>
						    <li><a class="dropdown-item" href="#">회원정보 수정</a></li>
						  </ul>
						</div>
				     	<br><br>
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">회원번호</th>
						      <th scope="col">이름</th>
						      <th scope="col">아이디</th>
						      <th scope="col">닉네임</th>
						      <th scope="col">나이</th>
						      <th scope="col">가입일</th>
						    </tr>
						  </thead>
						  <tbody>
						 	 <c:forEach var="m" items="${list}">
							    <tr>
							      <th scope="row">${m.memNo}</th>
							      <td>${m.memName }</td>
							      <td>${m.memId }</td>
							      <td>${m.nickname }</td>
							      <td>${m.age }</td>
							      <td>${m.enrollDate }</td>
							    </tr>
						 	 </c:forEach>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
</body>
</html>