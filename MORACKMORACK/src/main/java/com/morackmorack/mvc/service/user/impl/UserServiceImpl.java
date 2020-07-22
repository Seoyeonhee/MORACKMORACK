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

	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
	
	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public boolean checkDuplication2(String nickName) throws Exception {
		boolean result=true;
		User user=userDao.getUser(nickName);
		if(user != null) {
			result=false;
		}
		return result;
	}

	public void delUser(User user) throws Exception {
		userDao.delUser(user);
		
	}

}