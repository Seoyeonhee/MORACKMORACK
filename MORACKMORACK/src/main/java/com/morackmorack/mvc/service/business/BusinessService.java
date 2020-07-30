package com.morackmorack.mvc.service.business;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Business;
import com.morackmorack.mvc.service.domain.Menu;
import com.morackmorack.mvc.service.domain.ReserveAble;

public interface BusinessService {
	
	// 제휴 신청(업체 가입)
	public void addBusiness(Business business) throws Exception;
	
	// 업체 세부 정보(업체가 자기 정보 변경하고자 할때 보여지는 정보들)
	public Business getBusiness(String businessId) throws Exception;
	
	// 업체 정보 수정
	public void updateBusiness(Business business) throws Exception;
	
	// 업체 목록
	public List<Business> getBusinessList(Search search) throws Exception;
	
	// 제휴 해지(업체 탈퇴)
	public void delBusiness(String businessId) throws Exception;
	
	
	

	// 메뉴 등록
	public void addBusinessMenu(Menu menu) throws Exception;
	
	// 메뉴리스트
	public List<Menu> listBusinessMenu(String businessId) throws Exception;
	
	// 메뉴 상세
	public Menu getBusinessMenu(int menuNo) throws Exception;
	
	// 메뉴 수정
	public void updateBusinessMenu(Menu menu) throws Exception;
	
	// 메뉴 삭제
	public void delBusinessMenu(int menuNo) throws Exception;
	
	
	
	
	// 예약 가능 시간 등록
	public void addReserveAbleTime(ReserveAble reserveAble) throws Exception;
	
	// 예약 가능 시간 전체 삭제
	public void delReserveAbleTime(String businessId) throws Exception;
	
	// 예약 가능 시간 목록
	public List<ReserveAble> listReserveAbleTime(String businessId) throws Exception;
	
	
	
	
	// 예약 화면을 위한 예약 가능 시간 목록
	public List<ReserveAble> showReserveAbleTimeList(String businessId, String reserveDate) throws Exception;
	
	// 예약가능시간 번호로 예약 시간 가져오기
	public ReserveAble getReservAbleTime(int reserveAbleNo) throws Exception;
	
}
