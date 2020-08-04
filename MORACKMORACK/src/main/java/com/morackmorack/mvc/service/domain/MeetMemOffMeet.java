package com.morackmorack.mvc.service.domain;

public class MeetMemOffMeet {

	private  int meetMemOffmeetNO;
	private MeetMem meetMem;
	private OffMeet offMeet;

	public MeetMemOffMeet() {
	
	}

	public int getMeetMemOffmeetNO() {
		return meetMemOffmeetNO;
	}

	public void setMeetMemOffmeetNO(int meetMemOffmeetNO) {
		this.meetMemOffmeetNO = meetMemOffmeetNO;
	}

	public MeetMem getMeetMem() {
		return meetMem;
	}

	public void setMeetMem(MeetMem meetMem) {
		this.meetMem = meetMem;
	}

	public OffMeet getOffMeet() {
		return offMeet;
	}

	public void setOffMeet(OffMeet offMeet) {
		this.offMeet = offMeet;
	}

	@Override
	public String toString() {
		return "MeetMemOffMeet [meetMemOffmeetNO=" + meetMemOffmeetNO + ", meetMem=" + meetMem + ", offMeet=" + offMeet
				+ "]";
	}

	
	

	

}
