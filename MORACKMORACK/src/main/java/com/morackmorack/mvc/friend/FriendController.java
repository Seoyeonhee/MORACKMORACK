package com.morackmorack.mvc.friend;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Page;
import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.friend.FriendService;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {
	
	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public FriendController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageunit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="reqFriend")
	public ModelAndView reqFriend(@RequestParam("userId") String userId, HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		
		User reqFriend = (User)session.getAttribute("user");
		User recvFriend = userService.getUser(userId);
		
		Friend friend = new Friend();
		
		friend.setReqFriend(reqFriend);
		friend.setRecvFriend(recvFriend);
		
		modelAndView.setViewName("/meet/listMeetMem./jsp");
		modelAndView.addObject("friend", friend);
		
		return modelAndView;
	}
	
	@RequestMapping(value="listRecvFriend")
	public ModelAndView listRecvFriend(@ModelAttribute("search") Search search, HttpServletRequest request, Model model) throws Exception {
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		search.setPageSize(3);
		
		HttpSession session = request.getSession(true);
		
		String recvFriendId = ((User)session.getAttribute("user")).getUserId();
		Map<String,Object> map = friendService.listRecvFriend(search,  recvFriendId);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/friend/listRecvFrien.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getRecvFriend", method=RequestMethod.GET)
	public ModelAndView getRecvFriend(@RequestParam("userId") String userId, Model model)throws Exception {
		
		Friend friend = friendService.getRecvFriend(userId);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("friend", friend);
		modelAndView.setViewName("/friend/getRecvFriend.jsp");
		
		return modelAndView;
	}
	
//	@RequestMapping(value="listFriend")
//	public ModelAndView listFriend(@ModelAttribute("search") Search search, HttpServletRequest request, Model model) throws Exception {
//		
//		System.out.println("/listFriend.do");
//		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		
//		ModelAndView modelAndView = new ModelAndView();
//		
//		search.setPageSize(3);
//		
//		HttpSession session = request.getSession(true);
//
//	}

}
