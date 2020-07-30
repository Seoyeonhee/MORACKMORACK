package com.morackmorack.mvc.service.meet;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Files;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.domain.WishMeet;

public interface MeetService {
	
	public void addLimg(Files file);
	
	public  List<Meet> getMeetMain();

	public void addMeet(Meet meet);
	
	public Meet getMeet(String meetId);
	
	public void updateMeet(Meet meet);
	
	public List<Meet> listMeet(Search search);
	
	public List<Meet> listMeetFromMain();
	
	public List<Meet> listMeetFromMain(List<String> categoryName);
	
	public void outMeet(String userId, String meetId);
	
	public void delMeet(String meetId);
	
	public void joinMeet(MeetMem meetMem);
	
	public void addMemNum(String meetId);
	
	public MeetMem getMeetMem(String meetId, String userId);
	
	public List<MeetMem> listMeetMem(String meetId);
	
	public  List<MeetMem> listJoinMeetUser(String meetId);
	
	public void okJoinMeetUser(String userId, String meetId);
	
	public void refuseJoinMeetUser(String userId, String meetId);
	
	public void provideStaff(String userId, String meetId, String pstnNum);
	
	public void provideLeader(String userId, String meetId);
	
	public List<MeetMem> listMyMeet(String userId);
	
	public void addWishMeet(String userId, String meetId);
	
	public Map getWishMeet(String meetId, String userId);
	
	public Map listWishMeet(String userId);
	
	public void delWishMeet(String userId, String meetId);
	
	public String getHash(String hashtag);

	public List<String> getHashtagFromMain(String hashtag);
	
	public void addHash(String hashtag);
	
	public void addMeet_Hash(String meetId, String hashNo);
	
	public Boolean checkJoinMeetCount(int meetCount);
}
