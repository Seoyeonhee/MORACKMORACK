package com.morackmorack.mvc.meet;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/meet/*")
public class MeetRestController {
	
	@ResponseBody
	@RequestMapping(value  = "/json/saveAlarm")
	public void saveAlarm(@RequestBody HashMap<String, Object> map) {
		System.out.println("/json/saveAlarm");
		System.out.println(map);
	}

}
