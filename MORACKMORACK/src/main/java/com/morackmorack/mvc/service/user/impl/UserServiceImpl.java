package com.morackmorack.mvc.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.user.UserDAO;
import com.morackmorack.mvc.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDAO userDao;
	
	public User getUser(String userId) throws Exception{
		return userDao.getUser(userId);
	}

}
