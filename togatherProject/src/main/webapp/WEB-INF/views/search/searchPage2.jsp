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
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">필터</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					</div>


					<div class="modal-body">
						<h5>정렬</h5>
						<label>
							소셜링 <input type="radio" name="options" value="option1">
						</label>
						<br>
						<label>
							클럽 <input type="radio" name="options" value="option2">
						</label>
						<br>
						<label>
							피드 <input type="radio" name="options" value="option3">
						</label>
					</div>


					<div class="modal-footer">
						<button type="button" class="btn btn-apply" data-dismiss="modal">적용하기</button>
					</div>
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
					
						<c:forEach var="c" items="${ list }">
							<div class="col-md-4 post-item">
								<article class="post">
									<div class="post-preview"><a href="#"><img src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,q_auto,w_375/KakaoTalk_20220327_184200992_08_5db3013d2eaf663853f3a86bc7904ceaf407b8c40c77c10f97f6c440fbb5b546" alt=""></a></div>
									<div class="post-wrapper">
										<div class="post-header">
											<h4 class="post-title1"><a href="blog-single-1.html">${ c.classTitle }</a></h4>
										</div>
										<div class="post-content">
											<p>${c.classLocation }</p>
										</div>
										<div class="post-more"><a href="#">${ c.classDate }</a></div>
									</div>
								</article>
							</div>
						</c:forEach>
							
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
                		<li class="page-item"><a class="page-link" href="search.li?cpage=${ p }&keyword=${ keyword }">${ p }</a></li>
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