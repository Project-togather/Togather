<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라운지 페이지</title>
<link rel="shortcut icon" href="assets/images/detail/favicon.ico">
<style>
.menu-classic-item-img img{
	width: 349.99px;
	height: 204.07px;
	object-fit: cover;
}
.categorybarDiv{ width: 500px; margin:0 auto;}
.categorybar{ float:left; text-align:center;}
.categorybar li{ display:inline-block; text-align:center; margin-left: 50px;}
li:hover {cursor: pointer; background-color: orange;}
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>

		<br><br><br><br><br>
		
		<div class="col-md-6 m-auto text-center">
				<h1 class="display-1">라운지</h1>
				<p class="lead">비슷한 관심사를 가진 <br/> 멤버들의 취향 피드 구독하기</p> <br>
				<h4>나와 비슷한 멤버를 찾아 팔로우하면 <br> 언제 어디서나 더 가깝게 연결될 수 있어요.</h4>
			<div class="divider-border"></div>
		</div>
        <div class="categorybarDiv">
    		<ul class="categorybar">
	        	<li onclick="feedPage(1)"> <h5> 🔥 인기피드 </h5> </li>
	        	<li onclick="feedPage(2)"> <h5> 😁 모임후기 </h5> </li>
	        	<c:if test="${ not empty loginMember }">
	        	<li onclick="feedPage(3)"> <h5> ❤️ 팔로잉 </h5> </li>
	        	</c:if>
	        </ul>
		</div>
		<input type="hidden" id="memNo" name="memNo" value="${ loginMember.memNo }">
		
		<script>
			function feedPage(e){
				
				$("#row").html("");
				
				let status = "";
				
				if(e == 1){
					status = 'Y';
				}else if(e == 2){
					status = 'N';
				}else if(e == 3){
					status = 'G';
				}
				
				console.log(status);
				$.ajax({
					url:"feed.list",
					data:{
						feStatus:status,
						memNo:$("#memNo").val()
						},
					success:(data)=>{
						console.log(data);
						let value = "";
						for(let i in data){
							console.log(data);
							console.log(data[i].img);
							value += "<div class='col-md-4'>" 
								    + "<div class='menu-classic-item'>"
								    + "<div class='menu-classic-item-img' onclick=location.href='feedDetail.fe?feNo="+ data[i].feNo+"'>"
								    + "<img src=" + data[i].img + ">"
								    + "</div>"
								    + "<div class='menu-classic-item-inner'>"
								    + "<h6>" 
								    + (data[i].feContent.length >= 30 ? data[i].feContent.substring(0, 29) : data[i].feContent)
								    + "</h6>"
								    + "</div>"
								    + "</div>"
								    + "</div>"
								  ;
						}
						$("#row").html(value);
					},
					error:()=>{
						console.log("실패")
					}
				})
			}
		</script>
		
		<!-- Menu-->
		<section class="module">
			<div class="container">
				<div class="row" id="row">
					<c:forEach var="f" items="${ list }">
						<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img" onclick="location.href='feedDetail.fe?feNo=${ f.feNo }'">
								<img src="${ f.img }">
							</div>
							<div class="menu-classic-item-inner">
					       <c:choose>
					           <c:when test="${fn:length(f.feContent) > 30}">
					            	<h6><c:out value="${fn:substring(f.feContent, 0,29)}"/>...</h6>
					           </c:when>
					           <c:otherwise>
					            	<h6><c:out value="${f.feContent}"/></h6>
				        	   </c:otherwise> 
				          </c:choose>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- Menu end-->

		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>