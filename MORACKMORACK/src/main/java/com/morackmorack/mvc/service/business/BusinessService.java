package com.morackmorack.mvc.service.business;

import java.util.List;

import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;

public interface BusinessService {

	// �޴� ���
	public void addBusinessMenu(Menu menu) throws Exception;
	
	// �޴�����Ʈ
	public List<Menu> listBusinessMenu(String businessId) throws Exception;
	
	// �޴� ��
	public Menu getBusinessMenu(int menuNo) throws Exception;
	
	// �޴� ����
	public void updateBusinessMenu(Menu menu) throws Exception;
	
	// �޴� ����
	public void delBusinessMenu(int menuNo) throws Exception;
	
}
