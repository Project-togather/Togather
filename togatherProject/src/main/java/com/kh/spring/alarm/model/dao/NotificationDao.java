package com.kh.spring.alarm.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class NotificationDao {

	public int insertAlarm(Member receiver, String content, SqlSessionTemplate sqlSession) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("receiver", receiver);
		params.put("content", content);
		
		return sqlSession.insert("notificationMapper.insertAlarm", params);
	}
	
}
