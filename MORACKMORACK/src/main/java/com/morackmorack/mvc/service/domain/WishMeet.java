package com.morackmorack.mvc.service.domain;

public class WishMeet {
	private String userId;
	private Meet meet;
	
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
	@Override
	public String toString() {
		return "WishMeet [userId=" + userId + ", meet=" + meet + "]";
	}
}
