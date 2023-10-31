<%@page import="com.kh.spring.attachment.model.vo.Attachment"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	//if(session.getAttribute("pImg") != null){
	//	Attachment at = (Attachment)session.getAttribute("pImg");
	//	System.out.println("헤더에서 이미지 주소 " + at.getFilePath());
	//	String filePath = at.getFilePath();
	//}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

<style>
.menu-item-span{
   font-size: 17px;
   font-weight: bold;
}

.top-bar{
   height: 100%;
}

.search-txt{
   display: flex;
   padding: 0;
   width: 500px;
   border:none;
   background: none;
   outline: none;
   float: left;
}

.top-bar-tools {
   position: relative;
}

.open-offcanvas {
   position: absolute;
   left: auto;
}

.ti-user fa-2x {
   position:absolute;
   left: 100px;
}

.col-md-6 .lead{
	font-size: 30px;
}
</style>
</head>
<body>
	<c:if test="${not empty alertMsg}">
		<script >
			//swal("${alertMsg}");
			swal("${alertMsg}","", "success");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

   <!-- Preloader-->
      <div class="page-loader">
         <div class="loader"></div>
      </div>
      <!-- Preloader end-->

      <!-- Header-->
      <header class="header header-transparent">
         <!-- Top bar-->
         <div class="top-bar" style="background-color: orange;">
            <ul class="top-bar-tools">

                  <li><a class="open-offcanvas" href="#"><i class="ti-menu fa-2x"></i></a></li>
                 <c:choose>
                 	<c:when test="${empty loginMember}">
                  		<li><a href="loginForm.me">login</a></li>
                  	</c:when>
                  	<c:otherwise>
                  		<li> ${loginMember.memName} 님환영합니다 </li>
                  	</c:otherwise>
                  </c:choose>
                  
                   <c:choose>
                 	<c:when test="${empty loginMember}">
                  <li><a href="enrollForm.me"><i class="ti-user fa-2x"></i></a></li>
					</c:when>
					  <c:otherwise>
                 			 <li><img src="${loginMember.img}" style="width: 40px; height: 40px ;border-radius: 30px; "></li>
					  </c:otherwise>
                  </c:choose> 	

						<li>
							<div class="search-box">
							<input type="text" class="search-txt" name="" placeholder="지금 생각나는 취미를 검색하세요.">
							<a class="search-btn" href="list.se">
								<i class="fa fa-search" aria-hidden="true" type="submit"></i>
							</a>
						</div>
					</li>
					<c:if test="${not empty loginMember}">
						<li>
							<a href="logout.me">logOut</a>
						</li>
					</c:if>
				</ul>
			</div>
			
         <div class="navigation navigation-center">
            <div class="container-fluid">
               <!-- Brand-->
               <div class="inner-header"><a class="inner-brand" href="index.do"><img class="brand-dark" src="assets/images/logo.png" width="74px" alt=""><img class="brand-light" src="assets/images/logo-light.png" width="74px" alt=""></a></div>
               <!-- Navigation-->
               <div class="inner-navigation collapse">
                  <div class="inner-nav onepage-nav">
                     <ul>
						<li><a href="index.do"><span class="menu-item-span">Home</span></a></li>
						<li><a href="social.pa"><span class="menu-item-span">SOCIAL</span></a></li>
						<li><a href="club.pa"><span class="menu-item-span">CLUB</span></a></li>
						<li><a href="challenge.pa"><span class="menu-item-span">CHALLENGE</span></a></li>
						<li><a href="oneday.pa"><span class="menu-item-span">ONEDAY</span></a></li>
						<li><a href="lounge.pa"><span class="menu-item-span">ROUNGE</span></a></li>
						
					 <c:if test="${ not empty loginMember }"> 
					 </c:if> 
						<li><a href="myclass.pa"><span class="menu-item-span">MYCLASS</span></a></li>
						<li><a href="enrollForm.cl"><span class="menu-item-span">ENROLL CLASS</span></a></li>
						<li><a href="mypage.me"><span class="menu-item-span">MYPAGE</span></a></li>

					
					 <c:if test="${ loginMember.memId == 'ADMIN' }">
					 </c:if> 
					 	<li><a href="admin.pa"><span class="menu-item-span">관리자페이지</span></a></li>
						
                     </ul>
                  </div>
               </div>

               <!-- Mobile menu-->
               <div class="nav-toggle"><a href="#" data-toggle="collapse" data-target=".inner-navigation"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a></div>
            </div>
         </div>
      </header>
      <!-- Header end-->
      
      <!-- Scripts-->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
      <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
      <script src="assets/js/plugins.min.js"></script>
      <script src="assets/js/custom.min.js"></script>
</body>
</html>