package com.morackmorack.mvc.service.user;

import com.morackmorack.mvc.service.domain.User;

public interface UserDAO {
	
	public User getUser(String userId) throws Exception;
}
