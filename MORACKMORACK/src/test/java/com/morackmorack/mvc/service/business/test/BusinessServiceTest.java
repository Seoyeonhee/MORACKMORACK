package com.morackmorack.mvc.service.business.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;

// JUnit���� BusinessLayer �����׽�Ʈ
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })

public class BusinessServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;

	//@Test
	public void testAddBusinessMenu() throws Exception {
		
		Business business = new Business();
		List<Menu> menuList = new ArrayList<>();
		menuList.add(new Menu("bus01", "���κ������Ʈ", 3000, "���κ������Ʈ.jsp"));
		menuList.add(new Menu("bus01", "����ġ������ũ", 10000, "����ġ������ũ.jsp"));
		menuList.add(new Menu("bus01", "����� ���� ����", 7000, "����� ���� ����.jsp"));
		
		business.setMenu(menuList);
		
		System.out.println(business);
		
		for(int i=0 ; i<menuList.size() ; i++) {
			System.out.println(i + "��° �޴� ������ => " + menuList.get(i));
			businessService.addBusinessMenu(menuList.get(i));
		}
	}
	
	
	//@Test
	public void testListBusinessMenu() throws Exception {
		
		Business business = new Business();
		List<Menu> menuList = new ArrayList<>();
	
		String businessId = "bus01";
		
		menuList = businessService.listBusinessMenu(businessId);
		
		System.out.println("������");
		System.out.println(menuList);
		
	}
	
	
	//@Test
	public void testGetBusinessMenu() throws Exception {
		
		Menu menu = new Menu();
	
		int menuNo = 3;
		
		menu = businessService.getBusinessMenu(menuNo);
		
		System.out.println("������");
		System.out.println(menu);
		
	}
	
	
	//@Test
	public void testUpdateBusinessMenu() throws Exception {
		
		int menuNo = 3;
		
		businessService.delBusinessMenu(menuNo);
		
	}
	
}
