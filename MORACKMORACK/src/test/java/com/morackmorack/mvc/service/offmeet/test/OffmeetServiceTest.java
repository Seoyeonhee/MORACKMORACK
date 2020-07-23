package com.morackmorack.mvc.service.offmeet.test;



import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.offmeet.OffMeetService;


@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
public class OffmeetServiceTest {

	@Autowired
	@Qualifier("offMeetServiceImpl")
	private OffMeetService offMeetService;
	
	//@Test
	public void testAddOffmeet() throws Exception {	
		
		OffMeet offMeet = new OffMeet();
		User user = new User();
		user.setUserId("user02");
		Meet meet = new Meet();
		meet.setMeetId("meet01");
		offMeet.setUser(user);
		offMeet.setMeet(meet);
		offMeet.setOffName("모여라 준호");
		offMeet.setOffLoc("우리집");
		offMeet.setOffMax(20);
        offMeet.setOffMem(1);
		offMeet.setAmount(10003);
		offMeet.setOffDate("2014-04-01");
		offMeet.setOffTime("12시");
		
		offMeetService.addOff(offMeet);
		
	}
	//@Test
	public void testGetOffmeet() throws Exception {
		
		OffMeet offMeet = new OffMeet();
	
		offMeet = offMeetService.getOff(10001);

		//==> console 확인
		System.out.println(offMeet);
		
		
	}	
	//@Test
	public void testUpdateOffmeet() throws Exception{
		 
		OffMeet offMeet = offMeetService.getOff(10001);
	
		offMeet.setOffName("아11아");
		offMeet.setOffLoc("아아1111");
		offMeet.setOffNo(10001);
		
		offMeetService.updateOff(offMeet);
		
		offMeet = offMeetService.getOff(10001);
		System.out.println(offMeet);	
	 }
	

	
@Test
public void addOffPay() throws Exception {	
		Pay pay = new Pay();
		User user = new User();
		user.setUserId("user02");
		Meet meet = new Meet();
		meet.setMeetId("meet02");
		OffMeet offMeet = new OffMeet();
		offMeet.setOffNo(10002);
		pay.setUser(user);
		pay.setMeet(meet);
		pay.setOffMeet(offMeet);
		pay.setPayMethod('0');
		pay.setTotalAmount(100000);
		
		offMeetService.addOffPay(pay);
		
	}
	

//@Test
public void testOffPay() throws Exception {
	
		Pay pay = new Pay();

		pay = offMeetService.getOffPay(10001);

	//==> console 확인
	System.out.println("pay는"+pay);

}	


//@Test
public void addBusinessPay() throws Exception {	
		Pay pay = new Pay();
		User user = new User();
		user.setUserId("user01");
		Meet meet = new Meet();
		meet.setMeetId("meet01");
		OffMeet offMeet = new OffMeet();
		offMeet.setOffNo(10001);
		Business business = new Business();
		business.setBusinessId("bus01");
		
		pay.setUser(user);
		pay.setMeet(meet);
		pay.setOffMeet(offMeet);
		pay.setBusiness(business);
		pay.setPayMethod('0');
		pay.setReserveMemNum(10);
		pay.setReserveDate("2014-04-01");
		pay.setReserveStartTime("13시");
		pay.setReserveEndTime("14시");
		pay.setTotalAmount(100000);
		
		offMeetService.addBusinessPay(pay);
		
	}

//@Test
public void testBusinessPay() throws Exception {
	
		Pay pay = new Pay();

		pay = offMeetService.getBusinessPay(10002);

	//==> console 확인
	System.out.println("pay는"+pay);

}	

}
