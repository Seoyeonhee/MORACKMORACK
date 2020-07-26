package com.morackmorack.mvc.business;

import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.business.BusinessService;
import com.morackmorack.mvc.service.domain.Business;

//==> ��ü���� RestController
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
	
	
//	2020-07-25 ������
//	getBusiness
//	��ü ���� ��ȸ
	@RequestMapping( value="json/getBusiness/{businessId}", method=RequestMethod.GET )
	public Business getBusiness( @RequestParam("businessId") String businessId ) throws Exception {
		
		System.out.println("/business/json/getBusiness : GET");
		
		Business business = businessService.getBusiness(businessId);
		System.out.println(business);
		
		return business;
		
	}
	
	
//	2020-07-26 ������
//	listBusiness
//	��ü ��� ��ȸ
	@RequestMapping( value="json/listBusiness/{searchKeyword}", method=RequestMethod.GET )
	public List<Business> listBusiness( @ModelAttribute("search") Search search ) throws Exception {
		
		System.out.println("/business/json/listBusiness : GET");
		
		search.setSearchKeyword(URLDecoder.decode(search.getSearchKeyword(), "UTF-8"));

		List<Business> businessList = businessService.getBusinessList(search);
		
		System.out.println(businessList);
		return businessList;
		
	}

}

