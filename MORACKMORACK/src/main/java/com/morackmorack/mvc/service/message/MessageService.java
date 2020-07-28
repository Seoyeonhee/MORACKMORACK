package com.morackmorack.mvc.service.message;

import java.util.List;

import com.morackmorack.mvc.service.domain.Message;

public interface MessageService {
	
	public void sendMessage(Message message);
	
	public Message getMessage(int messageNo);
	
	public void readMessage(int messageNo);
	
	public List<Message> listSendMessage(String userId);
	
	public List<Message> listRecvMessage(String userId);
	
	public void delMessage(int messageNo);
	
}
