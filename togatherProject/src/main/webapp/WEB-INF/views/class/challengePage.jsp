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
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>

		<br><br><br><br><br>
		
		<div class="col-md-6 m-auto text-center">
				<h1 class="display-1">챌린지</h1>
				<p class="lead">같은 목표를 가진 <br/> 멤버들과 함께 도전해요</p>
			<div class="divider-border"></div>
		</div>
		
	
		<!-- Menu-->
		<section class="module">
			<div class="container">
				<div class="row">
					<c:forEach var="c" items="${ list }">
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="${ c.attachment.originName }"></a><img src="${ c.attachment.updateName }">
								<div class="menu-classic-item-price">6/${ c.peopleLimit }
								</div>
							</div>
							<div class="menu-classic-item-inner">
					       <c:choose>
					           <c:when test="${fn:length(c.classTitle) > 18}">
					            	<h6><c:out value="${fn:substring(c.classTitle, 0,17)}"/>...</h6>
					           </c:when>
					           <c:otherwise>
					            	<c:out value="${c.classTitle}"/>
				        	   </c:otherwise> 
				          </c:choose>
     					  <c:choose>
					           <c:when test="${fn:length(c.classContent) > 63}">
					            	<p><c:out value="${fn:substring(c.classContent, 0,62)}"/>...</p>
					           </c:when>
					           <c:otherwise>
					            	<c:out value="${c.classContent}"/>
				        	   </c:otherwise> 
				          </c:choose>
							</div>
						</div>
					</div>
					</c:forEach>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/1.jpg"></a><img src="assets/images/menu/1.jpg" alt="">
								<div class="menu-classic-item-price">$15
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Masala-Spiced Chickpeas</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/2.jpg"></a><img src="assets/images/menu/2.jpg" alt="">
								<div class="menu-classic-item-price">$18
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Kung Pao Chicken</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/3.jpg"></a><img src="assets/images/menu/3.jpg" alt="">
								<div class="menu-classic-item-price">$13
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Sweet &amp; Spicy Pork</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/4.jpg"></a><img src="assets/images/menu/4.jpg" alt="">
								<div class="menu-classic-item-price">$12
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Chicken Stew</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/5.jpg"></a><img src="assets/images/menu/5.jpg" alt="">
								<div class="menu-classic-item-price">$21
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Jalapeno-Mango Salsa</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/6.jpg"></a><img src="assets/images/menu/6.jpg" alt="">
								<div class="menu-classic-item-price">$17
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Spicy Fried Rice &amp; Bacon</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/1.jpg"></a><img src="assets/images/menu/1.jpg" alt="">
								<div class="menu-classic-item-price">$15
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Masala-Spiced Chickpeas</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/2.jpg"></a><img src="assets/images/menu/2.jpg" alt="">
								<div class="menu-classic-item-price">$18
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Kung Pao Chicken</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/3.jpg"></a><img src="assets/images/menu/3.jpg" alt="">
								<div class="menu-classic-item-price">$13
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Sweet &amp; Spicy Pork</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/4.jpg"></a><img src="assets/images/menu/4.jpg" alt="">
								<div class="menu-classic-item-price">$12
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Chicken Stew</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/5.jpg"></a><img src="assets/images/menu/5.jpg" alt="">
								<div class="menu-classic-item-price">$21
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Jalapeno-Mango Salsa</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu-classic-item">
							<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/6.jpg"></a><img src="assets/images/menu/6.jpg" alt="">
								<div class="menu-classic-item-price">$17
								</div>
							</div>
							<div class="menu-classic-item-inner">
								<h6>Spicy Fried Rice &amp; Bacon</h6>
								<p>Vanilla, Various Fruit, Cookies</p>
							</div>
						</div>
					</div>
				</div>
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
		
		<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="assets/js/plugins.min.js"></script>
		<script src="assets/js/custom.min.js"></script>
</body>
</html>