package com.morackmorack.mvc.service.business.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessDao;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.ReserveAble;

//==> 회원관리 서비스 구현
@Service("businessServiceImpl")
public class BusinessServiceImpl implements BusinessService {

	///Field
	@Autowired
	@Qualifier("businessDaoImpl")
	private BusinessDao businessDao;
	public void setUserDao(BusinessDao businessDao) {
		this.businessDao = businessDao;
	}
	
	///Constructor
	public BusinessServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addBusiness(Business business) throws Exception{
		businessDao.addBusiness(business);
	}
	
	public Business getBusiness(String businessId) throws Exception{
		return businessDao.getBusiness(businessId);
	}
	
	public void updateBusiness(Business business) throws Exception{
		businessDao.updateBusiness(business);
	}
	
	public List<Business> getBusinessList(Search search) throws Exception{
		return businessDao.getBusinessList(search);
	}
	
	public void delBusiness(String businessId) throws Exception{
		businessDao.delBusiness(businessId);
	}
	
	
	
	
	
	
	
	
	
	public void addBusinessMenu(Menu menu) throws Exception {
		businessDao.addBusinessMenu(menu);
	}
	
	public List<Menu> listBusinessMenu(String businessId) throws Exception {
		return businessDao.listBusinessMenu(businessId);
	}
	
	public Menu getBusinessMenu(int menuNo) throws Exception {
		return businessDao.getBusinessMenu(menuNo);
	}
	
	public void updateBusinessMenu(Menu menu) throws Exception {
		businessDao.updateBusinessMenu(menu);
	}
	public void delBusinessMenu(int menuNo) throws Exception {
		businessDao.delBusinessMenu(menuNo);
	}
	
	
	
	
	
	
	
	
	public void addReserveAbleTime(ReserveAble reserveAble) throws Exception {
		businessDao.addReserveAbleTime(reserveAble);
	}
	
	public void delReserveAbleTime(String businessId) throws Exception {
		businessDao.delReserveAbleTime(businessId);
	}
	
	public List<ReserveAble> listReserveAbleTime(String businessId) throws Exception {
		return businessDao.listReserveAbleTime(businessId);
	}
	
	
	
	
	
	
	public List<ReserveAble> showReserveAbleTimeList(String businessId, String reserveDate) throws Exception {
		return businessDao.showReserveAbleTimeList(businessId, reserveDate);
	}
	
	public ReserveAble getReservAbleTime(int reserveAbleNo) throws Exception {
		return businessDao.getReservAbleTime(reserveAbleNo);
	}

}
