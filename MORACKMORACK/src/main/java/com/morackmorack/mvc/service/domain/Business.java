package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.List;

import java.sql.Date;

public class Business implements Serializable {

	/// Field
	private String businessId;
	private String businessPass;
	private String businessName;
	private String businessLoc;
	private int categoryNo;
	private String businessPhone;
	private String businessImg;
	private String businessNum;
	private String businessOwner;
	private Date regDate;
	private String bank;
	private String depositAccNum;
	private int businessStar;
	private String businessStartTime;
	private String businessEndTime;
	
	private List<ReserveAble> reserveAble;
	
	private List<Menu> menu;
	
	/// Constructor
	public Business() {
	}

	
	/// Method
	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getBusinessPass() {
		return businessPass;
	}

	public void setBusinessPass(String businessPass) {
		this.businessPass = businessPass;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getBusinessLoc() {
		return businessLoc;
	}

	public void setBusinessLoc(String businessLoc) {
		this.businessLoc = businessLoc;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getBusinessPhone() {
		return businessPhone;
	}

	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}

	public String getBusinessImg() {
		return businessImg;
	}

	public void setBusinessImg(String businessImg) {
		this.businessImg = businessImg;
	}

	public String getBusinessNum() {
		return businessNum;
	}

	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}

	public String getBusinessOwner() {
		return businessOwner;
	}

	public void setBusinessOwner(String businessOwner) {
		this.businessOwner = businessOwner;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getDepositAccNum() {
		return depositAccNum;
	}

	public void setDepositAccNum(String depositAccNum) {
		this.depositAccNum = depositAccNum;
	}

	public int getBusinessStar() {
		return businessStar;
	}

	public void setBusinessStar(int businessStar) {
		this.businessStar = businessStar;
	}

	public String getBusinessStartTime() {
		return businessStartTime;
	}

	public void setBusinessStartTime(String businessStartTime) {
		this.businessStartTime = businessStartTime;
	}

	public String getBusinessEndTime() {
		return businessEndTime;
	}

	public void setBusinessEndTime(String businessEndTime) {
		this.businessEndTime = businessEndTime;
	}

	public List<ReserveAble> getReserveAble() {
		return reserveAble;
	}

	public void setReserveAble(List<ReserveAble> reserveAble) {
		this.reserveAble = reserveAble;
	}

	public List<Menu> getMenu() {
		return menu;
	}

	public void setMenu(List<Menu> menu) {
		this.menu = menu;
	}


	@Override
	public String toString() {
		return "Business [businessId=" + businessId + ", businessPass=" + businessPass + ", businessName="
				+ businessName + ", businessLoc=" + businessLoc + ", categoryNo=" + categoryNo + ", businessPhone="
				+ businessPhone + ", businessImg=" + businessImg + ", businessNum=" + businessNum + ", businessOwner="
				+ businessOwner + ", regDate=" + regDate + ", bank=" + bank + ", depositAccNum=" + depositAccNum
				+ ", businessStar=" + businessStar + ", businessStartTime=" + businessStartTime + ", businessEndTime="
				+ businessEndTime + ", reserveAble=" + reserveAble + ", menu=" + menu + ", getBusinessId()="
				+ getBusinessId() + ", getBusinessPass()=" + getBusinessPass() + ", getBusinessName()="
				+ getBusinessName() + ", getBusinessLoc()=" + getBusinessLoc() + ", getCategoryNo()=" + getCategoryNo()
				+ ", getBusinessPhone()=" + getBusinessPhone() + ", getBusinessImg()=" + getBusinessImg()
				+ ", getBusinessNum()=" + getBusinessNum() + ", getBusinessOwner()=" + getBusinessOwner()
				+ ", getRegDate()=" + getRegDate() + ", getBank()=" + getBank() + ", getDepositAccNum()="
				+ getDepositAccNum() + ", getBusinessStar()=" + getBusinessStar() + ", getBusinessStartTime()="
				+ getBusinessStartTime() + ", getBusinessEndTime()=" + getBusinessEndTime() + ", getReserveAble()="
				+ getReserveAble() + ", getMenu()=" + getMenu() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	
}
