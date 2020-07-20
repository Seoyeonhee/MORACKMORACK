package com.morackmorack.mvc.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.morackmorack.mvc.service.domain.User;

public class EchoHandler extends TextWebSocketHandler{
	
	private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
	
	//로그인한 전체
	private List<WebSocketSession> sessionAll = new ArrayList<WebSocketSession>();
	
	// 클라이언트가 서버로 연결된 이후 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("afterConnectionEstablished");
		
		User user = (User) session.getAttributes().get("user");
		sessions.put("user01", session);
		
		sessionAll.add(session);
		
		System.out.println(sessions);
		System.out.println(sessionAll);
	}
	
	// 클라이언트가 서버로 메세지 전송했을 때 실행
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage");
		
		String msg = message.getPayload();
		
		System.out.println(msg);
		
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null) {
				String alarm_meetNo = strs[0];
				String alarm_maker = strs[1];
				String alarm_message = strs[2];
				
				for(WebSocketSession sess : sessionAll) {
					sess.sendMessage(new TextMessage(alarm_meetNo+alarm_maker+alarm_message));
				}
			}
		}
	}
	
	// 클라이언트가 연결 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed" + session +", "+ status);
		
		sessions.remove(session.getId());
		sessionAll.remove(session);
	}
	
	// 연결된 클라이언트에서 예외 발생 시 실행
	/*
	 * @Override public void handleTransPortError(WebSocketSession session,
	 * Throwable exception) throws Exception{
	 * 
	 * }
	 */

}
