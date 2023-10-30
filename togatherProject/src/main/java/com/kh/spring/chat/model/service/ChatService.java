package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ChatRoom;

public interface ChatService {
	//채팅방이 있는지 없는지 검사
	ArrayList<ChatRoom> checkChatRoom(String memNo);
	//채팅방이 없으면 채팅방 만들기
	
	//채팅 리스트 가져오기
	ArrayList<Chat> selectChatList(String chatRoomNo);
}
