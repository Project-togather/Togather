package com.kh.spring.chat.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.chat.model.service.ChatServiceImpl;
import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ChatRoom;
import com.kh.spring.member.model.service.MemberServiceImpl;
import com.kh.spring.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatServiceImpl chatService ; 
	
	@Autowired 
	private MemberServiceImpl mService;
	
	
	//채팅창 입장
	@RequestMapping(value = "chat.ch")
	public String moveChatForm(HttpSession session ,  String targetNo , HttpServletRequest request) {
		
		//먼저 방이 있나없나 봐야함 
		//채팅방이 없으면 채팅방 테이블에 추가를 해줘야함
		//있으면 여기 단계 생략하고 바로 불러오기 해야겠지
		//채팅방이 있는지 없는지 검사는 채팅보내는 사람 의 채팅방번호 select + 채팅받는사람의 채팅방번호 select 한값이 2가 되어야함
		String memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		//System.out.println(memNo);
		
		//System.out.println(targetNo);
		//hash쓰기 귀찮은데 걍 두번 왔다갔다 해서 결과값곱해서 1인걸로 하자
 		
		ArrayList<ChatRoom> cr1 = chatService.checkChatRoom(memNo); //일단 내 정보
		ArrayList<ChatRoom> cr2 = chatService.checkChatRoom(targetNo); //그 다음 상대 정보
		//탐색을 잘해봐서 곂치는 방번호가 있나봐야함
		
		//System.out.println(cr1);
		//System.out.println(cr2);
		
//		for (int i = 0; i < cr1.size() ; i ++) {
//			System.out.println("cr1" +  cr1.get(i));
//		}
//		
//		for (int i = 0; i < cr2.size() ; i ++) {
//			System.out.println("cr2" + cr2.get(i));
//		}
		int count = 0 ; 
		String chatRoomNo = "";
		//System.out.println("여까지 오나확인");
		
		
		//만약에 채팅방이 아무것도 없는 유저일수도 있으니 분기처리는 해야겠다
		if(cr1 != null && cr2 != null) {
		for(int i = 0 ; i < cr1.size(); i++) {
			
				for(int j = 0 ; j < cr2.size() ; j ++) {
				
					if(cr1.get(i).getChatRoomNo().equals(cr2.get(j).getChatRoomNo())) {
						//System.out.println(i + "  "  + j);
						//System.out.println("곂치는거 : " + cr1.get(i).getChatRoomNo()  + cr2.get(j).getChatRoomNo() );
						chatRoomNo = cr1.get(i).getChatRoomNo();
						count ++ ; 
					}
				}
			}
			System.out.println("이미 둘은 채팅 기록이 있음 ");
			System.out.println(chatRoomNo); //count 는 무조건 1 나옴
		}
		//채팅에쓰일 사진 세팅
		//내 사진은 세션에서 뺴다 쓸거고 타겟 사진만 가져오자
		Attachment targetImgat = mService.getProfileImg(targetNo);
		String targetImg = targetImgat.getFilePath();
		
		System.out.println(targetImg);
		
		request.setAttribute("targetImg", targetImg);
		
		
		//채팅방 불러오기
		if(count != 0 ) { //채팅방이 이미 존재 할경우엔 채팅 리스트를 불러와야겠지
			//System.out.println("chatRoomNo 로 DB가자" + chatRoomNo);
			ArrayList<Chat> chatList = chatService.selectChatList(chatRoomNo);
//			for(int i = 0 ; i < chatList.size() ; i++) {
//				System.out.println(chatList.get(i));
//			}
			//채팅리스트 set해주자 왜함 ajax처리 할꺼여
			//request.setAttribute("chatList", chatList);
			//채팅방번호도 set 이건 따로 db다녀올 필요 없이 그냥 방번호 저장되어 있는거 가져오면 되겠군
			//아까 꺼내놨었네 55번쨰 줄
			request.setAttribute("chatRoomNo", chatRoomNo);
			
			System.out.println("이미 둘은 채팅 기록이 있고 채팅 내용은 " + chatList + "(주소값)이고 채팅방은 " + chatRoomNo);
			return "common/chat";
			
		}else {//채팅방이 없어? 그럼 채팅방부터 만들어줘야지 
			int createChatRoom = chatService.createChatRoom(memNo);
			int createChatRoom2 = chatService.createChatRoom2(targetNo);
			//방금 만든 채팅방 번호 가져와야함
			//아까 위에 해둔거 가져오면 될듯?? .. 아 리팩토링 마렵네
			//위에서 잘 만들었으니까 잘 가녀오면 되겠네
			ArrayList<ChatRoom> cr3 = chatService.checkChatRoom(memNo); //일단 내 정보
			ArrayList<ChatRoom> cr4 = chatService.checkChatRoom(targetNo); //그 다음 상대 정보
			for(int i = 0 ; i < cr3.size(); i++) { //방금 집
				
				for(int j = 0 ; j < cr4.size() ; j ++) {
				
					if(cr3.get(i).getChatRoomNo().equals(cr4.get(j).getChatRoomNo())) {
						//System.out.println(i + "  "  + j);
						//System.out.println("곂치는거 : " + cr1.get(i).getChatRoomNo()  + cr2.get(j).getChatRoomNo() );
						chatRoomNo = cr3.get(i).getChatRoomNo();
						count ++ ; 
					}
				}
			}
			System.out.println("둘은 처음 보는 사이야 새로운 채팅방" + chatRoomNo );
			request.setAttribute("chatRoomNo", chatRoomNo);
			return "common/chat";
		}
	}
	
	
	//채팅입력하고 DB에 넣기 
	@ResponseBody
	@RequestMapping(value = "chatInput.ch" , produces = "text/html ; charset =UTF-8 ")
	public String chatInput(Chat ch ,HttpSession session) {
		//System.out.println("첨부파일 아직 안합쳐짐"+ ch);
		String img =  (String)session.getAttribute("chattingFilePath");
		ch.setImg(img); //세션에서 첨부파일 합치고 
		//세션에서 chattingFilePath 는 지워주자
		session.removeAttribute("chattingFilePath");
		//System.out.println("첨부파일 합쳐짐"+ ch);
		int result = chatService.chatInput(ch);
		if(result != 0) {
			return "채팅작성성공";
		}else {
			return "채팅작성 실패";
		}
	}
	
	
	//채팅 파일첨부
	@ResponseBody
	@RequestMapping(value = "chatInputFile.ch", produces = "text/html ; charset =UTF-8 ")
	public String chatFileInput(MultipartFile[] chatImg , HttpSession session) {
		if(chatImg != null) {
			if (!chatImg[0].getOriginalFilename().equals("")) {
				String changeName = "";
				String originName = chatImg[0].getOriginalFilename();
				String filePath = "";
	
				changeName = saveFile(chatImg[0], session);
				filePath = "resources/uploadFiles/" + changeName;
				// System.out.println(filePath);
				session.setAttribute("chattingFilePath", filePath);
	
			}
			return "파일첨부 성공";
		}
		return "파일첨부 없음";
	}
	
	
	
	//채팅조회
	@ResponseBody
	@RequestMapping(value = "selectChatList.ch" ,produces = "application/json ; charset =UTF-8 " )
	public ArrayList<Chat> selectChatList(String chatRoomNo){
		ArrayList<Chat> chatList = chatService.selectChatList(chatRoomNo);
	
		//System.out.println(chatList);
		return chatList;
	}
	
	
	
	//파일저장 리팩토링 메서드
	public String saveFile(MultipartFile chatImg, HttpSession session) { //리팩토링1
		String originName = chatImg.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);//5자리 랜덤값
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ ranNum + ext ; //새로운 이름
		//업로드 시키고자 하는 폴더의 물리적 경로를 알아내보자
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");

		try {
			chatImg.transferTo(new File(savePath + changeName)); //io 라서 예외처리 실제 저장하는중
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return changeName;
	}
	
}
