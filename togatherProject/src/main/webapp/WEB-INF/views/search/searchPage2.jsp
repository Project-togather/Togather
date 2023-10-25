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

.searchBox {
  height: 60px;
  width: 600px;
  background-color: #f5f5f5;
  border-radius: 40px;
  display: flex;
  align-items: center;
}

.searchTxt {
  flex: 1;
  padding: 0;
  border: none;
  background: none;
  outline: none;
  font-size: 1rem;
  line-height: 60px;
  margin-left: 10px; /* 오른쪽 마진 추가 */
}

.searchBtn {
  
  margin-right: 20px;
}

.post-title {
  font-size: 1px;
}

/* 모달 */
#modalOpenButton, #modalCloseButton {
  cursor: pointer;
  
  border: 1px solid lightgray;
  border-radius: 10%;
  background-color: white;
  color: black;
  font-weight: 200;

  margin-left: 21%;
}

#modalContainer {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
  z-index: 999; /* Set a high z-index value to bring the modal to the front */
}


#modalContent {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 500px;
  padding: 15px;
}

#modalContainer.hidden {
  display: none;
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
		                <i class="fa fa-search fa-3x" aria-hidden="true" style="color: orange;"></i>
		            </button>
		        </div>
		    </form>
		</div>
		
		<br><br>
		
		<button id="modalOpenButton">필터</button>

		<div id="modalContainer" class="hidden">
		  <div id="modalContent">
		  	<div class="radioBtn" name="condition">
			   소셜링<input type="radio" name="chk_info" value="socialing"><br>
				클럽<input type="radio" name="chk_info" value="club"><br>
				피드<input type="radio" name="chk_info" value="feed"><br>
			</div>
		    <button id="modalCloseButton">닫기</button>
		  </div>
		</div>
		
		
		
		<section class="module" id="module1">
			<div class="container">
				<div class="search-class">
					<div class="row">
					
						<c:forEach var="c" items="${ list }">
							<div class="col-md-4 post-item">
								<article class="post">
									<div class="post-preview"><a href="#"><img src="assets/images/menu/1.jpg" alt=""></a></div>
									<div class="post-wrapper">
										<div class="post-header">
											<h2 class="post-title display-1"><a href="blog-single-1.html">${ c.classTitle }</a></h2>
										</div>
										<div class="post-content">
											<p>See how your users experience your website in realtime or view trends to see any changes in performance over time...</p>
										</div>
										<div class="post-more"><a href="#">read more...</a></div>
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
                		<li class="page-item"><a class="page-link" href="list.se?cpage=${ p }">${ p }</a></li>
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
		</section>
		
		
		<script>
		
			const modalOpenButton = document.getElementById('modalOpenButton');
			const modalCloseButton = document.getElementById('modalCloseButton');
			const modal = document.getElementById('modalContainer');
	
			modalOpenButton.addEventListener('click', () => {
				  modal.classList.remove('hidden');
				  document.body.style.overflow = 'hidden'; // Disable scrolling
			});

				modalCloseButton.addEventListener('click', () => {
				  modal.classList.add('hidden');
				  document.body.style.overflow = 'auto'; // Enable scrolling
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