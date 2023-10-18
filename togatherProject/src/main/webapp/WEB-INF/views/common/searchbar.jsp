<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicons-->
<link rel="shortcut icon" href="assets/images/favicon.png">
<link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="assets/images/apple-touch-icon-114x114.png">
<!-- Web Fonts-->
<link href="https://fonts.googleapis.com/css?family=PT+Serif%7cSignika:300,400,600,700" rel="stylesheet">
<!-- Bootstrap core CSS-->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Plugins and Icon Fonts-->
<link href="assets/css/plugins.min.css" rel="stylesheet">
<!-- Template core CSS-->
<link href="assets/css/template.css" rel="stylesheet">

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>


<style>
.top-bar {
	position: relative;

	height: 130px;
	border-bottom: 1px solid rgb(230, 230, 230);
}

.search-box {

	position: absolute;
	top: 30%;
	left: 35%;
	
	height: 60px;

	background-color: #f5f5f5;
	border-radius: 30px;
}

.search-txt{
	display: flex;
	padding: 0;
	width: 600px;
	border:none;
	background: none;
	outline: none;
	float: left;

	font-size: 1rem;
	line-height: 50px;
	margin-top: 1%;
	margin-left: 2%;

	position: relative;
}

.search-btn{
	/*
	box-sizing: border-box;
	border: 1px solid black;
	*/

	margin-left: 90%;
	margin-bottom: 50px;

	position: absolute;
	bottom: 75%;
}

.post-title {
	font-size: 1px;
}




.open-offcanvas {

}

.ti-user fa-2x {

}

/* 서치바 영역 */
.top-bar {
	position: relative;

	height: 130px;
	border-bottom: 1px solid rgb(230, 230, 230);
}

.search-box {

	position: absolute;
	top: 30%;
	left: 35%;
	
	height: 60px;

	background-color: #f5f5f5;
	border-radius: 30px;
}

.search-txt{
	display: flex;
	padding: 0;
	width: 600px;
	border:none;
	background: none;
	outline: none;
	float: left;

	font-size: 1rem;
	line-height: 50px;
	margin-top: 1%;
	margin-left: 2%;

	position: relative;
}

.search-btn{
	/*
	box-sizing: border-box;
	border: 1px solid black;
	*/

	margin-left: 90%;
	margin-bottom: 50px;

	position: absolute;
	bottom: 75%;
}

.post-title {
	font-size: 1px;
}




.open-offcanvas {

}

.ti-user fa-2x {

}

</style>

</head>
<body>

<!-- 서치바 영역 -->
<div class="top-bar" style="background-color: white;">
	<div class="search-box">
		<input type="text" class="search-txt" name="keyword" placeholder="지금 생각나는 취미를 검색하세요.">
		<a class="search-btn" href="list.so">
		<i class="fa fa-search fa-3x" aria-hidden="true" type="submit" style="color: orange;"></i>
		</a>
	</div>
</div>

</body>
</html>