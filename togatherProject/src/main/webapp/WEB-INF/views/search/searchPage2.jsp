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
  background-color: rgb(255, 187, 0);
  cursor: pointer;
  /* appearance를 해야 위의 스타일들을 볼 수 있음 */
  -webkit-appearance: none;
}




/* 온오프라인 */
.modal-body {
	position: relative;
}

.wrapper {
	position: absolute;
	right: 0%;

  width: 50px;
  height: 50px;
  text-align: center;
}

#switch {
  position: absolute;
  /* hidden */
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

.switch_label {
  position: relative;
  cursor: pointer;
  display: inline-block;
  width: 58px;
  height: 28px;
  background: #fff;
  border: 2px solid #ffd7a3;
  border-radius: 20px;
  transition: 0.2s;
}
.switch_label:hover {
  background: #efefef;
}
.onf_btn {
  position: absolute;
  top: 2px;
  left: 3px;
  display: inline-block;
  width: 20px;
  height: 20px;
  border-radius: 20px;
  background: #ffd7a3;
  transition: 0.2s;
}

/* checking style */
#switch:checked+.switch_label {
  background: #fcb251;
  border: 2px solid #fcb251;
}

#switch:checked+.switch_label:hover {
  background: #fcb251;
}

/* move */
#switch:checked+.switch_label .onf_btn {
  left: 34px;
  background: #fff;
  box-shadow: 1px 2px 3px #00000020;
}

