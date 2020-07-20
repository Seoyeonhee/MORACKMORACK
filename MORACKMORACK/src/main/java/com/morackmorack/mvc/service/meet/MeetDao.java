package com.morackmorack.mvc.service.meet;

import java.util.List;

import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;

public interface MeetDao {
	public void addMeet(Meet meet);
	
	public Meet getMeet(String meetId);
	
	public void updateMeet(String meetId);
	
	//public List<Meet> listMeet(String)
	
	public void delMeet(String userId, String meetId);
	
	public void joinMeet(String userId, String meetId);
	
	public void addMeetMem(MeetMem meetMem);
	
	public User getMeetMem(String meetId);
	
	public List<MeetMem> listMeetMem(String meetId);
	
	public  List<MeetMem> listJoinMeetUser(String meetId);
	
	public void okJoinMeetUser(String userId, String meetId);
	
	public void refuseJoinMeetUser(String userId, String meetId);
	
	public void provideStaff(String userId, String meetId);
	
	public void provideLeader(String userId, String meetId);
	
	public List<MeetMem> listMyMeet(String userId);
	
	public void addWishMeet(String userId, String meetId);
	
	public List<Meet> listWishMeet(String userId, String meetId);
	
	public void delWishMeet(String userId, String meetId);
	
	public String getHash(String hashtag);
	
	public void addHash(String hashtag);
	
	public void addMeet_Hash(String meetId, String hashNo);
}
