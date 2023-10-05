<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div id="login">로그인 / 회원가입</div>
		</div>
	</div>
	
	
	
</body>
</html>