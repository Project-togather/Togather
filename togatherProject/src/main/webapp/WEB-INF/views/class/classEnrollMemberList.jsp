<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Tavern - Responsive Restaurant Template(Bootstrap 4)</title>
	</head>
	<body>
	
		<jsp:include page="../common/menubar.jsp"/>

			<!-- Brunch Menu-->
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-md-8 m-auto">
							<div class="menu-simple">
								<div class="menu-simple-item">
									<div class="menu-simple-item-img"><img src="assets/images/widgets/1.jpg" alt=""></div>
									<div class="menu-simple-item-inner">
										<h6><span>Wild Mushroom Bucatini with Kale</span><span class="pull-right">$10</span></h6>
										<p>Cheese, Garlic, Potato, Pork</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Brunch Menu End-->
		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	</body>
</html>