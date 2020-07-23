package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {

	/// Field
	private int menuNo;
	private String businessId;
	private String businessMenu;
	private int businessMenuFee;
	private String businessMenuImg;
	
	private String[] businessMenuList;
	private int[] businessMenuFeeList;
	private String[] businessMenuImgList;
	
	
	
	/// Constructor
	public Menu() {
	}
	public Menu(String businessMenu, int businessMenuFee, String businessMenuImg) {
		this.businessMenu = businessMenu;
		this.businessMenuFee = businessMenuFee;
		this.businessMenuImg = businessMenuImg;
		
	}

	public Menu(String businessId, String businessMenu, int businessMenuFee, String businessMenuImg) {
		this.businessId = businessId;
		this.businessMenu = businessMenu;
		this.businessMenuFee = businessMenuFee;
		this.businessMenuImg = businessMenuImg;
	}
	
	/// Method
	public String getBusinessId() {
		return businessId;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	public String getBusinessMenu() {
		return businessMenu;
	}
	public void setBusinessMenu(String businessMenu) {
		this.businessMenu = businessMenu;
	}
	public int getBusinessMenuFee() {
		return businessMenuFee;
	}
	public void setBusinessMenuFee(int businessMenuFee) {
		this.businessMenuFee = businessMenuFee;
	}
	public String getBusinessMenuImg() {
		return businessMenuImg;
	}
	public void setBusinessMenuImg(String businessMenuImg) {
		this.businessMenuImg = businessMenuImg;
	}
	
	public String[] getBusinessMenuList() {
		return businessMenuList;
	}
	public void setBusinessMenuList(String[] businessMenuList) {
		this.businessMenuList = businessMenuList;
	}
	public int[] getBusinessMenuFeeList() {
		return businessMenuFeeList;
	}
	public void setBusinessMenuFeeList(int[] businessMenuFeeList) {
		this.businessMenuFeeList = businessMenuFeeList;
	}
	public String[] getBusinessMenuImgList() {
		return businessMenuImgList;
	}
	public void setBusinessMenuImgList(String[] businessMenuImgList) {
		this.businessMenuImgList = businessMenuImgList;
	}
	
	
	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", businessId=" + businessId + ", businessMenu=" + businessMenu
				+ ", businessMenuFee=" + businessMenuFee + ", businessMenuImg=" + businessMenuImg + "]";
	}
	
	
}
