package com.kh.spring.alarm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.alarm.model.vo.Notification;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

@Repository
public class NotificationDao {

	public int insertAlarm(Member receiver, Reply reply, String content, SqlSessionTemplate sqlSession) {
		
		System.out.println(receiver);
		System.out.println(reply);
		
		Map<String, Object> params = new HashMap<>();
		params.put("receiver", receiver);
		params.put("content", content);
		params.put("reply", reply);
		
		return sqlSession.insert("notificationMapper.insertAlarm", params);
	}

	public ArrayList<Notification> selectAlarmList(String receiveNo, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("notificationMapper.selectAlarmList", receiveNo);
	}
	
	public int deleteAlarm(String aNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("notificationMapper.deleteAlarm", aNo);
	}
}
