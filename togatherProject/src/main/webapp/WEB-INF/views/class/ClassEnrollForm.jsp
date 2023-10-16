<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Tavern - Responsive Restaurant Template(Bootstrap 4)</title>
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
		
		<!-- 카카오 지도 코드 보류
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
		<script>
			Kakao.init('JAVASCRIPT_KEY');
			console.log(Kakao.isInitialized());
		</script>
		-->
		
		    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>		

	</head>
	<body>
		<!-- Header-->
		<jsp:include page="../common/menubar.jsp"/>

		
		<!-- Wrapper-->
		<div class="wrapper">

			<!-- Hero-->
			<section class="module-cover parallax" data-background="" data-overlay="0.7">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto">
							<div class="text-center">
								<div class="up-as">
									<h4>모임 등록하기</h4>
								</div>
								<div class="up-form">
									<form action="enroll.cl" method="post">
										<div class="form-group">
											<input type="hidden" id="hidden">
											<h5>모임유형을 선택해주세요!</h5>
											<select name="clType">
												<option value="1">소셜링</option>
												<option value="2">클럽</option>
												<option value="3">챌린지</option>
												<option value="4">원데이</option>
											</select>
										</div>
										<div class="form-group">
											<div class="form-control" id="socialing" style="color: white;">소셜링</div>
										</div>
										<div class="form-group">
											<div class="form-control" id="club" style="color: white;">클럽</div>
										</div>
										<div class="form-group">
											<div class="form-control" id="challenge" style="color: white;">챌린지</div>
										</div>
										<hr>
										<h5>(소셜링, 클럽, 챌린지)주제를 선택해 볼까요?</h5>
										<div class="form-group">
											<select name="clCategory">
												<option value="1">문화 예술</option>
												<option value="2">액티비티</option>
												<option value="3">푸드 드링크</option>
												<option value="4">취미</option>
												<option value="5">파티 소개팅</option>
												<option value="6">동네 친목</option>
												<option value="7">재테크</option>
												<option value="8">외국어</option>
											</select>
										</div>
										<hr>
										
										<div id="map" style="width:500px;height:400px;"></div>
										<div>
						                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
						                    <button type="submit" onclick="searchPlaces(); return false;">검색하기</button> 
										</div>
																
										
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9be07910948b6a467fe99fca4953cf06&libraries=services"></script>
										
										<script>
										
										// 마커를 담을 배열입니다
										var markers = [];

										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  

										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 

										// 장소 검색 객체를 생성합니다
										var ps = new kakao.maps.services.Places();  

										// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
										var infowindow = new kakao.maps.InfoWindow({zIndex:1});

										// 키워드로 장소를 검색합니다
										searchPlaces();

										// 키워드 검색을 요청하는 함수입니다
										function searchPlaces() {

										    var keyword = document.getElementById('keyword').value;

										    if (!keyword.replace(/^\s+|\s+$/g, '')) {
										        alert('키워드를 입력해주세요!');
										        return false;
										    }

										    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
										    ps.keywordSearch( keyword, placesSearchCB); 
										}

										// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
										function placesSearchCB(data, status, pagination) {
										    if (status === kakao.maps.services.Status.OK) {

										        // 정상적으로 검색이 완료됐으면
										        // 검색 목록과 마커를 표출합니다
										        displayPlaces(data);

										        // 페이지 번호를 표출합니다
										        displayPagination(pagination);

										    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

										        alert('검색 결과가 존재하지 않습니다.');
										        return;

										    } else if (status === kakao.maps.services.Status.ERROR) {

										        alert('검색 결과 중 오류가 발생했습니다.');
										        return;

										    }
										}

										// 검색 결과 목록과 마커를 표출하는 함수입니다
										function displayPlaces(places) {

										    var listEl = document.getElementById('placesList'), 
										    menuEl = document.getElementById('menu_wrap'),
										    fragment = document.createDocumentFragment(), 
										    bounds = new kakao.maps.LatLngBounds(), 
										    listStr = '';
										    
										    // 검색 결과 목록에 추가된 항목들을 제거합니다
										    removeAllChildNods(listEl);

										    // 지도에 표시되고 있는 마커를 제거합니다
										    removeMarker();
										    
										    for ( var i=0; i<places.length; i++ ) {

										        // 마커를 생성하고 지도에 표시합니다
										        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
										            marker = addMarker(placePosition, i), 
										            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

										        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
										        // LatLngBounds 객체에 좌표를 추가합니다
										        bounds.extend(placePosition);

										        // 마커와 검색결과 항목에 mouseover 했을때
										        // 해당 장소에 인포윈도우에 장소명을 표시합니다
										        // mouseout 했을 때는 인포윈도우를 닫습니다
										        (function(marker, title) {
										            kakao.maps.event.addListener(marker, 'mouseover', function() {
										                displayInfowindow(marker, title);
										            });

										            kakao.maps.event.addListener(marker, 'mouseout', function() {
										                infowindow.close();
										            });

										            itemEl.onmouseover =  function () {
										                displayInfowindow(marker, title);
										            };

										            itemEl.onmouseout =  function () {
										                infowindow.close();
										            };
										        })(marker, places[i].place_name);

										        fragment.appendChild(itemEl);
										    }

										    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
										    listEl.appendChild(fragment);
										    menuEl.scrollTop = 0;

										    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
										    map.setBounds(bounds);
										}

										// 검색결과 항목을 Element로 반환하는 함수입니다
										function getListItem(index, places) {

										    var el = document.createElement('li'),
										    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
										                '<div class="info">' +
										                '   <h5>' + places.place_name + '</h5>';

										    if (places.road_address_name) {
										        itemStr += '    <span>' + places.road_address_name + '</span>' +
										                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
										    } else {
										        itemStr += '    <span>' +  places.address_name  + '</span>'; 
										    }
										                 
										      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
										                '</div>';           

										    el.innerHTML = itemStr;
										    el.className = 'item';

										    return el;
										}

										// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
										function addMarker(position, idx, title) {
										    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
										        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
										        imgOptions =  {
										            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
										            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
										            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
										        },
										        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
										            marker = new kakao.maps.Marker({
										            position: position, // 마커의 위치
										            image: markerImage 
										        });

										    marker.setMap(map); // 지도 위에 마커를 표출합니다
										    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

										    return marker;
										}

										// 지도 위에 표시되고 있는 마커를 모두 제거합니다
										function removeMarker() {
										    for ( var i = 0; i < markers.length; i++ ) {
										        markers[i].setMap(null);
										    }   
										    markers = [];
										}

										// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
										function displayPagination(pagination) {
										    var paginationEl = document.getElementById('pagination'),
										        fragment = document.createDocumentFragment(),
										        i; 

										    // 기존에 추가된 페이지번호를 삭제합니다
										    while (paginationEl.hasChildNodes()) {
										        paginationEl.removeChild (paginationEl.lastChild);
										    }

										    for (i=1; i<=pagination.last; i++) {
										        var el = document.createElement('a');
										        el.href = "#";
										        el.innerHTML = i;

										        if (i===pagination.current) {
										            el.className = 'on';
										        } else {
										            el.onclick = (function(i) {
										                return function() {
										                    pagination.gotoPage(i);
										                }
										            })(i);
										        }

										        fragment.appendChild(el);
										    }
										    paginationEl.appendChild(fragment);
										}

										// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
										// 인포윈도우에 장소명을 표시합니다
										function displayInfowindow(marker, title) {
										    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

										    infowindow.setContent(content);
										    infowindow.open(map, marker);
										}

										 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
										function removeAllChildNods(el) {   
										    while (el.hasChildNodes()) {
										        el.removeChild (el.lastChild);
										    }
										}
										
										
										
										
										
										/*
										// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
										var infowindow = new kakao.maps.InfoWindow({zIndex:1});

										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  

										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 

										// 장소 검색 객체를 생성합니다
										var ps = new kakao.maps.services.Places(); 

										// 키워드로 장소를 검색합니다
										ps.keywordSearch('이태원 맛집', placesSearchCB); 

										// 키워드 검색 완료 시 호출되는 콜백함수 입니다
										function placesSearchCB (data, status, pagination) {
										    if (status === kakao.maps.services.Status.OK) {

										        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
										        // LatLngBounds 객체에 좌표를 추가합니다
										        var bounds = new kakao.maps.LatLngBounds();

										        for (var i=0; i<data.length; i++) {
										            displayMarker(data[i]);    
										            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
										        }       

										        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
										        map.setBounds(bounds);
										    } 
										}

										// 지도에 마커를 표시하는 함수입니다
										function displayMarker(place) {
										    
										    // 마커를 생성하고 지도에 표시합니다
										    var marker = new kakao.maps.Marker({
										        map: map,
										        position: new kakao.maps.LatLng(place.y, place.x) 
										    });

										    // 마커에 클릭이벤트를 등록합니다
										    kakao.maps.event.addListener(marker, 'click', function() {
										        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
										        infowindow.open(map, marker);
										    });
										}
										*/
											
										</script>
										
										<hr>
										<h5>(소셜링, 클럽, 챌린지)정보를 입력할 차례에요!</h5>
										<div class="form-group">
											<input class="form-control" type="text" name="cTitle" placeholder="소셜링 제목을 작성해주세요!" style="color:white"> <!-- 글자수체크 추가 -->
										</div>
										<table>
											<tr>
												<td><img id="contentImg1" width="150" height="120" onclick="chooseFile(1);"></td>
												<td><img id="contentImg2" width="150" height="120" onclick="chooseFile(2);"></td>
												<td><img id="contentImg3" width="150" height="120" onclick="chooseFile(3);"></td>
												<td><img id="contentImg4" width="150" height="120" onclick="chooseFile(4);"></td>
												<td><img id="contentImg5" width="150" height="120" onclick="chooseFile(5);"></td>
											</tr>
										</table>
										<div style="display:none">
											<input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
											<input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
											<input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
											<input type="file" id="file4" name="file4" onchange="loadImg(this, 4);">
											<input type="file" id="file5" name="file5" onchange="loadImg(this, 5);">
										</div>
										<br>
										
										<div class="form-group">
											<textarea id="summernote" name="cContent" style="color:black"></textarea>
										</div>

										<h5>언제 만날까요?</h5>
										<div class="form-group">
											<input type="date" name="cDate">
											<input type="time" name="cTime">
										</div>
										
										
										<div class="form-group">
											<select name="cApproval">
												<option value="Y">승인제</option>
												<option value="N">선착순</option>
											</select>
										</div>
										
										<div class="form-group">
											최소 나이 제한 <input type="text" class="form-control" name="minAge" style="color:white"> <br>
											최대 나이 제한 <input type="text" class="form-control" name="maxAge" style="color:white">
										</div>
										
										<div class="form-group">
											<input class="form-control" type="number" name="cPrice" placeholder="참가비가 없다면 0을 입력해주세요." style="color:white">
										</div>
										<div class="form-group">
											<input class="form-control" type="number" name="peopleLimit" placeholder="참가 인원수를 선택해주세요." style="color:white">
										</div>
										
										<script>
											
										/*
											$(document).ready(function() {
											  $('#summernote').summernote({
										 	    	placeholder: 'content',
											        minHeight: 370,
											        maxHeight: null,
											        focus: true, 
											        lang : 'ko-KR'
											  });
											});
										*/

											function chooseFile(num){
												$("#file" + num).click();
											}
									
											function loadImg(inputFile, num){
												if(inputFile.files.length == 1){
													const reader = new FileReader();
													reader.readAsDataURL(inputFile.files[0]);
													reader.onload = function(e){
														switch(num){
						        						case 1 : $("#contentImg1").attr("src", e.target.result); break;
						        						case 2 : $("#contentImg2").attr("src", e.target.result); break;
						        						case 3 : $("#contentImg3").attr("src", e.target.result); break;
						        						case 4 : $("#contentImg4").attr("src", e.target.result); break;
						        						case 5 : $("#contentImg5").attr("src", e.target.result); break;
														
														}
													}
												} else{
													switch(num){
					        						case 1 : $("#contentImg1").attr("src", null); break;
					        						case 2 : $("#contentImg2").attr("src", null); break;
					        						case 3 : $("#contentImg3").attr("src", null); break;
					        						case 4 : $("#contentImg4").attr("src", null); break;
					        						case 5 : $("#contentImg5").attr("src", null); break;
												}
											}
											}
										</script>
				
										<input type="submit" value="모임등록">
									</form>		
								</div>
								<div class="up-help">
									<p>By clicking "Sign Up", you agree to our <br> <a href="#">software services agreement</a>.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Hero end-->

			<script>
				// 모임 유형 선택 (div)시 다른 div 체크해제 + 히든에 값주기
			</script>

		</div>
		<!-- Wrapper end-->
		<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>

		<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="assets/js/plugins.min.js"></script>
		<script src="assets/js/custom.min.js"></script>
	</body>
</html>