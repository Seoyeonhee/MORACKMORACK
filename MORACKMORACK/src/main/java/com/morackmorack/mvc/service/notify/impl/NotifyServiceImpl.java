package com.morackmorack.mvc.service.notify.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.common.Search;
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
	public Map<String, Object> listNotifyUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Notify> list =  notifyDao.listNotifyUser(search);
		int totalCount = notifyDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalcCount", new Integer(totalCount));
		
		return map;
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
