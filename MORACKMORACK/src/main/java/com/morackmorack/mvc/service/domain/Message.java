package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Message implements Serializable {
private int messageNo;
private char messageFlag;
private User sender;
private User receiver;
private String meetId;
private String meetName;
private int offNo;
private String title;
private String content;
private Date sendDate;
private boolean readState;


public int getMessageNo() {
	return messageNo;
}
public void setMessageNo(int messageNo) {
	this.messageNo = messageNo;
}
public char getMessageFlag() {
	return messageFlag;
}
public void setMessageFlag(char messageFlag) {
	this.messageFlag = messageFlag;
}
public User getSender() {
	return sender;
}
public void setSender(User sender) {
	this.sender = sender;
}
public User getReceiver() {
	return receiver;
}
public void setReceiver(User receiver) {
	this.receiver = receiver;
}
public String getMeetId() {
	return meetId;
}
public void setMeetId(String meetId) {
	this.meetId = meetId;
}
public String getMeetName() {
	return meetName;
}
public void setMeetName(String meetName) {
	this.meetName = meetName;
}
public int getOffNo() {
	return offNo;
}
public void setOffNo(int offNo) {
	this.offNo = offNo;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getSendDate() {
	return sendDate;
}
public void setSendDate(Date sendDate) {
	this.sendDate = sendDate;
}
public boolean getReadState() {
	return readState;
}
public void setReadState(boolean readState) {
	this.readState = readState;
}

@Override
public String toString() {
	return "Message [messageNo=" + messageNo + ", messageFlag=" + messageFlag + ", sender=" + sender + ", receiver="
			+ receiver + ", meetId=" + meetId + ", meetName=" + meetName + ", offNo=" + offNo + ", title=" + title
			+ ", content=" + content + ", sendDate=" + sendDate + ", readState=" + readState + "]";
}

}
