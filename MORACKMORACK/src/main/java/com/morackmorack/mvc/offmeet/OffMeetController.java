package com.morackmorack.mvc.offmeet;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetService;
import com.morackmorack.mvc.service.meet.impl.MeetServiceImpl;
import com.morackmorack.mvc.service.user.UserService;
import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
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


@Autowired
@Qualifier("businessServiceImpl")
private BusinessService businessService;


@Value("#{commonProperties['offmeetfilePath']}")
String uploadPath;



public OffMeetController() {
		
	}


@RequestMapping(value="addOffView", method =RequestMethod.GET)
public String addOffView(@ModelAttribute ("offMeet") OffMeet offMeet, @RequestParam("meetId") String meetId, HttpSession session, Model model) throws Exception {
   
	System.out.println("offMeet :" +offMeet);
	offMeet.setUser((User)session.getAttribute("user"));
	offMeet.setMeet(meetService.getMeet(meetId));

    
	model.addAttribute("offMeet", offMeet);
	System.out.println("model :" +model);
	return "forward:/offMeet/addOff.jsp";
}



@RequestMapping (value ="addOff", method = RequestMethod.POST)
public String addOff (@RequestParam("meetId") String meetId, @ModelAttribute ("offMeet") OffMeet offMeet,  HttpSession session ) throws Exception {

    offMeet.setUser((User)session.getAttribute("user"));
	offMeet.setOffMem(1);
	offMeet.setMeet(meetService.getMeet(meetId));
	
	if(offMeet.getImage() !=null) {
		MultipartFile offfile = (MultipartFile)offMeet.getImage();
		if( offfile.isEmpty() == false) {	
			String fileName = offfile.getOriginalFilename();
			fileName = uploadFile(fileName, offfile.getBytes());
			offMeet.setImageFile(fileName);
			System.out.println("offMeet : :::::"+offMeet);
		}else {
			offMeet.setImageFile("noImage.jpg");
		}
	}else {
		offMeet.setImageFile("noImage.jpg");
	}
	System.out.println("offMeet : :::::"+offMeet);
	offMeetService.addOff(offMeet);

	return "forward:/offMeet/addOkOff.jsp";
}

private String uploadFile(String originalName, byte[] fileData) throws Exception{

	UUID uuid = UUID.randomUUID();
	
	String savedName = uuid.toString()+"_"+originalName;
	File target = new File(uploadPath, savedName);

	FileCopyUtils.copy(fileData, target);
	
	return savedName;
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

	  return "forward:/offMeet/getInfoOff.jsp";
	}

@RequestMapping(value="reqOff", method =RequestMethod.GET)
public String reqOff (@ModelAttribute ("offMeet") OffMeet offMeet, @RequestParam("offNo") int offNo, Model model, HttpSession session) throws Exception{
	

	User user = ((User)session.getAttribute("user"));
	
	
    offMeet = (OffMeet)offMeetService.getOff(offNo);
	
	model.addAttribute("offMeet", offMeet);
	model.addAttribute("user", user);
	
	return "forward:/offMeet/reqOff.jsp";
}

@RequestMapping (value="addOffPay", method = RequestMethod.POST)
public String addOffPay (@RequestParam ("meetId") String meetId, @RequestParam ("offNo") int offNo, @RequestParam("payMethod") char payMethod, @RequestParam("amount") int amount,  Model model,HttpSession session) throws Exception{

	Pay pay = new Pay();
	User user = (User)session.getAttribute("user");
	pay.setUser(user);
	pay.setOffMeet(offMeetService.getOff(offNo));
	pay.setMeet(meetService.getMeet(meetId));

//	offMeetService.addOff_MeetMem(memNo, offNo);
	
	OffMeet offMeet = (OffMeet)offMeetService.getOff(offNo);
	
	pay.setPayMethod(payMethod);
	pay.setTotalAmount(amount);
	pay.setOffMeet(offMeet);
	
	offMeetService.addOffPay(pay);
	model.addAttribute("offMeet", offMeet);
	model.addAttribute("pay", pay);
	
	return "forward:/offMeet/reqOkOff.jsp";
}

