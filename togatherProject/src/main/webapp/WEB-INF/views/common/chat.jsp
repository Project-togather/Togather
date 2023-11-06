<%@page import="java.util.Date"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!DOCTYPE html>
<html>
	<head>
		<title>Chat</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
     	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <style>

body,html{
    height: 100%;
    margin: 0;
    
    /*background: #7F7FD5;
   background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
    background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
    */
}

.chat{
    margin-top: auto;
    margin-bottom: auto;
}
.card{
    height: 680px;
    width : 500px;
    border-radius: 15px !important;
	
    background-color: rgba(0,0,0,0.4) !important;
	margin: auto;
    
}
.contacts_body{
    padding:  0.75rem 0 !important;
    overflow-y: auto;
    white-space: nowrap;
}
.msg_card_body{
    overflow-y: auto;
}
.card-header{
    border-radius: 15px 15px 0 0 !important;
    border-bottom: 0 !important;
}
.card-footer{
border-radius: 0 0 15px 15px !important;
    border-top: 0 !important;
}
.container{
    align-content: center;
}
.search{
    border-radius: 15px 0 0 15px !important;
    background-color: rgba(0,0,0,0.3) !important;
    border:0 !important;
    color:white !important;
}
.search:focus{
     box-shadow:none !important;
   outline:0px !important;
}
.type_msg{
    background-color: rgba(0,0,0,0.3) !important;
    border:0 !important;
    color:white !important;
    height: 60px !important;
    overflow-y: auto;
}
    .type_msg:focus{
     box-shadow:none !important;
   outline:0px !important;
}
.attach_btn{
border-radius: 15px 0 0 15px !important;
background-color: rgba(0,0,0,0.3) !important;
    border:0 !important;
    color: white !important;
    cursor: pointer;
}
.send_btn{
border-radius: 0 15px 15px 0 !important;
background-color: rgba(0,0,0,0.3) !important;
    border:0 !important;
    color: white !important;
    cursor: pointer;
}
.search_btn{
    border-radius: 0 15px 15px 0 !important;
    background-color: rgba(0,0,0,0.3) !important;
    border:0 !important;
    color: white !important;
    cursor: pointer;
}
.contacts{
    list-style: none;
    padding: 0;
}
.contacts li{
    width: 100% !important;
    padding: 5px 10px;
    margin-bottom: 15px !important;
}
.active{
    background-color: rgba(0,0,0,0.3);
}
.user_img{
    height: 70px;
    width: 70px;
    border:1.5px solid #f5f6fa;

}
.user_img_msg{
    height: 40px;
    width: 40px;
    border:1.5px solid #f5f6fa;

}
.img_cont{
    position: relative;
    height: 70px;
    width: 70px;
}
.img_cont_msg{
    height: 40px;
    width: 40px;
}
.online_icon{
position: absolute;
height: 15px;
width:15px;
background-color: #4cd137;
border-radius: 50%;
bottom: 0.2em;
right: 0.4em;
border:1.5px solid white;
}
.offline{
background-color: #c23616 !important;
}
.user_info{
margin-top: auto;
margin-bottom: auto;
margin-left: 15px;
}
.user_info span{
font-size: 20px;
color: white;
}
.user_info p{
font-size: 10px;
color: rgba(255,255,255,0.6);
}
.video_cam{
margin-left: 50px;
margin-top: 5px;
}
.video_cam span{
color: white;
font-size: 20px;
cursor: pointer;
margin-right: 20px;
}
.msg_cotainer{
margin-top: auto;
margin-bottom: auto;
margin-left: 10px;
border-radius: 25px;
background-color: #82ccdd;
padding: 10px;
position: relative;
}
.msg_cotainer_send{
margin-top: auto;
margin-bottom: auto;
margin-right: 10px;
border-radius: 25px;
background-color: #78e08f;
padding: 10px;
position: relative;
}
.msg_time{
position: absolute;
left: 0;
bottom: -15px;
color: rgba(255,255,255,0.5);
font-size: 10px;
}
.msg_time_send{
position: absolute;
right:0;
bottom: -15px;
color: rgba(255,255,255,0.5);
font-size: 10px;
}
.msg_head{
position: relative;
}
#action_menu_btn{
position: absolute;
right: 10px;
top: 10px;
color: white;
cursor: pointer;
font-size: 20px;
}
.action_menu{
z-index: 1;
position: absolute;
padding: 15px 0;
background-color: rgba(0,0,0,0.5);
color: white;
border-radius: 15px;
top: 30px;
right: 15px;
display: none;
}
.action_menu ul{
list-style: none;
padding: 0;
margin: 0;
}
.action_menu ul li{
width: 100%;
padding: 10px 15px;
margin-bottom: 5px;
}
.action_menu ul li i{
padding-right: 10px;

}
.action_menu ul li:hover{
cursor: pointer;
background-color: rgba(0,0,0,0.2);
}
@media(max-width: 576px){
.contacts_card{
margin-bottom: 15px !important;
}
}

     </style>   


	</head>
	<!--Coded With Love By Mutiullah Samim-->
	<body>
	
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
				
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="${targetImg}" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
									<span> 채팅 </span>						
								</div>

							</div>
							<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
						
						</div>
						<div class="card-body msg_card_body" id ="test1">
						
						
						
						<!--상대 메세지 볼때 -->
                            
                         <%-- 
							<div class="d-flex justify-content-start mb-4">

									<div class="img_cont_msg">
										<img src="" class="rounded-circle user_img_msg">
									</div>
									<div class="msg_cotainer">
										내용입력
										<span class="msg_time">시간입력</span>
									</div>
									
							</div>

                            <!-- 내 메세지 볼때-->
                            	
							<div class="d-flex justify-content-end mb-4" >
								<ul>
								<li>
									<img src="resources/uploadFiles/2023110103404994436.png" style="width: 200px; height: 200px;">
								</li>
								<li>
										<div class="msg_cotainer_send">
											내용입력내용입력내용입력내용입력내용입력
											<span class="msg_time_send">시간입력</span>
										</div>
										<div class="img_cont_msg">
											<img src="" class="rounded-circle user_img_msg">
										</div>
								</li>
								</ul>
							</div>

							<div class="d-flex justify-content-end mb-4">
								
									<div class="msg_cotainer_send">
										내용입력
										<span class="msg_time_send">시간입력</span>
									</div>
									<div class="img_cont_msg">
								        <img src="" class="rounded-circle user_img_msg">
									</div>
								
							</div>
							<div class="d-flex justify-content-end mb-4">
								
									<div class="msg_cotainer_send">
										내용입력
										<span class="msg_time_send">시간입력</span>
									</div>
									<div class="img_cont_msg">
								        <img src="" class="rounded-circle user_img_msg">
									</div>
								
							</div>
						--%>
						</div>	
						

							
							 
							

						





						<div class="card-footer">
							<div class="input-group">
								<div class="input-group-append">
									<span class="input-group-text attach_btn"><i class="fas fa-paperclip" onclick="chooseFile(1);"></i></span>
								</div>
									
										<div id="file-area" style = "display:none" >
											<input type="file" name="file1" id = "file1" onchange ="loadImg(this,1)">
										</div>
									<textarea id = "input-text" name="chatContent" class="form-control type_msg" placeholder="Type your message..."></textarea>
								<div class="input-group-append">
									<span class="input-group-text send_btn" onclick="inputChat()"><i class="fas fa-location-arrow"></i></span>
								</div>
								<img id = "chatImg" width="50" height="50" onclick="chooseFile(1);" style="display: none;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		
        <script>
        //파일첨부 관련 스크립트
        
        	function chooseFile(num){
            		$("#file"+num).click();
            	}
        	function loadImg(inputFile , num){
					$("#chatImg").css("display","block");
            		if (inputFile.files.length == 1){//파일이 선택된경우 => 파일읽어들여서 미리보기
            			
            			const reader = new FileReader();
            			reader.readAsDataURL(inputFile.files[0]);
            			reader.onload = function(e){
            				switch (num){
                                case 1: $("#chatImg").attr("src",e.target.result);
                                break; 
                            }
            			}
            		}else{//파일이 빠졌을경우
                        switch (num){
                                case 1: $("#chatImg").attr("src",null);
                                break;
                            }
            		}
            	}
        
        
        
        
        
        
        	//달러 펑션
			$(function(){
            
            setInterval (function(){
                  
                selectChat();
                },1000);
            
           	})
        
        	//채팅조회
			function selectChat(){
				//alert("채팅조회");
				console.log("채팅조회");
				  $.ajax({
					  url : "selectChatList.ch",
					  data : {chatRoomNo : '${chatRoomNo}'},
					  success : function(chatList){
						
							 
							let value = "";
							for(let i = 0 ; i<chatList.length ; i ++ ){
								if(chatList[i].chatWriter == '${loginMember.memNo}'){//내가친 메세지
									if(chatList[i].img == null){
											value += 
											  "<div class='d-flex justify-content-end mb-4'>"
											+"		<div class='msg_cotainer_send'>"
											+			chatList[i].chatContent 
											+"			<span class='msg_time_send'>" + chatList[i].createDate +"</span>"
											+"		</div>"
											+"			<div class='img_cont_msg'>"
											+"				<img src='${loginMember.img}' class='rounded-circle user_img_msg'>"	
											+"			</div>"
											+"</div>";
										}else{//내가친 메세지고 파일은 있을때
											value += 
											"<div class='d-flex justify-content-end mb-4' >"
										+"		<ul>"
										+"		<li>"
										+"			<img src='"+chatList[i].img +"'style='width: 200px; height: 200px;'>"
										+"		</li>"
										+"		<li>";
										if(chatList[i].chatContent !=null) {//내가 친 메세지고 파일은 있고 채팅도 있을때
											value += 
												"				<div class='msg_cotainer_send'>"
												+ chatList[i].chatContent 
												+"				<span class='msg_time_send'>"+chatList[i].createDate+"</span>"
												+"</div>"
										}					
											value+=			
										"		</li>"
										+"		</ul>"
										+"	</div>";
									}
									

								}else{
									if(chatList[i].img == null){
									value += 
										"<div class='d-flex justify-content-start mb-4'>"
									+"			<div class='img_cont_msg'>"
									+"			<img src='${targetImg}' class='rounded-circle user_img_msg'>"	
									+"			</div>"
									+"			<div class='msg_cotainer'>"	
									+				chatList[i].chatContent
									+"			<span class='msg_time'>" + chatList[i].createDate +"</span>"
									+"			</div>"
									+"	</div>";
									}else{
										value += 
											"<div class='d-flex justify-content-start mb-4'>"
										+"		<ul>"
										+"		<li>"
										+"			<img src='"+chatList[i].img +"'style='width: 200px; height: 200px;'>"
										+"		</li>"
										+"		<li>";
										if(chatList[i].chatContent !=null){
											value +=

											"				<div class='msg_cotainer'>"
											+		 			chatList[i].chatContent 
											+"					<span class='msg_time'>"+chatList[i].createDate+"</span>"
											+"				</div>";
										}
										value +=
										"		</li>"
										+"		</ul>"
										+"	</div>";
										
									}
									
								}
								
									
							}//for문끝
							
						  	$("#test1").html(value);
						  	//alert(value);
							
							
					 	 },error : function(){
						  console.log("채팅조회 통신 실패");
					  }
				  })
				  
				  
			}
        	
			 
        

			//채팅입력 (사진첨부) 이거 먼저 해서 세션에 띄워놓자
            function inputChat(){
            	var form = $('#file1')[0].files[0];
        		var formData = new FormData();
        		formData.append('chatImg', form);
               $.ajax({
            	   url : "chatInputFile.ch",
            	   data : formData,
            	    type : "POST",
            	    contentType: false,
    		        cache: false,
    		        timeout: 600000,
            	    processData: false,
            	   success : function(result){
            		   
            		   inputChat2();
            	   },
            	   error : function(){
            		   alert("통신 실패");
            	   }
               })
               $("#file1").val("");
               $("#chatImg").css("display","none");
            }
			
          //채팅글자 insert
            function inputChat2(){
            	 //alert($("#input-text").val());
               $.ajax({
            	   url : "chatInput.ch",
            	   data : {
            		   chatWriter :'${loginMember.memNo}',
            		   chatRoom : '${chatRoomNo}',
            		   chatContent :$("#input-text").val(),
            	   },
            	   success : function(result){
            		   selectChat();
            	   },
            	   error : function(){
            		   alert("통신 실패");
            	   }
               })
               $("#input-text").val("");
            }  
               
             
         

        </script>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</html>
