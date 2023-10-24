<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Custom fonts for this template-->
<link href="assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="assets/css/sb-admin-2.min.css" rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- 사이드 바 시작 -->
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="admin.pa">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">Togather Admin</div>
		</a>

		<!-- hr 줄바꿈 -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item "><a class="nav-link" href="admin.pa"> <i
				class="fas fa-fw fa-tachometer-alt"></i> <span>대시보드</span></a></li>


		<!-- hr 줄바꿈 -->
		<hr class="sidebar-divider my-0">



		<!-- 회원 관리 대시보드 시작 -->
		<li class="nav-item"><a class="nav-link collapsed"
			href="list.mem" data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <i
				class="fas fa-fw fa-cog"></i> <span>회원 관리</span>
		</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">회원관리</h6>
					<a class="collapse-item" href="list.mem">회원 통합 관리</a> <a
						class="collapse-item" href="blacklist.bo">블랙리스트 관리</a>
				</div>
			</div></li>
		<!-- 회원 관리 대시보드 끝 -->

		<!-- hr 줄바꿈 -->
		<hr class="sidebar-divider my-0">

		<!-- 모임 관리 대시보드 시작 -->
		<li class="nav-item "><a class="nav-link collapsed" href="challenge.cl"
			data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"> <i
				class="fas fa-fw fa-wrench"></i> <span>모임 관리</span>
		</a>
			<div id="collapseUtilities" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">모임관리</h6>
					<a class="collapse-item" href="challenge.cl">챌린지</a> 
					<a class="collapse-item" href="utilities-border.html">모임1(소셜링)</a> 
					<a class="collapse-item" href="utilities-animation.html">모임1(클럽)</a>
				</div>
			</div></li>

		<!-- hr 줄바꿈 -->
		<hr class="sidebar-divider my-0">

		<!-- Heading 
            <div class="sidebar-heading">
                Addons
            </div>
            -->

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed"
			href="notice.list" data-toggle="collapse"
			data-target="#collapsePages" aria-expanded="true"
			aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i>
				<span>고객센터 글 관리</span>
		</a>
			<div id="collapsePages" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">고객센터</h6>
					<a class="collapse-item" href="notice.list">공지사항 </a> <a
						class="collapse-item" href="register.html">FAQ </a>
					<!--   <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>-->
				</div>
			</div></li>

		<!-- hr 줄바꿈 -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Charts -->
		<li class="nav-item"><a class="nav-link" href="charts.html">
				<i class="fas fa-fw fa-chart-area"></i> <span>결제관리</span>
		</a></li>

		<!-- hr 줄바꿈 -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link" href="tables.html">
				<i class="fas fa-fw fa-table"></i> <span>준비중</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>

	<!-- 사이드바 끝 -->

	<script>
		$(function() {
			$(".collapse-item").click(function() {
				$(this).closest("li.nav-item").addClass("active");
			});
		});
	</script>


	<!-- Bootstrap core JavaScript-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="assets/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="assets/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="assets/js/demo/chart-area-demo.js"></script>
	<script src="assets/js/demo/chart-pie-demo.js"></script>

</body>
</html>