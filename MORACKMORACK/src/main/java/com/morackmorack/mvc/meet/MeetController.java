package com.morackmorack.mvc.meet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetService;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/meet/*")
public class MeetController {

	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService usertService;
	
	public MeetController() {
		
	}
	
	@RequestMapping(value="addMeet", method=RequestMethod.GET)
	public ModelAndView addMeet(HttpServletRequest request) throws Exception{
		System.out.println("/meet/addMeet : GET");
		
		HttpSession session=request.getSession(true);	
		User user = (User)session.getAttribute("user");
		String userId = "user01";
		
		Boolean checkMeetCount = checkJoinMeetCount(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(checkMeetCount);
		mav.setViewName("redirect:/meet/addMeet.jsp");
		return mav;
	}
	
	@RequestMapping(value="addMeet", method=RequestMethod.POST)
	public ModelAndView addMeet(@ModelAttribute("meet") Meet meet, HttpServletRequest request) throws Exception{
		System.out.println("/meet/addMeet : POST");
		
		meet.setMeetLoc("�����"); //���߿� ������
		
		HttpSession session=request.getSession(true);	
		User user = (User)session.getAttribute("user");
		//String userId = user.getUserId();  ////
		String userId = "user01";
		
		String uuid = (UUID.randomUUID().toString().replaceAll("-", "")).substring(0,14);
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyMMdd");
		String meetId = uuid+simpleDate.format(date);
		
		meet.setMeetId(meetId);
		meet.setLeaderId(userId);

	     String bank = meet.getBank();
	     int len = 0;
	     
	     if(bank.equals("���") || bank.equals("����")) {
	    	 len = 14;
	     }else if(bank.equals("����") || bank.equals("�츮")) {
	    	 len = 13;
	     }else if(bank.equals("�ѱ���Ƽ") || bank .equals("����")) {
	    	 len = 12;
	     }else if(bank.equals("SC����")) {
	    	 len = 11;
	     }
	     
	    Random rand = new Random();
	     String accNum = "";
	     
	     for(int i=0; i<len; i++) {
	    	 String ran = Integer.toString(rand.nextInt(10));
	    	 accNum += ran;
	     }
	    meet.setAccNum(accNum);
	    
	    meetService.addMeet(meet);
	    
	    String hash = (String) request.getParameter("hash");
	    String[] hashSplit = hash.split("#");
	    
	    for(int i=1; i<hashSplit.length; i++) {
	    	String hashtag = hashSplit[i].trim();    	
	    	
	    	String hash_no = meetService.getHash(hashtag);
	    	if(hash_no== null) {
	    		meetService.addHash(hashtag);
	    		hash_no = meetService.getHash(hashtag);
	    		meetService.addMeet_Hash(meetId, hash_no);
	    	}else {
	    		meetService.addMeet_Hash(meetId, hash_no);
	    	}
	    }
	    
	    MeetMem meetMem = new MeetMem();
	    meetMem.setUser(user);
	    meetMem.setMeet(meet);
	    meetMem.setJoinCode('1'); 
	    meetMem.setMeetRole('0');
	    meetService.addMeetMem(meetMem); 
	        	    
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("redirect:/getMeet.jsp");
		return mav;
	}
	
	public List<Meet> listMeet(){
		return null;
	}
		  
	
	@RequestMapping(value="getMeet/{meetId}", method=RequestMethod.POST)
	public ModelAndView getMeet(@PathVariable("meetId") String meetId) {
		System.out.println("/meet/getMeet");
		
		Meet meet = meetService.getMeet(meetId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("meet", meet);
		mav.setViewName("redirect:/meet/getMeet.jsp");
		
		return mav;
	}
	
	public void delMeet(String userId, String meetId) {
		
	}
	
	@RequestMapping(value="checkJoinMeetCount", method=RequestMethod.POST)
	public Boolean checkJoinMeetCount(String userId) {
		System.out.println("/meet/checkJoinMeet : POST");
		
		//User user = userService.getUser(userId);	
		//int joinMeetCount = user.getJoinMeetCount();
		
		int joinMeetCount = 0;

		if(joinMeetCount<5) {
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="joinMeet", method=RequestMethod.POST)
	public ModelAndView joinMeet(HttpServletRequest request) {
		System.out.println("/meet/joinMeet : POST");	
		
		HttpSession session=request.getSession(true);	
		User user = (User)session.getAttribute("user");	
		String userId = "user06"; ////
		
		
		String meetId = (String) request.getAttribute("meetId");
			
		return null;
	
	}
	
	@RequestMapping(value="listJoinMeetUser", method=RequestMethod.POST)
	public ModelAndView listJoinMeetUser(@RequestParam("meetId") String meetId){
		System.out.println("/meet/listJoinMeetUser : POST");	
		
		List<MeetMem> listJoinMeetUser = new ArrayList<MeetMem>();		
		listJoinMeetUser = meetService.listJoinMeetUser(meetId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listJoinMeetUser",listJoinMeetUser);
		mav.setViewName("redirect:/meet/listJoinMeetUser.jsp");
		
		return mav;	
	}
	
	@RequestMapping(value="manJoinMeetUser/{userId}", method=RequestMethod.GET)
	public ModelAndView manJoinMeetUser(@RequestParam("joinFlag") boolean joinFlag, @RequestParam("meetId") String meetId, @PathVariable("userId") String userId) {
		System.out.println("/meet/manJoinMeetUser : POST");	
		
		if(joinFlag == true) {
			meetService.okJoinMeetUser(userId, meetId);
		}else if(joinFlag == false) {
			meetService.refuseJoinMeetUser(userId, meetId);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/meet/listJoinMeetUser.jsp");
		
		return mav;
		}
	
	@RequestMapping(value="listMeetMem", method=RequestMethod.POST)
	public ModelAndView listMeetMem(@RequestParam("meetId") String meetId){
		System.out.println("/meet/listMeetMem : POST");	
	
		List<MeetMem> listMeetMem = new ArrayList<MeetMem>();		
		listMeetMem = meetService.listMeetMem(meetId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listMeetMem", listMeetMem);
		mav.setViewName("redirect:/meet/listMeetMem.jsp");
		
		return mav;
	}
	
	public void providePstn() {
		
	}
	
	public List<Meet> listMyMeet(){
		return null;
		
	}
	
	public void delMyMeet(String userId, String meetId) {
		
	}
	
	public void addWishMeet(String userId, String meetId) {
		
	}
	
	public void listWishMeet(String userId) {
		
	}
	
	public void delWishMeet(String userId, String meetId) {
		
	}
}
