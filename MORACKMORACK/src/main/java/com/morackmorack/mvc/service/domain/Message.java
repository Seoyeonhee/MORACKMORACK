package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
private int messagNo;
private char messageFlag;
private String sendId;
private String recvId;
private String recvMeetId;
private int offNo;
private String title;
private String content;
private Date sendDate;
private Date readState;

public char getMessageFlag() {
	return messageFlag;
}
public void setMessageFlag(char messageFlag) {
	this.messageFlag = messageFlag;
}
public String getSendId() {
	return sendId;
}
public void setSendId(String sendId) {
	this.sendId = sendId;
}
public String getRecvId() {
	return recvId;
}
public void setRecvId(String recvId) {
	this.recvId = recvId;
}
public String getRecvMeetId() {
	return recvMeetId;
}
public void setRecvMeetId(String recvMeetId) {
	this.recvMeetId = recvMeetId;
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
public Date getReadState() {
	return readState;
}
public void setReadState(Date readState) {
	this.readState = readState;
}

@Override
public String toString() {
	return "Message [messageFlag=" + messageFlag + ", sendId=" + sendId + ", recvId=" + recvId + ", recvMeetId="
			+ recvMeetId + ", offNo=" + offNo + ", title=" + title + ", content=" + content + ", sendDate=" + sendDate
			+ ", readState=" + readState + "]";
}

}
