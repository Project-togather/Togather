<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Favicons-->
<link rel="shortcut icon" href="assets/images/favicon.png">
<link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="assets/images/apple-touch-icon-114x114.png">
<!-- Web Fonts-->
<link href="https://fonts.googleapis.com/css?family=PT+Serif%7cSignika:300,400,600,700" rel="stylesheet">
<!-- Bootstrap core CSS-->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Plugins and Icon Fonts-->
<link href="assets/css/plugins.min.css" rel="stylesheet">
<!-- Template core CSS-->
<link href="assets/css/template.css" rel="stylesheet">

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

<!-- Include Bootstrap JS and jQuery (optional) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<!-- 요기에 구글 머티리얼 아이콘 -->
<link
    href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
    rel="stylesheet">






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
.btn.btn-primary {
    border-radius: 10px; /* 버튼을 둥글게 만들기 */
    background-color: #ffffff; /* 배경색을 하얀색으로 설정 */
    border: 2px solid lightgray; /* 테두리 선을 라이트 그레이로 설정 */
    color: #333; /* 텍스트 색상 설정 */
}

/* 버튼 호버 시 스타일 */
.btn.btn-primary:hover {
    background-color: #ffffff; /* 마우스 호버 시 배경색 변경 */
    border: 2px solid #fcb251; /* 마우스 호버 시 테두리 선 변경 */
	color: #333;
}

/* 모달 닫기 버튼 스타일 */
.modal-footer .btn.btn-apply {
    display: block;
    margin: 0 auto; /* 가운데 정렬 */
    width: 150px; /* 가로 크기 조정 */
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

.post-title {
  font-size: 1px;
}





/* ? */
.open-offcanvas {
}

.ti-user fa-2x {
}



/* 네비게이션 바 영역 */
#searchNav {
    position: relative;
    display: flex;
    justify-content: center; /* 수평 가운데 정렬을 위해 사용 */
    width: 80%; /* 네비게이션 바의 너비를 80%로 설정 */
    margin: 0 auto; /* 네비게이션 바를 수평 가운데로 배치하기 위해 좌우 마진을 자동으로 설정 */
    font-size: 15px;
}
#searchNav a {
    display: block;
    width: 25%; /* 각 링크의 너비를 조정합니다 (필요에 따라 조절할 수 있음). */
    padding: .75em 0;
    color: #333;
    text-decoration: none;
    text-align: center;
    cursor: pointer;
}

.nav-underline {
    position: absolute;
  }

/* 추가: 클릭한 페이지의 링크 스타일 */
#searchNav a.is-current {
    color: black;
}

/* 페이징 디자인 */
.wrapper {
    position: relative;
}

#pagingArea {
    position: absolute;
    left: 42%;
}


/* 피드 디자인 */

.feed {
	display: flex;
	flex-wrap: wrap;
	justify-content: center; /* 가로 중앙 정렬 */
  	align-items: center; /* 세로 중앙 정렬 */
	gap: 0; /* No gap between feed items */
}

.row {

	display: flex;
	flex: 1; /* Equal distribution of available space */
}

.feed-item {

	width: 480px; /* 변경: 너비를 480px로 설정 */
	background-color: white;
	height: 480px;
	margin: 0; /* Remove margin */
	display: flex; /* 내부 요소 중앙 정렬을 위해 내부 요소에도 flex를 적용 */
	justify-content: center; /* 내부 요소 가로 중앙 정렬 */
	align-items: center; /* 내부 요소 세로 중앙 정렬 */

	border-top: 1px solid lightgray;
}

.feed-box {

	padding: 10%;

}

@media (max-width: 768px) { /* 미디어 쿼리 화면 폭 조건을 설정 */
	.feed-item {
		width: 100%; /* 화면 폭이 768px 이하일 때 feed-item 하나씩 표시 */
	}
}




.feed_img{
	width: 400px;
  	height: 250px;
  	object-fit: cover;
}

.feed_content{
    padding: 10px;
}


.feed_like{
    padding: 0px 10px;
}

.feed_reply{
    padding: 0px 10px;
    display: flex;
    flex-direction: column;
}


.feed_txt{
    font-size: 14px;
}

.feed_icon{
    padding: 5px 5px 0px 5px;
    display: flex;
    justify-content: space-between;
}span{
     padding-right: 5px;
 }


/* 프로필, 리스트 아이콘 관련 스타일 */
.feed_name{
    padding: 10px;
    display: flex;
    align-items: center;
}

