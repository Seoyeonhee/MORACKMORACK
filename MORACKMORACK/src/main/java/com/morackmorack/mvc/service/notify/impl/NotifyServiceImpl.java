package com.morackmorack.mvc.service.notify.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.service.domain.Notify;
import com.morackmorack.mvc.service.notify.NotifyDao;
import com.morackmorack.mvc.service.notify.NotifyService;

@Service("notifyServiceImpl")
public class NotifyServiceImpl implements NotifyService {

	@Autowired
	@Qualifier("notifyDaoImpl")
	private NotifyDao notifyDao;
	public void setNotifyDao(NotifyDao notifyDao) {
		this.notifyDao = notifyDao;
	}
	
	public NotifyServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void notifyUser(Notify notify) throws Exception {
		// TODO Auto-generated method stub
		notifyDao.notifyUser(notify);
	}

	@Override
	public Map<String, Object> listNotifyUser() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notify getNotifyUser(String recvNotiUser) throws Exception {
		// TODO Auto-generated method stub
		return notifyDao.getNotifyUser(recvNotiUser);
	}

	@Override
	public void prohibit(Notify notify) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
