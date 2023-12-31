<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="../common/leftnav.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<jsp:include page="../common/topvar.jsp"></jsp:include>
				<div class="container-fluid ">
					<div>회원 상세 정보</div>
					<div class="container">
					<main id="main" class="main">

    <div class="pagetitle">
      <h1>프로필</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.ad">Home</a></li>
          <li class="breadcrumb-item">회원</li>
          <li class="breadcrumb-item active">프로필</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            
          </div>

        </div>

        <div class="col-xl-12">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-edit">회원정보변경</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호변경</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-edit pt-3" id="profile-edit">
                  <!-- Profile Edit Form -->
                  <form action="adupdate.mem" method="post">
                    <input type="hidden" name="memNo" value="${m.memNo}"/>
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">아이디</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="memId" type="text" class="form-control" id="fullName" value="${m.memId }" disabled>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="password" class="col-md-4 col-lg-3 col-form-label">비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input type="password" value="********" class="form-control" disabled>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="name" class="col-md-4 col-lg-3 col-form-label">이름</label>
                      <div class="col-md-8 col-lg-9">
                        <input type="text" name="memName" value="${m.memName }" class="form-control" disabled>
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="nickName" class="col-md-4 col-lg-3 col-form-label">닉네임</label>
                      <div class="col-md-8 col-lg-9">
                        <input type="text" name="nickName" value="${m.nickName }" class="form-control">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="birthday" class="col-md-4 col-lg-3 col-form-label">가입일</label>
                      <div class="col-md-8 col-lg-9">
                        <input type="date" name="enrollDate" value="${m.enrollDate }" class="form-control" placeholder="생년월일 8자리 [ex)230824]" disabled>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">전화번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="phone" value="${m.phone }" type="text" class="form-control" id="Phone" placeholder="휴대폰 번호 [010-1234-5678]" onKeyup = "addHypen(this);">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="email" class="form-control" id="Email" value="${m.email }">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="gender" class="col-md-4 col-lg-3 col-form-label">회원 상태</label>
                      <div class="col-md-8 col-lg-9">
                        <select name="memStatus" class="form-control">
                        <c:choose>
                        	 <c:when test = "${m.memStatus eq 'Y'}"> 
                        	 	<option value="Y">${m.memStatus }</option>
                          		<option value="N">N</option>
                        	 </c:when>
                        	 <c:otherwise>
                        	 	<option value="N">${m.memStatus }</option>
                          		<option value="Y">Y</option>
                        	 </c:otherwise>
                        </c:choose>
                      </select>
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">회원정보변경</button> &nbsp;
                      <button  type="reset"class="btn btn-danger">추방시키기</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- 비밀번호변경 Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새로운 Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새로운 Password를 입력해주세요.</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div>
              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

 <!-- ======= Footer ======= -->
  
 
  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/admin.js"></script>
  

</body>
</html>