.feed_name_txt{
    font-size: 14px;
    padding: 0px 10px;
    font-weight: bold;
}

.profile_box {
    width: 40px;
    height: 40px;
    border-radius: 70%;
    overflow: hidden;
}
.profile_img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.gallery-item  {
	box-sizing: border-box;
	border: 1px solid black;
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

        
        
        
        
        
        <!-- 네비바 -->
        <nav id="searchNav">
			<a href="#" id="feedClick">
				<i class="fas fa-light fa-comment" style="color: rgba(114, 114, 114, 0.918);"></i>&nbsp;Feed
			</a>
			<a href="#" id="memberClick">
				<i class="fas fa-solid fa-user" style="color: rgba(136, 230, 112, 0.918);"></i>&nbsp;Member
			</a>
			<div class="nav-underline"></div>
		</nav>
		
		
		
		
		
		<!-- 피드 ajax 영역 -->
		<section class="module">
			<div class="container">
				<div id="feedContainer" class="feed">

					<!-- 
					<div class="feed-item" style="border: 1px solid lightgray;">
						<div class="feed-box">

							<div class="feed_name">
								<div class="profile_box">
								  <img class="profile_img" src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90">
								</div>
								<span class="feed_name_txt"> jin.99 </span>
							</div>

							<img class="feed_img " src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,q_auto,w_375/%EC%95%8C%EB%A0%88%EC%98%AC%EB%A0%88_e1e634ae5a2fb6377b1dd828a0fb8c2ce5f12723fc34df3da578ea3e8e35eb62">
							<div class="feed_icon">
								<div>
								  <span class="material-icons-outlined">
									favorite_border
								  </span>
								  <span class="material-icons-outlined">
									mode_comment
								  </span>
								</div>
								<div>
								  <span class="material-icons-outlined">
									turned_in_not
								  </span>
								</div>
							  </div>
							  <div class="feed_like">
								<p class="feed_txt"> <b>좋아요 10개</b></p>
							  </div>
							<div class="feed_content">
							  <p class="feed_txt">제목</p>
							</div>
						</div>
					</div>
					 -->

					<!--
					 <div class="row">
						<div class="col-md-12">
							<div class="gallery">
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/1.jpg"></div><a href="assets/images/portfolio/1.jpg" title="Title 1"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/5.jpg"></div><a href="assets/images/portfolio/5.jpg" title="Title 2"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/3.jpg"></div><a href="assets/images/portfolio/3.jpg" title="Title 3"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/4.jpg"></div><a href="assets/images/portfolio/4.jpg" title="Title 4"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/2.jpg"></div><a href="assets/images/portfolio/2.jpg" title="Title 5"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/6.jpg"></div><a href="assets/images/portfolio/6.jpg" title="Title 6"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/7.jpg"></div><a href="assets/images/portfolio/7.jpg" title="Title 7"></a>
								</div>
								<div class="gallery-item">
									<div class="gallery-image" data-background="assets/images/portfolio/8.jpg"></div><a href="assets/images/portfolio/8.jpg" title="Title 8"></a>
								</div>
							</div>
						</div>
					</div>
					-->

				</div>
			</div>
		</section>

		<div id="feedMore" class="feedMore">
			
		</div>
		


		<script>
			<!-- 먼저 보이는 feed -->
			$(function() {
					
					$.ajax({
						url:"getList.fe",
						success:function(object) {
							
							
							
							
							
							let value = "";
							
							for(let i in object.alist) {
								
								let item = object.list[i];
								let item2 = object.alist[i];
								let item3 = object.mlist[i];

								console.log(item3.filePath);

								$(".feed_img").attr("src", item2.filePath);
								$(".profile_img").attr("src", item3.filePath);

								value += "<div class='feed-item'>" 
											+ "<div class='feed-box'>" 
											
												+ "<div class='feed_name'>" 
													+ "<div class='profile_box'>" 
														+ "<img class='profile_img' src='" + item3.img + "'>"
													+ "</div>"
													+ "<span class='feed_name_txt'>" + item3.nickName + "</span>"
													
												+ "</div>" 
												
												+ "<img class='feed_img' src='" + item2.filePath + "'>"
												
												+ "<div class='feed_icon'>" 
													+ "<div>"
														+ "<span class='material-icons-outlined'>" + "favorite_border" + "</span>"
														+ "<span class='material-icons-outlined'>" + "mode_comment" + "</span>"
													+ "</div>"
													
													+ "<div>"
														+ "<span class='material-icons-outlined'>" + "turned_in_not" + "</span>"
													+ "</div>"
													
												+ "</div>"
												
												+ "<div class='feed_like'>" 
													+ "<p class='feed_txt'>" + "<b>" + "좋아요 10개" + "</b>" + "</p>"
												+ "</div>"
												
												+ "<div class='feed_content'>" 
													+ "<p class='feed_txt'>" + item.feContent + "</p>"
												+ "</div>"
												
									+ "</div>"
								+ "</div>"
								
							}

							$(".feed").html(value);
							
							
						}, error:function() {
							console.log("ajax 통신 실패");
						}
					
				})
			});

		 
			<!-- 피드 ajax 스크립트 영역 -->
			$(function() {
				$("#feedClick").click(function() {
					
					$.ajax({
						url:"getList.fe",
						success:function(object) {
							
							
							console.log(object.list);
							
							let value = "";
							
							for(let i in object.list) {
								
								let item = object.list[i];
								let item2 = object.alist[i];
								let item3 = object.mlist[i];

								console.log(item3.filePath);

								$(".feed_img").attr("src", item2.filePath);
								$(".profile_img").attr("src", item3.filePath);
								
								value += "<div class='feed-item'>" 
											+ "<div class='feed-box'>" 
											
												+ "<div class='feed_name'>" 
													+ "<div class='profile_box'>" 
														+ "<img class='profile_img' src='" + item3.img + "'>"
													+ "</div>"
													+ "<span class='feed_name_txt'>" + item3.nickName + "</span>"
													
												+ "</div>" 
												
												+ "<img class='feed_img' src='" + item2.filePath + "'>"
												
												+ "<div class='feed_icon'>" 
													+ "<div>"
														+ "<span class='material-icons-outlined'>" + "favorite_border" + "</span>"
														+ "<span class='material-icons-outlined'>" + "mode_comment" + "</span>"
													+ "</div>"
													
													+ "<div>"
														+ "<span class='material-icons-outlined'>" + "turned_in_not" + "</span>"
													+ "</div>"
													
												+ "</div>"
												
												+ "<div class='feed_like'>" 
													+ "<p class='feed_txt'>" + "<b>" + "좋아요 10개" + "</b>" + "</p>"
												+ "</div>"
												
												+ "<div class='feed_content'>" 
													+ "<p class='feed_txt'>" + item.feContent + "</p>"
												+ "</div>"
												
									+ "</div>"
								+ "</div>"
								
							}

							$(".feed").html(value);
							
							
						}, error:function() {
							console.log("ajax 통신 실패");
						}
					})
					
				})
			})

			
			<!-- 멤버 ajax 스크립트 영역 -->
			$(function() {
				$("#memberClick").click(function() {
					
					$.ajax({
						url:"getList.me",
						success:function(list) {
							
							
							console.log(list);
							
							let value = "";
							
							for(let i in list) {
								
								let item = list[i];
								
								value += "<div class='row'>" + "<div class='col-md-12'>" + "<div class='gallery'>" + "<div class='gallery-item'>" + "<div class='gallery-image' data-background='assets/images/portfolio/1.jpg'>" + "</div>" + "<a href='assets/images/portfolio/1.jpg' title='Title 1'>" + "</a>" + "</div>" + "</div>" + "</div>" + "</div>"
								
							}

							$(".feed").html(value);
							
							
						}, error:function() {
							console.log("ajax 통신 실패");
						}
					})
					
				})
			})
		 	
			
			
			/* 네비바 조정 */

            $('nav a').click(function(e) {
				e.preventDefault();

				// Remove the 'is-current' class from all navigation links
				$('nav a').removeClass('is-current');

				// Add the 'is-current' class to the clicked link
				$(this).addClass('is-current');

				const link = this;
				const underline = $('.nav-underline')[0];
				const left = link.offsetLeft;
				underline.style.width = link.offsetWidth + 'px';
				underline.style.left = left + 'px';
			});


			// 무한 스크롤
			$(function() {
					
					$.ajax({
						url:"getMoreFeeds.fe",
						success:function(list) {
							
							
							console.log(list);
							

							$(".feedMore").html(value);
							
							
						}, error:function() {
							console.log("ajax 통신 실패");
						}
					})
			})

		</script>
		
	</div>
	
	
	
	

		
		
	<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
