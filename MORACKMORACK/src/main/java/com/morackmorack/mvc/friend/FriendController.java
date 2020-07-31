package com.morackmorack.mvc.friend;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	
	@RequestMapping(value="reqFriend" , method = RequestMethod.GET) //친구 신청 인자로 상대 아이디 받음
	public ModelAndView reqFriend(HttpServletRequest request, @RequestParam("userId") String userId, @RequestParam("meetId") String meetId) throws Exception {
		System.out.println("/friend/reqFriend : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User reqFriend = (User) session.getAttribute("user"); //세션은 내 아이디
		
		Friend friend = new Friend();
		friend.setReqFriend(reqFriend); //내 아이디
		
		User recvFriend = userService.getUser(userId);	
		friend.setRecvFriend(recvFriend); //상대 아이디
		
		friendService.reqFriend(friend);
		
		mav.setViewName("/meet/listMeetMem/"+meetId); 
	
		return mav;
	}
	
	@RequestMapping(value="listFriend/{listFlag}" , method = RequestMethod.GET) //친구 리스트
	public ModelAndView listFriend(HttpServletRequest request, @PathVariable("listFlag") String listFlag, @RequestParam(value = "isModal", required = false) boolean isModal) throws Exception {	
		System.out.println("/friend/listFriend : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
		 	mav.setViewName("/user/loginView.jsp");
			return mav;
		 }
		
		String userId = user.getUserId();
		
		List<Friend> listFriend = new ArrayList<Friend>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(listFlag.equals("0")) {
			listFriend = friendService.listRecvFriend(userId);
			mav.addObject("listFriend", listFriend);
			mav.setViewName("/friend/listRecvFriend.jsp"); //나한테 친구 신청한 사람 (listRecvFriend.jsp 페이지에서 수락/거절)			
		}else if(listFlag.equals("1")) {
			map = friendService.listFriend(userId);
			mav.addObject("listFriend", map.get("listFriend"));
			mav.addObject("friendCount",map.get("friendCount"));
			
			if (isModal == true) {
				mav.addObject("isModal", "1");
				mav.setViewName("/message/sendMessage.jsp");
			} else {
				mav.setViewName("/friend/listFriend.jsp"); // 내 친구 목록
			}
		}

		return mav;
	}
	
	@RequestMapping(value="getFriend/{friendNo}" , method = RequestMethod.GET) //친구 상세조회
	public ModelAndView getFriend(@PathVariable("friendNo") int friendNo) throws Exception {
		System.out.println("/friend/getFriend/ : GET");
		
		ModelAndView mav = new ModelAndView();
		
		Friend friend = new Friend();
		friend = friendService.getFriend(friendNo);
		
		mav.addObject("friend", friend);
		mav.setViewName("/friend/getFriend.jsp");
		
		return mav;		
	}

	@RequestMapping(value="mangFriend/{friendNo}/{friendFlag}") //0이면 친구 거절 1이면 친구 신청
	public ModelAndView mangFriend(@PathVariable("friendNo") int friendNo, @PathVariable("friendFlag") String friendFlag) throws Exception {	
		System.out.println("/friend/mangFriend/ : GET");
		
		ModelAndView mav = new ModelAndView();
		
		if(friendFlag.equals("0")) {
			friendService.delFriend(friendNo);
		}else if(friendFlag.equals("1")){
			friendService.okFriend(friendNo);
		}
		
		mav.setViewName("/friend/listFriend/1");
		
		return mav;
	}
}
