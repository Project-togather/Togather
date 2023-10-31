<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.demo-preview img{
	width: 384.89px;
	height: 219.31px;
	object-fit: cover;
}
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	
	<!-- Wrapper-->
	<div class="wrapper">
		<script>
			$(document).ready(function () {
				$(".module-cover").not(".imgs").hide();
				
				setInterval(nextSlide, 4000);
			});
			
			function nextSlide(){
				$(".module-cover").hide();
				var allSlide = $(".module-cover");
				var currentIndex = 0;
				
				$(".module-cover").each(function(index,item){
					if($(this).hasClass("imgs")) {
						currentIndex = index;
					}
				});
				
				var newIndex = 0;
				
				if(currentIndex >= allSlide.length-1) {
					//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
					newIndex = 0;
				} else {
					//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
					newIndex = currentIndex+1;
				}

				$(".module-cover").removeClass("imgs");
				$(".module-cover").eq(newIndex).addClass("imgs");
				$(".module-cover").eq(newIndex).show();
			}
		</script>
		
		<!-- Hero-->
		<section id="eventimg" class="module-cover parallax imgs" data-background="assets/images/eventimg7.jpg" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg1.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg2.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg3.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg4.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg5.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg6.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg8.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
		<section id="eventimg" class="module-cover parallax" data-background="assets/images/eventimg9.webp" data-overlay="1" data-gradient="1">
			<div class="container"><div class="row"><div class="col-md-12"><div class="text-center"><img src="#" alt=""><p><br></p></div></div></div></div>
		</section>
			

	
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h1 class="display-1">소셜링</h1>
						<p class="lead">똑같은 일상을 다채롭게 <br/> 만들어 줄 원데이 취향 모임</p>
						<div class="divider-border"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="40px"></div>
					</div>
				</div>
			</div>
			<div class="container-fluid custom-container">
				<div class="row">
					<c:forEach var="c"  items="${ list }" end="8">
						<c:if test="${ c.clType eq 1 }">
						<div class="col-md-4">
							<div class="demo-preview" onclick="location.href='detail.cl?classNo=${ c.classNo }&clType=${ c.clType }'">
							<a>
								<img src="${ c.attachment.updateName }">
						       <c:choose>
						           <c:when test="${fn:length(c.classTitle) > 18}">
						            	<h6><c:out value="${fn:substring(c.classTitle, 0,17)}"/>...</h6></a></div>
						           </c:when>
						           <c:otherwise>
						            	<h6><c:out value="${c.classTitle}"/></h6></a></div>
					        	   </c:otherwise> 
					          </c:choose>
							</div>
				          </c:if>
					</c:forEach>
				</div>
			</div>
		</section>

		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h1 class="display-1">클럽</h1>
						<p class="lead">지속형 모임으로 <br/> 계속해서 친하게 지내요</p>
						<div class="divider-border"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="40px"></div>
					</div>
				</div>
			</div>
			<div class="container-fluid custom-container">
				<div class="row">
					<c:forEach var="c" items="${ list }" end="8">
						<c:if test="${ c.clType eq 2 }">
							<div class="col-md-4">
								<div class="demo-preview"><a href="${ c.attachment.originName }"><img src="${ c.attachment.updateName }" alt="">
					       <c:choose>
					           <c:when test="${fn:length(c.classTitle) > 18}">
					            	<h6><c:out value="${fn:substring(c.classTitle, 0,17)}"/>...</h6>
					           </c:when>
					           <c:otherwise>
					           		<h6>${c.classTitle}</h6></a></div>
				        	   </c:otherwise> 
				          </c:choose>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
		
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h1 class="display-1">챌린지</h1>
						<p class="lead">같은 목표를 가진 <br/> 멤버들과 함께 도전해요</p>
						<div class="divider-border"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="40px"></div>
					</div>
				</div>
			</div>
			<div class="container-fluid custom-container">
				<div class="row">
					<c:forEach var="c" items="${ list }" end="8">
						<c:if test="${ c.clType eq 3 }">
							<div class="col-md-4">
								<div class="demo-preview"><a href="${ c.attachment.originName }"><img src="${ c.attachment.updateName }" alt="">
					       <c:choose>
					           <c:when test="${fn:length(c.classTitle) > 18}">
					            	<h6><c:out value="${fn:substring(c.classTitle, 0,17)}"/>...</h6>
					           </c:when>
					           <c:otherwise>
					           		<h6>${c.classTitle}</h6></a></div>
				        	   </c:otherwise> 
				          </c:choose>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
		
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h1 class="display-1">원데이 클래스</h1>
						<p class="lead">배우고 싶은 걸 <br/> 하루만에 배워보아요</p>
						<div class="divider-border"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="40px"></div>
					</div>
				</div>
			</div>
			<div class="container-fluid custom-container">
				<div class="row">
					<c:forEach var="c" items="${ list }" end="8">
						<c:if test="${ c.clType eq 4 }">
							<div class="col-md-4">
								<div class="demo-preview"><a href="${ c.attachment.originName }"><img src="${ c.attachment.updateName }" alt="">
					       <c:choose>
					           <c:when test="${fn:length(c.classTitle) > 18}">
					            	<h6><c:out value="${fn:substring(c.classTitle, 0,17)}"/>...</h6>
					           </c:when>
					           <c:otherwise>
					           		<h6>${c.classTitle}</h6></a></div>
				        	   </c:otherwise> 
				          </c:choose>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
		
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h1 class="display-1">라운지</h1>
						<p class="lead">비슷한 관심사를 가진 <br/> 멤버들의 취향 피드 구독하기</p>
						<div class="divider-border"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-mY="40px"></div>
					</div>
				</div>
			</div>
			<div class="container-fluid custom-container">
				<div class="row">
					<c:forEach var="c" items="${ list }" end="8">
						<c:if test="${ fe.feStatus eq 5 }">
							<div class="col-md-4">
								<div class="demo-preview"><a href="${ c.attachment.originName }"><img src="${ c.attachment.updateName }" alt="">
					       <c:choose>
					           <c:when test="${fn:length(c.classTitle) > 18}">
					            	<h6><c:out value="${fn:substring(c.classTitle, 0,17)}"/>...</h6>
					           </c:when>
					           <c:otherwise>
					           		<h6>${c.classTitle}</h6></a></div>
				        	   </c:otherwise> 
				          </c:choose>
							</div>
						</c:if>
					</c:forEach>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-2.html"><img src="assets/images/demo/2.jpg" alt="">
								<h6>02. Slider</h6></a></div>
					</div>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-3.html"><img src="assets/images/demo/3.jpg" alt="">
								<h6>03. Text Slider</h6></a></div>
					</div>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-4.html"><img src="assets/images/demo/4.jpg" alt="">
								<h6>04. Youtube</h6></a></div>
					</div>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-5.html"><img src="assets/images/demo/5.jpg" alt="">
								<h6>05. Vimeo</h6></a></div>
					</div>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-6.html"><img src="assets/images/demo/6.jpg" alt="">
								<h6>06. Local Video</h6></a></div>
					</div>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-12.html"><img src="assets/images/demo/12.jpg" alt="">
								<h6>07. Video & Sound</h6></a></div>
					</div>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-13.html"><img src="assets/images/demo/13.jpg" alt="">
								<h6>08. Small Hero</h6></a></div>
					</div>
					<div class="col-md-4">
						<div class="demo-preview"><a href="index-14.html"><img src="assets/images/demo/14.jpg" alt="">
								<h6>09. Without Hero</h6></a></div>
					</div>
				</div>
			</div>
		</section>

	<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	
		<br><br><br>
		
	<jsp:include page="common/footer.jsp"/>
</body>
</html>