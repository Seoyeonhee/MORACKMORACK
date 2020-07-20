package com.morackmorack.mvc.service.meet.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.meet.MeetDao;
import com.morackmorack.mvc.service.meet.MeetService;

@Service("meetServiceImpl")
public class MeetServiceImpl implements MeetService{

	@Autowired
	@Qualifier("meetDaoImpl")
	private MeetDao meetDao;
	
	public void addMeet(Meet meet) {
	meetDao.addMeet(meet);
}
	
	public Meet getMeet(String meetId){
		return meetDao.getMeet(meetId);
	}
	
	public void updateMeet(String meetId){
		meetDao.updateMeet(meetId);
	}
	
	//public List<Meet> listMeet(String)
	
	public void delMeet(String userId, String meetId){
		meetDao.delMeet(userId, meetId);
	}
	
	public void joinMeet(String userId, String meetId){
		meetDao.joinMeet(userId, meetId);
	}
	
	public void addMeetMem(MeetMem meetMem){
		meetDao.addMeetMem(meetMem);
	}
	
	public User getMeetMem(String meetId){
		return meetDao.getMeetMem(meetId);
	}
	
	public List<MeetMem> listMeetMem(String meetId){
		return meetDao.listMeetMem(meetId);
	}
	
	public  List<MeetMem> listJoinMeetUser(String meetId){
		return meetDao.listJoinMeetUser(meetId);
	}
	
	public void okJoinMeetUser(String userId, String meetId){
		meetDao.okJoinMeetUser(userId, meetId);
	}
	
	public void refuseJoinMeetUser(String userId, String meetId){
		meetDao.refuseJoinMeetUser(userId, meetId);
	}
	
	public void provideStaff(String userId, String meetId){
		meetDao.provideStaff(userId, meetId);
	}
	
	public void provideLeader(String userId, String meetId){
		meetDao.provideLeader(userId, meetId);
	}
	
	public List<Meet> listMyMeet(String userId){
		return meetDao.listMyMeet(userId);
	}
	
	public void addWishMeet(String userId, String meetId){
		meetDao.addWishMeet(userId, meetId);
	}
	
	public List<Meet> listWishMeet(String userId, String meetId){
		return meetDao.listWishMeet(userId, meetId);
	}
	
	public void delWishMeet(String userId, String meetId){
		meetDao.delWishMeet(userId, meetId);
	}
	
	public String getHash(String hashtag) {
		return meetDao.getHash(hashtag);
	}
	
	public void addHash(String hashtag) {
		meetDao.addHash(hashtag);
	}
	
	public void addMeet_Hash(String meetId, String hashNo) {
		meetDao.addMeet_Hash(meetId, hashNo);
	}
	
}
