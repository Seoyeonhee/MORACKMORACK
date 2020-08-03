package com.morackmorack.mvc.business;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.community.CommunityService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Files;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.domain.ReserveAble;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.offmeet.OffMeetService;

//==> 업체관리 Controller
@Controller
@RequestMapping("/business/*")
public class BusinessController {

	///Field
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;
	@Autowired
	@Qualifier("offMeetServiceImpl")
	private OffMeetService offMeetService;
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
		
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	public BusinessController(){
		System.out.println(this.getClass());
	}
	
	

//	2020-07-24 서연희
//	login
//	업체 로그인 화면으로 단순 이동
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/business/logon : GET");

		return "redirect:/business/loginBusiness.jsp";
	}
	
	
//	2020-07-24 서연희
//	login
//	업체 로그인
	@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(@ModelAttribute("business") Business business , HttpSession session ) throws Exception{
		
		System.out.println("/business/login : POST");
		
		ModelAndView mv = new ModelAndView();
		
		Business dbBusiness = businessService.getBusiness(business.getBusinessId());
		
		if(business.getBusinessPass().equals(dbBusiness.getBusinessPass())) {
			session.setAttribute("business", dbBusiness);
		}
		
		mv.setViewName("redirect:/index.jsp");
		
		return mv;
	}
	
	
