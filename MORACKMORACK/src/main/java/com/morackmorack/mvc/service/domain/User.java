package com.morackmorack.mvc.service.domain;

import java.sql.Date;
import java.util.List;

public class User {
	private String userId;
	private String password;
	private String name;
    private String email;
    private String phoneNumber;
    private int age;
    private String nickName;
    private Date birthday;
    private List<String> category;
    private String address;
    private String profileImg;
    private List<String> userStateList;
    private List<String> meetList;
    private int meetCount;
   
    public User(){
    }
 
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
   
    public String getName() {
        return name;
    }
   
    public void setName(String name) {
        this.name = name;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public List<String> getCategory() {
		return category;
	}

	public void setCategory(List<String> category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public List<String> getUserStateList() {
		return userStateList;
	}

	public void setUserstateList(List<String> userStateList) {
		this.userStateList = userStateList;
	}

	public List<String> getMeetList() {
		return meetList;
	}

	public void setMeetList(List<String> meetList) {
		this.meetList = meetList;
	}

	public int getMeetCount() {
		return meetCount;
	}

	public void setMeetCount(int meetCount) {
		this.meetCount = meetCount;
	}
	
	@Override
	public String toString() {
		return "User : [userId] "+userId+" [password] "+password+" [name] "+name+" [email] "+email
				+" [phoneNumber] "+phoneNumber+" [age] "+age+" [nickName] "+nickName
				+" [birthday] "+birthday+" [category] "+category+" [address] "+address
				+" [profileImg] "+profileImg+" [userStateList] "+userStateList+" [meetList] "+meetList
				+" [meetCount] "+meetCount;
	}
   
}