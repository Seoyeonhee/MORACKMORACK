package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Meet implements Serializable {
	private String meetId;
	private String leaderId;
	private String meetImg;
	private String meetName;
	private int category;	
	private int maxNum;
	private int memNum;
	private String meetLoc; 
	private String sIntro;
	private String lIntro;
	private List<String> lImg;
	private List<String> hashtag;
	private int meetType;
	private boolean meetAppr;
	private int meetStar;
	private Date regDate;
	private String bank;
	private String accNum;
	
	public Meet() {
		
	}
	
	public String getMeetId() {
		return meetId;
	}
	public void setMeetId(String meetId) {
		this.meetId = meetId;
	}
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}
	public String getMeetImg() {
		return meetImg;
	}
	public void setMeetImg(String meetImg) {
		this.meetImg = meetImg;
	}
	public String getMeetName() {
		return meetName;
	}
	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public String getMeetLoc() {
		return meetLoc;
	}
	public void setMeetLoc(String meetLoc) {
		this.meetLoc = meetLoc;
	}
	public String getsIntro() {
		return sIntro;
	}
	public void setsIntro(String sIntro) {
		this.sIntro = sIntro;
	}
	public String getlIntro() {
		return lIntro;
	}
	public void setlIntro(String lIntro) {
		this.lIntro = lIntro;
	}
	public List<String> getlImg() {
		return lImg;
	}
	public void setlImg(List<String> lImg) {
		this.lImg = lImg;
	}
	public List<String> getHashtag() {
		return hashtag;
	}
	public void setHashtag(List<String> hashtag) {
		this.hashtag = hashtag;
	}
	public int getMeetType() {
		return meetType;
	}
	public void setMeetType(int meetType) {
		this.meetType = meetType;
	}
	public boolean isMeetAppr() {
		return meetAppr;
	}
	public void setMeetAppr(boolean meetAppr) {
		this.meetAppr = meetAppr;
	}
	public int getMeetStar() {
		return meetStar;
	}
	public void setMeetStar(int meetStar) {
		this.meetStar = meetStar;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date meetRegDate) {
		this.regDate = meetRegDate;
	}
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	@Override
	public String toString() {
		return "Meet [meetId=" + meetId + ", leaderId=" + leaderId + ", meetImg=" + meetImg + ", meetName=" + meetName
				+ ", category=" + category + ", maxNum=" + maxNum + ", memNum=" + memNum + ", meetLoc=" + meetLoc
				+ ", sIntro=" + sIntro + ", lIntro=" + lIntro + ", hashtag=" + hashtag + ", meetType=" + meetType
				+ ", meetAppr=" + meetAppr + ", meetStar=" + meetStar + ", regDate=" + regDate + ", bank=" + bank
				+ ", accNum=" + accNum + "]";
	}
	
}
