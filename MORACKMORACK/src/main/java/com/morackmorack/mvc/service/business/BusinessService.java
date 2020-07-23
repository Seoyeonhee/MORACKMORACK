package com.morackmorack.mvc.service.business;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;

public interface BusinessService {
	
	// ���� ��û(��ü ����)
	public void addBusiness(Business business) throws Exception;
	
	// ��ü ���� ����(��ü�� �ڱ� ���� �����ϰ��� �Ҷ� �������� ������)
	public Business getBusiness(String businessId) throws Exception;
	
	// ��ü ���� ����
	public void updateBusiness(Business business) throws Exception;
	
	// ��ü ���
	public List<Business> getBusinessList(Search search) throws Exception;
	
	// ���� ����(��ü Ż��)
	public void delBusiness(String businessId) throws Exception;
	
	
	

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
