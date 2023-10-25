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
.clCategorydiv, .classApproval, .choiseMap{
	display: inline-flex;
	flex-direction: row;
	justify-content: space-around;
}

.clCategorydiv div{
	width: 130px;
	height: 50px;
}

 .classApproval div, .choiseMap div{
 	width: 200px;
	height: 50px;
 }

.form-group:hover{ cursor: pointer;}
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
								<form action="enroll.cl" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<input type="hidden" name="memNo" value="${ loginMember.memNo }">
										<h5>모임유형을 선택해주세요!</h5>
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
									<div class="form-group">
										<div class="form-control" id="oneday" style="color: white;">원데이</div>
									</div>
									
									<!-- 사업자 등록증 -->
									<div class="hiddenBusiness" id="hiddenBusiness">
										<div class="form-group">
											<input class="form-control" type="text" id="business" style="color: white;" placeholder="사업자번호를 입력해주세요">
											<div id="verification"></div>
										</div>
									</div>
									
									<script>
										$(function(){
											$("#business").keyup(function(){
												var businessNum = $("#business").val()
												var data = {
													    b_no: [businessNum]
													   }; 
												$.ajax({
													  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=6XpkUEJDu71bRIhw1wGcWoIAAgK8quJ0dx8ZLuYoj4h1LwPhtwnVd%2BZrZQjPhEJJgUEVnwr2avsIeJJIBOClpg%3D%3D",
													  type: "POST",
													  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
													  dataType: "JSON",
													  contentType: "application/json",
													  accept: "application/json",
													  success: function(result) {
													      $("#verification").html(result.data[0].tax_type);
													      if(result.data[0].tax_type == "국세청에 등록되지 않은 사업자등록번호입니다."){
													    	  $("#submitbtn").attr("disabled", true);
													    	  $("#submitbtn").removeClass("submitbtn");
													      }else{
													          $("#submitbtn").attr("disabled", false);
													          $("#submitbtn").addClass("submitbtn");
													      }
													  },
													  error: function(result) {
													      console.log(result.responseText); //responseText의 에러메세지 확인
													  }
													})
												})
											})
									</script>
									
									<input type="hidden" id="clType" name="clType">
										
									<script>
										// 모임 유형 선택 (div)시 다른 div 체크해제 + 히든에 값주기
										$("#socialing").click(function(){
											if($("#club").css("display") != "none"){
												$("#club").css("display", "none");
												$("#challenge").css("display", "none");
												$("#oneday").css("display", "none");
												
												$("#socialing").css("backgroundColor", "orange");
												$("#clType").val(1);
											}else{
												$("#club").css("display", "");
												$("#challenge").css("display", "");
												$("#oneday").css("display", "");
												
												$("#socialing").css("backgroundColor", "");
												$("#clType").val(0);
											}
										})
										
										$("#club").click(function(){
											if($("#socialing").css("display") != "none"){
												$("#socialing").css("display", "none");
												$("#challenge").css("display", "none");
												$("#oneday").css("display", "none");
												
												$("#club").css("backgroundColor", "green");
												$("#clType").val(2);
											}else{
												$("#socialing").css("display", "");
												$("#challenge").css("display", "");
												$("#oneday").css("display", "");
												
												$("#club").css("backgroundColor", "");
												$("#clType").val(0);
											}
										})
										
										$("#challenge").click(function(){
											if($("#socialing").css("display") != "none"){
												$("#socialing").css("display", "none");
												$("#club").css("display", "none");
												$("#oneday").css("display", "none");
												
												$("#challenge").css("backgroundColor", "blue");
												$("#clType").val(3);
											}else{
												$("#socialing").css("display", "");
												$("#club").css("display", "");
												$("#oneday").css("display", "");
												
												$("#challenge").css("backgroundColor", "");
												$("#clType").val(0);
											}
										})
										
										$("#oneday").click(function(){
											if($("#socialing").css("display") != "none"){
												$("#socialing").css("display", "none");
												$("#club").css("display", "none");
												$("#challenge").css("display", "none");
												
												$("#oneday").css("backgroundColor", "purple");
												$("#clType").val(4);
												
												if($("#hiddenBusiness").hasClass("hiddenBusiness")){
													$("#hiddenBusiness").removeClass("hiddenBusiness");
												}
											}else{
												$("#socialing").css("display", "");
												$("#club").css("display", "");
												$("#challenge").css("display", "");
												$("#business").val("");
												$("#verification").html("");
												
												$("#hiddenBusiness").addClass("hiddenBusiness");
												$("#oneday").css("backgroundColor", "");
												$("#clType").val(0);
											}
										})
									</script> 
									 
									<hr>
									<br>
									
									<h5>(소셜링, 클럽, 챌린지)주제를 선택해 볼까요?</h5>
									
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
								
									<input type="hidden" name="clCategory" id="clCategory">
									
									<br>
									
									<script>
										$(function() {
											$("#culture").click(()=>{
												if($("#culture").hasClass("orange")){
													$("#culture").removeClass("orange");
													$("#culture").css("backgroundColor","");
													$("#clCategory").val(0);
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
													$("#clCategory").val(0);
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
													$("#clCategory").val(0);
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
													$("#clCategory").val(0);
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
													$("#clCategory").val(0);
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
													$("#clCategory").val(0);
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
													$("#clCategory").val(0);
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
													$("#clCategory").val(0);
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
										<input class="form-control" type="text" name="classTitle" placeholder="소셜링 제목을 작성해주세요!" style="color:white"> <!-- 글자수체크 추가 -->
									</div>
									
									<hr>
									
									<h5>소셜링을 소개해볼까요?</h5>
									<table style="margin: auto;">
										<tr>
											<td><img id="contentImg1" class="contentImg1" onclick="chooseFile(1);"></td>
										</tr>
									</table>
									<div style="display:none">
										<input type="file" id="file1" name="upfile" onchange="loadImg(this, 1);">
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
									
								    <!-- TOAST UI Editor가 들어갈 div태그 -->
								    <div id="editor" style="margin: 0;"></div>
								    
								    <!-- TOAST UI Editor CDN URL(JS) -->
								    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
									
									<textarea id="editorContent" style="display: none;" name="classContent"></textarea>
									
								    <!-- TOAST UI Editor 생성 JavaScript 코드 -->
								    <script>
								        const editor = new toastui.Editor({
								            el: document.querySelector('#editor'),
								            previewStyle: 'tab',
								            height: '500px',
								            initialValue: '안녕하세요. METASTAR입니다.',
								            initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
								            initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
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
										           			callback(url, "");
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
								        		console.log($("#editorContent").val())
								        		console.log($("#editor").val());
								        	})
								        })
								    </script>
									
									<br>
									
									<h5>언제 만날까요?</h5>
									<div class="form-group">
										<input type="date" name="classDate">
										<input type="time" name="classTime">
									</div>
																		
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
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c08fb064e6bc40cfa573768b020756&libraries=services"></script>
									
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
									            
									        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
									        // LatLngBounds 객체에 좌표를 추가합니다
									        bounds.extend(placePosition);
									            
									        // 마커와 검색결과 항목에 mouseover 했을때
									        // 해당 장소에 인포윈도우에 장소명을 표시합니다
									        // mouseout 했을 때는 인포윈도우를 닫습니다
									        (function(marker, title) {
									            kakao.maps.event.addListener(marker, 'click', function() {
									            	map.setCenter(marker.getPosition());
									            	$(this).addClass("addorange");
									            	$(this).siblings().removeClass("addorange");

									                $("#latitude").val(marker.getPosition().getLat()); // 위도 값 저장
									                $("#longitude").val(marker.getPosition().getLng()); // 경도 값 저장
									                
									            });
									            
									            itemEl.onclick = function(){
									            	map.setCenter(marker.getPosition());
									                $("#latitude").val(marker.getPosition().getLat()); // 위도 값 저장
									                $("#longitude").val(marker.getPosition().getLng()); // 경도 값 저장
													
									            	if($(this).hasClass("addorange")){
									            		$(this).removeClass("addorange");
									            	}else{
									            		$(this).addClass("addorange");
									            	}
									            	$(this).siblings().removeClass("addorange");
									            }
									            
									        })(marker, places[i]);
									
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
									
									<input type="hidden" id="classApproval" name="classApproval">
									
									<script>
										$(function(){
											$("#approval").click(function(){
												if($("#approval").hasClass("orange")){
													$("#approval").removeClass("orange");
													$("#approval").css("backgroundColor","");
												}else{
													$("#approval").addClass("orange");
													$("#approval").css("backgroundColor","orange");
													$("#First-come").css("backgroundColor","");
												}
											})
											
											$("#First-come").click(function(){
												if($("#First-come").hasClass("orange")){
													$("#First-come").removeClass("orange");
													$("#First-come").css("backgroundColor","");
												}else{
													$("#First-come").addClass("orange");
													$("#First-come").css("backgroundColor","orange");
													$("#approval").css("backgroundColor","");
												}
											})
										})
									</script>
									
									<hr>
									
									<div id="remove">
										나이제한이 필요하시면 버튼을 클릭해주세요 <br>
										<button type="button" id="ageLimit">나이제한</button>
									</div>
									<script>
										$("#ageLimit").click(function(){
											$("#age1").attr("type", "number");
											$("#age2").attr("type", "number");
											$("#remove").remove();
										})
									</script>							
									<div class="form-group">
										<input type="hidden" id="age1" class="form-control" name="minAge" style="color:white" value="0" placeholder="최소나이제한"> <br>
										<input type="hidden" id="age2" class="form-control" name="maxAge" style="color:white" value="0" placeholder="최대나이제한">
									</div>
									
									<div class="form-group">
										<input class="form-control" type="number" name="classPrice" placeholder="참가비가 없다면 0을 입력해주세요." style="color:white">
									</div>
									<div class="form-group">
										<input class="form-control" type="number" name="peopleLimit" placeholder="참가 인원수를 선택해주세요." style="color:white">
									</div>
			
									<input type="submit" id="submitbtn" class="submitbtn" value="모임등록">
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