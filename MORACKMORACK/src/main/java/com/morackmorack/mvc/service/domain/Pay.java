package com.morackmorack.mvc.service.domain;

import java.sql.Date;

public class Pay {

	private int payNo;
	private char payFlag;
	private User user;
	private Meet meet;
	private OffMeet offmeet;
	private Business business;
	private int totalAmount;
	private Date payDate;
	private char payMethod;
	private String reserveStartTime;
	private String reserveEndTime;
	private Date reserveDate;
	

	public Pay() {
	
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public char getPayFlag() {
		return payFlag;
	}


	public void setPayFlag(char payFlag) {
		this.payFlag = payFlag;
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


	public OffMeet getOffmeet() {
		return offmeet;
	}


	public void setOffmeet(OffMeet offmeet) {
		this.offmeet = offmeet;
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


	public Date getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}


	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", payFlag=" + payFlag + ", user=" + user + ", meet=" + meet + ", offmeet="
				+ offmeet + ", totalAmount=" + totalAmount + ", payDate=" + payDate + ", payMethod=" + payMethod
				+ ", reserveStartTime=" + reserveStartTime + ", reserveEndTime=" + reserveEndTime + ", reserveDate="
				+ reserveDate + "]";
	}

}
