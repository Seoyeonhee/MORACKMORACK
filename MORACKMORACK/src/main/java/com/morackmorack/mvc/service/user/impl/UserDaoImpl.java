package com.morackmorack.mvc.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}

	@Override
	public int idCheck(String userId) {
		int result = sqlSession.selectOne("userMapper.idCheck",userId);
		return result;
	}

	@Override
	public int nickNameCheck(String nickName) {
		int result = sqlSession.selectOne("userMapper.nickNameCheck",nickName);
		return result;
	}
	
	@Override
	public int passwordCheck(User user) throws Exception {
		int result = sqlSession.selectOne("userMapper.passwordCheck", user);
		return result;
	}

	@Override
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
		
	}

	@Override
	public void delUser(User user) throws Exception {
		sqlSession.delete("UserMapper.delUser", user);
		
	}
}