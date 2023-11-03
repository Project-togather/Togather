package com.kh.spring.handler;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.binary.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.spring.member.model.vo.Member;



public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private ArrayList<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { //클라이언트가 소켓에 접속했을때
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		//logger.info("Socket 연결");
		sessions.add(session);
		//System.out.println("afterConnectionEstablished" + session);	
		//System.out.println(session.getAttributes());
		String memId =  ((Member)(session.getAttributes().get("loginMember"))).getMemId();
		
		//System.out.println(memId);
		userSessionsMap.put(memId,session);
		//System.out.println(userSessionsMap);
		
		
	}
	
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { //소켓에 메세지 보낼때
		// TODO Auto-generated method stub
		System.out.println("gdgdgdg");
		super.handleTextMessage(session, message);
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
	
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		logger.info("Socket 끊음");
		sessions.remove(session);
		//System.out.println(session.getId());
		userSessionsMap.remove(session.getId(),session);
	}
	
	
}
