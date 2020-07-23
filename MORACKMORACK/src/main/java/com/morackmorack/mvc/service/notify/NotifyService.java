package com.morackmorack.mvc.service.notify;

import java.util.Map;

import com.morackmorack.mvc.service.domain.Notify;

public interface NotifyService {
	
	public void notifyUser(Notify notify) throws Exception;
	
	public Map<String,Object> listNotifyUser() throws Exception;
	
	public Notify getNotifyUser(String recvNotiUser) throws Exception;
	
	public void prohibit(Notify notify) throws Exception;
	
}
