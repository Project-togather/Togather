package com.kh.spring.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {
	
	//채팅방있는지 확인
	public ArrayList<ChatRoom> checkChatRoom(SqlSessionTemplate sqlSession, String memNo){
		return (ArrayList)sqlSession.selectList("chatMapper.checkChatRoom", memNo);
	}
}
