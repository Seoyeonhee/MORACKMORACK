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
		return sqlSession.selectOne("MessageMapper.getMessage", messageNo);
	}
	
	public void readMessage(int messageNo){
		sqlSession.update("MessageMapper.readMessage", messageNo);
	}
	
	public List<Message> listSendMessage(String userId){
		return sqlSession.selectList("MessageMapper.listSendMessage", userId);
	}
	
	public List<Message> listRecvMessage(String userId){
		return sqlSession.selectList("MessageMapper.listRecvMessage", userId);
	}
	
	public void delMessage(int messageNo){
		sqlSession.delete("MessageMapper.delMessage", messageNo);
	}

}
