package com.morackmorack.mvc.service.domain;

import java.util.Date;
import java.util.Map;

public class MeetMem {
	private int memNo;
	private User user;
	private  Meet meet;
	private char joinCode;
	private char meetRole;
	private Date joinReqDate;
	private Date joinDate;
	private String intro;
	private int notifyCount;
	private Map<String, String> blackList;
	
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Meet getMeet() {
		return meet;
	}
	public void setMeet(Meet meet) {
		this.meet = meet;
	}
	public int getJoinCode() {
		return joinCode;
	}
	public void setJoinCode(char joinCode) {
		this.joinCode = joinCode;
	}
	public int getMeetRole() {
		return meetRole;
	}
	public void setMeetRole(char meetRole) {
		this.meetRole = meetRole;
	}
	public Date getJoinReqDate() {
		return joinReqDate;
	}
	public void setJoinReqDate(Date joinReqDate) {
		this.joinReqDate = joinReqDate;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getNotifyCount() {
		return notifyCount;
	}
	public void setNotifyCount(int notifyCount) {
		this.notifyCount = notifyCount;
	}
	public Map<String, String> getBlackList() {
		return blackList;
	}
	public void setBlackList(Map<String, String> blackList) {
		this.blackList = blackList;
	}
	
	@Override
	public String toString() {
		return "MeetMem [memNo=" + memNo + ", user=" + user + ", meet=" + meet + ", joinCode=" + joinCode
				+ ", meetRole=" + meetRole + ", joinReqDate=" + joinReqDate + ", joinDate=" + joinDate + ", intro="
				+ intro + ", notifyCount=" + notifyCount + ", blackList=" + blackList + "]";
	}
}
