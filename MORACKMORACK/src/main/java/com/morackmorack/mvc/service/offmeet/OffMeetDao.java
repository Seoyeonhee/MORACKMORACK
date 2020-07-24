package com.morackmorack.mvc.service.offmeet;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;

public interface OffMeetDao {
	//�������� ���� ����
	public void addOff(OffMeet offMeet) throws Exception;
	//�������� ���� ����
	public void updateOff(OffMeet offMeet) throws Exception;
	//�������� ���� �� ��ȸ
	public OffMeet getOff(int offNo) throws Exception;
    //�������� ���� ����
    public void addOffPay(Pay pay) throws Exception;
    //���� ��ü ����
    public void addBusinessPay(Pay pay) throws Exception;
    //�������� ���� ���� �� ��ȸ
    public Pay getOffPay(int payNo) throws Exception;
	//���� ��ü ���� �� ��ȸ
    public Pay getBusinessPay(int payNo) throws Exception;
      
    public List<OffMeet> getOffList(String meetId) throws Exception;
    
    public int getOffTotalCount(Search search) throws Exception;
    
    public int getOffPayTotalCount(Search search) throws Exception;
    
    public List<Pay> getBusinessPayList(Search search, String userId) throws Exception;
	
}