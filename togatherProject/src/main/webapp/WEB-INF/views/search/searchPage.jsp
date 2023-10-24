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





/* ? */
.open-offcanvas {
}

.ti-user fa-2x {
}



/* 네비바 영역 */

#searchNav {
    position: relative;
    display: flex;
    width: 80%;
    margin: 1em auto;
    font-size: 20px;
}
#searchNav a {
    display: block;
    width: 20%;
    padding: .75em 0;
    color: #333;
    text-decoration: none;
    text-align: center;
    cursor: pointer; /* 추가: 링크에 커서 스타일 적용 */
}

.nav-underline {
    position: absolute;
    left: 0;
    bottom: -2px;
    width: 20%;
    height: 2px;
    background: #333;
    transition: all .3s ease-in-out;
}

/* 추가: 클릭한 페이지의 링크에 대한 스타일 */
#searchNav a.is-current {
    color: black; /* 클릭한 링크의 텍스트 색상 변경 */
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
		
		<!-- 서치바 영역 -->
        <div class="searchBar" style="background-color: white;">
            <div class="searchBox">
                <input type="text" class="searchTxt" name="keyword" placeholder="지금 생각나는 취미를 검색하세요.">
                <a class="searchBtn" href="search.li">
                <i class="fa fa-search fa-3x" aria-hidden="true" type="submit" style="color: orange;"></i>
                </a>
            </div>
        </div>
        
        
        <!-- 네비바 영역 -->
        <nav id="searchNav">
			<a href="#" id="socialingClick" onclick="searchClassList(1);">
				<i class="fas fa-duotone fa-bolt" style="color: rgba(46, 102, 255, 0.918);"></i>&nbsp;Socialing
			</a>
			<a href="#" id="clubClick" onclick="searchClassList(2);">
				<i class="fas fa-regular fa-star" style="color: rgba(255, 233, 35, 0.918);"></i>&nbsp;Club
			</a>
			<a href="#" id="challengeClick" onclick="searchClassList(3);">
				<i class="fas fa-regular fa-fire" style="color: rgba(255, 98, 36, 0.918);"></i>&nbsp;Challenge
			</a>
			<a href="#" id="feedClick">
				<i class="fas fa-light fa-comment" style="color: rgba(114, 114, 114, 0.918);"></i>&nbsp;Feed
			</a>
			<a href="#" id="memberClick">
				<i class="fas fa-solid fa-user" style="color: rgba(136, 230, 112, 0.918);"></i>&nbsp;Member
			</a>
			<div class="nav-underline"></div>
		</nav>
		
        
        
        
        <!-- 소셜링, 클럽, 챌린지 ajax 영역 -->
		<section class="module" id="module1">
			<div class="container">
				<div class="search-class">
					<div class="row">
					
						<!--  
						<div class="col-md-4 post-item">
							<article class="post">
								<div class="post-preview"><a href="#"><img src="assets/images/menu/1.jpg" alt=""></a></div>
								<div class="post-wrapper">
									<div class="post-header">
										<h2 class="post-title display-1"><a href="blog-single-1.html">Which Lamb is the Best: American, Australian or New Zealand?</a></h2>
									</div>
									<div class="post-content">
										<p>See how your users experience your website in realtime or view trends to see any changes in performance over time...</p>
									</div>
									<div class="post-more"><a href="#">read more...</a></div>
								</div>
							</article>
						</div>
						-->
							
					</div>
				</div>
					

				<div id="pagingArea">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							
								<!--
								<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
								</li>
								-->
								
						</ul>
					</nav>
				</div>

			</div>
		</section>
		
		
		
		
		
		<!-- 피드 ajax 영역 -->
		<section class="module" id="module3">
			<div class="container">
				<div class="feed">

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


				</div>
			</div>
		</section>
		


		<script>
			
			function searchClassList(num) {
				
				var clType;
				var num;
				
				if(num == 1){
					clType = 1;
				} else if(num == 2){
					clType = 2;
				} else if(num == 3){
					clType = 3;
				}
				
				console.log(clType);
				
				$.ajax({
					
					url:"getList.cl",
					data: { clType:clType },
					success: response => {
						
						console.log(clType);
						console.log(response.list);
						
						
						
						
					}, error:()=> {
						console.log("ajax 조회 실패");
					}
					
				})
				
				
			}
			
			
			
			
			
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
