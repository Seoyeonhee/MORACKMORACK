package com.morackmorack.mvc.service.offmeet.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


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
	
	
	public OffMeet getOff(int offNO) throws Exception {
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


	
}