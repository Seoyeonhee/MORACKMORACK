package com.morackmorack.mvc.service.message.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.service.domain.Message;
import com.morackmorack.mvc.service.message.MessageDao;

@Repository("messageDaoImpl")
public class MessageDaoImpl implements MessageDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void sendMessage(Message message) {
		sqlSession.insert("MessageMapper.sendMessage", message);
	}
	
	public Message getMessage(int messageNo){
		Message message =  sqlSession.selectOne("MessageMapper.getMessage", messageNo);
		 message.setSender(sqlSession.selectOne("UserMapper.getUser", message.getSender().getUserId()));
		 message.setReceiver(sqlSession.selectOne("UserMapper.getUser", message.getReceiver().getUserId()));		
		 
		 return message;
	}
	
	public void readMessage(int messageNo){
		sqlSession.update("MessageMapper.readMessage", messageNo);
	}
	
	public List<Message> listSendMessage(String userId){
		List<Message> listSendMessage = sqlSession.selectList("MessageMapper.listSendMessage", userId);
		
		for(int i=0; i<listSendMessage.size(); i++) {
			listSendMessage.get(i).setSender(sqlSession.selectOne("UserMapper.getUser", listSendMessage.get(i).getSender().getUserId()));
			listSendMessage.get(i).setReceiver(sqlSession.selectOne("UserMapper.getUser", listSendMessage.get(i).getReceiver().getUserId()));
		}
		return listSendMessage;
	}
	
	public List<Message> listRecvMessage(String userId){
		List<Message> listRecvMessage = sqlSession.selectList("MessageMapper.listRecvMessage", userId);
		
		for(int i=0; i<listRecvMessage.size(); i++) {
			listRecvMessage.get(i).setSender(sqlSession.selectOne("UserMapper.getUser", listRecvMessage.get(i).getSender().getUserId()));
			listRecvMessage.get(i).setReceiver(sqlSession.selectOne("UserMapper.getUser", listRecvMessage.get(i).getReceiver().getUserId()));
		}
		return listRecvMessage;
	}
	
	public void delMessage(int messageNo){
		sqlSession.delete("MessageMapper.delMessage", messageNo);
	}

}
