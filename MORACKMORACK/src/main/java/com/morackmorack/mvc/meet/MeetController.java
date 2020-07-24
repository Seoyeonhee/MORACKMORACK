package com.morackmorack.mvc.meet;

import java.text.ParseException;
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

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.domain.WishMeet;
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
	private UserService userService;

	public MeetController() {

	}

	@RequestMapping(value = "addMeet", method = RequestMethod.GET)
	public ModelAndView addMeet(HttpServletRequest request) throws Exception {
		System.out.println("/meet/addMeet : GET");

		//HttpSession session = request.getSession(true);
		//User user = (User) session.getAttribute("user");
		
		String userId = "user06";		
		User user = userService.getUser(userId);

		Boolean checkMeetCount = meetService.checkJoinMeetCount(user.getMeetCount());

		ModelAndView mav = new ModelAndView();
		if(checkMeetCount == true) {
		mav.setViewName("/meet/addMeet.jsp");
		}else {
			mav.addObject("checkMeetCount", "���� ���� ���� �ʰ��� ���� �Ұ�");
			mav.setViewName("index.jsp");
		}
		return mav;
	}

	@RequestMapping(value = "addMeet/{maxNum}", method = RequestMethod.POST)
	public ModelAndView addMeet(HttpServletRequest request, @ModelAttribute("meet") Meet meet, @PathVariable ("maxNum") int maxNum) throws Exception {
		System.out.println("/meet/addMeet : POST");
		
		meet.setMeetLoc("�����"); // ���߿� ������

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		//String userId = user.getUserId(); 
		
		String userId = "user06";	
		user = userService.getUser(userId);

		String uuid = (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 14);
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyMMdd");
		String meetId = uuid + simpleDate.format(date);
		
		meet.setMeetId(meetId);
		meet.setLeaderId(userId);
		meet.setMaxNum(maxNum);

		String bank = meet.getBank();
		int len = 0;
		
		System.out.println(bank);

		if (bank.equals("���") || bank.equals("����")) {
			len = 14;
		} else if (bank.equals("����") || bank.equals("�츮")) {
			len = 13;
		} else if (bank.equals("�ѱ���Ƽ") || bank.equals("����")) {
			len = 12;
		} else if (bank.equals("SC����")) {
			len = 11;
		}

		Random rand = new Random();
		String accNum = "";

		for (int i = 0; i < len; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			accNum += ran;
		}
		meet.setAccNum(accNum);

		meetService.addMeet(meet);

		String hash = (String) request.getParameter("hash");
		String[] hashSplit = hash.split("#");

		for (int i = 1; i < hashSplit.length; i++) {
			String hashtag = hashSplit[i].trim();

			String hash_no = meetService.getHash(hashtag);
			if (hash_no == null) {
				meetService.addHash(hashtag);
				hash_no = meetService.getHash(hashtag);
				meetService.addMeet_Hash(meetId, hash_no);
			} else {
				meetService.addMeet_Hash(meetId, hash_no);
			}
		}

		MeetMem meetMem = new MeetMem();
		meetMem.setUser(user);
		meetMem.setMeet(meet);
		meetMem.setJoinCode('1');
		meetMem.setMeetRole('0');

		meetService.joinMeet(meetMem);
		meetService.addMemNum(meetId);
		
		meet = meetService.getMeet(meetId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(meet);
		mav.setViewName("/meet/getMeet.jsp");
		return mav;
	}

	@RequestMapping(value = "listMeet",  method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listMeet(@ModelAttribute("search")  Search search, @RequestParam(value="searchType" , required=false) String searchType) {
		System.out.println("/meet/listMeet  : GET");
		
		if(searchType != null) {
			search.setSearchType(searchType);
			search.setSearchCondition("0");
			}
		
		System.out.println(search);
		
		List<Meet> listMeet = meetService.listMeet(search);

		ModelAndView mav = new ModelAndView();
		mav.addObject("listMeet", listMeet);
		mav.addObject("search", search);
		mav.setViewName("/meet/listMeet.jsp");
	
		return mav;
	}

	@RequestMapping(value = "getMeet/{meetId}", method = RequestMethod.GET)
	public ModelAndView getMeet(@PathVariable("meetId") String meetId) {
		System.out.println("/meet/getMeet : GET");

		Meet meet = meetService.getMeet(meetId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("meet", meet);
		mav.setViewName("/meet/getMeet.jsp");
		
		return mav;
	}

	@RequestMapping(value = "delMeet/{meetId}/{delNo}", method = RequestMethod.GET)
	public ModelAndView delMeet(HttpServletRequest request, @PathVariable("meetId") String meetId, @PathVariable("delNo") int delNo) {
		System.out.println("/meet/delMeet :GET");
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		
		ModelAndView mav = new ModelAndView();
		
		Meet meet = meetService.getMeet(meetId);
		
		if(delNo==1) {
			if(meet.getMemNum() == 0) {
				meetService.delMeet(userId, meetId);
			}else {
				mav.addObject("delMessage", "���� ���� ȸ�� ������ ���� ���� �Ұ�");
				}
			}else {
				
		}
			
		mav.setViewName("/meet/listMyMeet");
		
		return mav;	
	}

	@RequestMapping(value = "joinMeet", method = RequestMethod.GET)
	public ModelAndView joinMeet(HttpServletRequest request, @RequestParam("meetId") String meetId) throws Exception {
		System.out.println("/meet/joinMeet : GET");
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		//String userId = user.getUserId();
		
		String userId = "user07";
		user = userService.getUser(userId);
		
		Meet meet = meetService.getMeet(meetId);

		ModelAndView mav = new ModelAndView();
		String joinMessage = null;
		
		MeetMem meetMem = new MeetMem();
		meetMem.setUser(user);
		meetMem.setMeet(meet);
		meetMem.setJoinCode('1');
		meetMem.setMeetRole('2');
		
		mav.setViewName("/meet/getMeet.jsp");
		
		if (meet.getMaxNum() == meet.getMemNum()) {
			mav.addObject(joinMessage, "���� �ο� �ʰ�");
			return mav;
		}

		if (meet.getMeetType() == '0') {
			meetService.joinMeet(meetMem);
			meetService.addMemNum(meetId);
		} else {
			if (meetService.checkJoinMeetCount(user.getMeetCount())) {
				if (meet.isMeetAppr()) {
					mav.setViewName("/meet/joinMeet.jsp");
					return mav;
				} else {
					meetService.joinMeet(meetMem);
					meetService.addMemNum(meetId);
				}
			} else {
				mav.addObject(joinMessage, "���� ������ ������ �ִ� 5��");
			}
		}
		
		meet = meetService.getMeet(meetId);
		mav.addObject("meet", meet);
		return mav;
	}
	
	@RequestMapping(value = "joinMeet", method = RequestMethod.POST)
	public ModelAndView joinMeet(HttpServletRequest request, @RequestParam("meetId") String meetId, @RequestParam("intro")String intro) {
		System.out.println("/meet/joinMeet : POST");
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		
		Meet meet = new Meet();
		meet = meetService.getMeet(meetId);
		
		ModelAndView mav = new ModelAndView();
		
		MeetMem meetMem = new MeetMem();
		meetMem.setUser(user);
		meetMem.setMeet(meet);
		meetMem.setJoinCode('0');
		meetMem.setMeetRole('2');
		
		meetService.joinMeet(meetMem);
		
		mav.addObject("meet", meet);
		mav.setViewName("redirect:/meet/getMeet.jsp");
		
		return mav;
	}
	

	@RequestMapping(value = "listJoinMeetUser/{meetId}", method = RequestMethod.GET)
	public ModelAndView listJoinMeetUser(@PathVariable("meetId") String meetId) {
		System.out.println("/meet/listJoinMeetUser : POST");

		List<MeetMem> listJoinMeetUser = new ArrayList<MeetMem>();
		listJoinMeetUser = meetService.listJoinMeetUser(meetId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("listJoinMeetUser", listJoinMeetUser);
		mav.setViewName("/meet/listJoinMeetUser.jsp");

		return mav;
	}

	@RequestMapping(value = "mangJoinMeetUser/{userId}", method = RequestMethod.GET)
	public ModelAndView mangJoinMeetUser(@RequestParam("joinFlag") boolean joinFlag, @RequestParam("meetId") String meetId, @PathVariable("userId") String userId) {
		System.out.println("/meet/mangJoinMeetUser : POST");

		if (joinFlag == true) {
			meetService.okJoinMeetUser(userId, meetId);
		} else if (joinFlag == false) {
			meetService.refuseJoinMeetUser(userId, meetId);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/meet/listJoinMeetUser.jsp");

		return mav;
	}

	@RequestMapping(value = "listMeetMem/{meetId}", method = RequestMethod.GET)
	public ModelAndView listMeetMem(@PathVariable("meetId") String meetId) {
		System.out.println("/meet/listMeetMem : GET");

		List<MeetMem> listMeetMem = new ArrayList<MeetMem>();
		listMeetMem = meetService.listMeetMem(meetId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("listMeetMem", listMeetMem);
		mav.setViewName("/meet/listMeetMem.jsp");

		return mav;
	}

	@RequestMapping(value = "providePstn", method = RequestMethod.POST)
	public ModelAndView providePstn(HttpServletRequest request, @RequestParam("pstnNum") String pstnNum, @RequestParam("userId") String userId, @RequestParam("meetId") String meetId) {
		System.out.println("/meet/providePstn : POST");
		
		if(pstnNum == "0") {
			meetService.provideLeader(userId, meetId);
		}else {
			meetService.provideStaff(userId, meetId);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/meet/listMeetMem");
		
		return mav;
	}

	@RequestMapping(value = "listMyMeet", method = RequestMethod.GET)
	public ModelAndView listMyMeet(HttpServletRequest request) {
		System.out.println("/meet/listMyMeet : GET");


		// HttpSession session=request.getSession(true);
		 //User user = (User)session.getAttribute("user");
		 //String userId = user.getUserId();
		 
		 String userId = "user06";

		List<MeetMem> listMyMeet = meetService.listMyMeet(userId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("listMyMeet", listMyMeet);
		mav.setViewName("forward:/meet/listMyMeet.jsp");

		return mav;
	}

	@RequestMapping(value = "delMyMeet", method = RequestMethod.GET)
	public void delMyMeet(String userId, String meetId) {
		System.out.println("/meet/delMyMeet : GET");
	}

	@RequestMapping(value = "addWishMeet", method = RequestMethod.GET)
	public ModelAndView addWishMeet(HttpServletRequest request, @RequestParam("meetId") String meetId) {
		System.out.println("/meet/addWishMeet :GET");

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		//String userId = user.getUserId();
		String userId = "user07";
		
		meetService.addWishMeet(userId, meetId);
		
		Meet meet = meetService.getMeet(meetId);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("meet", meet);
		mav.setViewName("/meet/getMeet.jsp");
		
		return mav;
	}

	@RequestMapping(value = "listWishMeet", method = RequestMethod.GET)
	public ModelAndView listWishMeet(HttpServletRequest request) {
		System.out.println("/meet/listWishMeet :GET");
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
				
		List<WishMeet> listWishMeet = meetService.listWishMeet(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listWishMeet", listWishMeet);
		mav.setViewName("redirect:/meet/listWishMeet.jsp");
		return null;
	}
	
	@RequestMapping(value = "delWishMeet/{meetId}", method = RequestMethod.GET)
	public ModelAndView delWishMeet(HttpServletRequest request, @PathVariable("meetId") String meetId) {
		System.out.println("/meet/delWishMeet :GET");
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		
		meetService.delWishMeet(userId, meetId);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/meet/listWishMeet");
		
		return mav;	
	}
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public void test() throws Exception {
	
		
		
		for(int i=0; i<1001; i++) {
			Random rand = new Random();
			
			User user = new User();
			String birthday = "";
			String phone = "010";
			
			user.setUserId("user"+i);
			user.setPassword(user.getUserId());
			user.setUserName(user.getUserId());
			user.setNickName(user.getUserId());
			user.setEmail(user.getUserId()+"@naver.com");
			
			for(int k=0; k<2; k++) {
			for (int j = 0; j < 4; j++) {
				String ran = Integer.toString(rand.nextInt(10));
				phone += ran;
			}
		}
			user.setPhoneNumber(phone);
			
			for(int j=0; j<6; j++) {
				String ran = Integer.toString(rand.nextInt(10));
				birthday += ran;
			}
			SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
			Date convBirthday = (Date) transFormat.parse(birthday);
			user.setBirthday(convBirthday);
			user.setAddress("�����");
			user.setGender('0');
			
			System.out.println(">> "+user);
			userService.addUser(user);
		}
		
		
		
	}
}
