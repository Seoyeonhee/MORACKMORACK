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

// JUnit으로 BusinessLayer 단위테스트
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })

public class BusinessServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;

	//@Test
	public void testAddBusinessMenu() throws Exception {
		
		Business business = new Business();
		List<Menu> menuList = new ArrayList<>();
		menuList.add(new Menu("bus01", "레인보우샤베트", 3000, "레인보우샤베트.jsp"));
		menuList.add(new Menu("bus01", "뉴욕치즈케이크", 10000, "뉴욕치즈케이크.jsp"));
		menuList.add(new Menu("bus01", "사랑에 빠진 딸기", 7000, "사랑에 빠진 딸기.jsp"));
		
		business.setMenu(menuList);
		
		System.out.println(business);
		
		for(int i=0 ; i<menuList.size() ; i++) {
			System.out.println(i + "번째 메뉴 데이터 => " + menuList.get(i));
			businessService.addBusinessMenu(menuList.get(i));
		}
	}
	
	
	//@Test
	public void testListBusinessMenu() throws Exception {
		
		Business business = new Business();
		List<Menu> menuList = new ArrayList<>();
	
		String businessId = "bus01";
		
		menuList = businessService.listBusinessMenu(businessId);
		
		System.out.println("서연희");
		System.out.println(menuList);
		
	}
	
	
	//@Test
	public void testGetBusinessMenu() throws Exception {
		
		Menu menu = new Menu();
	
		int menuNo = 3;
		
		menu = businessService.getBusinessMenu(menuNo);
		
		System.out.println("서연희");
		System.out.println(menu);
		
	}
	
	
	//@Test
	public void testUpdateBusinessMenu() throws Exception {
		
		int menuNo = 3;
		
		businessService.delBusinessMenu(menuNo);
		
	}
	
}
