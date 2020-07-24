package com.morackmorack.mvc.business;

import java.util.ArrayList;
import java.util.List;


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

//==> 업체관리 Controller
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
	
//	2020-07-22 서연희
//	listBusiness
//	업체 목록
	@RequestMapping( value="listBusiness", method=RequestMethod.GET )
	public ModelAndView listBusiness( @RequestParam("businessId") String businessId ) throws Exception {

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
	
	
	
	
	
//	2020-07-21 서연희
//	addBusinessMenu
//	업체 메뉴 등록
	@RequestMapping( value="addBusinessMenu", method=RequestMethod.POST )
	public ModelAndView addBusinessMenu( @RequestParam(value="businessMenuList", required=true) List<String> businessMenuList,
										@RequestParam(value="businessMenuFeeList", required=true) List<Integer> businessMenuFeeList,
										@RequestParam(value="businessMenuImgList" ) List<String> businessMenuImgList ) throws Exception {

		System.out.println("/business/addBusinessMenu : POST");
		
		ModelAndView mv = new ModelAndView();
		
		// 서연희_수정필요
		// 업체 가입과 로그인 구현 이후 "bus01"대신 세션에서 받아오는 업체 아이디 넣을것!!!!
		for(int i=0 ; i<businessMenuList.size() ; i++) {
			Menu menu = new Menu("bus02", businessMenuList.get(i), businessMenuFeeList.get(i), businessMenuImgList.get(i));
			System.out.println("businessService.addBusinessMenu(menu) 실행 전 메뉴\n" + menu);
			businessService.addBusinessMenu(menu);
		}
		
		mv.setViewName("redirect:/business/BusinessTestURL.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 서연희
//	listBusinessMenu
//	업체 메뉴 목록
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
	
	
//	2020-07-21 서연희
//	getBusinessMenu
//	업체 메뉴 상세
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
	
	
//	2020-07-21 서연희
//	updateBusinessMenu
//	업체 메뉴 수정
	@RequestMapping( value="updateBusinessMenu", method=RequestMethod.POST )
	public ModelAndView updateBusinessMenu( @ModelAttribute("menu") Menu menu ) throws Exception {

		System.out.println("/business/updateBusinessMenu : POST");
		
		ModelAndView mv = new ModelAndView();
		
		businessService.updateBusinessMenu(menu);
		
		mv.setViewName("redirect:/business/BusinessTestURL.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 서연희
//	delBusinessMenu
//	업체 메뉴 삭제
	@RequestMapping( value="delBusinessMenu", method=RequestMethod.GET )
	public ModelAndView delBusinessMenu( @RequestParam("menuNo") int menuNo ) throws Exception {

		System.out.println("/business/delBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		
		businessService.delBusinessMenu(menuNo);
		
		mv.setViewName("redirect:/business/listBusinessMenu.jsp");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	2020-07-23 서연희
//	addReserveAbleTime
//	업체 예약 가능 시간 재등록
	@RequestMapping( value="addReserveAbleTime", method=RequestMethod.POST )
	public ModelAndView addReserveAbleTime( @RequestParam(value="reserveAbleStartTime", required=true) List<String> reserveAbleStartTime,
											@RequestParam(value="reserveAbleEndTime", required=true) List<String> reserveAbleEndTime ) throws Exception {

		System.out.println("/business/addReserveAbleTime : POST");
		
		ModelAndView mv = new ModelAndView();
		
		// 서연희_수정필요
		// 업체 가입과 로그인 구현 이후 "bus02"대신 세션에서 받아오는 업체 아이디 넣을것!!!!
		String businessId = "bus02";
		
		for(int i=0 ; i<reserveAbleStartTime.size() ; i++) {
			ReserveAble reserveAble = new ReserveAble();
			reserveAble.setBusinessId(businessId);
			reserveAble.setReserveAbleStartTime(reserveAbleStartTime.get(i));
			reserveAble.setReserveAbleEndTime(reserveAbleEndTime.get(i));
			
			System.out.println("서연희");
			System.out.println("businessService.addReserveAbleTime(reserveAble) 실행 전 메뉴\n" + reserveAble);
			businessService.addReserveAbleTime(reserveAble);
		}
		
		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(businessId);
		
		mv.addObject(reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-07-23 서연희
//	delReserveAbleTime
//	업체 예약 가능 등록 화면으로 이동하면서 예약 가능 시간 목록 삭제
	@RequestMapping( value="delReserveAbleTime", method=RequestMethod.GET )
	public ModelAndView delReserveAbleTime( @RequestParam("businessId") String businessId ) throws Exception {

		System.out.println("/business/delReserveAbleTime : GET");
		
		ModelAndView mv = new ModelAndView();
		
		// 서연희_수정필요
		// 업체 가입과 로그인 구현 이후 "bus02"대신 세션에서 받아오는 업체 아이디 넣을것!!!!
		businessService.delReserveAbleTime(businessId);
		
		mv.setViewName("redirect:/business/addReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-07-23 서연희
//	listReserveAbleTime
//	업체 예약 가능 시간 목록
	/*@RequestMapping( value="listReserveAbleTime", method=RequestMethod.GET )*/
	@RequestMapping( value="listReserveAbleTime" )
	public ModelAndView listReserveAbleTime( @RequestParam("businessId") String businessId ) throws Exception {

		System.out.println("/business/listReserveAbleTime : GET/POST");
		
		ModelAndView mv = new ModelAndView();
		
		/*businessId = "bus02";*/
		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(businessId);
		
		System.out.println("서연희");
		System.out.println(reserveAbleTimeList);
		
		mv.addObject(reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime.jsp");
		
		return mv;
	}
	
}
