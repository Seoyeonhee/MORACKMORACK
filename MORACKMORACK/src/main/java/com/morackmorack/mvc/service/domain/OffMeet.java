package com.morackmorack.mvc.service.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;


	
public class OffMeet {

		
	private int offNo;
	private User user;
	private Meet meet;
	private String offName;
	private String offLoc;
	private String offMax;
	private int offMem;
	private int amount;
	private Date offDate;
	private Date offTime;
	
	@ManyToMany(mappedBy = "offMeet")
	private List<MeetMem> meetMem = new ArrayList<MeetMem>();
	
	public OffMeet() {
		
	}

	public List<MeetMem> getMeetMem() {
		return meetMem;
	}
	
	public void setMeetMem(List<MeetMem> meetMem) {
		this.meetMem = meetMem;
	}
	public int getOffNo() {
		return offNo;
	}
	public void setOffNo(int offNo) {
		this.offNo = offNo;
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
	public String getOffName() {
		return offName;
	}
	public void setOffName(String offName) {
		this.offName = offName;
	}
	public String getOffLoc() {
		return offLoc;
	}
	public void setOffLoc(String offLoc) {
		this.offLoc = offLoc;
	}
	public String getOffMax() {
		return offMax;
	}
	public void setOffMax(String offMax) {
		this.offMax = offMax;
	}
	public int getOffMem() {
		return offMem;
	}
	public void setOffMem(int offMem) {
		this.offMem = offMem;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOffDate() {
		return offDate;
	}
	public void setOffDate(Date offDate) {
		this.offDate = offDate;
	}
	public Date getOffTime() {
		return offTime;
	}
	public void setOffTime(Date offTime) {
		this.offTime = offTime;
	}

	@Override
	public String toString() {
		return "OffMeet [offNo=" + offNo + ", user=" + user + ", meet=" + meet + ", offName=" + offName + ", offLoc="
				+ offLoc + ", offMax=" + offMax + ", offMem=" + offMem + ", amount=" + amount + ", offDate=" + offDate
				+ ", offTime=" + offTime + ", meetMem=" + meetMem + "]";
	}
	
}
