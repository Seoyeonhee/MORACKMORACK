package com.morackmorack.mvc.service.user;

import java.util.Map;

import com.morackmorack.mvc.service.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;

	public int idCheck(String userId) throws Exception;
	
	public int nickNameCheck(String nickName) throws Exception;
	
	public int passwordCheck(User user) throws Exception;
	
	public User getUser(String userId) throws Exception ;
	
	public void updateUser(User user) throws Exception ;
	
	public void delUser(User user) throws Exception ;
	
}