/* 달력 */
a { color:#000000;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr > td { width:50px;height:50px; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#ffffff; }
    .scriptCalendar > tbody > tr > td { width:50px;height:50px; }
	
.scriptCalendar {
	margin-left: 9%;
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
								<h5>기간</h5>
								<table class="scriptCalendar">
									<thead>
										<tr>
											<td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
											<td colspan="5">
												<span id="calYear">YYYY</span>년
												<span id="calMonth">MM</span>월
											</td>
											<td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
										</tr>
										<tr>
											<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
								<br>
								<div id="selectedDate">
									선택 날짜 : <span id="dateValue" name="dateValue" value="${ dateValue }"></span>
								</div>
								<br>
							</div>


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
									온라인 <input type="radio" name="sorting" value="1" <c:if test="${sorting == '1'}">checked</c:if>>
								</label>
								<br>
								<label>
									오프라인 <input type="radio" name="sorting" value="2" <c:if test="${sorting == '2'}">checked</c:if>>
								</label>
							</div>

							<div class="modal-body">
							    <h5>종료된 모임도 표시하기</h5>
							    <div class="wrapper">
									<input type="checkbox" id="switch">
									<label for="switch" class="switch_label">
									  <span class="onf_btn"></span>
									</label>
								  </div>
							</div>
							
							<div class="modal-body">
								<h5>카테고리</h5>
								<label>
									문화, 예술 <input type="radio" name="category" value="1" <c:if test="${category == '1'}">checked</c:if>>
								</label>
								<br>
								<label>
									액티비티 <input type="radio" name="category" value="2" <c:if test="${category == '2'}">checked</c:if>>
								</label>
								<br>
								<label>
									푸드 드링크 <input type="radio" name="category" value="3" <c:if test="${category == '3'}">checked</c:if>>
								</label>
								<br>
								<label>
									취미 <input type="radio" name="category" value="4" <c:if test="${category == '4'}">checked</c:if>>
								</label>
								<br>
								<label>
									파티 소개팅 <input type="radio" name="category" value="5" <c:if test="${category == '5'}">checked</c:if>>
								</label>
								<br>
								<label>
									동네 친목 <input type="radio" name="category" value="6" <c:if test="${category == '6'}">checked</c:if>>
								</label>
								<br>
								<label>
									재테크 <input type="radio" name="category" value="7" <c:if test="${category == '7'}">checked</c:if>>
								</label>
								<br>
								<label>
									외국어 <input type="radio" name="category" value="8" <c:if test="${category == '8'}">checked</c:if>>
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
			            <c:forEach var="c" items="${list}" varStatus="loop">
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
	                		<li class="page-item"><a class="page-link" href="search.li?cpage=${ pi.currentPage - 1 }&keyword=${ keyword }">&lt;</a></li>
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
                 			<li class="page-item"><a class="page-link" href="search.li?cpage=${ pi.currentPage + 1 }&keyword=${ keyword }">&gt;</a></li>
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

			
			
			<!-- 온오프라인 -->
			var check = $("input[type='checkbox']");
			check.click(function(){
				// Remove the code that toggles the "post-more" element
			});




			<!-- 달력 -->
			document.addEventListener("DOMContentLoaded", function() {
        buildCalendar();
    });

    var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
    var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

    /**
     * @brief   이전달 버튼 클릭
     */
    function prevCalendar() {
        this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        buildCalendar();    // @param 전월 캘린더 출력 요청
    }

    /**
     * @brief   다음달 버튼 클릭
     */
    function nextCalendar() {
        this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        buildCalendar();    // @param 명월 캘린더 출력 요청
    }

    /**
     * @brief   캘린더 오픈
     * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
     */
    function buildCalendar() {

        let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

        let tbCalendar = document.querySelector(".scriptCalendar > tbody");

        document.getElementById("calYear").innerText = today.getFullYear();                       // @param YYYY월
        document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월


        // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
        while(tbCalendar.rows.length > 0) {
            tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        }


        // @param 첫번째 개행
        let row = tbCalendar.insertRow();



        // @param 날짜가 표기될 열의 증가값
        let dom = 1;

        // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
        //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
        let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

        // @param 달력 출력
        // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
        for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

            let column = row.insertCell();

            // @param 평일( 전월일과 익월일의 데이터 제외 )
            if(Math.sign(day) == 1 && lastDate.getDate() >= day) {


                // @param 평일 날짜 데이터 삽입

                column.innerText = autoLeftPad(day, 2);


                // @param 일요일인 경우
                if(dom % 7 == 1) {
                    column.style.color = "#FF4D4D";
                }

                // @param 토요일인 경우
                if(dom % 7 == 0) {
                    column.style.color = "#4D4DFF";
                    row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                }

            }

            // @param 평일 전월일과 익월일의 데이터 날짜변경
            else {
                let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                column.style.color = "#A9A9A9";
            }

            // @brief   전월, 명월 음영처리
            // @details 현재년과 선택 년도가 같은경우
            if(today.getFullYear() == date.getFullYear()) {

                // @details 현재월과 선택월이 같은경우
                if(today.getMonth() == date.getMonth()) {

                    // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                    if(date.getDate() > day && Math.sign(day) == 1) {
                        column.style.backgroundColor = "#E5E5E5";
                    }

                    // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                    else if(date.getDate() < day && lastDate.getDate() >= day) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }

                    // @details 현재일인 경우
                    else if(date.getDate() == day) {
                        column.style.backgroundColor = "#fff6e6";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }

                // @details 현재월보다 이전인경우
                } else if(today.getMonth() < date.getMonth()) {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#E5E5E5";
                    }
                }

                // @details 현재월보다 이후인경우
                else {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }
                }
            }

            // @details 선택한년도가 현재년도보다 작은경우
            else if(today.getFullYear() < date.getFullYear()) {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#E5E5E5";
                }
            }

            // @details 선택한년도가 현재년도보다 큰경우
            else {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }
            }


            dom++;

        }
    }

    /**
     * @brief   날짜 선택
     * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
     */
    function calendarChoiceDay(column) {

        // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
        if(document.getElementsByClassName("choiceDay")[0]) {
            document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        }

        // @param 선택일 체크 표시
        column.style.backgroundColor = "#fcb251";


        // @param 선택일 클래스명 변경
        column.classList.add("choiceDay");
    }

    /**
     * @brief   숫자 두자릿수( 00 ) 변경
     * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
     * @param   num     앞에 0을 붙일 숫자 값
     * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
     */
    function autoLeftPad(num, digit) {
        if(String(num).length < digit) {
            num = new Array(digit - String(num).length + 1).join("0") + num;
        }
        return num;
    }



	// 한글 월 이름 배열
	var monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	// 한글 요일 이름 배열
	var dayNames = ["일", "월", "화", "수", "목", "금", "토"];

	function calendarChoiceDay(column) {
		// 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화합니다.
		if (document.getElementsByClassName("choiceDay")[0]) {
			document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
			document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
		}

		// 선택일 체크 표시
		column.style.backgroundColor = "#fcb251";

		// 선택일 클래스명 변경
		column.classList.add("choiceDay");

		// 선택한 날짜의 년도와 월을 한글로 표시
		var selectedYear = document.getElementById("calYear").innerText;
		var selectedMonth = document.getElementById("calMonth").innerText;
		var selectedDate = column.innerText;

		// 각 월의 한글 표현 배열
		var monthsInKorean = ["", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];

		// 선택한 날짜를 한글로 표시
		var koreanDate = selectedYear + "년 " + monthsInKorean[parseInt(selectedMonth)] + " " + selectedDate + "일";
		document.getElementById("dateValue").innerText = koreanDate;
	}


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