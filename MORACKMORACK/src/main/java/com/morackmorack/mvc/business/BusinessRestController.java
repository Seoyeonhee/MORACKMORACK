package com.morackmorack.mvc.business;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.ReserveAble;

//==> 업체관리 RestController
@RestController
@RequestMapping("/business/*")
public class BusinessRestController {
	
	/// Field
	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService businessService;
	
	public BusinessRestController() {
		System.out.println(this.getClass());
	}
	
	
//	2020-07-25 서연희
//	getBusiness
//	업체 정보 조회
	@RequestMapping( value="json/getBusiness/{businessId}", method=RequestMethod.GET )
	public Business getBusiness( @RequestParam("businessId") String businessId ) throws Exception {
		
		System.out.println("/business/json/getBusiness : GET");
		
		Business business = businessService.getBusiness(businessId);
		System.out.println(business);
		
		return business;
		
	}
	
	
//	2020-07-26 서연희
//	listBusiness
//	업체 목록 조회
	@RequestMapping( value="json/listBusiness/{searchKeyword}", method=RequestMethod.GET )
	public List<Business> listBusiness( @ModelAttribute("search") Search search ) throws Exception {
		
		System.out.println("/business/json/listBusiness : GET");
		
		search.setSearchKeyword(URLDecoder.decode(search.getSearchKeyword(), "UTF-8"));

		List<Business> businessList = businessService.getBusinessList(search);
		
		System.out.println(businessList);
		return businessList;
		
	}
	
	
//	2020-07-28 서연희
//	showReserveAbleTimeList
//	업체 목록 조회
	@RequestMapping( value="json/showReserveAbleTimeList/{businessId}/{reserveDate}", method=RequestMethod.GET )
	public List<ReserveAble> showReserveAbleTimeList( @PathVariable String businessId, @PathVariable String reserveDate ) throws Exception {
		
		System.out.println("/business/json/showReserveAbleTimeList : GET");

		List<ReserveAble> reserveAbleList = businessService.showReserveAbleTimeList(businessId, reserveDate);
		
		System.out.println("reserveAbleList = " + reserveAbleList);
		return reserveAbleList;
		
	}
	
	
//	2020-07-29 서연희
//	reserve
//	예약 시간 선택해서 넘기기
	@RequestMapping( value="json/reserve", method=RequestMethod.POST )
	@ResponseBody
	public Map<String, Object> reserve( @RequestParam(value="listSelectedTime[]") List<String> listSelectedTime, @RequestParam(value="reserveDate") String reserveDate ) throws Exception {
		
		System.out.println("/business/json/reserve : POST");
		List<ReserveAble> reserveAbleList = new ArrayList<ReserveAble>();
		
		for(int i=0 ; i<listSelectedTime.size() ; i++) {
			int reserveAbleNo = Integer.parseInt(listSelectedTime.get(i));
			ReserveAble reserveAble = businessService.getReservAbleTime(reserveAbleNo);
			reserveAbleList.add(reserveAble);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 예약 선택한 날짜
		map.put("reserveDate", reserveDate);
		// 예약 선택한 시간 목록
		map.put("reserveTimeList", reserveAbleList);
		
		return map;
		
	}

}

