package com.morackmorack.mvc.service.offmeet;

import java.util.List;

import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;

public interface OffMeetDao {
	//오프라인 모임 생성
	public void addOff(OffMeet offmeet) throws Exception;
	//오프라인 모임 수정
	public void updateOff(OffMeet offmeet) throws Exception;
	//오프라인 모임 상세 조회
	public OffMeet getOff(int offNo) throws Exception;
    //오프라인 모임 결제
    public void addOffPay(Pay pay) throws Exception;
    //제휴 업체 결제
    public void addBusinessPay(Pay pay) throws Exception;
    //오프라인 모임 결제 상세 조회
    public Pay getOffPay(int payNo) throws Exception;
	//제휴 업체 결제 상세 조회
    public Pay getBusinessPay(int payNo) throws Exception;
      

}