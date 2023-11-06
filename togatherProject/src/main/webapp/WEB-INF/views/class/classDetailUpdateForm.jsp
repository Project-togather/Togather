<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/images/detail/favicon.ico">
<title>${ c.classTitle }</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative; right:35px; width:610px;;height:400px; line-height: 1;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:200px;height:400px; margin:0px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
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
.display{display: none;}
#oneday:hover{background-color: purple;}
.clCategorydiv, .classApproval, .choiseMap, .ageLimit, .classTime{
	display: inline-flex;
	flex-direction: row;
	justify-content: space-around;
}

.clCategorydiv div{
	width: 130px;
	height: 50px;
}

 .classApproval div, .choiseMap div, .ageLimit div, .classTime input{
 	width: 200px;
	height: 50px;
 }

.form-group:hover, #age1:hover, #age2:hover{ cursor: pointer;}
.clCategorydiv div:hover, .classApproval div:hover{ background-color: orange;}
.hiddenMap{
	display: none;
}
.hiddenBusiness{
	display: none;
}
.addorange{background-color: orange;}
.submitbtn:hover{background-color: orange;}
.contentImg1{
	width: 250px;
	height: 250px;
	object-fit: cover;
}
#editor{text-align: left;}

<!-- 양방향 range -->
#ageLimitDiv {
  margin: 0;
  padding: 0;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #e5e5e5;
}

.middle {
  position: relative;
  max-width: 500px;
  width: 100%;
}

.slider {
  position: relative;
  z-index: 1;
  height: 15px;
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
  background-color: #ffcf00;
}

.slider > .range {
  position: absolute;
  z-index: 2;
  left: 15%;
  right: 15%;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  background-color: orange;
}

.slider > .thumbl, .slider > .thumbr {
  position: absolute;
  top: -5px;
  z-index: 3;
  width: 30px;
  height: 30px;
  background-color: #da813f;
  border-radius: 50%;
}

.slider > .thumbl {
  left: 12%;
}
.slider > .thumbr {
  right: 10%;
}

input[type="range"] {
  position: absolute;
  pointer-events: none;
  -webkit-appearance: none;
  z-index: 3;
  height: 10px;
  width: 100%;
  top: -7px;
  opacity: 0;
}

