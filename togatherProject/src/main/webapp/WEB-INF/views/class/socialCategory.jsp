<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menu-classic-item-img img{
	width: 349.99px;
	height: 204.07px;
	object-fit: cover;
}
.categorybarDiv{ width: 1000px; margin:0 auto;}
.categorybar{ float:left; text-align:center;}
.categorybar li{ display:inline-block; text-align:center; margin-left: 20px;}
li:hover {cursor: pointer; background-color: orange;}
.bestDiv1{
    padding: 4px 6px;
    font-size: 12px;
    font-weight: 500;
    line-height: 14px;
    border-radius: 5px;
    color: white;
    background-color: orange;
}
.bestDiv2{
    padding: 4px 6px;
    font-size: 12px;
    font-weight: 500;
    line-height: 14px;
    border-radius: 5px;
    color: white;
    background-color: rgb(255, 63, 51);
}
.menu-classic-item-inner img{
	width: 30px; 
	height: 30px;
}
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>

		<br><br><br><br><br>
		
		<div class="col-md-6 m-auto text-center">
			<h1 class="display-1">소셜링</h1>
			<p class="lead">똑같은 일상을 다채롭게 <br/> 만들어 줄 원데이 취향 모임</p>
			<h4>누구나 열고 참여할 수 있는 원데이 모임, <br> 소셜링으로 가볍고 즐겁게 만나보세요!</h4>
        </div>
        <br>
        <div class="categorybarDiv">
    		<ul class="categorybar">
	        	<li onclick="location.href='social.pa'">전체</li>
	        	<li onclick="category(1);"><img src="https://images.munto.kr/munto-web/culture_icon.svg" width="17.33" height="26" style="color: transparent;"> 문화·예술</li>
	        	<li onclick="category(2);"><img src="https://images.munto.kr/munto-web/activite_icon.svg" width="17.33" height="26" style="color: transparent;"> 액티비티</li>
	        	<li onclick="category(3);"><img src="https://images.munto.kr/munto-web/food_icon.svg" width="17.33" height="26" style="color: transparent;"> 푸드·드링크</li>
	        	<li onclick="category(4);"><img src="https://images.munto.kr/munto-web/hobby_icon.svg" width="17.33" height="26" style="color: transparent;"> 취미</li>
	        	<li onclick="category(5);"><img src="https://images.munto.kr/munto-web/icon_category_blind-date.svg" width="17.33" height="26" style="color: transparent;"> 파티·소개팅</li>
	        	<li onclick="category(6);"><img src="https://images.munto.kr/munto-web/icon_category_peer.svg" width="28" height="48" style="color: transparent;"> 동네·친목</li>
	        	<li onclick="category(7);"><img src="https://images.munto.kr/munto-web/financial_tech_icon.svg" width="17.33" height="26" style="color: transparent;"> 재테크</li>
	        	<li onclick="category(8);"><img src="https://images.munto.kr/munto-web/foreign_language_icon.svg" width="28" height="48" style="color: transparent;"> 외국어</li>
	        </ul>
		</div>
		
		<script>
			function category(e){
				let categorynum = e;
				$.ajax({
					url:"category.list",
					data:{
						clCategory:categorynum,
						clType: 1,
						},
					success:(list)=>{
						location.href="category.solist";
					},
					error:()=>{
						console.log("실패");
					}
				})
			}
		</script>
		
		<!-- Menu-->
		<section class="module">
			<div class="container">
				<div class="row">
					<c:forEach var="c" items="${ list }">
						<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img" onclick="location.href='detail.cl?classNo=${ c.classNo }&clType=${ c.clType }'">
								<img src="${ c.attachment.filePath }">
							</div>
							<div class="menu-classic-item-inner">
					       <c:choose>
					           <c:when test="${fn:length(c.classTitle) > 18}">
					            	<h6><c:out value="${fn:substring(c.classTitle, 0,17)}"/>...</h6>
					           </c:when>
					           <c:otherwise>
					            	<h6><c:out value="${c.classTitle}"/></h6>
				        	   </c:otherwise> 
				          </c:choose>
				          	<span class="bestDiv1"> ${ c.clName } </span> <br>
				          	${ c.clCaName }  ${ c.classLocation } <br>
     	     	 			<c:if test="${ not empty c.classDate }">
				          	 	${ c.classDate } ${ c.classTime } <br>
				          	</c:if>
    					    <c:forEach var="i" items="${ imgList1 }">
    					    	<c:if test="${ c.classNo eq i.classNo }">
			          				<img src="${ i.img }">
			          			</c:if>
			          		</c:forEach>
			          		${ c.vacancy }/${ c.peopleLimit } <br>
							</div>
						</div>
					</div>
					</c:forEach>
					
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="100px"></div>
					</div>
				</div>
			</div>
		</section>
		<!-- Menu end-->


		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>