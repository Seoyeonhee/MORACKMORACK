package com.morackmorack.mvc.offmeet;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetService;
import com.morackmorack.mvc.service.meet.impl.MeetServiceImpl;
import com.morackmorack.mvc.service.user.UserService;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.offmeet.OffMeetService;
import com.morackmorack.mvc.service.meet.MeetService;

@Controller
@RequestMapping("/offmeet/*")
public class OffMeetController {


@Autowired 
@Qualifier("offMeetServiceImpl")
private OffMeetService offMeetService;


@Autowired 
@Qualifier("meetServiceImpl")
private MeetService meetService;


@Autowired
@Qualifier("userServiceImpl")
private UserService userService;

public OffMeetController() {
		
	}


@RequestMapping(value="addOffView", method =RequestMethod.GET)
public String addOffView() throws Exception {
	
	System.out.println("/offmeet/addOff :GET");
	
	
	return "redirect:/offMeet/addOff.jsp";
}



@RequestMapping (value ="addOff", method = RequestMethod.POST)
public String addOff (@ModelAttribute ("offMeet") OffMeet offMeet, HttpSession session) throws Exception {
	
	System.out.println("offMeet : "+offMeet);
//	offMeet.setUser((User)session.getAttribute("user"));
	User user = new User();
	user.setUserId("user02");
	offMeet.setUser(user);
	offMeet.setOffMem(1);
	Meet meet = new Meet();
	meet.setMeetId("meet02");
	offMeet.setMeet(meet);
	offMeetService.addOff(offMeet);
	System.out.println("offMeet��?" + offMeet);
	return "forward:/offMeet/getInfoOff.jsp";
}


@RequestMapping(value = "updateOffView", method=RequestMethod.GET)
public String updateOffView(@RequestParam("offNo") int offNo, Model model) throws Exception{
	

	OffMeet offMeet = offMeetService.getOff(offNo);
	model.addAttribute("offMeet", offMeet);

	return "forward:/offMeet/updateOff.jsp";
}


@RequestMapping(value="updateOff", method =RequestMethod.POST)
public String updateOff (@RequestParam("offNo") int offNo, Model model) throws Exception{
	
	OffMeet offMeet = offMeetService.getOff(offNo);
	model.addAttribute("offMeet", offMeet);
	
	return "forward:/offMeet/updateOff.jsp";
}

@RequestMapping(value ="getInfoOff", method=RequestMethod.GET)
public String getOff(@RequestParam("offNo") int offNo, Model model ) throws Exception{

	  OffMeet offMeet = offMeetService.getOff(offNo);
	  
	  model.addAttribute("offMeet", offMeet);
	  
	  return "forward:/offMeet/getInfOff.jsp";
	}

@RequestMapping(value="reqOff", method =RequestMethod.GET)
public String reqOff (@RequestParam("offNo") int offNo, Model model, HttpSession session) throws Exception{
	
//	User user = ((User)session.getAttribute("user"));
	
	String userId ="user01";
	User user = (User)userService.getUser(userId);
	
	Pay pay = new Pay();
	pay.setUser(user);
	
	OffMeet offMeet = (OffMeet)offMeetService.getOff(offNo);
	
	model.addAttribute("offMeet", offMeet);
	model.addAttribute("user", user);
	
	return "forward:/offMeet/reqOff.jsp";
}

@RequestMapping (value="addOffPay", method = RequestMethod.POST)
public String addOffPay (@RequestParam ("offNo") int offNo, @RequestParam("payMethod") int payMethod, @RequestParam("amount") int amount,  Model model,HttpSession session) throws Exception{

	System.out.println("/addPay : POST");
	System.out.println("offNo1?"+offNo);
	Pay pay = new Pay();
//	User user = (User) session.getAttribute("user");
	String userId ="user01";
	User user = (User)userService.getUser(userId);
	pay.setUser(user);
	
	String meetId ="meet01";
	Meet meet =(Meet)meetService.getMeet(meetId);
	pay.setMeet(meet);
	
	System.out.println("offNo2?"+offNo);
	OffMeet offMeet = (OffMeet)offMeetService.getOff(offNo);
	System.out.println("offNo3?"+offNo);
	pay.setPayMethod(payMethod);
	pay.setTotalAmount(amount);
	pay.setOffMeet(offMeet);
	
	offMeetService.addOffPay(pay);
	
	
	model.addAttribute("meet", meet);
	model.addAttribute("offMeet", offMeet);
	model.addAttribute("user", user);
	model.addAttribute("pay", pay);
	
	return "forward:/offMeet/reqOkOff.jsp";
}


@RequestMapping (value="addBusinessPay", method = RequestMethod.POST)
public String addBusinessPay (@ModelAttribute("pay") Pay pay) throws Exception{

	System.out.println("/addPay : POST");
	
	offMeetService.addBusinessPay(pay);

	return "forward:/offMeet/getReqOkBusiness.jsp";
}


}
