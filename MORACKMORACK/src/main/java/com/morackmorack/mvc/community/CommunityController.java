package com.morackmorack.mvc.community;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Page;
import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.community.CommunityService;
import com.morackmorack.mvc.service.domain.Community;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetService;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;
	
	@Value("#{commonProperties['path']}")
	String path;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public CommunityController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="addPostView", method=RequestMethod.GET)
	public ModelAndView addPostView(@RequestParam("meetId") String meetId, HttpServletRequest request) throws Exception {
		
		System.out.println("/addPostView?meetId="+meetId);
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		Meet meet = meetService.getMeet(meetId);
		User user = userService.getUser(userId);
		
		mav.addObject("user", user);
		mav.addObject("meet", meet);
		mav.setViewName("/community/addPost.jsp");
		return mav;
	}
	
	@RequestMapping(value="addPost", method=RequestMethod.GET)
	public ModelAndView addPost(HttpSession session, Community community) throws Exception {
		
		communityService.addPost(community);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("community", community);
		mav.setViewName("/commnity/getPost/");
		return mav;
	}
	
	@RequestMapping(value="getPostList")
	public ModelAndView getPostList(@RequestParam("meetId") String meetId, @ModelAttribute("search") Search search) throws Exception {
		
		if (search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = communityService.getPostList(search, meetId);
		
		Page resultPage = new Page (search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
		
		mav.addObject("list", map.get("list"));
		mav.addObject("resultPage", resultPage);
		mav.addObject("search", search);
		mav.addObject("totalCount", map.get("totalCount"));
		mav.setViewName("/community/getCommunityList.jsp");
		
		return mav;
	}
	
	@RequestMapping("getPost")
	public ModelAndView getPost(@RequestParam("postNo") int postNo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		Community community = communityService.getPost(postNo);
		
		mav.addObject("community", community);
		mav.setViewName("/community/getPost.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="updatePostView" , method=RequestMethod.GET)
	public ModelAndView updatePostView(@RequestParam("postNo") int postNo) throws Exception {
		
		ModelAndView mav = new ModelAndView ();
		
		Community community = communityService.getPost(postNo);
		
		mav.addObject("community", community);
		mav.setViewName("/community/updatePostView.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="updatePost", method=RequestMethod.POST)
	public ModelAndView updatePost(@ModelAttribute("community") Community community)throws Exception {
		
		ModelAndView mav = new ModelAndView ();
		
		communityService.updatePost(community);
		
		mav.setViewName("/community/getPost.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="deletePost", method=RequestMethod.GET)
	public ModelAndView deletePost(@RequestParam("postNo") int postNo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		communityService.deletePost(postNo);
		
		mav.setViewName("/community/getPostList.jsp");
		
		return mav;
	}

}
