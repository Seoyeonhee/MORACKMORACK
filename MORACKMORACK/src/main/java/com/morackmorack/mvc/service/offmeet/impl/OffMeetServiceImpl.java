package com.morackmorack.mvc.service.offmeet.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.offmeet.OffMeetDao;
import com.morackmorack.mvc.service.offmeet.OffMeetService;

@Service("offMeetServiceImpl")
public class OffMeetServiceImpl implements OffMeetService{
	

	@Autowired
	@Qualifier("offMeetDaoImpl")
	private OffMeetDao offMeetDao;
	public void setProductDao(OffMeetDao offMeetDao) {
		this.offMeetDao = offMeetDao;
	}
	
	public OffMeetServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addOff(OffMeet offMeet) throws Exception {
		offMeetDao.addOff(offMeet);
	}

	public void updateOff(OffMeet offMeet) throws Exception {
		offMeetDao.updateOff(offMeet);
	}
	

	public void delOffMeet(int offNo) throws Exception {
		offMeetDao.delOffMeet(offNo);
	}
	
	
	public OffMeet getOff(int offNO) throws Exception {
		System.out.println("시작=-----------------");
		return offMeetDao.getOff(offNO);
		
	}

	
	public void addOffPay(Pay pay) throws Exception {
		offMeetDao.addOffPay(pay);
	}


	public void addBusinessPay(Pay pay) throws Exception {
	    offMeetDao.addBusinessPay(pay);	
	}


	public Pay getOffPay(int payNo) throws Exception {
		return offMeetDao.getOffPay(payNo);
	}

	
	public Pay getBusinessPay(int payNo) throws Exception {
		return offMeetDao.getBusinessPay(payNo);
	}

	public List<OffMeet> getOffList(String meetId) throws Exception {
	
		return offMeetDao.getOffList(meetId);
	}

	public Map<String,Object> listOffPay (Search search , String userId) throws Exception {
		System.out.println("시작");
	
		List<OffMeet> list= offMeetDao.listOffPay(search, userId);
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println("list====="+list);
		int totalCount = offMeetDao.getOffPayTotalCount(userId);
	
		map.put("list", list);
		map.put("search", search);
		map.put("totalCount", new Integer(totalCount));
		System.out.println("map====="+map);	
		return map;
	}
	

	public Map<String, Object> listBusinessPay(Search search, String meetId) throws Exception {
		List<Pay> list= (List<Pay>) offMeetDao.listBusinessPay(search, meetId);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("list====="+list);
		int totalCount = offMeetDao.getBusinessPayTotalCount(meetId);
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		System.out.println(map);
		return map;
	}

	@Override
	public Map<String, Object> listOffMem(Search search) throws Exception {
		
		List<Pay> list= offMeetDao.listOffMem(search);
		
		return null;
	}
	
	//참여자 확인 미완성
	public Map<String, Object> getJoinMemberList(Search search) throws Exception {
		
		List<Pay> list= offMeetDao.listOffMem(search);
		int totalCount = offMeetDao.getTotalOffMemCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		System.out.println(map);
		
		return map;
	}


	public Map<String, Object> listReserveBusiness(Search search) throws Exception {
		
		List <Pay> list =offMeetDao.listReserveBusiness(search);
		int totalCount = offMeetDao.getReserveTotalCount(search);
		
		Map <String, Object> map = new HashMap <String, Object>();
		
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public Pay getReserveBusiness(int payNo) throws Exception {
		
		return offMeetDao.getReserveBusiness(payNo);
	}

	
}