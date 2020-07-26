package com.morackmorack.mvc.business;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.ReserveAble;
import com.morackmorack.mvc.service.domain.User;

//==> ��ü���� Controller
@Controller
@RequestMapping("/business/*")
public class BusinessController {

	///Field
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;
		
	public BusinessController(){
		System.out.println(this.getClass());
	}
	
	
	
//	2020-07-24 ������
//	login
//	��ü �α���
	@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(@ModelAttribute("business") Business business , HttpSession session ) throws Exception{
		
		System.out.println("/business/login : POST");
		
		ModelAndView mv = new ModelAndView();
		
		Business dbBusienss = businessService.getBusiness(business.getBusinessId());
		
		if(business.getBusinessPass().equals(dbBusienss.getBusinessPass())) {
			session.setAttribute("business", dbBusienss);
		}
		
		/*mv.addObject("userFlag", "business");*/
		mv.setViewName("redirect:/index.jsp");
		
		return mv;
	}
	
	
//	2020-07-24 ������
//	login
//	��ü �α���
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/business/logon : GET");

		return "redirect:/business/loginBusiness.jsp";
	}
	
	
//	2020-07-24 ������
//	logout
//	��ü �α���
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/business/logout : POST");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	
	
	
	
	
//	2020-07-22 ������
//	listBusiness
//	��ü ���
	@RequestMapping( value="listBusiness", method=RequestMethod.GET )
	public ModelAndView listBusiness( ) throws Exception {

		System.out.println("/business/listBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		List<Business> businessList = new ArrayList<>();
		Search search = new Search();
		
		businessList = businessService.getBusinessList(search);
		
		System.out.println(businessList);
		
		mv.addObject(businessList);
		mv.setViewName("redirect:/business/listBusiness.jsp");
		
		return mv;
	}
	
	
	
	
	
//	2020-07-21 ������
//	addBusinessMenu
//	��ü �޴� ���
	@RequestMapping( value="addBusinessMenu", method=RequestMethod.POST )
	public ModelAndView addBusinessMenu( @RequestParam(value="businessMenuList", required=true) List<String> businessMenuList,
										@RequestParam(value="businessMenuFeeList", required=true) List<Integer> businessMenuFeeList,
										@RequestParam(value="businessMenuImgList" ) List<String> businessMenuImgList ) throws Exception {

		System.out.println("/business/addBusinessMenu : POST");
		
		ModelAndView mv = new ModelAndView();
		
		// ������_�����ʿ�
		// ��ü ���԰� �α��� ���� ���� "bus01"��� ���ǿ��� �޾ƿ��� ��ü ���̵� ������!!!!
		for(int i=0 ; i<businessMenuList.size() ; i++) {
			Menu menu = new Menu("bus02", businessMenuList.get(i), businessMenuFeeList.get(i), businessMenuImgList.get(i));
			System.out.println("businessService.addBusinessMenu(menu) ���� �� �޴�\n" + menu);
			businessService.addBusinessMenu(menu);
		}
		
		mv.setViewName("redirect:/business/BusinessTestURL.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	listBusinessMenu
//	��ü �޴� ���
	@RequestMapping( value="listBusinessMenu", method=RequestMethod.GET )
	public ModelAndView listBusinessMenu( @RequestParam("businessId") String businessId ) throws Exception {

		System.out.println("/business/listBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = new Business();
		List<Menu> menuList = businessService.listBusinessMenu(businessId);
		
		business.setMenu(businessService.listBusinessMenu(businessId));
		
		mv.addObject(business);
		mv.addObject(menuList);
		mv.setViewName("forward:/business/listBusinessMenu.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	getBusinessMenu
//	��ü �޴� ��
	@RequestMapping( value="getBusinessMenu", method=RequestMethod.GET )
	public ModelAndView getBusinessMenu( @RequestParam("businessId") String businessId, @RequestParam("menuNo") int menuNo ) throws Exception {

		System.out.println("/business/getBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		Menu menu = new Menu();
		
		menu = businessService.getBusinessMenu(menuNo);
		
		mv.addObject(menu);
		mv.setViewName("redirect:/business/getBusinessMenu.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	updateBusinessMenu
//	��ü �޴� ����
	@RequestMapping( value="updateBusinessMenu", method=RequestMethod.POST )
	public ModelAndView updateBusinessMenu( @ModelAttribute("menu") Menu menu ) throws Exception {

		System.out.println("/business/updateBusinessMenu : POST");
		
		ModelAndView mv = new ModelAndView();
		
		businessService.updateBusinessMenu(menu);
		
		mv.setViewName("redirect:/business/BusinessTestURL.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 ������
//	delBusinessMenu
//	��ü �޴� ����
	@RequestMapping( value="delBusinessMenu", method=RequestMethod.GET )
	public ModelAndView delBusinessMenu( @RequestParam("menuNo") int menuNo ) throws Exception {

		System.out.println("/business/delBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		
		businessService.delBusinessMenu(menuNo);
		
		mv.setViewName("redirect:/business/listBusinessMenu.jsp");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	2020-07-23 ������
//	addReserveAbleTime
//	��ü ���� ���� �ð� ����
	@RequestMapping( value="addReserveAbleTime", method=RequestMethod.POST )
	public ModelAndView addReserveAbleTime( @RequestParam(value="reserveAbleStartTime", required=true) List<String> reserveAbleStartTime,
											@RequestParam(value="reserveAbleEndTime", required=true) List<String> reserveAbleEndTime ) throws Exception {

		System.out.println("/business/addReserveAbleTime : POST");
		
		ModelAndView mv = new ModelAndView();
		
		// ������_�����ʿ�
		// ��ü ���԰� �α��� ���� ���� "bus02"��� ���ǿ��� �޾ƿ��� ��ü ���̵� ������!!!!
		String businessId = "bus02";
		
		for(int i=0 ; i<reserveAbleStartTime.size() ; i++) {
			ReserveAble reserveAble = new ReserveAble();
			reserveAble.setBusinessId(businessId);
			reserveAble.setReserveAbleStartTime(reserveAbleStartTime.get(i));
			reserveAble.setReserveAbleEndTime(reserveAbleEndTime.get(i));
			
			System.out.println("������");
			System.out.println("businessService.addReserveAbleTime(reserveAble) ���� �� �޴�\n" + reserveAble);
			businessService.addReserveAbleTime(reserveAble);
		}
		
		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(businessId);
		
		mv.addObject(reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-07-23 ������
//	delReserveAbleTime
//	��ü ���� ���� ��� ȭ������ �̵��ϸ鼭 ���� ���� �ð� ��� ����
	@RequestMapping( value="delReserveAbleTime", method=RequestMethod.GET )
	public ModelAndView delReserveAbleTime( @RequestParam("businessId") String businessId ) throws Exception {

		System.out.println("/business/delReserveAbleTime : GET");
		
		ModelAndView mv = new ModelAndView();
		
		// ������_�����ʿ�
		// ��ü ���԰� �α��� ���� ���� "bus02"��� ���ǿ��� �޾ƿ��� ��ü ���̵� ������!!!!
		businessService.delReserveAbleTime(businessId);
		
		mv.setViewName("redirect:/business/addReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-07-23 ������
//	listReserveAbleTime
//	��ü ���� ���� �ð� ���
	/*@RequestMapping( value="listReserveAbleTime", method=RequestMethod.GET )*/
	@RequestMapping( value="listReserveAbleTime" )
	public ModelAndView listReserveAbleTime( @RequestParam("businessId") String businessId ) throws Exception {

		System.out.println("/business/listReserveAbleTime : GET/POST");
		
		ModelAndView mv = new ModelAndView();
		
		/*businessId = "bus02";*/
		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(businessId);
		
		System.out.println("������");
		System.out.println(reserveAbleTimeList);
		
		mv.addObject(reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime.jsp");
		
		return mv;
	}
	
}
