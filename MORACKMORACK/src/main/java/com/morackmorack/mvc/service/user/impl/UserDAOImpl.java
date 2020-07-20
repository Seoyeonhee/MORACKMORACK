package com.morackmorack.mvc.service.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.user.UserDAO;

@Repository("userDaoImpl")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public User getUser(String userId) throws Exception{
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

}
