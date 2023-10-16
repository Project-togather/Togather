<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
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
	</head>
	<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

		<!-- Preloader-->
		<div class="page-loader">
			<div class="loader"></div>
		</div>
		<!-- Preloader end-->

		<!-- Wrapper-->
		<div class="wrapper">

			<!-- Hero-->
			<section class="module-cover fullscreen parallax" data-background="assets/images/clients/logo-1.png" data-overlay="0.7">
				<div class="container">
					<div class="row">
						<div class="col-md-4 m-auto">
							<div class="text-center">
								<div class="up-as">
									<h5>Create a new account</h5>
								</div>
								<div class="up-form">
									<form action="insertMember.me" method="post" enctype="multipart/form-data">
										<div class="form-group">
											<input class="form-control" id="idInput" name="memId" type="text" placeholder="Id" style="color: white;">
										</div>
										<div id="checkResult">
											
										</div>
										<div class="form-group">
											<input class="form-control" name="memName" type="text" placeholder="Name" style="color: white;">
										</div>
										<div class="form-group">
											<input class="form-control" name="email" type="email" placeholder="Email" style="color: white;">
										</div>
										<div class="form-group">
											<input class="form-control" name="memPwd" type="password" placeholder="Pasword" style="color: white;">
										</div>
										<div class="form-group">
											<input class="form-control" type="password" placeholder="Confirm password" style="color: white;">
										</div>
										<div class="form-group">
											<input class="form-control" name="nickName" type="text" placeholder="nickName" style="color: white;">
										</div>
										<div class="form-group">
											<input class="form-control" name="phone" type="text" placeholder="phone" style="color: white;">
										</div>
										<div class="form-group">
											<input type='radio'
											       name='gender' 
											       value='F' 
											       />Female
											<input type='radio' 
											       name='gender' 
											       value='M' 
											       />Male
											<br>
											AGE
											<select name = "age">
												<c:forEach begin="10" end="60" step="1" var ="i">
												  <option value='${i}'>${i}</option>
											    </c:forEach>	  
											</select>
											 <th>프로필이미지</th>
							                    <td colspan="3" align="center">
							                        <img id = "titleImg" width="250" height="170" onclick="chooseFile(1);">
							                    </td>
							                      <div id="file-area" style = "display:none">
									                <input type="file" name="upfile" id = "file1" onchange ="loadImg(this,1)" required>
									             </div>
											
										</div>
										
										<div class="form-group">
											<button id="submitBtn" class="btn btn-block btn-round btn-brand" type="submit" disabled>Sign Up</button>
										</div>
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
			
			    <script>
    $(function(){
    	//아이디를 입력하는 input 요소 객체 변수에 담아두기
    	const $idInput = $("#idInput"); //
    	$idInput.keyup(function(){
    		//console.log($idInput.val());
    		//5글자 이상에서만
    		if($idInput.val().length >= 5){
    			$.ajax({
    				url: "idCheck.me",
    			   data: {checkId : $idInput.val()},
    			   success : function(result){
    				   if(result == "NNNNN"){//사용이 불가능한 상태
    					   // -> 빨간색 메세지 (사용불가능) 출력
    					   // -> 버튼 비활성화
    					   $("#checkResult").show();
    					   $("#checkResult").css("color", "red").text("중복된 아이디입니다");
    					   $("#submitBtn").attr("disalbled", true);
    				   }else{//사용이 가능한 상황
    					   $("#checkResult").show();
    					   $("#checkResult").css("color", "green").text("사용가능한 아이디입니다");
    					   $("#submitBtn").attr("disabled", false);
    				   }

    			   },
    			   error :function(){
    				   console.log("ajax 통신 실패요");
    			   }
    			})
    		}else{//5글자 미만인경우 버튼 비활성화
    			$("#checkResult").hide();
    			$("#enrollForm :submit").attr("disalbled", true);
    		}
    		
    		
    	})
    })
    
   			  function chooseFile(num){
            		$("#file"+num).click();
            	}
            	function loadImg(inputFile , num){
            		if (inputFile.files.length == 1){//파일이 선택된경우 => 파일읽어들여서 미리보기
            			
            			const reader = new FileReader();
            			reader.readAsDataURL(inputFile.files[0]);
            			//해당파일을 읽어들이는 순간 해당 파일만이 가지고 있는 url 을 부여해줌
            			//파일 읽어들이기가 완료가 되었다면 실행할 함수는?
            			reader.onload = function(e){
            			//e.target.result -> 읽어들인 파일의 고유한 url 이 들어가 있다	
            				switch (num){
                                case 1: $("#titleImg").attr("src",e.target.result);
                                break; 
                            }
            			}
            		}else{//파일이 빠졌을경우
                        switch (num){
                                case 1: $("#titleImg").attr("src",null);
                                break;
                            }
            		}
            		
            		
            		
            	}
    
    </script>
			
			
			
			
			
			
			
		<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="assets/js/plugins.min.js"></script>
		<script src="assets/js/custom.min.js"></script>
	</body>
</html>