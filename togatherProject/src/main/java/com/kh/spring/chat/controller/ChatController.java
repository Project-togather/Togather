package com.kh.spring.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.chat.model.service.ChatServiceImpl;
import com.kh.spring.chat.model.vo.ChatRoom;
import com.kh.spring.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatServiceImpl chatService ; 
	
	
	//채팅창 입장
	@RequestMapping(value = "chat.ch")
	public String moveChatForm(HttpSession session ,  String targetNo) {
		System.out.println("시발 뭐지");
		//먼저 방이 있나없나 봐야함 
		//채팅방이 없으면 채팅방 테이블에 추가를 해줘야함
		//있으면 여기 단계 생략하고 바로 불러오기 해야겠지
		//채팅방이 있는지 없는지 검사는 채팅보내는 사람 의 채팅방번호 select + 채팅받는사람의 채팅방번호 select 한값이 2가 되어야함
		String memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		System.out.println("시발 뭐지2");
		System.out.println("너냐? +"  memNo);
		System.out.println("시발 뭐지3");
		System.out.println(targetNo);
		//hash쓰기 귀찮은데 걍 두번 왔다갔다 해서 결과값곱해서 1인걸로 하자
 		
		ArrayList<ChatRoom> cr1 = chatService.checkChatRoom(memNo); //일단 내 정보
		ArrayList<ChatRoom> cr2 = chatService.checkChatRoom(targetNo); //그 다음 상대 정보
		//탐색을 잘해봐서 곂치는 방번호가 있나봐야함
		
		
		for (int i = 0; i < cr1.size() ; i ++) {
			System.out.println(cr1.get(i));
		}
		
		for (int i = 0; i < cr2.size() ; i ++) {
			System.out.println(cr2.get(i));
		}
		int count = 0 ; 
		System.out.println("넌 나와야지");
		for(int i = 0 ; i < cr1.size(); i++) {
			for(int j = 0 ; i < cr2.size() ; j ++) {
				if(cr1.get(i).getChatRoomNo().equals(cr2.get(j).getChatRoomNo())) {
					System.out.println("곂치는거 : " + cr1.get(i).getChatRoomNo()  + cr2.get(j).getChatRoomNo() );
					count ++ ; 
				}
			}
		}
		System.out.println(count);
		
		
		//채팅방 불러오기
		
		
		//채팅리스트 set해서 보내자
		return "common/chat";
	}
}
