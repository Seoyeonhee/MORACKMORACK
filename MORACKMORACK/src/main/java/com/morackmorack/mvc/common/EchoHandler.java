package com.morackmorack.mvc.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.morackmorack.mvc.service.domain.User;

@Component
public class EchoHandler extends TextWebSocketHandler{
	
	//webSocketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 연결 
	//해당 객체를 통해 메세지를 주고 받음
	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public EchoHandler() {
		users = new ArrayList<WebSocketSession>();
		userMap = new HashMap<String, Object>();
	}
	
	// 클라이언트가 서버로 연결된 이후 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("afterConnectionEstablished : 연결 생성");
		users.add(session);
	}
	
	// 클라이언트가 서버로 메세지 전송했을 때 실행
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage : 메세지 수신");
		System.out.println("메세지 : "+message.getPayload());
		
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		
		if( type != null && type.equals("message")) {
			String sendId = object.getString("sendId");
			userMap.put(sendId, session);
			
			String recvId = object.getString("recvId");
			WebSocketSession ws = (WebSocketSession)userMap.get(recvId);
			String content = object.getString("content");
			
			if(ws != null) {
				ws.sendMessage(new TextMessage(content));
			}
	}
}
	
	// 클라이언트가 연결 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed : 연결 종료");
		users.remove(session);
	}

}
