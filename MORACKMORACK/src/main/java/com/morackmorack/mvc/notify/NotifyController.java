package com.morackmorack.mvc.notify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="notifyUser", method=RequestMethod.GET)
	public ModelAndView notifyUserView(@RequestParam("userId") String userId, HttpServletRequest request) throws Exception{
		
		System.out.println("/notifyUserView.do");
		
		System.out.println(userId);
		
		ModelAndView modelAndView = new ModelAndView();		
		
		User user1 = userService.getUser(userId);
		
		Notify notify = new Notify();
		
		notify.setRecvNotiUser(user1);

		
		return modelAndView;
	}

}
