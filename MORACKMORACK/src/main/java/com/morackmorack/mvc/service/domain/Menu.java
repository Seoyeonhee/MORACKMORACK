package com.morackmorack.mvc.service.domain;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {

	/// Field
	private String businessId;
	private String businessMenu;
	private int businessMenuFee;
	private String businessMenuImg;
	
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
	
	
}
