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

import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.offmeet.OffMeetService;
@Controller
@RequestMapping("/offmeet/*")
public class OffMeetController {

@Autowired
@Qualifier("offmeetServiceImpl")
private OffMeetService offMeetService;
public OffMeetController() {
		
	}


@RequestMapping(value="addOffView", method =RequestMethod.GET)
public String addOffView() throws Exception {
	
	System.out.println("/offmeet/addOff :GET");
	
	
	return "redirect:/offmeet/addOff.jsp";
}



@RequestMapping (value ="addOff", method = RequestMethod.POST)
public String addOff (@ModelAttribute ("offmeet") OffMeet offmeet) throws Exception {
	
	offMeetService.addOff(offmeet);
	
	return "forward:/offMeet/getInfoOff.jsp";
}


@RequestMapping(value = "updateOffView", method=RequestMethod.GET)
public String updateOffView(@RequestParam("offNo") int offNo, Model model) throws Exception{
	

	OffMeet offMeet = offMeetService.getOff(offNo);
	model.addAttribute("offMeet", offMeet);

	return "forward:/offMeet/updateOff.jsp";
}


@RequestMapping(value="updateOff", method =RequestMethod.POST)
public String updateOff (@RequestParam("offNo") OffMeet offMeet, Model model) throws Exception{
	
	offMeetService.updateOff(offMeet);
	model.addAttribute("offMeet", offMeet);
	return "forward:/offmeet/getInfoOff.jsp";
}


@RequestMapping(value = "getReqOk" , method = RequestMethod.GET)
public String getReqOk(@RequestParam("offNo") int offNo, Model model) throws Exception{
	
	OffMeet offMeet = offMeetService.getOff(offNo);

	model.addAttribute("offMeet", offMeet);;

	return "forward:/offMeet/getReqOk.jsp";
}

@RequestMapping(value ="getInfoOff", method=RequestMethod.GET)
public String getOff(@RequestParam("offNo") int offNo, Model model ) throws Exception{

	  OffMeet offMeet = offMeetService.getOff(offNo);
	  
	  model.addAttribute("offMeet", offMeet);
	  
	  return "forward:/offMeet/getInfOff.jsp";
	}


@RequestMapping (value="addOffPay", method = RequestMethod.POST)
public String addOffPay (@ModelAttribute("pay") Pay pay) throws Exception{

	System.out.println("/addPay : POST");
	
	offMeetService.addOffPay(pay);

	return "forward:/offmeet/getReqOkOff.jsp";
}

@RequestMapping (value="addBusinessPay", method = RequestMethod.POST)
public String addBusinessPay (@ModelAttribute("pay") Pay pay) throws Exception{

	System.out.println("/addPay : POST");
	
	offMeetService.addBusinessPay(pay);

	return "forward:/offmeet/getReqOkBusiness.jsp";
}


}
