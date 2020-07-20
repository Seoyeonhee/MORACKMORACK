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
		
		meet.setMeetLoc("서울시"); //나중에 지워랑
		
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
	     
	     if(bank.equals("기업") || bank.equals("국민")) {
	    	 len = 14;
	     }else if(bank.equals("농협") || bank.equals("우리")) {
	    	 len = 13;
	     }else if(bank.equals("한국씨티") || bank .equals("신한")) {
	    	 len = 12;
	     }else if(bank.equals("SC제일")) {
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
		  
	
	@RequestMapping(value="getMeet/{meetId}", method=RequestMethod.GET)
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
	
	@RequestMapping(value="checkJoinMeet", method=RequestMethod.POST)
	public ModelAndView checkJoinMeet(HttpServletRequest request, @RequestParam("meetId") String meetId) {
		System.out.println("/meet/checkJoinMeet : POST");
		
		//User user = userService.getUser(userId);	
		//int joinMeetCount = user.getJoinMeetCount();
		
		HttpSession session=request.getSession(true);	
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		
		Meet meet = meetService.getMeet(meetId);
		
		ModelAndView mav = new ModelAndView();
		String joinMessage = null;
		
		if(meet.getMaxNum() == meet.getMemNum()) {
			return mav.addObject(joinMessage, "모임 인원 초과");
		}else if(meet.getMeetType() == '1') {
			if(user.getMeetCount() >= 5) {
				return mav.addObject(joinMessage, "가입 가능한 모임 개수 초과");
			}else {
				if(meet.getMeetA)
			}
		}
		
		return null;
	}
	
	@RequestMapping(value="joinMeet", method=RequestMethod.POST)
	public ModelAndView joinMeet(HttpServletRequest request) {
		System.out.println("/meet/joinMeet : POST");	
		
		HttpSession session=request.getSession(true);	
		User user = (User)session.getAttribute("user");	
		String userId = "user06"; ////
		
		
		
		
			
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
	
	@RequestMapping(value="mangJoinMeetUser/{userId}", method=RequestMethod.GET)
	public ModelAndView mangJoinMeetUser(@RequestParam("joinFlag") boolean joinFlag, @RequestParam("meetId") String meetId, @PathVariable("userId") String userId) {
		System.out.println("/meet/mangJoinMeetUser : POST");	
		
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
	
	@RequestMapping(value="listMyMeet", method=RequestMethod.GET)
	public ModelAndView listMyMeet(HttpServletRequest request){
		System.out.println("/meet/listMyMeet : GET");	
		
		/*
		 * HttpSession session=request.getSession(true); User user =
		 * (User)session.getAttribute("user"); String userId = null;
		 */
		/*
		 * if(session == null) { userId = "user01"; }else { userId = user.getUserId(); }
		 */
		
		String userId = "user01";
		
		List<MeetMem> listMyMeet = meetService.listMyMeet(userId);
		System.out.println(">>>>>>>>>>>>>>>>>>>>"+listMyMeet);
		ModelAndView mav = new ModelAndView();
		mav.addObject(listMyMeet);
		mav.setViewName("redirect:/meet/listMyMeet.jsp");
		
		return mav;		
	}
	
	@RequestMapping(value="delMyMeet", method=RequestMethod.GET)
	public void delMyMeet(String userId, String meetId) {
		System.out.println("/meet/delMyMeet : GET");
	}
	
	@RequestMapping(value="addWishMeet/{meetId}", method=RequestMethod.GET)
	public void addWishMeet(HttpServletRequest request, @PathVariable("meetId") String meetId) {
		System.out.println("/meet/addWishMeet :GET");	
		
		HttpSession session=request.getSession(true);	
		User user = (User)session.getAttribute("user");	
		
		
	}
	
	public void listWishMeet(String userId) {
		
	}
	
	public void delWishMeet(String userId, String meetId) {
		
	}
}