//	2020-07-24 서연희
//	logout
//	업체 로그아웃
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/business/logout : POST");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}

	
//	2020-07-22 서연희
//	listBusiness
//	업체 목록
	@RequestMapping( value="listBusiness", method=RequestMethod.GET )
	public ModelAndView listBusiness( ) throws Exception {

		System.out.println("/business/listBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		List<Business> businessList = new ArrayList<>();
		Search search = new Search();
		
		businessList = businessService.getBusinessList(search);

		System.out.println(businessList);
		
		mv.addObject("businessList", businessList);
		mv.setViewName("/business/listBusiness.jsp");
		
		return mv;
	}

	
//	2020-07-27 서연희
//	getBusiness
//	업체 상세(예약을 위한)
	@RequestMapping( value="getBusiness", method=RequestMethod.GET )
	public ModelAndView getBusiness( @RequestParam("businessId") String businessId ) throws Exception {

		System.out.println("/business/getBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = businessService.getBusiness(businessId);
		business.setMenu(businessService.listBusinessMenu(businessId));

		mv.addObject("menu", business.getMenu());
		mv.setViewName("/business/getBusiness.jsp");
		
		return mv;
	}

	
//	2020-08-01 서연희
//	addBusinessMenu
//	업체 메뉴 등록_파일업로드까지
	@RequestMapping( value="addBusinessMenu", method=RequestMethod.POST )
	public ModelAndView addBusinessMenu( @RequestParam(value="businessMenuList", required=true) List<String> businessMenuList,
										@RequestParam(value="businessMenuFeeList", required=true) List<Integer> businessMenuFeeList,
										MultipartHttpServletRequest mtf,
										HttpServletRequest request,
										HttpSession session) throws Exception {

		System.out.println("/business/addBusinessMenu : POST");
		
		ModelAndView mv = new ModelAndView();

		List<MultipartFile> fileList = mtf.getFiles("businessMenuImgList");
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/images/uploadFiles/business/";
		String upload_path = "C:/Users/a/Git/MORACKMORACK/MORACKMORACK/WebContent/resources/images/uploadFiles/business";
		
		Menu menu = new Menu();
		menu.setBusinessId(((Business)session.getAttribute("business")).getBusinessId());
		int index = 0;
		
		if(fileList != null) {
			for(MultipartFile mf : fileList) {
				
				String originFileName = mf.getOriginalFilename();
				long fileSize = mf.getSize();
				
				String savedFile = communityService.uploadFile(upload_path, originFileName, mf.getBytes());
				
				try {
					/*mf.transferTo(new File(root_path + attach_path + savedFile));*/
					menu.setBusinessMenuImg(savedFile);
					menu.setBusinessMenu(businessMenuList.get(index));
					menu.setBusinessMenuFee(businessMenuFeeList.get(index));
					
					businessService.addBusinessMenu(menu);
					
					index++;
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			menu.setBusinessMenuImg("empty_Img.png");
		}
		
		mv.setViewName("redirect:/business/listBusinessMenu");
		
		return mv;
	}
	
	
//	2020-07-21 서연희
//	listBusinessMenu
//	업체 메뉴 목록
	@RequestMapping( value="listBusinessMenu", method=RequestMethod.GET )
	public ModelAndView listBusinessMenu(HttpSession session) throws Exception {

		System.out.println("/business/listBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		List<Menu> menuList = businessService.listBusinessMenu(business.getBusinessId());
		
		business.setMenu(businessService.listBusinessMenu(business.getBusinessId()));
		
		mv.addObject("menuList", menuList);
		mv.setViewName("forward:/business/listBusinessMenu.jsp");
		
		return mv;
	}
	
	
//	2020-07-21 서연희
//	getBusinessMenu
//	업체 메뉴 상세
	@RequestMapping( value="getBusinessMenu", method=RequestMethod.GET )
	public ModelAndView getBusinessMenu( @RequestParam("menuNo") int menuNo ) throws Exception {

		System.out.println("/business/getBusinessMenu : GET");
		
		ModelAndView mv = new ModelAndView();
		Menu menu = new Menu();
		
		menu = businessService.getBusinessMenu(menuNo);
		
		mv.addObject("menu", menu);
		mv.setViewName("forward:/business/getBusinessMenu.jsp");
		
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
		
		mv.setViewName("redirect:/business/listBusinessMenu");
		
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
		
		mv.setViewName("forward:/business/listBusinessMenu");
		
		return mv;
	}	
	
	
//	2020-07-23 서연희
//	addReserveAbleTime
//	업체 예약 가능 시간 재등록
	@RequestMapping( value="addReserveAbleTime", method=RequestMethod.POST )
	public ModelAndView addReserveAbleTime( @RequestParam(value="reserveAbleStartTime", required=true) List<String> reserveAbleStartTime,
											@RequestParam(value="reserveAbleEndTime", required=true) List<String> reserveAbleEndTime,
											HttpSession session ) throws Exception {

		System.out.println("/business/addReserveAbleTime : POST");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		
		String businessId = business.getBusinessId();
		
		for(int i=0 ; i<reserveAbleStartTime.size() ; i++) {
			ReserveAble reserveAble = new ReserveAble();
			reserveAble.setBusinessId(businessId);
			reserveAble.setReserveAbleStartTime(reserveAbleStartTime.get(i));
			reserveAble.setReserveAbleEndTime(reserveAbleEndTime.get(i));
			
			businessService.addReserveAbleTime(reserveAble);
		}
		
		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(businessId);
		
		mv.addObject(reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime");
		
		return mv;
	}
	
	
//	2020-07-23 서연희
//	delReserveAbleTime
//	업체 예약 가능 등록 화면으로 이동하면서 예약 가능 시간 목록 삭제
	@RequestMapping( value="delReserveAbleTime", method=RequestMethod.GET )
	public ModelAndView delReserveAbleTime( HttpSession session ) throws Exception {

		System.out.println("/business/delReserveAbleTime : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		
		businessService.delReserveAbleTime(business.getBusinessId());
		
		mv.setViewName("forward:/business/addReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-07-23 서연희
//	listReserveAbleTime
//	업체 예약 가능 시간 목록
	/*@RequestMapping( value="listReserveAbleTime", method=RequestMethod.GET )*/
	@RequestMapping( value="listReserveAbleTime" )
	public ModelAndView listReserveAbleTime( HttpSession session ) throws Exception {

		System.out.println("/business/listReserveAbleTime : GET/POST");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");

		List<ReserveAble> reserveAbleTimeList = businessService.listReserveAbleTime(business.getBusinessId());

		System.out.println(reserveAbleTimeList);
		
		mv.addObject("reserveAbleTimeList", reserveAbleTimeList);
		mv.setViewName("forward:/business/listReserveAbleTime.jsp");
		
		return mv;
	}
	
	
//	2020-08-03 서연희
//	listReserveBusiness
//	업체가 _ 에약 목록 조회
	@RequestMapping( value="listReserveBusiness" )
	public ModelAndView listReserveBusiness( HttpSession session, @ModelAttribute("search") Search search ) throws Exception {
		
		System.out.println("/business/listReserveBusiness : GET/POST");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map map = offMeetService.listReserveBusiness(search);
		
		// 모락모락_서연희
		// 쿼리 에러때문에 확인 못해봐서 잘 구현된건지 모름
		mv.addObject("list", map.get("list"));
		
		mv.setViewName("forward:/business/listReserveBusiness.jsp");
		
		return mv;
	}
	
	
//	2020-08-03 서연희
//	getReserveBusiness
//	업체가 _ 에약 상세 조회
	@RequestMapping( value="listReserveBusiness", method=RequestMethod.GET )
	public ModelAndView getReserveBusiness( HttpSession session, @RequestParam("payNo") int payNo ) throws Exception {
		
		System.out.println("/business/listReserveBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		Business business = (Business)session.getAttribute("business");
		
		// 모락모락_서연희
		// getReserveBusiness - businessId, payNo 파라미터 두개 받아야함
		/*Pay pay = offMeetService.getBusinessPay(business.getBusinessId(), payNo);*/
		
		/*mv.addObject("pay", pay)*/
		mv.setViewName("forward:/business/getReserveBusiness.jsp");
		
		return mv;
	}
	
	
//	2020-07-20 서연희
//	listUsedBusiness
//	User가 이용한 업체 목록
	@RequestMapping( value="listUsedBusiness", method=RequestMethod.GET )
	public ModelAndView listUsedBusiness( HttpSession session ) throws Exception {
		
		System.out.println("/business/listUsedBusiness : GET");
		
		ModelAndView mv = new ModelAndView();
		User user = (User)session.getAttribute("user");
		
		List<Pay> usedBusinessList = businessService.getUsedBusinessList(user.getUserId());
		
		System.out.println("서연희");
		System.out.println(usedBusinessList);
		
		mv.addObject("usedBusinessList", usedBusinessList);
		mv.setViewName("forward:/business/listUsedBusiness.jsp");
		
		return mv;
	}
	
}
