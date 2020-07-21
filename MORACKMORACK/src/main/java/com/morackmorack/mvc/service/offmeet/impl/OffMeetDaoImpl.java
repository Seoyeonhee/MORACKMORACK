package com.morackmorack.mvc.service.offmeet.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.service.domain.OffMeet;
import com.morackmorack.mvc.service.domain.Pay;
import com.morackmorack.mvc.service.offmeet.OffMeetDao;

@Repository("offMeetDaoImpl")
public class OffMeetDaoImpl implements OffMeetDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public OffMeetDaoImpl() {
		System.out.println(this.getClass());
	}

	public void addOff(OffMeet offMeet) throws Exception {
		sqlSession.insert("OffMeetMapper.addOff", offMeet);	
	}
	
	public void updateOff(OffMeet offMeet) throws Exception {
		sqlSession.update("OffMeetMapper.updateOff", offMeet);
	}
	
	public OffMeet getOff(int offNo) throws Exception {
		System.out.println(offNo);
		return sqlSession.selectOne("OffMeetMapper.getOff", offNo);
	}

	public void addOffPay(Pay pay) throws Exception {
		sqlSession.insert("OffMeetMapper.addOffPay", pay);
		sqlSession.update("OffMeetMapper.updateOffMem", pay);
	}

	public void addBusinessPay(Pay pay) throws Exception {
		sqlSession.insert("OffMeetMapper.addBusinessPay", pay);
	}
	
	public Pay getOffPay(int payNo) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getOffPay", payNo);
	}

	public Pay getBusinessPay(int payNo) throws Exception {
		return sqlSession.selectOne("OffMeetMapper.getBusinessPay", payNo);
	}
	

}