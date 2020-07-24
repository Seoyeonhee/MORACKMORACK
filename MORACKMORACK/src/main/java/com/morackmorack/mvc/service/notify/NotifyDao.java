package com.morackmorack.mvc.service.notify;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Notify;

public interface NotifyDao {
	
	public void notifyUser(Notify notify) throws Exception;
	
	public List<Notify> listNotifyUser(Search search) throws Exception;
	
	public Notify getNotifyUser(String recvNotiUser) throws Exception;
	
	public void prohibit(Notify notify) throws Exception;

	public int getTotalCount(Search search); 
}
