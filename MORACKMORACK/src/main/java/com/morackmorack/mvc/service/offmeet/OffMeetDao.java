package com.morackmorack.mvc.service.offmeet;

import java.util.List;

import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;

public interface OffMeetDao {
	//�������� ���� ����
	public void addOff(OffMeet offmeet) throws Exception;
	//�������� ���� ����
	public void updateOff(OffMeet offmeet) throws Exception;
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
      

}