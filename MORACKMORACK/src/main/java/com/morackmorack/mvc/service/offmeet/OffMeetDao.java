package com.morackmorack.mvc.service.offmeet;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;

public interface OffMeetDao {
	//오프라인 모임 생성
	public void addOff(OffMeet offMeet) throws Exception;
	//오프라인 모임 수정
	public void updateOff(OffMeet offMeet) throws Exception;
	
	public void delOffMeet(int offNo) throws Exception;
	
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
     //오프라인 모임 리스트 조회
    public List<OffMeet> getOffList(String meetId) throws Exception;

    //참여비 사용 내역 카운트 
    public int getOffPayTotalCount(String userId) throws Exception;
    
	//참여비 사용 내역 리스트 조회
	public List<OffMeet> getOffMeetList(Search search, String userId) throws Exception;
	//참여비 사용 내역 리스트 조회
	public List<OffMeet> getPayList(Search search, String userId) throws Exception;
	//오프라인 모임 참여자 목록
	public List<Pay> listOffMem(Search search) throws Exception ;
	//오프라인 모임 참여자 수
	public int getTotalOffMemCount(Search search) throws Exception;
	
	public List<Pay> getBusinessPayList(Search search, String userId) throws Exception;
	//업체가 예약 목록 확인
	public List<Pay> listReserveBusiness(Search search) throws Exception;
	//업체 예약한 모임 수 확인 
	public int getReserveTotalCount(Search search) throws Exception;
	
	//업체가 상세 예약 확인
	public Pay getReserveBusiness(int payNo) throws Exception;
}