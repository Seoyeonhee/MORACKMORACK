package com.morackmorack.mvc.service.business;

import java.util.List;

import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;

public interface BusinessService {

	// 메뉴 등록
	public void addBusinessMenu(Menu menu) throws Exception;
	
	// 메뉴리스트
	public List<Menu> listBusinessMenu(String businessId) throws Exception;
	
	// 메뉴 상세
	public Menu getBusinessMenu(int menuNo) throws Exception;
	
	// 메뉴 수정
	public void updateBusinessMenu(Menu menu) throws Exception;
	
	// 메뉴 삭제
	public void delBusinessMenu(int menuNo) throws Exception;
	
}
