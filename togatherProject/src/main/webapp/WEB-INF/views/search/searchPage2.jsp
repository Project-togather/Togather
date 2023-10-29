<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>

/* 서치바 영역 */

.searchBar {
  position: relative;
  height: 130px;
  border-bottom: 1px solid rgb(230, 230, 230);
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: white;
}

#searchBar.focused {
    background-color: white;
    border: 1px solid orange;
}

.searchBox {
  height: 50px;
  width: 600px;
  background-color: #f5f5f5;
  border-radius: 40px;
  display: flex;
  align-items: center;
  transition: all 0.3s; /* Add a transition for smooth effect */
}

.searchBox:focus-within {
  background-color: white;
  border: 1px solid orange;
}

.searchTxt {
  flex: 1;
  padding: 0;
  border: none;
  background: none;
  outline: none;
  font-size: 1rem;
  line-height: 40px;
  margin-left: 20px; /* Add right margin */
}

.searchBtn {
	background-color: transparent;
    color: orange; /* Set the color to orange without any other effects */
    transition: none; /* Remove any transitions */

  	margin-right: 20px;
}

.searchBtn:focus {
    outline: none;
}

.searchBox:focus-within .fa-search {
  color: orange;
}

.post-title {
  font-size: 1px;
}

/* 모달 버튼 스타일 */
.modal-btn {
	margin-top: 3%;
	margin-left: 21%;
}

.btn.btn-primary {

    border-radius: 10px; /* 버튼을 둥글게 만들기 */
    background-color: #ffffff; /* 배경색을 하얀색으로 설정 */
    border: 1px solid lightgray; /* 테두리 선을 라이트 그레이로 설정 */
    color: #333; /* 텍스트 색상 설정 */

	padding: 10px 20px; /* 수정된 부분: 버튼 내부의 내용과 패딩을 조절하여 버튼 크기를 변경합니다. */
    font-size: 14px; /* 수정된 부분: 원하는 글꼴 크기로 조절합니다. */
}

/* 버튼 호버 시 스타일 */
.btn.btn-primary:hover {
    background-color: #ffffff; /* 마우스 호버 시 배경색 변경 */
    border: 1px solid #fcb251; /* 마우스 호버 시 테두리 선 변경 */
	color: #333;
}

/* 모달 닫기 버튼 스타일 */
.modal-footer .btn.btn-apply {
    display: block;
    margin: 0 auto; /* 가운데 정렬 */
    width: 200px; /* 가로 크기 조정 */
	height: 50px;
    border-radius: 5px; /* 둥글게 만들기 */
    background-color: #fcb251; /* 밝은 파란색 배경색 */
    color: #ffffff; /* 흰색 텍스트 색상 */
}

/* 닫기 버튼 호버 시 스타일 */
.modal-footer .btn.btn-apply:hover {
    background-color: #ffd19d; /* 호버 시 배경색 변경 */
}

/* 인스타 아이콘 */
.instagram-container{
	padding-left: 2%;
}

.fa-instagram{
	
}

/* 모달 위치 조정 */

/* 모달 안으로 줄이기 */
.modal-header h4 {
	padding-left: 10%; /* 왼쪽 패딩 설정 */
    padding-right: 10%; /* 오른쪽 패딩 설정 */
	padding-top: 5%;
}

.modal-body div, h5, label {

    padding-left: 10%; /* 왼쪽 패딩 설정 */
    padding-right: 10%; /* 오른쪽 패딩 설정 */
}

/* 모달 밑줄 */
.modal-body::after {
    content: "";
    display: block;
    border-bottom: 1px solid rgba(204, 204, 204, 0.5); /* 투명한 밑줄 스타일 설정 */
    margin-left: 10%; /* 왼쪽 패딩 설정 */
    margin-right: 10%; /* 오른쪽 패딩 설정 */
}

.postPreview img {

	width: 300px;
  	height: 300px;
  	object-fit: cover;
}

