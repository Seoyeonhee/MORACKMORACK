package com.morackmorack.mvc.service.business;

import java.util.List;

import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;

public interface BusinessDao {

	// INSERT MENU
	public void addBusinessMenu(Menu menu) throws Exception ;
	
	// LIST MENU
	public List<Menu> listBusinessMenu(String businessId) throws Exception;
	
	// SELECT MENU
	public Menu getBusinessMenu(int menuNo) throws Exception;
	
	// UPDATE MENU
	public void updateBusinessMenu(Menu menu) throws Exception;
	
	// DELETE MENU
	public void delBusinessMenu(int menuNo) throws Exception;
}
