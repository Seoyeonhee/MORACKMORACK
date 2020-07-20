package com.morackmorack.mvc.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.user.UserService;
import com.morackmorack.mvc.service.user.UserDao;


@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	public int idCheck(String userId) throws Exception {
		int result = userDao.idCheck(userId);
		return result;
	}

	public int nickNameCheck(String nickName) throws Exception {
		int result = userDao.nickNameCheck(nickName);
		return result;
	}
	
	public int passwordCheck(User user) throws Exception {
		int result = userDao.passwordCheck(user);
		return result;
	}

	@Override
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		
	}

	@Override
	public void delUser(User user) throws Exception {
		userDao.delUser(user);
		
	}

}