package com.morackmorack.mvc.notify;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
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

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Notify;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.notify.NotifyService;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/notify/*")
public class NotifyController {
	
	@Autowired
	@Qualifier("notifyServiceImpl")
	private NotifyService notifyService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public NotifyController() {
	}
	
	@RequestMapping(value="notifyUserView")
	public ModelAndView notifyUserView(@RequestParam("userId") String userId, HttpSession session) throws Exception{
		
		System.out.println("/notifyUserView.do");
		
		System.out.println(userId);
		
		ModelAndView modelAndView = new ModelAndView();		
	
		User reqNotiUser = (User)session.getAttribute("user");
		System.out.println("132"+reqNotiUser);
		User recvNotiUser = userService.getUser(userId);
		
		Notify notify = new Notify();
		
		notify.setRecvNotiUser(recvNotiUser);
		notify.setReqNotiUser(reqNotiUser);
		System.out.println("333333"+notify);
		modelAndView.setViewName("/notify/notifyUserView.jsp");
		modelAndView.addObject("notify", notify);
		
		return modelAndView;
	}
	
	@RequestMapping(value="notifyUser", method=RequestMethod.POST)
	public ModelAndView notifyUser(@ModelAttribute("notify") Notify notify, HttpSession session) throws Exception {
		
		System.out.println("노티파이"+notify);
		
		
		User reqNotiUser = (User)session.getAttribute("user");
		
		notify.setReqNotiUser(reqNotiUser);
		notifyService.notifyUser(notify);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/index.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listNotifyUser")
	public ModelAndView listNotifyUser(@ModelAttribute("search") Search search, HttpServletRequest request, Model model) throws Exception{
		
		System.out.println("/listNotifyUser.do");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		ModelAndView mav = new ModelAndView();
		
		search.setPageSize(3);
		
		List<Notify> listNotifyUser = new ArrayList<Notify>();
		listNotifyUser = notifyService.listNotifyUser(search);
		
		System.out.println(listNotifyUser);
		
		mav.addObject("listNotifyUser", listNotifyUser);
		mav.setViewName("/notify/listNotifyUser.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="getNotifyUser", method=RequestMethod.GET)
	public String getNotifyUser(@RequestParam("notifyNo") int notifyNo, Model model) throws Exception {
		
		//Notify notify = notifyService.getNotifyUser(notifyNo);
		
		//model.addAttribute("notify", notify);
		//System.out.println(notify);
		
		return "forward:/notify/getNotifyUser.jsp";
	
	}
	
//	@RequestMapping(value="prohibit")
//	public ModelAndView prohibit(@RequestParam("notifyNo") int notifyNo) throws Exception {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		
//		Notify prohibit = new Notify();
//		
//		prohibit.setNotifyNo(notifyNo);
//		
//		prohibit.
//		
//		//modelAndView.addObject("notify", notify);
//		//modelAndView.setViewName("/notify/listNotifyUser.jsp");
//		
//		return modelAndView;
//	}

}
