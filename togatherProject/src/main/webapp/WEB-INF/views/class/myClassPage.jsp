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
				<h1 class="display-1">내모임</h1>
			<div class="divider-border"></div>
		</div>
        <div class="categorybarDiv">
    		<ul class="categorybar">
	        	<li onclick="myClass(1)"> <h5> 🏃 참가중인 모임 </h5> </li>
	        	<li onclick="myClass(2)"> <h5> ⌛ 승인 대기중 </h5> </li>
	        	<li onclick="myClass(3)"> <h5> 🌟 즐겨찾기 </h5> </li>
	        	<li onclick="myClass(4)"> <h5> 🕧 진행중인 모임 </h5> </li>
	        </ul>
		</div>
		
		<input type="hidden" id="memNo" name="memNo" value="${ loginMember.memNo }">
		
		<script>
			function myClass(e){
				
				$(".row").html("");
				
				console.log(status);
				$.ajax({
					url:"myclass.list",
					data:{
						feStatus:e,
						memNo:$("#memNo").val();
						},
					success:(data)=>{
						console.log(data);
						let value = "";
						for(let i in data){
							console.log(data);
							console.log(data[i].img);
							value += "<div class='col-md-4'>" 
								    + "<div class='menu-classic-item'>"
								    + "<div class='menu-classic-item-img' onclick=" + "'location.href='" + "'feedDetail.fe?feNo=" + data[i].feNo + "'>"
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
						$(".row").html(value);
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
				<div class="row">
					<c:forEach var="c" items="${ list }">
						<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img" onclick="location.href='detail.cl?classNo=${ c.classNo }&clType=${ c.clType }'">
								<img src="${ c.attachment.updateName }">
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
				          	${ c.clCaName }  ${ c.classLocation }, ${ c.classDate } ${ c.classTime } <br>
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
				</div>
			</div>
		</section>
		<!-- Menu end-->

		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>