package com.morackmorack.mvc.service.domain;

import java.sql.Date;

public class Pay {

	private int payNo;
	private User user;
	private Meet meet;
	private OffMeet offMeet;
	private Business business;
	private int totalAmount;
	private Date payDate;
	private char payMethod;
	private String reserveStartTime;
	private String reserveEndTime;
	private String reserveDate;
	private int reserveMemNum;
	private char payStatus;
	private int reserveAbleNo;
	private String meetName;
	private String bank;
	private String accNum;
	
	public Pay() {
		
	}
	
	public char getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(char payStatus) {
		this.payStatus = payStatus;
	}

	
	
	public int getReserveAbleNo() {
		return reserveAbleNo;
	}

	public void setReserveAbleNo(int reserveAbleNo) {
		this.reserveAbleNo = reserveAbleNo;
	}

	public int getReserveMemNum() {
		return reserveMemNum;
	}


	public void setReserveMemNum(int reserveMemNum) {
		this.reserveMemNum = reserveMemNum;
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
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


	public Business getBusiness() {
		return business;
	}


	public void setBusiness(Business business) {
		this.business = business;
	}


	public int getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}



	public Date getPayDate() {
		return payDate;
	}


	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}


	public char getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(char payMethod) {
		this.payMethod = payMethod;
	}


	public String getReserveStartTime() {
		return reserveStartTime;
	}


	public void setReserveStartTime(String reserveStartTime) {
		this.reserveStartTime = reserveStartTime;
	}


	public String getReserveEndTime() {
		return reserveEndTime;
	}


	public void setReserveEndTime(String reserveEndTime) {
		this.reserveEndTime = reserveEndTime;
	}


	public String getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}


	public OffMeet getOffMeet() {
		return offMeet;
	}


	public void setOffMeet(OffMeet offMeet) {
		this.offMeet = offMeet;
	}

	public String getMeetName() {
		return meetName;
	}

	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccNum() {
		return accNum;
	}

	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}

	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", user=" + user + ", meet=" + meet + ", offMeet=" + offMeet + ", business="
				+ business + ", totalAmount=" + totalAmount + ", payDate=" + payDate + ", payMethod=" + payMethod
				+ ", reserveStartTime=" + reserveStartTime + ", reserveEndTime=" + reserveEndTime + ", reserveDate="
				+ reserveDate + ", reserveMemNum=" + reserveMemNum + ", payStatus=" + payStatus + ", reserveAbleNo="
				+ reserveAbleNo + ", meetName=" + meetName + ", bank=" + bank + ", accNum=" + accNum + "]";
	}



}
