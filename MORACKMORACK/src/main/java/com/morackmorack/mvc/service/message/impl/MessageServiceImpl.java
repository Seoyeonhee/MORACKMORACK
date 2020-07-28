package com.morackmorack.mvc.service.message.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.service.domain.Message;
import com.morackmorack.mvc.service.message.MessageDao;
import com.morackmorack.mvc.service.message.MessageService;

@Service("messageServiceImpl")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	@Qualifier("messageDaoImpl")
	MessageDao messageDao;
	
	public void sendMessage(Message message) {
		messageDao.sendMessage(message);
	}
	
	public Message getMessage(int MessageNo){
		return messageDao.getMessage(MessageNo);
	}
	
	public void readMessage(int MessageNo){
		messageDao.readMessage(MessageNo);
	}
	
	public List<Message> listSendMessage(String userId){
		return messageDao.listSendMessage(userId);
	}
	
	public List<Message> listRecvMessage(String userId){
		return messageDao.listRecvMessage(userId);
	}
	
	public void delMessage(int messageNo){
		messageDao.delMessage(messageNo);
	}
}
