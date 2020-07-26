package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.Date;

public class WishMeet  implements Serializable{
	private String userId;
	private Meet meet;
	private Date wishDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Meet getMeet() {
		return meet;
	}
	public void setMeet(Meet meet) {
		this.meet = meet;
	}
	public Date getWishDate() {
		return wishDate;
	}
	public void setWishDate(Date wishDate) {
		this.wishDate = wishDate;
	}
	@Override
	public String toString() {
		return "WishMeet [userId=" + userId + ", meet=" + meet + ", wishDate=" + wishDate + "]";
	}
	
}
