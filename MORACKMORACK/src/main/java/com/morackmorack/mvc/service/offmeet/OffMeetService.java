package com.morackmorack.mvc.service.offmeet;

import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;


public interface OffMeetService {
	
	public void addOff(OffMeet offMeet) throws Exception;

	public void updateOff(OffMeet offMeet) throws Exception;
	
	public OffMeet getOff(int offNo) throws Exception;
    
    public void addOffPay(Pay pay) throws Exception;
    
    public void addBusinessPay(Pay pay) throws Exception;
    
    public Pay getOffPay(int payNo) throws Exception;
	
    public Pay getBusinessPay(int payNo) throws Exception;

    public Map<String, Object> getOffList(Search search) throws Exception;
  
	public Map<String,Object> getBusinessPayList(Search search, String userId) throws Exception;
    
}