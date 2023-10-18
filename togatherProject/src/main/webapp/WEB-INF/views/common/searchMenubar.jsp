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

.search-txt {
    display: flex;
    padding: 0;
    width: 600px;
    border: none;
    background: none;
    outline: none;
    float: left;
    font-size: 1rem;
    line-height: 50px;
    margin-top: 1%;
    margin-left: 2%;
    position: relative;
}

.search-btn {
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

/* 네비바 영역 */
nav {
    position: relative;
    display: flex;
    width: 80%;
    margin: 1em auto;
    font-size: 20px;
}
nav a {
    display: block;
    width: 20%;
    padding: .75em 0;
    color: #333;
    text-decoration: none;
    text-align: center;
    cursor: pointer; /* 추가: 링크에 커서 스타일 적용 */
}

.nav-underline {
    position: absolute;
    left: 0;
    bottom: -2px;
    width: 20%;
    height: 2px;
    background: #333;
    transition: all .3s ease-in-out;
}

/* 추가: 클릭한 페이지의 링크에 대한 스타일 */
nav a.is-current {
    color: black; /* 클릭한 링크의 텍스트 색상 변경 */
}
</style>
</head>
<body>

<!-- 네비바 영역 -->
<nav>
    <a href="list.so" onclick="setActiveLink(this)"><i class="fas fa-duotone fa-bolt">&nbsp;</i>Socialing</a>
    <a href="#" onclick="setActiveLink(this)"><i class="fas fa-regular fa-star">&nbsp;</i>Club</a>
    <a href="#" onclick="setActiveLink(this)"><i class="fas fa-regular fa-fire">&nbsp;</i>challenge</a>
    <a href="feed.li" onclick="setActiveLink(this)"><i class="fas fa-light fa-comment">&nbsp;</i>Feed</a>
    <a href="#" onclick="setActiveLink(this)"><i class="fas fa-solid fa-user">&nbsp;</i>Member</a>
    <div class="nav-underline"></div>
</nav>

<script>
function setActiveLink(link) {
    // 모든 링크에서 'is-current' 클래스 제거
    $("nav a").removeClass("is-current");
    // 클릭한 링크에 'is-current' 클래스 추가
    $(link).addClass("is-current");
    // 밑줄의 위치 업데이트
    updateUnderlinePosition(link);
}

function updateUnderlinePosition(link) {
    // 밑줄을 클릭한 링크 아래로 이동
    var linkIndex = $("nav a").index(link);
    var underlinePosition = linkIndex * 20 + "%";
    $(".nav-underline").css("left", underlinePosition);
}

// 페이지 로드시 URL을 기반으로 현재 페이지 결정
$(document).ready(function() {
    var currentPageURL = window.location.href;
    if (currentPageURL.includes("list.so")) {
        setActiveLink($("nav a[href='list.so']"));
    } else if (currentPageURL.includes("feed.li")) {
        setActiveLink($("nav a[href='feed.li']"));
    }
});
</script>

</body>
</html>
