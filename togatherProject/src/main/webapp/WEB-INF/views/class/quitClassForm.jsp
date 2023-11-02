<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<section class="module">
		<div class="container">
			<div class="row" style="margin-top:70px;">
				<div class="col-md-6 m-auto">
					<div class="menu-classic-item">
					<h1 class="display-3">취소할 ${ c.clCaName }</h1>
						<div class="menu-classic-item-img"><a class="photo" href="assets/images/menu/1.jpg"></a><img src="assets/images/menu/1.jpg" alt="">
						</div>
						<div class="menu-classic-item-inner">
							<h6>${c.classTitle }</h6>
							<p>${c.classDate } - ${c.classTime }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		<form action="quitClass.cl" method="post">
			<input type="hidden" name=classNo value="${ c.classNo }">
			<input type="hidden" name=memNo value="${ loginMember.memNo }">
			<section class="module bg-gray" id="special">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
								<h1 class="display-3">취소 사유</h1>
									<select name="quitReason" required>
										<option selected>사유를 선택해 주세요
										<option value="personal">개인 사유
										<option value="time">시간 부족
										<option value="mitake">신청 실수
										<option value="etc">기타
									</select>
									<br><br>
								<h1 class="display-3">상세 사유</h1>
								<div class="col-md-12">
									<div class="form-group">
										<textarea class="form-control" name="detailReason" placeholder="취소하는 상세한 사유를 입력해 주세요.(선택)" rows="12" style="resize:none;"></textarea>
								</div>
							</div>
							<c:if test="${ price ne 0 }">
								<p style="color:red">환불 금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ price }원</p>
							</c:if>
							<c:if test="${ price eq 0 }">
								<p style="color:red">환불 금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0원</p>
							</c:if>
					</div>
				</div>
			</div>
		</section>
		<section class="module" id="news">
			<div class="container">
				<div class="row map">
					<div class="col-md-8 m-auto text-center">
						<h1 class="display-3">꼭 확인해주세요</h1>
						<p class="display-5">
							- 결제 승인 취소는 영업일 기준 3~5일이 소요될 수 있어요 <br/>
							- 참여하고 있던 채팅방에서 나가게되며 다시 입장할 수 없어요. <br/>
							- 한번 탈퇴한 모임에 대해서 재가입이 불가능하니 신중하게 생각해주세요.
						</p>
						<p class="icon_check_alt2 quit_admit"> 규정을 확인하였으며 이에 동의합니다</p>
						<br/><br/>
						<button class="btn btn-outline btn-sm btn-black quit_btn" disabled>탈퇴하기</button>
						
						<script>
						  const admit = $(".quit_admit");
						
						  admit.on("click", function() {
							  
						    if (admit.css("color") === "rgb(0, 0, 0)") {
						      admit.css("color", "red");
						      $(".quit_btn").attr("disabled", false);
						    } else {
						      admit.css("color", "black");
						      $(".quit_btn").attr("disabled", true);
						    }
						  });
						</script>
					</div>
				</div>
			</div>
		</section>
	</form>
</body>
</html>