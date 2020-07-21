package com.morackmorack.mvc.business;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;

//==> 업체관리 Controller
@Controller
@RequestMapping("/business/*")
public class BusinessController {

	///Field
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;
		
	public BusinessController(){
		System.out.println("서연희");
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="addBusinessMenu", method=RequestMethod.POST )
	public String addBusinessMenu( @ModelAttribute("menu") Menu menu, HttpServletRequest request ) throws Exception {
	/*public void addBusinessMenu() throws Exception {*/

		System.out.println("/business/addBusinessMenu : POST");
		
		
		String[] businessMenu = request.getParameterValues("businessMenu");
		String[] businessMenuFee = request.getParameterValues("businessMenuFee");
		String[] businessMenuImg = request.getParameterValues("businessMenuImg");
		
		System.out.println(businessMenu);
		System.out.println(businessMenuFee);
		System.out.println(businessMenuImg);
		
		
		
		System.out.println(menu);
		
		
		//Business Logic
		//businessService.addBusinessMenu(business);
		
		return "redirect:/business/addBusinessMenu.jsp";
	}
	
}
