package com.morackmorack.mvc.service.domain;

import java.sql.Date;

public class Friend {
	
	private int friendNo;
	private User reqFriend;
	private User recvFriend;
	private Date reqFriendDate;
	private Date friendDate;
	private String friendCode;
	private User myFriend;
	
	public Friend() {
	}
	
	public int getFriendNo() {
		return friendNo;
	}
	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}
	public User getReqFriend() {
		return reqFriend;
	}
	public void setReqFriend(User reqFriend) {
		this.reqFriend = reqFriend;
	}
	public User getRecvFriend() {
		return recvFriend;
	}
	public void setRecvFriend(User recvFriend) {
		this.recvFriend = recvFriend;
	}
	public Date getReqFriendDate() {
		return reqFriendDate;
	}
	public void setReqFriendDate(Date reqFriendDate) {
		this.reqFriendDate = reqFriendDate;
	}
	public Date getFriendDate() {
		return friendDate;
	}
	public void setFriendDate(Date friendDate) {
		this.friendDate = friendDate;
	}
	public String getFriendCode() {
		return friendCode;
	}
	public void setFriendCode(String friendCode) {
		this.friendCode = friendCode;
	}
	public User getMyFriend() {
		return myFriend;
	}

	public void setMyFriend(User myFriend) {
		this.myFriend = myFriend;
	}

	@Override
	public String toString() {
		return "Friend [friendNo=" + friendNo + ", reqFriend=" + reqFriend + ", recvFriend=" + recvFriend
				+ ", reqFriendDate=" + reqFriendDate + ", friendDate=" + friendDate + ", friendCode=" + friendCode
				+ ", myFriend=" + myFriend + "]";
	}	

}
