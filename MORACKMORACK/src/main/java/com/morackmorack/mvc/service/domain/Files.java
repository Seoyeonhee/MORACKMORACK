package com.morackmorack.mvc.service.domain;

public class Files {
private int fileNo;
private int postNo;
private String meetId;
private String fileName;
private String fileExtension;
private long fileSize;

public int getFileNo() {
	return fileNo;
}
public void setFileNo(int fileNo) {
	this.fileNo = fileNo;
}
public int getPostNo() {
	return postNo;
}
public void setPostNo(int postNo) {
	this.postNo = postNo;
}
public String getMeetId() {
	return meetId;
}
public void setMeetId(String meetId) {
	this.meetId = meetId;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public String getFileExtension() {
	return fileExtension;
}
public void setFileExtension(String fileExtension) {
	this.fileExtension = fileExtension;
}
public long getFileSize() {
	return fileSize;
}
public void setFileSize(long fileSize2) {
	this.fileSize = fileSize2;
}
@Override
public String toString() {
	return "File [fileNo=" + fileNo + ", postNo=" + postNo + ", meetId=" + meetId + ", fileName=" + fileName
			+ ", fileExtension=" + fileExtension + ", fileSize=" + fileSize + "]";
}

}
