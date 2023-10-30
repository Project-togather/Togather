package com.kh.spring.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {
	
	//채팅방있는지 확인
	public ArrayList<ChatRoom> checkChatRoom(SqlSessionTemplate sqlSession, String memNo){
		return (ArrayList)sqlSession.selectList("chatMapper.checkChatRoom", memNo);
	}
	//채팅방이 있으면 채팅 기록 가져오기
	
	public ArrayList<Chat> selectChatList(SqlSessionTemplate sqlSession , String chatRoomNo){
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList" , chatRoomNo);
	}
}
