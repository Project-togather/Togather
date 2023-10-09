<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#outer{
		margin-top: 20px;
		margin: auto;
		width: 1200px;
	}

	#menubar{
		float: left;
	}
	
	#menubar>div{
		width: 50px;
		height: 50px;
	}
	
	#login{
		float: right;
		padding-right: 50px;
	}
	
	a:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="outer">
		<div id="menubar">
			<div>로고이미지 눌렀을때 홈으로</div>
			<div><a herf="#">소셜링</a></div>
			<div><a herf="#">클럽</a></div>
			<div><a herf="#">챌린지</a></div>
			<div><a herf="#">라운지</a></div>
			<div><a herf="#">원데이</a></div>
			<!--  로그인 전 -->
			<c:choose>
             	<c:when test="${ empty loginMember }">
	               <form action="login.me" method="post">
						<div id="login">로그인 / 회원가입</div> <br>
						ID : <input type="text" name="memId" required> <br>
						PWD : <input type="password" name="memPwd" required> <br>
						<button type="submit">로그인</button>
					</form>
             	</c:when>
				<c:otherwise>
                    <!-- 로그인 후-->
                    <div>${ loginMember.nickname }님 환영합니다</div>
                    <a href="">마이페이지</a>
                    <a href="logout.me">로그아웃</a>
				</c:otherwise>	                      
            </c:choose>
		</div>
	</div>
	
	
	
</body>
</html>