@RequestMapping (value="addBusinessPay", method = RequestMethod.GET)
public String addBusinessPay (HttpSession session, Model model) throws Exception{
	Pay pay = new Pay();
	
	Business business = new Business();
	String businessId ="bus01";
	Meet meet = new Meet();
	String meetId ="meet01";
	OffMeet offMeet = new OffMeet();
	int  offNo = 10001;
	
	pay.setMeet(meetService.getMeet(meetId));
	pay.setUser((User)session.getAttribute("user"));
	System.out.println("============="+offMeetService.getOff(offNo));
	pay.setOffMeet(offMeetService.getOff(offNo));
	pay.setBusiness(businessService.getBusiness(businessId));
	pay.setReserveDate("2020/07/30");
	pay.setReserveStartTime("13:00");
	pay.setReserveEndTime("15:00");
	pay.setTotalAmount(10000);
	pay.setReserveMemNum(13);
	
	model.addAttribute("pay", pay);
	System.out.println("model======"+model);
	System.out.println("pay========"+pay);
	return "forward:/offMeet/reserveBusiness.jsp";
}


@RequestMapping (value="payOkBusiness", method = RequestMethod.POST)
public String payOkBusiness (@ModelAttribute ("pay") Pay pay, @RequestParam ("businessId") String businessId,  @RequestParam ("payMethod") char payMethod, @RequestParam ("reserveDate") String reserveDate, @RequestParam ("reserveStartTime") String reserveStartTime, @RequestParam ("reserveEndTime") String reserveEndTime, @RequestParam("meetId") String meetId, @RequestParam ("offNo") int offNo, @RequestParam ("totalAmount") int totalAmount, HttpSession session, Model model) throws Exception{
	System.out.println("Ω√¿€");
	System.out.println("asaSasAS : "+offNo);
//	int off_No = Integer.parseInt(offNo);
	
	pay.setUser((User)session.getAttribute("user"));
	pay.setBusiness(businessService.getBusiness(businessId));
	pay.setMeet(meetService.getMeet(meetId));
	pay.setOffMeet(offMeetService.getOff(offNo));
	
	pay.setReserveAbleNo(3);
	pay.setTotalAmount(totalAmount);
	pay.setPayMethod(payMethod);
	pay.setReserveDate(reserveDate);
	pay.setReserveStartTime(reserveStartTime);
	pay.setReserveEndTime(reserveEndTime);
	
	offMeetService.addBusinessPay(pay);
	
	model.addAttribute("pay", pay);
	
	System.out.println("model======="+model);
	return "forward:/offMeet/payOkBusiness.jsp";
}


@RequestMapping(value = "getOffList")
public String getOffList(@RequestParam("meetId") String meetId, Model model) throws Exception {

	List<OffMeet> getOffList = new ArrayList<OffMeet>();
	getOffList = offMeetService.getOffList(meetId);
	
	model.addAttribute("list", getOffList);

	return "forward:/offMeet/offList.jsp";
}

@RequestMapping(value = "getOffPayList")
public String getOffPayList(@ModelAttribute("search") Search search, Model model,
		HttpSession session) throws Exception {

	User user = (User) session.getAttribute("user");
	
	String userId = user.getUserId();

	if (search.getCurrentPage() == 0) {
		search.setCurrentPage(1);
	}


	Map<String, Object> map = offMeetService.getOffList2(search, userId);
	
	System.out.println("map====="+map);



	List<Pay>offPayList = (List<Pay>) map.get("list");

	model.addAttribute("list", map.get("list"));
	model.addAttribute("userId", userId);

	model.addAttribute("search", search);
	
	return "forward:/offMeet/getPayList.jsp";
}


}
