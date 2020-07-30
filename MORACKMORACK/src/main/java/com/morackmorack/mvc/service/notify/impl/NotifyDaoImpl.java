package com.morackmorack.mvc.service.notify.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Notify;
import com.morackmorack.mvc.service.domain.User;
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
	public List<Notify> listNotifyUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Notify> listNotifyUser = sqlSession.selectList("NotifyMapper.listNotiUser", search);
		for(int i = 0 ; i<listNotifyUser.size() ; i++) {
			listNotifyUser.get(i).setRecvNotiUser((User)sqlSession.selectOne("UserMapper.getUser", listNotifyUser.get(i).getRecvNotiUser().getUserId()));
		}
		
		return listNotifyUser;
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

	@Override
	public int getTotalCount(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notifyMapper.totalCount", search);
	}

}
