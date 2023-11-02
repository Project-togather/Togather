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
.categorybarDiv{ width: 600px; margin:0 auto;}
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
li>h5{margin-bottom: 0px;}
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
	        	<li onclick="location.href='myclass.pa'"> <h5> 🕧 내가 만든 모임 </h5> </li>
	        	<li onclick="myClass(1)"> <h5> 🏃 참가중인 모임 </h5> </li>
	        	<li onclick="myClass(2)"> <h5> ⌛ 승인 대기중 </h5> </li>
	        	<li onclick="likeClass()"> <h5> 🌟 찜한 모임 </h5> </li>
	        </ul>
		</div>
		
		<input type="hidden" id="memNo" name="memNo" value="${ loginMember.memNo }">
		
		<script>
			function myClass(e){
				
				$.ajax({
					url:"myclass.list",
					data:{
						clTypeStatus:e,
						memNo:$("#memNo").val(),
						},
					success:(data)=>{
						let value = "";
						for(let i in data){
							value += "<div class='col-md-4'>" 
								    + "<div class='menu-classic-item'>"
								    + "<div class='menu-classic-item-img' onclick=location.href='detail.cl?classNo="+ data[i].classNo+"'>"
								    + "<img src=" + data[i].img + ">"
								    + "</div>"
								    + "<div class='menu-classic-item-inner'>"
								    + "<h6>" 
								    + (data[i].classContent.length >= 18 ? data[i].classTitle.substring(0, 17) : data[i].classTitle)
								    + "</h6>"
								    + "<span class='bestDiv1'>" + data[i].clName + "</span>  " + data[i].clCaName + "<br>"
								    + data[i].classLocation + "<br>"
								    + data[i].classDate + " " + data[i].classTime + " "
								    + data[i].vacancy + "/" + data[i].peopleLimit + "<br>"
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
			
			function likeClass(){
				$.ajax({
					url:"likeclass.list",
					data:{
						memNo:$("#memNo").val(),
					},
					success:(data)=>{
						console.log(data);
						let value = "";
						for(let i in data){
							value += "<div class='col-md-4'>" 
								    + "<div class='menu-classic-item'>"
								    + "<div class='menu-classic-item-img' onclick=location.href='detail.cl?classNo="+ data[i].classNo+"'>"
								    + "<img src=" + data[i].img + ">"
								    + "</div>"
								    + "<div class='menu-classic-item-inner'>"
								    + "<h6>" 
								    + (data[i].classContent.length >= 18 ? data[i].classTitle.substring(0, 17) : data[i].classTitle)
								    + "</h6>"
								    + "<span class='bestDiv1'>" + data[i].clName + "</span>  " + data[i].clCaName + "<br>"
								    + data[i].classLocation + "<br>"
								    + data[i].classDate + " " + data[i].classTime + " "
								    + data[i].vacancy + "/" + data[i].peopleLimit + "<br>"
								    + "</div>"
								    + "</div>"
								    + "</div>"
								  	;
						}
						$("#row").html(value);
					},
					error:()=>{
						console.log("실패!")
					}
				})
			}
		</script>
		
		<!-- Menu-->
		<section class="module">
			<div class="container">
				<div class="row" id="row">
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
				          	<span class="bestDiv1"> ${ c.clName } </span> &nbsp;&nbsp; ${ c.clCaName }   <br>
				          	 ${ c.classLocation } <br>
				          	 ${ c.classDate } ${ c.classTime } &nbsp;
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