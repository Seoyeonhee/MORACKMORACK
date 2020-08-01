package com.morackmorack.mvc.service.user;

import java.util.List;

import com.morackmorack.mvc.service.domain.User;

public interface UserDao {
	
	public void addUser(User user) throws Exception ;
	
	public User getUser(String userId) throws Exception ;
	
	public User getNickName(String nickName) throws Exception ;
	
	public void updateUser(User user) throws Exception ;
	
	public void delUser(User user) throws Exception ;

}