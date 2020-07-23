package com.morackmorack.mvc.service.domain;

import java.io.Serializable;

import java.sql.Date;

public class ReserveAble implements Serializable {

	/// Field
	private int reserveAbleNo;
	private String businessId;
	private String reserveAbleStartTime;
	private String reserveAbleEndTime;
	
	/// Constructor
	public ReserveAble() {
	}

	/// Method
	public int getReserveAbleNo() {
		return reserveAbleNo;
	}

	public void setReserveAbleNo(int reserveAbleNo) {
		this.reserveAbleNo = reserveAbleNo;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getReserveAbleStartTime() {
		return reserveAbleStartTime;
	}

	public void setReserveAbleStartTime(String reserveAbleStartTime) {
		this.reserveAbleStartTime = reserveAbleStartTime;
	}

	public String getReserveAbleEndTime() {
		return reserveAbleEndTime;
	}

	public void setReserveAbleEndTime(String reserveAbleEndTime) {
		this.reserveAbleEndTime = reserveAbleEndTime;
	}

	
	
	@Override
	public String toString() {
		return "ReserveAble [reserveAbleNo=" + reserveAbleNo + ", businessId=" + businessId + ", reserveAbleStartTime="
				+ reserveAbleStartTime + ", reserveAbleEndTime=" + reserveAbleEndTime + "]";
	}

}
