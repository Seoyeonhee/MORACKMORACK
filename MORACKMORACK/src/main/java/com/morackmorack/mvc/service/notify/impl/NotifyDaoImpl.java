package com.morackmorack.mvc.service.notify.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.service.domain.Notify;
import com.morackmorack.mvc.service.notify.NotifyDao;

@Repository("notifyDaoImpl")
public class NotifyDaoImpl implements NotifyDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public NotifyDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("pConstructor:"+getClass());
	}

	@Override
	public void notifyUser(Notify notify) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("NotifyMapper.notifyUser", notify);		
	}

	@Override
	public List<Notify> listNotifyUser() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notify getNotifyUser(String recvNotiUser) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("NotifyMapper.getNotifyUser", recvNotiUser);
	}

	@Override
	public void prohibit(Notify notify) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("NotifyMapper.prohibit", notify);
		sqlSession.update("NotifyMapper.prohibitUser", notify);
		
	}

}
