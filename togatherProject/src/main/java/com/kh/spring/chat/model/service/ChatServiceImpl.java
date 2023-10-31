package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.chat.model.dao.ChatDao;
import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDao chatDao ;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//채팅방있는지 확인
	@Override
	public ArrayList<ChatRoom> checkChatRoom(String memNo) {
		return chatDao.checkChatRoom(sqlSession , memNo);
	}

	//채팅 리스트 가져오기 
	@Override
	public ArrayList<Chat> selectChatList(String chatRoomNo){
		return chatDao.selectChatList(sqlSession,chatRoomNo );
	}
	
	//채팅방 만들기1
	@Override
	public int createChatRoom(String memNo) {
		return chatDao.createChatRoom(sqlSession, memNo);
	}

	//채팅방만들기2
	@Override
	public int createChatRoom2(String memNo) {
		return chatDao.createChatRoom2(sqlSession, memNo);
	}
	
	//채팅입력
	@Override
	public int chatInput(Chat ch) {
		return chatDao.chatInput(sqlSession , ch);
	}


	
}
