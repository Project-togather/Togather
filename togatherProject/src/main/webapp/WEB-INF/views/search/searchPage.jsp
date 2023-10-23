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
.top-bar {
	position: relative;

	height: 130px;
	border-bottom: 1px solid rgb(230, 230, 230);
}

.search-box {

	position: absolute;
	top: 30%;
	left: 35%;
	
	height: 60px;

	background-color: #f5f5f5;
	border-radius: 30px;
}

.search-txt{
	display: flex;
	padding: 0;
	width: 600px;
	border:none;
	background: none;
	outline: none;
	float: left;

	font-size: 1rem;
	line-height: 50px;
	margin-top: 1%;
	margin-left: 2%;

	position: relative;
}

.search-btn{
	/*
	box-sizing: border-box;
	border: 1px solid black;
	*/

	margin-left: 90%;
	margin-bottom: 50px;

	position: absolute;
	bottom: 75%;
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

nav {
    position: relative;
    display: flex;
    width: 80%;
    margin: 1em auto;
    font-size: 20px;
}
nav a {
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
nav a.is-current {
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

    	<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->

		<!-- Wrapper-->
		<div class="wrapper">

		<!-- Hero-->

        <!-- 서치바 영역 -->
        <div class="top-bar" style="background-color: white;">
            <div class="search-box">
                <input type="text" class="search-txt" name="keyword" placeholder="지금 생각나는 취미를 검색하세요.">
                <a class="search-btn" href="search.li">
                <i class="fa fa-search fa-3x" aria-hidden="true" type="submit" style="color: orange;"></i>
                </a>
            </div>
        </div>

        <!-- 네비바 영역 -->
        <nav>
            <a href="#" id="socialingClick"><i class="fas fa-duotone fa-bolt" style="color: rgba(46, 102, 255, 0.918);">&nbsp;</i>Socialing</a>
            <a href="#" id="clubClick"><i class="fas fa-regular fa-star" style="color: rgba(255, 233, 35, 0.918);">&nbsp;</i>Club</a>
            <a href="#" id="challengeClick"><i class="fas fa-regular fa-fire" style="color: rgba(255, 98, 36, 0.918);">&nbsp;</i>challenge</a>
            <a href="#" id="feedClick"><i class="fas fa-light fa-comment" style="color: rgba(114, 114, 114, 0.918);">&nbsp;</i>Feed</a>
            <a href="#" id="memberClick"><i class="fas fa-solid fa-user" style="color: rgba(136, 230, 112, 0.918);">&nbsp;</i>Member</a>
            <div class="nav-underline"></div>
        </nav>

		<!-- Hero end-->
		
		<!-- 소셜링 ajax 영역 -->
		<section class="module">
				<div class="container">
					<div class="socialing">
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
			</div>
		</section>
		
		
		
		
		
		<!-- 클럽 ajax 영역 -->
		<section class="module">
				<div class="container">
					<div class="club">
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
					

				<!-- 
				<div id="pagingArea">
					<nav aria-label="Page navigation example">
					
					  <ul class="pagination">
					  
					  	
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
					    
					    
					  </ul>
					  
					</nav>
				</div>
				 -->
				
				</div>
			</div>
		</section>
		
		
		
		
		
		
		<!-- 피드 ajax 영역 -->
		<section class="module">
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
			<!-- 소셜링 ajax 스크립트 영역 -->
			 $(function() {
			    $("#socialingClick").click(function() {
			        loadSocialingData(1); // 초기 페이지 번호 (1)로 데이터 로드
			    });
			    
			    /*
			    
			    // 페이징 버튼 클릭 시 해당 페이지 데이터 로드
			    $(document).on("click", ".pagination a", function(e) {
			        e.preventDefault();
			        let page = $(this).data("page");
			        loadSocialingData(page);
			    });
			    */

			    function loadSocialingData(page) {
			    	
			        $.ajax({
			            url: "getList.so",
			            data: { cpage: page },
			            success: function(response) {
			            	
			                console.log(response);
			                
			                let list = response.list;
			                
			                
			                $(".socialing .row").empty();

			                
			                $.each(list, function(index, item) {
			                	
			                	let row = $("<div class='col-md-4 post-item'>");
			                    let article = $("<article class='post'>");

			                    let postPreview = $("<div class='post-preview'></div");
			                    let postWrapper = $("<div class='post-wrapper'></div");
			                    let postContent = $("<div class='post-content'></div");
			                    let postMore = $("<div class='post-more'></div");

			                    // <a href='#'>를 추가
			                    let link = $("<a href='#'></a>");

			                    // <img src="assets/images/widgets/3.jpg" alt="">를 추가 (이미지 경로 수정)
			                    let image = $("<img src='assets/images/widgets/3.jpg' alt='' />");

			                    // 링크 안에 이미지를 넣음
			                    link.append(image);

			                    // postPreview 안에 링크를 넣음
			                    postPreview.append(link);

			                    // postWrapper 안에 post-header 추가
			                    postWrapper.append("<div class='post-header'></div>");

			                    let postHeader = postWrapper.find(".post-header");
			                    let postTitle = $("<h2 class='socialing-title'></h2>");
			                    let postLink = $("<a href='blog-single-1.html'></a>");
			                    
			                    // postLink를 postTitle에 추가
			                    postTitle.append(postLink);

			                    // postTitle를 postHeader에 추가
			                    postHeader.append(postTitle);


			                    // postMore 안에 <a href='#'></a>를 추가
			                    let moreLink = $("<a href='#'></a>");
			                    postMore.append(moreLink);

			                    article.append(postPreview);
			                    article.append(postWrapper);
			                    article.append(postContent);
			                    article.append(postMore);

			                    row.append(article);

			                 	// item 넣기
			                 	
			                 	// 모임 명
			                    postLink.text(item.classTitle);
			                 	postTitle.append(postLink);
			                 	
			                 	// 모임 타입
			                 	let paragraph = $("<p>" + item.clType + "</p>");
								postContent.append(paragraph);
			                 	
			                 	// 모임 날짜
			                 	moreLink.text(item.classDate);
								postMore.append(moreLink);
			                 	
			                    
			                    
			                    $(".socialing .row").append(row);
			                    
			                    $(".feed").hide();
			                    
			                    $(".socialing .row").show();
			                    $(".pagination").show();
			                });
			                
							
			                // 페이징 버튼 업데이트
			                updatePagination(response.pageInfo);
							
			            },
			            error: function() {
			                console.log("ajax 통신 실패");
			            }
			        });
			    }
			    
			    
			    
			    
			    <!-- 소셜링 페이징바 영역 -->
			    function updatePagination(pageInfo) {
			        let pagination = $(".pagination");
			        pagination.empty();

			        // << 버튼
			        if (pageInfo.currentPage > 1) {
			            let prevPageLink = $("<a class='page-link' href='#' aria-label='Previous'>&laquo;</a>");
			            prevPageLink.data("page", pageInfo.currentPage - 1);
			            pagination.append($("<li class='page-item'></li>").append(prevPageLink));
			            prevPageLink.click(function() {
			                loadSocialingData(pageInfo.currentPage - 1);
			            });
			        } else {
			            pagination.append($("<li class='page-item disabled'></li").append($("<a class='page-link' href='#' aria-label='Previous'>&laquo;</a>")));
			        }

			        // 숫자 버튼
			        for (let i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
			            let pageLink = $("<a class='page-link' href='#'></a>").text(i);
			            pageLink.data("page", i);
			            if (i === pageInfo.currentPage) {
			                pageLink.parent().addClass("active");
			            }
			            let pageItem = $("<li class='page-item'></li").append(pageLink);
			            pagination.append(pageItem);

			            // Clicking a page number loads the corresponding page
			            pageLink.click(function() {
			                loadSocialingData(i);
			            });
			        }

			        // >> 버튼
			        if (pageInfo.currentPage < pageInfo.maxPage) {
			            let nextPageLink = $("<a class='page-link' href='#' aria-label='Next'>&raquo;</a>");
			            nextPageLink.data("page", pageInfo.currentPage + 1);
			            pagination.append($("<li class='page-item'></li").append(nextPageLink));
			            nextPageLink.click(function() {
			                loadSocialingData(pageInfo.currentPage + 1);
			            });
			        } else {
			            pagination.append($("<li class='page-item disabled'></li").append($("<a class='page-link' href='#' aria-label='Next'>&raquo;</a>")));
			        }
			    }
			    
			});

		
		
		
		
		
        	<!-- 피드 ajax 스크립트 영역 -->
			$(function() {
				$("#feedClick").click(function() {
					
					$.ajax({
						url:"getList.fe",
						success:function(list) {
							
							$(".socialing .row").hide();
							
							// console.log(list);
							
							let value = "";
							
							for(let i in list) {
								
								let item = list[i];
								
								value += "<div class='feed-item'>" 
											+ "<div class='feed-box'>" 
											
												+ "<div class='feed_name'>" 
													+ "<div class='profile_box'>" 
														+ "<img class='profile_img' src='https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90'>"
													+ "</div>"
													+ "<span class='feed_name_txt'>" + item.feWriter + "</span>"
													
												+ "</div>" 
												
												+ "<img class='feed_img' src='https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,q_auto,w_375/%EC%95%8C%EB%A0%88%EC%98%AC%EB%A0%88_e1e634ae5a2fb6377b1dd828a0fb8c2ce5f12723fc34df3da578ea3e8e35eb62'>"
												
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
							
							$(".socialing .row").hide();
							$(".pagination").hide();
							
							$(".feed").show();
							
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


			
		</script>
		


			<svg class="footer-circle" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100" viewbox="0 0 100 100" preserveaspectratio="none">
				<path d="M0 100 C40 0 60 0 100 100 Z"></path>
			</svg>
			<!-- Footer-->
			<footer class="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<!-- Text widget-->
							<aside class="widget widget_text">
								<div class="textwidget">
									<p><img src="assets/images/logo-light.png" width="74px" alt=""></p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
									<ul class="icon-list">
										<li><i class="ti-email"></i> info@themebusiness.com</li>
										<li><i class="ti-headphone-alt"></i> 1-444-123-4559</li>
										<li><i class="ti-location-pin"></i> Raymond Boulevard 224, New York</li>
									</ul>
								</div>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Recent entries widget-->
							<aside class="widget widget_recent_entries">
								<div class="widget-title">
									<h5>Recent Posts</h5>
								</div>
								<ul>
									<li><a href="#">Matcha Portuguese Egg Tarts</a> <span class="post-date">May 8, 2016</span></li>
									<li><a href="#">Camp Cooking: One Pan Yaki Udon</a> <span class="post-date">April 7, 2016</span></li>
									<li><a href="#">Chicken & Spring Vegetable Lasagna</a> <span class="post-date">April 7, 2016</span></li>
									<li><a href="#">Mini California Sushi Cones</a> <span class="post-date">April 7, 2016</span></li>
								</ul>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Twitter-->
							<aside class="widget twitter-feed-widget">
								<div class="widget-title">
									<h5>Twitter Feed</h5>
								</div>
								<div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Recent portfolio widget-->
							<aside class="widget widget_recent_works">
								<div class="widget-title">
									<h5>Instagram</h5>
								</div>
								<ul>
									<li><a href="#"><img src="assets/images/widgets/1.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/2.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/3.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/4.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/5.jpg" alt=""></a></li>
									<li><a href="#"><img src="assets/images/widgets/6.jpg" alt=""></a></li>
								</ul>
							</aside>
						</div>
					</div>
				</div>
				<div class="small-footer">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="copyright">© 2017 <a href="http://2the.me/">2theme</a>, All Rights Reserved.</div>
							</div>
							<div class="col-md-6">
								<ul class="social-links">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- Footer end-->
		</div>
		<!-- Wrapper end-->

		<!-- Off canvas-->
		<div class="off-canvas-sidebar" data-background="assets/images/sidebar.jpg">
			<div class="off-canvas-sidebar-wrapper">
				<div class="off-canvas-header"><a class="close-offcanvas" href="#"><span class="arrows arrows-arrows-remove"></span></a></div>
				<div class="off-canvas-content">
					<!-- Text widget-->
					<aside class="widget widget_text">
						<div class="textwidget">
							<p><img src="assets/images/logo-light.png" width="74px" alt=""></p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
							<ul class="icon-list">
								<li><i class="ti-email"></i> info@themebusiness.com</li>
								<li><i class="ti-headphone-alt"></i> 1-444-123-4559</li>
								<li><i class="ti-location-pin"></i> Raymond Boulevard 224, New York</li>
							</ul>
						</div>
					</aside>
					<!-- Recent portfolio widget-->
					<aside class="widget widget_recent_works">
						<div class="widget-title">
							<h5>Instagram</h5>
						</div>
						<ul>
							<li><a href="#"><img src="assets/images/widgets/1.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/2.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/3.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/4.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/5.jpg" alt=""></a></li>
							<li><a href="#"><img src="assets/images/widgets/6.jpg" alt=""></a></li>
						</ul>
					</aside>
					<!-- Text widget-->
					<!--aside.widget.widget_text
					.textwidget
						.up-logo
							p.text-center.m-b-50: img(src="assets/images/logo-light.png" width="100" alt="")
						.up-form
							form(method="post")
								.form-group
									input.form-control.form-control-lg(type="email" placeholder="Email")
								.form-group
									input.form-control.form-control-lg(type="password" placeholder="Pasword")
								.form-group
									button(type="submit" class="btn btn-block btn-lg btn-round btn-brand") Log in
						.up-help
							p: a(href="#") Forgot your password?
							p Don't have an account yet? <a href="#">Sign in</a>
					
					-->

					<!-- Twitter widget-->
					<aside class="widget twitter-feed-widget">
						<div class="widget-title">
							<h5>Twitter Feed</h5>
						</div>
						<div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
					</aside>
					<ul class="social-icons">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-vk"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Off canvas end-->

		<!-- Reserve Popup-->
		<div class="white-popup-block mfp-hide" id="test-form">
			<div class="container">
				<div class="row">
					<div class="col-md-4 p-0">
						<div class="qwert" data-background="assets/images/module-2.jpg"></div>
					</div>
					<div class="col-md-8">
						<div class="ddd"><a class="popup-modal-dismiss" href="#"><i class="ti-close"></i></a>
							<h1 class="display-1">Book a Table</h1>
							<p class="lead">See how your users experience your website in realtime or view <br/> trends to see any changes in performance over time.</p>
							<div class="divider-border-left"></div>
							<div class="space" data-mY="60px"></div>
							<form method="post" novalidate>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="name" placeholder="Name" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="name" placeholder="Phone" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="email" name="email" placeholder="E-mail" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="subject" placeholder="Persons" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="email" name="email" placeholder="Date" required="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" name="subject" placeholder="Time" required="">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" placeholder="Special Requests" rows="6" required=""></textarea>
										</div>
									</div>
									<div class="col-md-12">
										<input class="btn btn-black" type="submit" value="Reserve">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Reserve Popup end-->

		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>

		<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></scrip>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="assets/js/plugins.min.js"></script>
		<script src="assets/js/custom.min.js"></script>

</body>
</html>
