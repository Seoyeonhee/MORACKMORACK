package com.morackmorack.mvc.notify;

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

import com.morackmorack.mvc.common.Page;
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
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public NotifyController() {
	}
	
	@RequestMapping(value="notifyUser", method=RequestMethod.GET)
	public ModelAndView notifyUserView(@RequestParam("userId") String userId, HttpServletRequest request) throws Exception{
		
		System.out.println("/notifyUserView.do");
		
		System.out.println(userId);
		
		ModelAndView modelAndView = new ModelAndView();		
		HttpSession session = request.getSession(true);
	
		User reqNotiUser = (User)session.getAttribute("user");
		User recvNotiUser = userService.getUser(userId);
		
		Notify notify = new Notify();
		
		notify.setRecvNotiUser(recvNotiUser);
		notify.setReqNotiUser(reqNotiUser);
		
		modelAndView.setViewName("/notify/notifyUserView.jsp");
		modelAndView.addObject("notify", notify);
		
		return modelAndView;
	}
	
	@RequestMapping(value="listNotifyUser")
	public String listNotifyUser(@ModelAttribute("search") Search search, HttpServletRequest request, Model model) throws Exception{
		
		System.out.println("/listNotifyUser.do");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.getPageSize();
		
		Map<String,Object> map = notifyService.listNotifyUser(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/notify/listNotifyUser.jsp";
	}

}
