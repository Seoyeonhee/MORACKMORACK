package com.morackmorack.mvc.offmeet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.offmeet.OffMeetService;

@RestController
@RequestMapping("/offMeet/*")
public class OffMeetRestController {

	@Autowired
	@Qualifier("offMeetServiceImpl")
	private OffMeetService offMeetService;
	
	public OffMeetRestController() {
		System.out.println(this.getClass());
	}
	
 @RequestMapping(value= "json/updateOffMem/{offNo}/{offMem}", method =RequestMethod.GET)
 public OffMeet updateOffMem (@PathVariable int offNo, @PathVariable int offMem) throws Exception{
	 
	 OffMeet offMeet = new OffMeet();
	 offMeet.setOffNo(offNo);
	 offMeet.setOffMem(offMem);
	
	 return offMeet;
 }

}
