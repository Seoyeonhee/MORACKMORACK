package com.morackmorack.mvc.service.domain;

import java.sql.Date;

public class Notify {
	
	private int notifyNo;
	private User recvNotiUser;
	private User reqNotiUser;
	private char notiType;
	private String notiDetail;
	private Date notifyDate;
	private String prohibit;
	
	public Notify() {
		
	}

	public int getNotifyNo() {
		return notifyNo;
	}

	public void setNotifyNo(int notifyNo) {
		this.notifyNo = notifyNo;
	}

	public User getRecvNotiUser() {
		return recvNotiUser;
	}

	public void setRecvNotiUser(User recvNotiUser) {
		this.recvNotiUser = recvNotiUser;
	}

	public User getReqNotiUser() {
		return reqNotiUser;
	}

	public void setReqNotiUser(User reqNotiUser) {
		this.reqNotiUser = reqNotiUser;
	}

	public char getNotiType() {
		return notiType;
	}

	public void setNotiType(char notiType) {
		this.notiType = notiType;
	}

	public String getNotiDetail() {
		return notiDetail;
	}

	public void setNotiDetail(String notiDetail) {
		this.notiDetail = notiDetail;
	}

	public Date getNotifyDate() {
		return notifyDate;
	}

	public void setNotifyDate(Date notifyDate) {
		this.notifyDate = notifyDate;
	}

	public String getProhibit() {
		return prohibit;
	}

	public void setProhibit(String prohibit) {
		this.prohibit = prohibit;
	}

	@Override
	public String toString() {
		return "Notify [notifyNo=" + notifyNo + ", recvNotiUser=" + recvNotiUser + ", reqNotiUser=" + reqNotiUser
				+ ", notiType=" + notiType + ", notiDetail=" + notiDetail + ", notifyDate=" + notifyDate
				+ ", notifyMang=" + prohibit + "]";
	}
	
}
