package com.morackmorack.mvc.service.domain;

import java.sql.Date;

public class Pay {

	private int payNo;
	private User user;
	private Meet meet;
	private OffMeet offMeet;
	private Business business;
	private int totalAmount;
	private String payDate;
	private int payMethod;
	private String reserveStartTime;
	private String reserveEndTime;
	private String reserveDate;
	private int reserveMemNum;


	
	public Pay() {
		
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


	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String string) {
		this.payDate = string;
	}


	public int getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(int payMethod) {
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


	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", user=" + user + ", meet=" + meet + ", offMeet="
				+ offMeet + ", business=" + business + ", totalAmount=" + totalAmount + ", payDate=" + payDate
				+ ", payMethod=" + payMethod + ", reserveStartTime=" + reserveStartTime + ", reserveEndTime="
				+ reserveEndTime + ", reserveDate=" + reserveDate + ", reserveMemNum=" + reserveMemNum + "]";
	}



}