/* 조절 바 */
#ageLimitDiv {
  margin: 0;
  padding-bottom: 10%;
  padding-right: 60%;
  height: 0vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #ffffff;
}

.middle {
  position: relative;
  max-width: 300px;
  width: 100%;
}

.slider {
  position: relative;
  z-index: 1;
  height: 10px; /* 높이를 조절 */
  margin: 0 15px;
}

.slider > .track {
  position: absolute;
  z-index: 1;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  background-color: #e2e2e2;
}

.slider > .range {
  position: absolute;
  z-index: 2;
  left: 15%;
  right: 15%;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  background-color: #616161;
}

.slider > .thumbl, .slider > .thumbr {
  position: absolute;
  top: -5px;
  z-index: 3;
  width: 20px; /* 너비를 조절 */
  height: 20px; /* 높이를 조절 */
  background-color: #000000;
  border-radius: 50%;
}

.slider > .thumbl {
  left: 15%;
}
.slider > .thumbr {
  right: 15%;
}

input[type="range"] {
  position: absolute;
  /* opacity로 가린 것을 이벤트도 비활성화하기 위해 */
  pointer-events: none;
  -webkit-appearance: none;
  z-index: 3;
  height: 10px;
  width: 100%;
  top: -7px;
  opacity: 0;
}

