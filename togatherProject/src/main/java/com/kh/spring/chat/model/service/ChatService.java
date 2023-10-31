package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ChatRoom;

public interface ChatService {
	//채팅방이 있는지 없는지 검사
	ArrayList<ChatRoom> checkChatRoom(String memNo);
	//채팅방이 없으면 채팅방 만들기
	int createChatRoom(String memNo);
	//동시에 두개 못넣어서 하나 더 해줘야함 curval 쓰려면..
	int createChatRoom2(String memNo);
	
	
	//채팅 리스트 가져오기
	ArrayList<Chat> selectChatList(String chatRoomNo);
	
	//채팅 입력
	int chatInput(Chat ch);
}
