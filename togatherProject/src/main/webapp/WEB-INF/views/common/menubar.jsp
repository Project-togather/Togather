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
<link rel="shortcut icon" href="assets/images/detail/favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />	
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- Favicons-->

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

/* 서치바 영역 */
li .m-searchBar {
  background-color: orange;
  width: 300px;
  height: 25px;
  margin: 0 auto;
  position: relative;
  top: 4px; /* 위로 조금 올립니다 */
  border-radius: 50px;
}

li .m-searchBox {
  position: relative;
}

li .m-searchTxt {
  border: none;
  border-radius: 50px;
  width: 100%;
  height: 30px;
  background-color: white;
  position: relative;
  top: -5px;
  text-align: left;
  font-size: 1em;
  line-height: 30px;
  padding-left: 10px; /* Adjust this value to move the text to the right */
}

li .m-searchBtn {
  border: none;
  background: none;
  position: absolute;
  top: -3px; /* 아이콘을 위로 조금 올립니다 */
  right: 0;
}

li .m-searchBtn:focus {
	outline: none;
}

li .m-searchBtn i {
  font-size: 2em;
  color: orange;
}


/* 추가적인 스타일을 원하실 경우 여기에 추가하실 수 있습니다. */
@font-face {
    font-family: 'TheJamsil';
    font-weight: 700;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.eot?#iefix') format('embedded-opentype'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.woff2') format('woff2'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.woff') format('woff'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Light.ttf') format("truetype");
    font-display: swap;
}
        *{
            font-family: 'TheJamsil';
            /* font-family: 'IBM Plex Sans KR', sans-serif; */
        }
</style>
</head>
<body>

  <script>
      var socket = null;
      
      $(document).ready(function(){
	      if(${loginMember != null}){
	   		
	      connectWs();
	      }
      })
      
      function connectWs(){
    	
		console.log("tttttt")
		var ws = new SockJS("http://localhost:8012/togather/alram");
		socket = ws;
		//alert(socket);
		console.log(socket);
		
			ws.onopen = function() {
		 
 		};
 		
	 		ws.onmessage = function(event) {
	 			
	 		alert(event.data);	
	 			
	 	};

	 		ws.onclose = function() {
	 		   //alert("onclose");
	 	 };
 	 
 		
 		
      
      };

      
      </script>
      
	
	<script>
	 
	/* sse Test */
    function sse(id) {
		
        // 비동기 작업을 위한 프로미스 반환
        /*
        return new Promise((resolve, reject) => {
        */  
        	const eventSource = new EventSource(`sse/` + id);
            
            eventSource.addEventListener("sse", function(event) {
                alarmList();
                console.log("오셨습니까...");
                const data = JSON.parse(event.data);
                console.log(data);

                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "onclick": function(){location.href="http://localhost:8012/togather/detail.cl?classNo=" + data.reply.refFno;},
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }

                toastr.info(data.reply.classTitle + "모임에 <span style='color: orange'>" + data.receiver.nickName + "</span>님이" + data.content, '🔔 알람이 도착했습니다 !');
                

                // 비동기 작업이 완료되면 프로미스 해결
                resolve(data);
            });
/*
            eventSource.addEventListener("error", function(event) {
                // 에러 발생 시 프로미스 거부
                reject(event);
            });
        });
*/
    }
	
	</script>
	

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
							<div class="m-searchBar" style="background-color: white;">
							    <form action="search.li" method="get">
							        <input type="hidden" name="cpage" value="1">
							        <div class="m-searchBox">
							            <input type="text" class="m-searchTxt" name="keyword" value="${ keyword }" placeholder="지금 생각나는 취미를 검색하세요.">
							            <button class="m-searchBtn" type="submit" style="border:none;">
							                <i class="fa fa-search fa-2x" aria-hidden="true" style="color: orange;"></i>
							            </button>
							        </div>
							    </form>
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
               <div class="inner-header"><a class="inner-brand" href="index.do"><img class="brand-dark" src="assets/images/togather-logo-light.png" width="150px" alt=""><img class="brand-light" src="assets/images/togather-logo.png" width="150px" alt=""></a></div>
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
						<li><a href="usnoticelist.pa"><span class="menu-item-span">NOTICE</span></a></li>
						
					 <c:if test="${ not empty loginMember }"> 
						<li><a href="myclass.pa"><span class="menu-item-span">MYCLASS</span></a></li>
						<li><a href="enrollForm.cl"><span class="menu-item-span">ENROLL CLASS</span></a></li>
						<li><a href="mypage.me"><span class="menu-item-span">MYPAGE</span></a></li>
					 </c:if>
					
					 <c:if test="${ loginMember.memId == 'admin' }">
					 	<li><a href="admin.pa"><span class="menu-item-span">관리자페이지</span></a></li>
					 </c:if>
						
                     </ul>
                  </div>
               </div>

               <!-- Mobile menu-->
               <div class="nav-toggle"><a href="#" data-toggle="collapse" data-target=".inner-navigation"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a></div>
            </div>
         </div>
      </header>
      
      <script>
      var socket = null;
      $(document).ready(function(){
	      if(${loginMember != null}){
	      connectWs();
	      }
      })
      
      function connectWs(){
		console.log("tttttt")
		var ws = new SockJS("/alram");
		socket = ws;
		
			ws.onopen = function() {
		 console.log('open');
 
 		};
      
      }

      
      </script>
      
      
      
      
      
      
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