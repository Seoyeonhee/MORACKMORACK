package com.morackmorack.mvc.message;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.Message;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetService;
import com.morackmorack.mvc.service.message.MessageService;
import com.morackmorack.mvc.service.user.UserService;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;
	
	public MessageController() {
		
	}
	
	@RequestMapping(value="sendMessage/{userId}/{meetId}", method = RequestMethod.GET)
	public ModelAndView sendMessage(@PathVariable("userId") String userId, @PathVariable("meetId") String meetId) throws Exception{
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> /message/sendMessage : GET");
	
	//Meet meet  = new Meet();
	Meet meet = meetService.getMeet(meetId);
	
	//User user = new User();
	User user = userService.getUser(userId);
	
	System.out.println("?///////////////////////////////////////////////////////////////////////////////////////////?");
	ModelAndView mav = new ModelAndView();
	mav.addObject("meet", meet);
	mav.addObject("user", user);
	mav.setViewName("/message/sendMessage.jsp");
	
	return mav;
	}
	
	@RequestMapping(value="sendMessage", method = RequestMethod.POST)
	public ModelAndView sendMessage(HttpServletRequest request, @ModelAttribute("message") Message message){
	System.out.println("/message/sendMessage : POST");
	
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(true);
	User user = (User) session.getAttribute("user");
	
	 if(user == null) {
		 	mav.setViewName("/user/loginView.jsp");
			return mav;
		 }
	
	String userId = user.getUserId();
	
	message.setSendId(userId);
	message.setMessageFlag('0'); //0쪽지 1알림
	
	messageService.sendMessage(message);
	
	mav.setViewName("/message/listSendMessage");
	
	return mav;
	}
	
	@RequestMapping(value="listSendMessage", method = RequestMethod.GET)
	public ModelAndView listSendMessage(HttpServletRequest request) {
		System.out.println("message/listSendMessage : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
				
		if(user == null) {
		 	mav.setViewName("/user/loginView.jsp");
			return mav;
		 }
		
		String userId = user.getUserId();
		
		List<Message> listSendMessage = messageService.listSendMessage(userId);
		
		mav.addObject("listSendMessage", listSendMessage);
		mav.setViewName("/message/listSendMessage.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="listRecvMessage", method = RequestMethod.GET)
	public ModelAndView listRecvMessage(HttpServletRequest request) {
		System.out.println("message/listRecvMessage : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		
		 if(user == null) {
			 	mav.setViewName("/user/loginView.jsp");
				return mav;
			 }
		
		String userId = user.getUserId();
		
		List<Message> listRecvMessage = messageService.listRecvMessage(userId);
		
		mav.addObject("listRecvMessage", listRecvMessage);
		mav.setViewName("/message/listRecvMessage.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="getMessage/{messageNo}", method = RequestMethod.GET)
	public ModelAndView getMessage(HttpServletRequest request, @PathVariable("messageNo") int messageNo) {
		System.out.println("message/getMessage : GET");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		
		 if(user == null) {
			 	mav.setViewName("/user/loginView.jsp");
				return mav;
			 }
		
		String userId = user.getUserId();
		
		Message message = new Message();
		message = messageService.getMessage(messageNo);
		
		if(message.getRecvId().equals("userId")) {
			messageService.readMessage(messageNo);
		}
		
		mav.addObject("message", message);
		mav.setViewName("/message/getMessage.jsp");
		
		return mav;
	}
	
	

}
