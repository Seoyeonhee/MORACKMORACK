package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.springframework.format.annotation.DateTimeFormat;

public class MeetMem implements Serializable{
	private int memNo;
	private User user;
	private  Meet meet;
	private char joinCode;
	private char meetRole;
	private Date joinReqDate;
	private Date joinDate;
	private String intro;
	private int notifyCount;
	private boolean friendFlag;
	private Map<String, String> blackList;
	
	  @ManyToMany
	  @JoinTable(name="meetmem_offmeet",
	  joinColumns = @JoinColumn(name="mem_no" , referencedColumnName= "memNo"),
	   inverseJoinColumns = @JoinColumn(name = "off_no", referencedColumnName = "offNo")
	  )
		private List<OffMeet> offMeet = new ArrayList<OffMeet>();
	  
	  
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
	public char getJoinCode() {
		return joinCode;
	}
	public void setJoinCode(char joinCode) {
		this.joinCode = joinCode;
	}
	public char getMeetRole() {
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

	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public List<OffMeet> getOffMeet() {
		return offMeet;
	}
	public void setOffMeet(List<OffMeet> offMeet) {
		this.offMeet = offMeet;
	}
	public boolean isFriendFlag() {
		return friendFlag;
	}
	public void setFriendFlag(boolean friendFlag) {
		this.friendFlag = friendFlag;
	}
	@Override
	public String toString() {
		return "MeetMem [memNo=" + memNo + ", user=" + user + ", meet=" + meet + ", joinCode=" + joinCode
				+ ", meetRole=" + meetRole + ", joinReqDate=" + joinReqDate + ", joinDate=" + joinDate + ", intro="
				+ intro + ", notifyCount=" + notifyCount + ", blackList=" + blackList + ", offMeet=" + offMeet + "]";
	}
	
}