input[type="range"]::-webkit-slider-thumb {
  pointer-events: all;
  width: 30px;
  height: 30px;
  border-radius: 0;
  border: 0 none;
  background-color: red;
  cursor: pointer;
  -webkit-appearance: none;
}
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
								<form action="update.cl" method="post" enctype="multipart/form-data">
									<input type="hidden" name="clType" value=${ c.clType }>
									<input type="hidden" name="classNo" value=${ c.classNo }>
									<input type="hidden" name="condition" value="1">
									<div class="form-group">
										<input type="text" style="display:none;" name="memNo" value="${ loginMember.memNo }">
										<h5 style="color:orange;">모임유형은 변경할 수 없어요!</h5>
									</div>

									<hr>
									<br>
									
									<h5>변경하실 카테고리를 선택해 볼까요?</h5>
									
									<div class="clCategorydiv">
										<div class="form-group">
											<div class="form-control" id="culture" style="color: white;">문화예술</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="activity" style="color: white;">액티비티</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="food" style="color: white;">푸드 드링크</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="hobby" style="color: white;">취미</div>
										</div>
									</div>
									<div class="clCategorydiv">
										<div class="form-group">
											<div class="form-control" id="party" style="color: white;">파티 소개팅</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="neighbor" style="color: white;">동네 친목</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="Investment" style="color: white;">재테크</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="foreign" style="color: white;">외국어</div>
										</div>
									</div>
								
									<input type="text" name="clCategory" id="clCategory" style="display:none;" required>
									
									<br>
									
									<script>
										$(function() {
											$("#culture").click(()=>{
												if($("#culture").hasClass("orange")){
													$("#culture").removeClass("orange");
													$("#culture").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#culture").addClass("orange");
													$("#culture").css("backgroundColor","orange");
													$("#activity").css("backgroundColor","");
													$("#food").css("backgroundColor","");
													$("#hobby").css("backgroundColor","");
													$("#party").css("backgroundColor","");
													$("#neighbor").css("backgroundColor","");
													$("#Investment").css("backgroundColor","");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val(1);
												}
											})									
											
											$("#activity").click(()=>{
												if($("#activity").hasClass("orange")){
													$("#activity").removeClass("orange");
													$("#activity").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#activity").addClass("orange");
													$("#activity").css("backgroundColor","orange");
													$("#culture").css("backgroundColor","");
													$("#food").css("backgroundColor","");
													$("#hobby").css("backgroundColor","");
													$("#party").css("backgroundColor","");
													$("#neighbor").css("backgroundColor","");
													$("#Investment").css("backgroundColor","");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val(2);
												}
											})
											
											$("#food").click(()=>{
												if($("#food").hasClass("orange")){
													$("#food").removeClass("orange");
													$("#food").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#food").addClass("orange");
													$("#food").css("backgroundColor","orange");
													$("#culture").css("backgroundColor","");
													$("#activity").css("backgroundColor","");
													$("#hobby").css("backgroundColor","");
													$("#party").css("backgroundColor","");
													$("#neighbor").css("backgroundColor","");
													$("#Investment").css("backgroundColor","");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val(3);
												}
											})	
											
											$("#hobby").click(()=>{
												if($("#hobby").hasClass("orange")){
													$("#hobby").removeClass("orange");
													$("#hobby").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#hobby").addClass("orange");
													$("#hobby").css("backgroundColor","orange");
													$("#culture").css("backgroundColor","");
													$("#activity").css("backgroundColor","");
													$("#food").css("backgroundColor","");
													$("#party").css("backgroundColor","");
													$("#neighbor").css("backgroundColor","");
													$("#Investment").css("backgroundColor","");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val(4);
												}
											})	
											
											$("#party").click(()=>{
												if($("#party").hasClass("orange")){
													$("#party").removeClass("orange");
													$("#party").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#party").addClass("orange");
													$("#party").css("backgroundColor","orange");
													$("#culture").css("backgroundColor","");
													$("#activity").css("backgroundColor","");
													$("#food").css("backgroundColor","");
													$("#hobby").css("backgroundColor","");
													$("#neighbor").css("backgroundColor","");
													$("#Investment").css("backgroundColor","");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val(5);
												}
											})	
											
											$("#neighbor").click(()=>{
												if($("#neighbor").hasClass("orange")){
													$("#neighbor").removeClass("orange");
													$("#neighbor").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#neighbor").addClass("orange");
													$("#neighbor").css("backgroundColor","orange");
													$("#culture").css("backgroundColor","");
													$("#activity").css("backgroundColor","");
													$("#food").css("backgroundColor","");
													$("#hobby").css("backgroundColor","");
													$("#party").css("backgroundColor","");
													$("#Investment").css("backgroundColor","");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val(6);
												}
											})	
											
											$("#Investment").click(()=>{
												if($("#Investment").hasClass("orange")){
													$("#Investment").removeClass("orange");
													$("#Investment").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#Investment").addClass("orange");
													$("#Investment").css("backgroundColor","orange");
													$("#culture").css("backgroundColor","");
													$("#activity").css("backgroundColor","");
													$("#food").css("backgroundColor","");
													$("#hobby").css("backgroundColor","");
													$("#party").css("backgroundColor","");
													$("#neighbor").css("backgroundColor","");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val(7);
												}
											})	
											
											$("#foreign").click(()=>{
												if($("#foreign").hasClass("orange")){
													$("#foreign").removeClass("orange");
													$("#foreign").css("backgroundColor","");
													$("#clCategory").val("");
												}else{
													$("#foreign").addClass("orange");
													$("#foreign").css("backgroundColor","orange");
													$("#culture").css("backgroundColor","");
													$("#activity").css("backgroundColor","");
													$("#food").css("backgroundColor","");
													$("#hobby").css("backgroundColor","");
													$("#party").css("backgroundColor","");
													$("#neighbor").css("backgroundColor","");
													$("#Investment").css("backgroundColor","");
													$("#clCategory").val(8);
												}
											})	
										})
									</script>
									
									<hr>
									<h5>(소셜링, 클럽, 챌린지)정보를 입력할 차례에요!</h5>
									<div class="form-group">
										<input class="form-control" type="text" name="classTitle" placeholder="소셜링 제목을 작성해주세요!" style="color:white" value="${ c.classTitle }" required>
									</div>
									 <!-- 글자수체크 추가 -->
									<hr>
									
									<h5>소셜링을 소개해볼까요?</h5>
									<table style="margin: auto;">
										<tr>
											<td><img src="${ c.filePath }" id="contentImg1" class="contentImg1" onclick="chooseFile(1);"></td>
										</tr>
									</table>
									<div style="display:none">
										<input type="file" id="file1" name="upfile" onchange="loadImg(this, 1);" required>
									</div>
									
									<script>
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
													}
												}
											}else {
												switch(num){
				        						case 1 : $("#contentImg1").attr("src", null); break;
												}
											}
										}
									</script>
									
									<br>
									<textarea id="Content" style="display: none;">${c.classContent }</textarea>
								    <!-- TOAST UI Editor가 들어갈 div태그 -->
								    <div id="editor" style="margin: 0;"></div>
								    
								    <!-- TOAST UI Editor CDN URL(JS) -->
								    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
									
									<textarea id="editorContent" style="display: none;" name="classContent" required></textarea>
									
								    <!-- TOAST UI Editor 생성 JavaScript 코드 -->
								    <script>
								    
								    const ct = $("#Content").text();
								    
								        const editor = new toastui.Editor({
								            el: document.querySelector('#editor'),
								            previewStyle: 'tab',
								            height: '500px',
								            initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
								            initialValue: ct,     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
								            previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
								            language: 'ko',
								            hooks: {
										    	addImageBlobHook: (blob, callback) => {
										    		
										    		const formData = new FormData();
										        	formData.append('image', blob);
										        	
										  			let url = "";
										  			
										   			$.ajax({
										           		url: "content.do",
										           		type: 'POST',
										           		enctype: 'multipart/form-data',
										           		data: formData,
										           		dataType: 'json',
										           		processData: false,
										           		contentType: false,
										           		cache: false,
										           		timeout: 600000,
										           		success: function(data) {
										           			// console.log(data);
										           			url = data.url;
										           			
										           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
										        			// 형식 : ![대체 텍스트](주소)
										           			callback(url, "사진 대체 텍스트 입력");
										           		},
										           		error: function(e) {
										           			//console.log('ajax 이미지 업로드 실패');
										           			//console.log(e.abort([statusText]));
										           			callback(e, '사진 대체 텍스트 입력');
										           		}
										           	});
										    	}
										    }
								        });
											
								        /*
								        // editor.getHtml()을 사용해서 에디터 내용 받아오기
								        see1 = function() {
								            console.log(editor.getHTML());
								        }
								        see2 = function() {
								            console.log(editor.getMarkdown());
								        }
								        */
								        
								        $(function(){
								        	$("#editor").keyup(function(){
								        		let classContent = editor.getHTML().replace(/<p>/g, "").replace(/<\/p>/g, "\n");
								        		$("#editorContent").val(classContent);
								        		// console.log($("#editorContent").val())
								        		// console.log($("#editor").val());
								        		String.prototype.getBytes = function() {
												    const contents = this;
												    let str_character;
												    let int_char_count = 0;
												    let int_contents_length = contents.length;
												
												    for (k = 0; k < int_contents_length; k++) {
												        str_character = contents.charAt(k);
												        if (escape(str_character).length > 4)
												            int_char_count += 3;
												        else
												            int_char_count++;
												    }
												    return int_char_count;
												}
								        		
								        		const test = $("#editorContent").val();
								        		console.log(test.getBytes() + "Byte");
								        		
								        		if(test.getBytes() >= 4000){
								        			alert("입력가능한 글자수가 넘었습니다.");
								        			str = test.substr(0, test.length - 1);
								        			$("#editorContent").val(str);
								        			
								        		}
								        	})
								        })
								    </script>
									
									<br>
									
									<h5>언제 만날까요?</h5>
									
									<div class="classTime">
										<div class="form-group">
											<input type="date" id="classDate" name="classDate" class="form-control" value="${ c.classDate }" style="color: white;">
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<input type="time" id="classTime" name="classTime" class="form-control" value="${ c.classTime }" style="color: white;">										
										</div>
									</div>
									
									<script>
										$("#classDate").change(function(){
											$(this).css("color", "orange");
										})
										
										$("#classTime").change(function(){
											$(this).css("color", "orange");
										})
									</script>
									
									<h5>어디서 만날까요?</h5>
									<div class="choiseMap">
										<div class="form-group">
											<div class="form-control" id="offLine" style="color: white;">오프라인</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="onLine" style="color: white;">온라인</div>
										</div>
									</div>
									
									<script>
										$(function(){
											$("#offLine").click(function(){
												if($("#offLine").hasClass("orange")){
													$("#offLine").removeClass("orange");
													$("#offLine").css("backgroundColor","");
													$("#hiddenMap").addClass("hiddenMap");
												}else{
													$("#offLine").addClass("orange");
													$("#offLine").css("backgroundColor","orange");
													$("#onLine").css("backgroundColor","");
													$("#hiddenMap").removeClass("hiddenMap");
												}
											})
											
											$("#onLine").click(function(){
												if($("#onLine").hasClass("orange")){
													$("#onLine").removeClass("orange");
													$("#onLine").css("backgroundColor","");
													$("#hiddenMap").addClass("hiddenMap");
												}else{
													$("#onLine").addClass("orange");
													$("#onLine").css("backgroundColor","orange");
													$("#offLine").css("backgroundColor","");
													$("#hiddenMap").addClass("hiddenMap");
												}
											})
										})
									</script>
									
									<br>
									
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c08fb064e6bc40cfa573768b020756&libraries=services"></script>
									
									<div class="hiddenMap" id="hiddenMap">
									<div class="map_wrap">
									    <div id="menu_wrap" class="bg_white">
									        <ul id="placesList"></ul>
									        <div id="pagination"></div>
									    </div>
										<div style="float: right;">
											<div id="map" style="width:400px;height:400px;"></div>
										</div>
									</div>
									<br>
				                    키워드 : <input type="text" value="서울" id="keyword" size="15" name="classLocation" placeholder="키워드"> 
				                    <button id="search" type="button" onclick="searchPlaces(); return false;">검색하기</button> 
									</div>
									
									<input type="hidden" name="latitude" id="latitude"> <!-- 위도 -->
									<input type="hidden" name="longitude" id="longitude"> <!-- 경도 -->
									<input type="hidden" name="placeId" id="placeId"> <!-- 장소 ID 값 -->
									
									<script>
									$(function(){
										$("#offLine").click(function(){
											 map.relayout();
										})
									})
									
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
											var	placeId = places[i].id
												
								            	console.log(placeId);
									            
									        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
									        // LatLngBounds 객체에 좌표를 추가합니다
									        bounds.extend(placePosition);
									            
									        // 마커와 검색결과 항목에 mouseover 했을때
									        // 해당 장소에 인포윈도우에 장소명을 표시합니다
									        // mouseout 했을 때는 인포윈도우를 닫습니다
									        (function(marker, title, placeId) {
									            kakao.maps.event.addListener(marker, 'click', function() {
									            	map.setCenter(marker.getPosition());
									            	$(this).addClass("addorange");
									            	$(this).siblings().removeClass("addorange");
									            										            	
									            	console.log("----pa----");
									            	console.log(placeId);

									                $("#latitude").val(marker.getPosition().getLat()); // 위도 값 저장
									                $("#longitude").val(marker.getPosition().getLng()); // 경도 값 저장
									                $("#placeId").val(placeId); // 위치장소 id 값 저장
									                
									            });
									            
									            itemEl.onclick = function(){
									            	map.setCenter(marker.getPosition());
									                $("#latitude").val(marker.getPosition().getLat()); // 위도 값 저장
									                $("#longitude").val(marker.getPosition().getLng()); // 경도 값 저장
									                $("#placeId").val(placeId); // 위치장소 id 값 저장
													
									            	if($(this).hasClass("addorange")){
									            		$(this).removeClass("addorange");
									            	}else{
									            		$(this).addClass("addorange");
									            	}
									            	$(this).siblings().removeClass("addorange");
									            }
									            
									        })(marker, places[i], placeId);
									
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
									</script>
									<hr>
									<br>
									
									<h5>어떻게 멤버를 모집할까요?</h5>									
									<div class="classApproval">
										<div class="form-group">
											<div class="form-control" id="approval" style="color: white;">승인제</div>
										</div> &nbsp;&nbsp;
										<div class="form-group">
											<div class="form-control" id="First-come" style="color: white;">선착순</div>
										</div>
									</div>
									
									<input type="text" style="display:none;" id="classApproval" name="classApproval" required>
									
									<script>
											$("#approval").click(function(){
												$("#classApproval").val('Y');
												if($("#approval").hasClass("orange")){
													$("#approval").removeClass("orange");
													$("#approval").css("backgroundColor","");
													$("#classApproval").val('');
												}else{
													$("#approval").addClass("orange");
													$("#approval").css("backgroundColor","orange");
													$("#First-come").css("backgroundColor","");
												}
												console.log($("#classApproval").val());
											})
											
											$("#First-come").click(function(){
												$("#classApproval").val('N');
												if($("#First-come").hasClass("orange")){
													$("#First-come").removeClass("orange");
													$("#First-come").css("backgroundColor","");
													$("#classApproval").val('');
												}else{
													$("#First-come").addClass("orange");
													$("#First-come").css("backgroundColor","orange");
													$("#approval").css("backgroundColor","");
												}
												console.log($("#classApproval").val());
											})
									</script>
									
									<hr>
									
									<div id="remove">
										나이제한이 필요하시면 버튼을 클릭해주세요 <br>
										<button type="button" id="ageLimit">나이제한</button>
									</div>
									
									<br>
									
									<script>
										$("#ageLimit").click(function(){
											$("#remove").remove();
											$("#ageLimitDiv").removeClass("display");
											$("#submitbtn").attr("disabled", true);
											$("#submitbtn").removeClass("submitbtn");
										})
									</script>
									
									<!-- 양방향 range -->
									<div id="ageLimitDiv" class="display">
										<div class="middle">
										  <div class="multi-range-slider">
											<input type="range" id="age1" class="form-control" min="20" max="70" step="5" name="minAge" style="color:white" value="25" placeholder="최소나이제한">
											<input type="range" id="age2" class="form-control" min="20" max="70" step="5" name="maxAge" style="color:white" value="65" placeholder="최대나이제한">
											
										    <!-- 커스텀 슬라이더 -->
										    <div class="slider">
										      <div class="track"></div>
										      <div class="range"></div>
										      <div class="thumbl"></div>
										      <div class="thumbr"></div>
										    </div>
										  </div>
										</div>
									</div>
									
									<script>
										const inputLeft = document.getElementById("age1");
										const inputRight = document.getElementById("age2");
										
										const thumbLeft = document.querySelector(".slider>.thumbl");
										const thumbRight = document.querySelector(".slider>.thumbr");
										const range = document.querySelector(".slider > .range");

										const setLeftValue = () => {
										  const _this = inputLeft;
										  const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
										  
										  _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 5);
										  
										  // input, thumb 같이 움직이도록
										  const percent = ((_this.value - min) / (max - min)) * 100;
										  thumbLeft.style.left = percent + "%";
										  range.style.left = percent + "%";
										};

										const setRightValue = () => {
										  const _this = inputRight;
										  const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
										  
										  _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 5);
										  
										  // input, thumb 같이 움직이도록
										  const percent = ((_this.value - min) / (max - min)) * 100;
										  thumbRight.style.right = 100 - percent + "%";
										  range.style.right = 100 - percent + "%";
										};

										inputLeft.addEventListener("input", setLeftValue);
										inputRight.addEventListener("input", setRightValue);
										
										$("#age1").change(function(){
											$("#ageText").removeClass("display");
											$("#minAgeText").html($("#age1").val());
											$("#maxAgeText").html($("#age2").val());
											$("#submitbtn").attr("disabled", false);
											$("#submitbtn").addClass("submitbtn");
										})
										
										$("#age2").change(function(){
											$("#ageText").removeClass("display");
											$("#minAgeText").html($("#age1").val());
											$("#maxAgeText").html($("#age2").val());
											$("#submitbtn").attr("disabled", false);
											$("#submitbtn").addClass("submitbtn");
										})
									</script>
									
									<br>
									
									<div class="display" id="ageText">
										<div class="ageLimit">
											<div class="form-group">
												최소 나이<div class="form-control" id="minAgeText" style="color: orange; font-size: 15px;"></div>
											</div> &nbsp;&nbsp;
											<div class="form-group">
												최대 나이<div class="form-control" id="maxAgeText" style="color: orange; font-size: 15px;"></div>
											</div>
										</div>
									</div>
																		
									<br><br>
									
									<div class="form-group">
										<input class="form-control" type="number" name="classPrice" placeholder="참가비가 없다면 0을 입력해주세요." style="color:white" value="${ c.classPrice }">
									</div>
									<div class="form-group">
										<input class="form-control" type="number" name="peopleLimit" placeholder="참가 인원수를 선택해주세요." style="color:white" value="${ c.peopleLimit }">
									</div>
									
									<c:choose>
										<c:when test="${ not empty loginMember }">
											<input type="submit" id="submitbtn" class="submitbtn" value="수정하기">
										</c:when>
										<c:otherwise>
											<input type="submit" id="submitbtn" value="수정하기" disabled>
										</c:otherwise>
									</c:choose>
								</form>		
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Hero end-->
	</div>
	<!-- Wrapper end-->
	<!-- To top button--><a class="scroll-top" href="#top"><span class="fa fa-angle-up"></span></a>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	
</body>
</html>