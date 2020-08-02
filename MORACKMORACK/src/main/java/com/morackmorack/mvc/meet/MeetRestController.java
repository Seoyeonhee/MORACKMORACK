package com.morackmorack.mvc.meet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.service.domain.Hashtag;
import com.morackmorack.mvc.service.meet.MeetService;

@RestController
@RequestMapping("/meet/*")
public class MeetRestController {
	
	@Autowired
	@Qualifier("meetServiceImpl")
	private MeetService meetService;
	
	@ResponseBody
	@RequestMapping(value  = "/json/getHashtag")
	public List<String>getHashtag(@RequestBody Map<String, Object>params ) {
		System.out.println("meet/json/getHashtag");
		
		List<String> listHash = meetService.getHashtagFromMain((String) params.get("hash"));
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+listHash);
		
		return listHash;
	
	}

}