input[type="range"]::-webkit-slider-thumb {
  /* 겹쳐진 두 thumb를 모두 활성화 */
  pointer-events: all;
  width: 30px;
  height: 30px;
  border-radius: 0;
  border: 0 none;
  background-color: red;
  cursor: pointer;
  /* appearance를 해야 위의 스타일들을 볼 수 있음 */
  -webkit-appearance: none;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

	<br><br><br><br><br>
	
	
	<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
	<!-- Preloader end-->
	
	<div class="search-wrapper">
	
		
		<!-- 서치바 -->
        <div class="searchBar" style="background-color: white;">
		    <form action="search.li" method="get">
		        <input type="hidden" name="cpage" value="1">
		        <div class="searchBox">
		            <input type="text" class="searchTxt" name="keyword" value="${ keyword }" placeholder="지금 생각나는 취미를 검색하세요.">
		            <button class="searchBtn" type="submit" style="border:none;">
		                <i class="fa fa-search fa-2x" aria-hidden="true" style="color: orange;"></i>
		            </button>
		        </div>
		    </form>

			<div class="instagram-container" id="instagramLink">
				<i class="fa fa-brands fa-instagram fa-2x"></i>
				<!-- <div class="feedText">feed</div> -->
			</div>

		</div>
		
		
		
		<!-- 모달 -->
		<!-- modal 구동 버튼 (trigger) -->
		<div class="modal-btn">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
				필터
			</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="max-width: 500px; max-height: 900px;">
				<div class="modal-content">
					<form action="search.li" method="get">
						<input type="hidden" name="cpage" value="1">
						<input type="hidden" name="keyword" value="${ keyword }">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">필터</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						</div>

						<div id="modal-body" style="max-height: 700px; overflow-y: auto;">
							
							
							<div class="modal-body">
							    <h5>유형</h5>
							    <label>
							        소셜링 <input type="radio" name="options" value="1" <c:if test="${options == '1'}">checked</c:if>>
							    </label>
							    <br>
							    <label>
							        클럽 <input type="radio" name="options" value="2" <c:if test="${options == '2'}">checked</c:if>>
							    </label>
							    <br>
							    <label>
							        챌린지  <input type="radio" name="options" value="3" <c:if test="${options == '3'}">checked</c:if>>
							    </label>
							</div>


							<div class="modal-body">
							    <h5>정렬</h5>
							    <label>
							        인기순 <input type="radio" name="sorting" value="4">
							    </label>
							    <br>
							    <label>
							        온 / 오프 라인 <input type="radio" name="sorting" value="5">
							    </label>
							    <br>
							    <label>
							        페쇄 여부 <input type="radio" name="sorting" value="6">
							    </label>
							</div>
							
							<div class="modal-body">
								<h5>카테고리</h5>
								<label>
									문화, 예술 <input type="radio" name="category" value="7">
								</label>
								<br>
								<label>
									액티비티 <input type="radio" name="category" value="8">
								</label>
								<br>
								<label>
									푸드 드링크 <input type="radio" name="category" value="9">
								</label>
								<br>
								<label>
									취미 <input type="radio" name="category" value="10">
								</label>
								<br>
								<label>
									파티 소개팅 <input type="radio" name="category" value="11">
								</label>
								<br>
								<label>
									동네 친목 <input type="radio" name="category" value="12">
								</label>
								<br>
								<label>
									재테크 <input type="radio" name="category" value="13">
								</label>
								<br>
								<label>
									외국어 <input type="radio" name="category" value="14">
								</label>
							</div>

						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-apply">적용하기</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>

		<div class="modal-btn2"></div>

		<br><br>
		
		<!-- 알림 메시지 표시 -->
		<c:if test="${not empty errorMessage}">
		    <div class="alert" style="text-align: center;">
		        ${errorMessage}
		    </div>
		</c:if>

		
		
		
			<div class="container">
			    <div class="search-class">
			        <div class="row">
			            <c:forEach var="c" items="${flist}" varStatus="loop">
			                <div class="col-md-4 post-item">
			                    <article class="post">
			                        <div class="postPreview">
			                            <a href="detail.cl?classNo=${c.classNo}&clType=${c.clType}">
			                                <img src="${alist[loop.index].updateName}" alt="">
			                            </a>
			                        </div>
			                        <br>
			                        <div class="post-wrapper">
			                            <div class="post-header">
			                                <h4 class="post-title1"><a href="blog-single-1.html">${c.classTitle}</a></h4>
			                            </div>
			                            <div class="post-content">
			                                <p>${c.classLocation}</p>
			                            </div>
			                            <div class="post-more"><a href="#">${c.classDate}</a></div>
			                        </div>
			                    </article>
			                </div>
			            </c:forEach>
			        </div>
			    </div>
			</div>


					

				<div id="pagingArea">
            		<ul class="pagination">
            	
            		<c:choose>
	            		<c:when test="${ pi.currentPage eq 1 }">
	                		<li class="page-item disabled"><a class="page-link" href="">&lt;</a></li>
	                	</c:when>
	                	<c:otherwise>
	                		<li class="page-item"><a class="page-link" href="list.se?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
	                	</c:otherwise>
                	</c:choose>
                	
                	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                		<li class="page-item"><a class="page-link" href="search.li?cpage=${ p }&keyword=${ keyword }&options=${ options }">${ p }</a></li>
                 	</c:forEach>
                 	
                 	<c:choose>
                 		<c:when test="${ pi.currentPage eq pi.maxPage }">
                 			<li class="page-item disabled"><a class="page-link" href="">&gt;</a></li>
                 		</c:when>
                 		<c:otherwise>
                 			<li class="page-item"><a class="page-link" href="list.se?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
                 		</c:otherwise>
                 	</c:choose>
                 	
                 	
		            </ul>
		        </div>

			</div>
		
		
		
		<script>
			<!-- list.al 이동 -->
			document.addEventListener("DOMContentLoaded", function() {
				// 인스타그램 아이콘을 클릭할 때 실행되는 함수
				function handleInstagramIconClick() {
					// 여기에 페이지 이동 로직을 추가합니다.
					// window.location.href를 사용하여 페이지를 이동합니다.
					window.location.href = "list.al"; // 이동할 페이지 URL로 변경하세요.
				}

				// 인스타그램 아이콘을 클릭 이벤트에 연결
				var instagramLink = document.getElementById("instagramLink");
				if (instagramLink) {
					instagramLink.addEventListener("click", handleInstagramIconClick);
				}
			});

			
			
			<!-- 조절 바 -->

		</script>



		
		</div>
	
	
	<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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