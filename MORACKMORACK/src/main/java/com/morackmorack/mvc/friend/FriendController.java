package com.morackmorack.mvc.friend;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	@RequestMapping(value="reqFriend")
	public ModelAndView reqFriend(@RequestParam("userId") String userId, @RequestParam("meetId") String meetId, HttpSession session) throws Exception {
		
		System.out.println("reqFriendController");
		System.out.println(1234+userId);
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		User reqFriend = (User)session.getAttribute("user");
		User recvFriend = userService.getUser(userId);
		
		System.out.println("101:"+reqFriend);
		System.out.println("101:"+recvFriend);
		
		Friend friend = new Friend();
		friend.setReqFriend(reqFriend);
		friend.setRecvFriend(recvFriend);
		
		friendService.reqFriend(friend);
		
		modelAndView.setViewName("/meet/listMeetMem/"+meetId);
		modelAndView.addObject("friend", friend);
		
		return modelAndView;
	}
	
	@RequestMapping(value="listRecvFriend")
	public ModelAndView listRecvFriend(HttpServletRequest request, Model model) throws Exception {
		
		
		ModelAndView modelAndView = new ModelAndView();

		List<Friend> listRecvFriend = new ArrayList<Friend>();
		
		HttpSession session = request.getSession(true);
		
		String recvFriendId = ((User)session.getAttribute("user")).getUserId();
		listRecvFriend = friendService.listRecvFriend(recvFriendId);
		
	
		
		modelAndView.addObject("listRecvFriend", listRecvFriend);
		modelAndView.setViewName("/friend/listRecvFriend.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="okFriend")
	public String okFriend(@RequestParam("friendNo") int friendNo, HttpSession session) throws Exception {
		
		System.out.println("13213"+friendNo);
		
		User reqFriendId = (User)session.getAttribute("user");
		
		
		Friend friend = new Friend();
		
		friend = friendService.getRecvFriend(friendNo);
		
		friendService.okFriend(friend);
		
		return "/friend/listRecvFriend.jsp";

	}
	
	@RequestMapping(value="denyFriend")
	public String denyFriend(@RequestParam("userId") String userId, HttpSession session) throws Exception {
		
		System.out.println("13213"+userId);
		
		User reqFriendId = (User)session.getAttribute("user");
		User recvFriendId = userService.getUser(userId);
		
		Friend friend = new Friend();
		
		friend.setReqFriend(reqFriendId);
		friend.setRecvFriend(recvFriendId);
		
		friendService.denyFriend(friend);
		
		return "/friend/listRecvFriend.jsp";

	}
	
	@RequestMapping(value="getRecvFriend", method=RequestMethod.GET)
	public ModelAndView getRecvFriend(@RequestParam("friendNo") int friendNo, Model model)throws Exception {
		
		Friend friend = friendService.getRecvFriend(friendNo);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("friend", friend);
		modelAndView.setViewName("/friend/getRecvFriend.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listFriend")
	public ModelAndView listFriend(HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("/listFriend.do");
		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession(true);
		String reqFriendId= ((User)session.getAttribute("user")).getUserId();
		List<Friend> listFriend = new ArrayList<Friend>();
		listFriend = friendService.listFriend(reqFriendId);
		
		mav.addObject("listFriend", listFriend);
		mav.setViewName("/friend/listFriend.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="friendList", method=RequestMethod.GET)
	public ModelAndView friendList(HttpServletRequest request, Model model) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		
		String reqFriendId = ((User)session.getAttribute("user")).getUserId();
		
		List<Friend> friendList = new ArrayList<Friend>();
		friendList = friendService.friendList(reqFriendId);
		
		System.out.println("12345"+friendList);
		
		modelAndView.addObject("friendList", friendList);
		modelAndView.setViewName("/friend/friendList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="delFriend")
	public ModelAndView delFriend(@RequestParam("userId") String userId, HttpServletRequest request)throws Exception{
		
		ModelAndView mav = new ModelAndView();
	
		HttpSession session = request.getSession(true);
		System.out.println(userId);
		String reqFriendId = ((User)session.getAttribute("user")).getUserId();
		
		String recvFriendId = userId;
		
		friendService.delFriend(reqFriendId,recvFriendId);
		
		return mav;
	}

}
