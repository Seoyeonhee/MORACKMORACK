package com.morackmorack.mvc.service.domain;

import java.io.Serializable;

import java.sql.Date;

public class ReserveAble implements Serializable {

	/// Field
	private Date reserveAbleStartTime;
	private Date reserveAbleEndTime;
	
	/// Constructor
	public ReserveAble() {
	}

	/// Method
	public Date getReserveAbleStartTime() {
		return reserveAbleStartTime;
	}
	
	public void setReserveAbleStartTime(Date reserveAbleStartTime) {
		this.reserveAbleStartTime = reserveAbleStartTime;
	}
	
	public Date getReserveAbleEndTime() {
		return reserveAbleEndTime;
	}
	
	public void setReserveAbleEndTime(Date reserveAbleEndTime) {
		this.reserveAbleEndTime = reserveAbleEndTime;
	}
	

}
