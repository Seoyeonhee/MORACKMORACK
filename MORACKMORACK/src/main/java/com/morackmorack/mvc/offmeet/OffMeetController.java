package com.morackmorack.mvc.offmeet;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PathVariable;
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
import com.morackmorack.mvc.common.Page;
import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.MeetMemOffMeet;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.ReserveAble;
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

@Value("#{commonProperties['pageUnit']}")
int pageUnit;

@Value("#{commonProperties['pageSize']}")
int pageSize;

public OffMeetController() {
		
	}


@RequestMapping(value="addOffView", method =RequestMethod.GET)
public String addOffView(@ModelAttribute ("offMeet") OffMeet offMeet, @RequestParam("meetId") String meetId, HttpSession session, Model model) throws Exception {
   
	System.out.println("offMeet :" +offMeet);
	offMeet.setUser((User)session.getAttribute("user"));
	offMeet.setMeet(meetService.getMeet(meetId));

	List<Business> businessList = new ArrayList<>();
	Search search = new Search();
	
	businessList = businessService.getBusinessList(search);
	
	model.addAttribute("businessList", businessList);
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
			offMeet.setImageFile("logo.png");
		}
	}else {
		offMeet.setImageFile("logo.png");
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
public String getOff(@RequestParam("meetId") String meetId, @RequestParam("offNo") int offNo, Model model, HttpSession session) throws Exception{
	
	User user = ((User)session.getAttribute("user"));
	String userId = user.getUserId();
	
	  OffMeet offMeet = offMeetService.getOff(offNo);
	  Meet meet =meetService.getMeet(meetId);
	  
	  MeetMem meetMem = meetService.getMeetMem(meetId, userId);
	  
	  model.addAttribute("meetMem", meetMem);
	  model.addAttribute("offMeet", offMeet);
	  model.addAttribute("meet", meet);

	  return "forward:/offMeet/getInfoOff.jsp";
	}


@RequestMapping(value="reqOff", method =RequestMethod.GET)
public ModelAndView reqOff (@RequestParam("memNo") int memNo, @RequestParam("meetId") String meetId, @RequestParam("offNo") int offNo, Model model, HttpSession session) throws Exception{
	
		User user = ((User)session.getAttribute("user"));
		ModelAndView modelAndView = new ModelAndView();
		String userId = user.getUserId();
	    OffMeet offMeet = offMeetService.getOff(offNo);
	    MeetMem meetMem = meetService.getMeetMem(meetId, userId);
	    MeetMemOffMeet meetMemOffMeet = offMeetService.getOff_MeetMem(memNo, offNo);

	    Meet meet = meetService.getMeet(meetId);
	    
	    
	    String	 message = "";
	 
	   if(meetMemOffMeet != null) {
		   message ="1";
		  modelAndView.setViewName("/offmeet/getOffList?message=" + message);
		   return modelAndView; 			
	   } else {
		   modelAndView.addObject("offMeet", offMeet);
		   modelAndView.addObject("user", user);
		   modelAndView.addObject("meetMem", meetMem);
		   modelAndView.addObject("meet", meet);
		   modelAndView.setViewName("/offMeet/reqOff.jsp");
		   return modelAndView;
	   }
}
@RequestMapping (value="addOffPay", method = RequestMethod.POST)
public String addOffPay (@RequestParam("memNo") int memNo, @RequestParam ("meetId") String meetId, @RequestParam ("offNo") int offNo, @RequestParam("payMethod") char payMethod, @RequestParam("amount") int amount,  Model model,HttpSession session) throws Exception{

	User user = ((User)session.getAttribute("user"));
    OffMeet offMeet = (OffMeet)offMeetService.getOff(offNo);
    

	String userId = user.getUserId();
	
	offMeetService.addOff_MeetMem(memNo, offNo);

	
	Pay pay = new Pay();
	user = (User)session.getAttribute("user");
	pay.setUser(user);
	pay.setOffMeet(offMeetService.getOff(offNo));
	pay.setMeet(meetService.getMeet(meetId));

	offMeet = (OffMeet)offMeetService.getOff(offNo);
	
	Meet meet = meetService.getMeet(meetId);

	pay.setPayMethod(payMethod);
	pay.setTotalAmount(amount);
	pay.setOffMeet(offMeet);
	
	offMeetService.addOffPay(pay);
	
	model.addAttribute("meet", meet);
	model.addAttribute("offMeet", offMeet);
	model.addAttribute("pay", pay);
	

	
	return "forward:/offMeet/payOkOffMeet.jsp";
}

@RequestMapping (value="getOffPay" , method = RequestMethod.GET)
public String getOffPay (@RequestParam("payNo") int payNo, Model model, HttpSession session) throws Exception{

	Pay pay = new Pay();
	
	pay = offMeetService.getOffPay(payNo);

	User user = (User)session.getAttribute("user");
	pay.setUser(user);
	
	model.addAttribute("pay", pay);
	
	return "forward:/offMeet/getOffPay.jsp";
}

@RequestMapping (value="getBusinessPay" , method = RequestMethod.GET)
public String getBusinessPay (@RequestParam("payNo") int payNo, Model model, HttpSession session) throws Exception{

	Pay pay = new Pay();
	
	pay = offMeetService.getBusinessPay(payNo);

	User user = (User)session.getAttribute("user");
	pay.setUser(user);
	
	model.addAttribute("pay", pay);
	
	return "forward:/offMeet/getBusinessPay.jsp";
}


@RequestMapping( value="addBusinessPay", method = RequestMethod.POST)
public String addBusinessPay(@RequestParam ("menuNo") int menuNo, @RequestParam ("businessMenuCnt") int businessMenuCnt , @RequestParam("businessId") String businessId, @RequestParam("listSelectedTime") List<String> listSelectedTime, @RequestParam("reserveDate") String reserveDate , Model model, HttpSession session) throws Exception {
	
	Pay pay = new Pay();
	Menu menu = new Menu();
	
	menu =businessService.getBusinessMenu(menuNo);
	User user = (User)session.getAttribute("user");
	
	List<ReserveAble> reserveAbleList = new ArrayList<ReserveAble>();
	Business business = new Business();
	business = businessService.getBusiness(businessId);
	
	
	for(int i=0 ; i<listSelectedTime.size() ; i++) {
		int reserveAbleNo = Integer.parseInt(listSelectedTime.get(i));
		ReserveAble reserveAble = businessService.getReservAbleTime(reserveAbleNo);
		reserveAbleList.add(reserveAble);
	}
	
		List<String> startTime = new ArrayList<>();
	
					
    	String reserveStartTime ="";
		for(int i = 0 ; i < reserveAbleList.size(); i++ ){
	       reserveStartTime = reserveAbleList.get(i).getReserveAbleStartTime();
	       startTime.add(reserveStartTime);
	       System.out.println("reserveStartTime"+reserveStartTime );
	 
		}

		List<String> endTime = new ArrayList<>();
		
		String reserveEndTime ="";
		for(int i = 0 ; i < reserveAbleList.size(); i++ ){
			reserveEndTime = reserveAbleList.get(i).getReserveAbleEndTime();
			 endTime.add(reserveEndTime);
	       System.out.println("reserveEndTime"+reserveEndTime);
	  }
	
		System.out.println("startTime"+startTime);
		System.out.println("endTime" +endTime);
	
	model.addAttribute("menu", menu);
	model.addAttribute("business", business);
	model.addAttribute("user", user);
	model.addAttribute("reserveDate", reserveDate);
	model.addAttribute("reserveStartTime", startTime);
	model.addAttribute("reserveEndTime", endTime);
	model.addAttribute("businessMenuCnt", businessMenuCnt);
	System.out.println("businessMenuCnt======="+businessMenuCnt);
	return "forward:/offMeet/addBusinessPay.jsp";
	
}

@RequestMapping (value="payOkBusiness", method = RequestMethod.POST)
public String payOkBusiness (@ModelAttribute ("pay") Pay pay, @RequestParam ("businessId") String businessId,  @RequestParam ("reserveDate") String reserveDate, @RequestParam ("reserveStartTime") String reserveStartTime, @RequestParam ("reserveEndTime") String reserveEndTime,  @RequestParam ("amount") int amount, @RequestParam ("businessMenuCnt") int businessMenuCnt,  HttpSession session, Model model) throws Exception{
	System.out.println("시작");

	
	pay.setUser((User)session.getAttribute("user"));
	pay.setBusiness(businessService.getBusiness(businessId));
	
	pay.setPayStatus('1');
	pay.setTotalAmount(amount);
	pay.setReserveDate(reserveDate);
	pay.setReserveStartTime(reserveStartTime);
	pay.setReserveEndTime(reserveEndTime);
	pay.setReserveMemNum(businessMenuCnt);
	
	offMeetService.addBusinessPay(pay);
	
	model.addAttribute("pay", pay);
	
	System.out.println("model======="+model);
	return "forward:/offMeet/payOkBusiness.jsp";
}


@RequestMapping(value = "getOffList")
public String getOffList(@RequestParam(value = "message", required = false) String message, @RequestParam("meetId") String meetId, Model model) throws Exception {
	System.out.println("message=========="+message);
	List<OffMeet> getOffList = new ArrayList<OffMeet>();
	getOffList = offMeetService.getOffList(meetId);
	
	Meet meet =meetService.getMeet(meetId);
	
	if (message != null) {
		model.addAttribute("message", message);
		model.addAttribute("list", getOffList);
		model.addAttribute("meet", meet);

	return "forward:/offMeet/offList.jsp";
	
	} else {
	
	model.addAttribute("list", getOffList);
	model.addAttribute("meet", meet);

	return "forward:/offMeet/offList.jsp";
	}
}
@RequestMapping(value = "listOffPay")
public String listOffPay(@ModelAttribute("search") Search search, Model model,HttpSession session, User user) throws Exception {

 System.out.println("컨트롤러 시작 ");
	user = (User) session.getAttribute("user");

	
	if (search.getCurrentPage() == 0) {
		search.setCurrentPage(1);
	}
	
	search.setPageSize(pageSize);

	String userId = user.getUserId();
	System.out.println("UserId ::" +userId);
	
	Map<String, Object> map = offMeetService.listOffPay(search, userId);
	
	 
	Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
			pageSize);
	System.out.println("ListPurchaseAction ::" + resultPage);

	System.out.println("list ::" +map.get("list"));

	model.addAttribute("list", map.get("list"));
	model.addAttribute("resultPage", resultPage);
	model.addAttribute("search", search);
	
	return "forward:/offMeet/listOffPay.jsp";
}


@RequestMapping(value = "listBusinessPay")
public String listBusinessPay(@ModelAttribute("search") Search search, Model model, HttpSession session, User user) throws Exception {

	
	if (search.getCurrentPage() == 0) {
		search.setCurrentPage(1);
	}
	
	search.setPageSize(pageSize);


	user = ((User)session.getAttribute("user"));
	String userId = user.getUserId();
	
	Map<String, Object> map = offMeetService.listBusinessPay(search, userId);
	
	 
	Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
			pageSize);
	System.out.println("listBusinessPay ::" + resultPage);

	System.out.println("list ::" +map.get("list"));

	model.addAttribute("list", map.get("list"));
	model.addAttribute("resultPage", resultPage);
	model.addAttribute("search", search);
	
	return "forward:/offMeet/listBusinessPay.jsp";
}



}
