package com.morackmorack.mvc.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetService;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;

	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		System.out.println("/main/home : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User user = (User) request.getAttribute("user");
		
		List<Meet> listMeetMain = new ArrayList<Meet>();
		
		if(user != null) {
		listMeetMain = meetService.listMeetFromMain(user.getCategory());
		}else {
			listMeetMain = meetService.listMeetFromMain();
		}

		mav.addObject("listMeetMain", listMeetMain);
		mav.setViewName("/index.jsp");
		return mav;		
	}
}
