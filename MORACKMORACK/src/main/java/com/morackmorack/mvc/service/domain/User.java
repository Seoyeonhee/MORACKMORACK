package com.morackmorack.mvc.service.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	private String userId;
	private String password;
	private String userName;
    private String email;
    private String phoneNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private String nickName;
    private String profileImg;
    private String address;
    private String gender;
    private char userStateList;
    private String naverId;
    private String kakaoId;
    private String googleId;
    private int meetCount;
    private String role;
    private List<String> category;
    private List<String> meetList;
    
    
    public String getUserId() {
        return userId;
    }
   
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getPassword() {
        return password;
    }
   
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getEmail() {
        return email;
    }
   
    public void setEmail(String email) {
        this.email = email;
    }

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public char getUserStateList() {
		return userStateList;
	}

	public void setUserStateList(char userStateList) {
		this.userStateList = userStateList;
	}

	public String getNaverId() {
		return naverId;
	}

	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public String getGoogleId() {
		return googleId;
	}

	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}
	
	public int getMeetCount() {
		return meetCount;
	}

	public void setMeetCount(int meetCount) {
		this.meetCount = meetCount;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<String> getCategory() {
		return category;
	}

	public void setCategory(List<String> category) {
		this.category = category;
	}
	
	public List<String> getMeetList() {
		return meetList;
	}

	public void setMeetList(List<String> meetList) {
		this.meetList = meetList;
	}

	

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", userName=" + userName + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", birthday=" + birthday + ", nickName=" + nickName + ", profileImg="
				+ profileImg + ", address=" + address + ", gender=" + gender + ", userStateList=" + userStateList
				+ ", naverId=" + naverId + ", kakaoId=" + kakaoId + ", googleId=" + googleId + ", meetCount="
				+ meetCount + ", role=" + role + ", category=" + category + ", meetList=" + meetList + "]";
	}
	
	
}