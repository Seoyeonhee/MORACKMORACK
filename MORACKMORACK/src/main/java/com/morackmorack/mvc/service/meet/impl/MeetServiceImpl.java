package com.morackmorack.mvc.service.meet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Files;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.domain.WishMeet;
import com.morackmorack.mvc.service.meet.MeetDao;
import com.morackmorack.mvc.service.meet.MeetService;

@Service("meetServiceImpl")
public class MeetServiceImpl implements MeetService{

	@Autowired
	@Qualifier("meetDaoImpl")
	private MeetDao meetDao;
	
	public void addLimg(Files file) {
		meetDao.addLimg(file);
	}
	
	public  List<Meet> getMeetMain(){
		return meetDao.getMeetMain();
	}
	
	public void addMeet(Meet meet) {
	meetDao.addMeet(meet);
}
	
	public Meet getMeet(String meetId){
		return meetDao.getMeet(meetId);
	}
	
	public void updateMeet(Meet meet){
		meetDao.updateMeet(meet);
	}
	
	public List<Meet> listMeet(Search search){
		return meetDao.listMeet(search);
	}
	
	public List<Meet> listMeetFromMain(){
		return meetDao.listMeetFromMain();
	}
	
	public List<Meet> listMeetFromMain(List<String> categoryName){
		return meetDao.listMeetFromMain(categoryName);
	}
	
	public void outMeet(String userId, String meetId){
		meetDao.outMeet(userId, meetId);
	}
	
	public void delMeet(String meetId){
		meetDao.delMeet(meetId);
	}
	
	public void joinMeet(MeetMem meetMem){
		meetDao.joinMeet(meetMem);
	}
	
	public void addMemNum(String meetId) {
		meetDao.addMemNum(meetId);
	}
	
	public MeetMem getMeetMem(String meetId, String userId){
		return meetDao.getMeetMem(meetId, userId);
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
	
	public void provideStaff(String userId, String meetId, String pstnNum){
		meetDao.provideStaff(userId, meetId, pstnNum);
	}
	
	public void provideLeader(String userId, String meetId){
		meetDao.provideLeader(userId, meetId);
	}
	
	public List<MeetMem> listMyMeet(String userId){
		return meetDao.listMyMeet(userId);
	}
	
	public void addWishMeet(String userId, String meetId){
		meetDao.addWishMeet(userId, meetId);
	}
	
	public Map getWishMeet(String meetId, String userId) {
		return meetDao.getWishMeet(meetId, userId);
	}
	
	public Map listWishMeet(String userId){
		return meetDao.listWishMeet(userId);
	}
	
	public void delWishMeet(String userId, String meetId){
		meetDao.delWishMeet(userId, meetId);
	}
	
	public String getHash(String hashtag) {
		return meetDao.getHash(hashtag);
	}
	
	public List<String> getHashtagFromMain(String hashtag) {
		return meetDao.getHashtagFromMain(hashtag);
	}
	
	public void addHash(String hashtag) {
		meetDao.addHash(hashtag);
	}
	
	public void addMeet_Hash(String meetId, String hashNo) {
		meetDao.addMeet_Hash(meetId, hashNo);
	}
	
	public Boolean checkJoinMeetCount(int joinMeetCount) {

		if(joinMeetCount>=5) {
			return false;
		}else {
			return true;
		}
	}
	
}
