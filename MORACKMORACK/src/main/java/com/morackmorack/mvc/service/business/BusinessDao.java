package com.morackmorack.mvc.service.business;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.ReserveAble;

public interface BusinessDao {
	
	// INSERT BUSINESS
	public void addBusiness(Business business) throws Exception;
	
	// GET BUSINESS
	public Business getBusiness(String businessId) throws Exception;
	
	// UPDATE BUSINESS
	public void updateBusiness(Business business) throws Exception;
	
	// LIST BUSIENSS
	public List<Business> getBusinessList(Search search) throws Exception;
	
	// DELETE BUSINESS
	public void delBusiness(String businessId) throws Exception;
	
	

	
	// INSERT MENU
	public void addBusinessMenu(Menu menu) throws Exception;
	
	// LIST MENU
	public List<Menu> listBusinessMenu(String businessId) throws Exception;
	
	// SELECT MENU
	public Menu getBusinessMenu(int menuNo) throws Exception;
	
	// UPDATE MENU
	public void updateBusinessMenu(Menu menu) throws Exception;
	
	// DELETE MENU
	public void delBusinessMenu(int menuNo) throws Exception;
	
	
	
	
	
	
	// INSERT RESERVEABLE
	public void addReserveAbleTime(ReserveAble reserveAble) throws Exception;
	
	// DELETE RESERVEABLE
	public void delReserveAbleTime(String businessId) throws Exception;
	
	// LIST RESERVEABLE
	public List<ReserveAble> listReserveAbleTime(String businessId) throws Exception;
	
	
	
	
	// LIST showReserveAble
	public List<ReserveAble> showReserveAbleTimeList(String businessId, String reserveDate) throws Exception;
	
	// LIST reserveAbleTime
	public ReserveAble getReservAbleTime(int reserveAbleNo) throws Exception;
	
	// LIST usedBusiness
	public List<Pay> getUsedBusinessList(String userId) throws Exception;
	
}
