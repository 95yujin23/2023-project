package me.bobit.myapp.mtapply.service;

public class MtapplyVO {
	//신청번호
	private int mtapplyNo;
	//모임번호
	private int meetNo;
	//신청자닉네임
	private String memNick;
	//승낙여부(w->o,x)
	private String mtapplyYn;
	
	//모임제목
	private String meetSj;
	//모임장
	private String meetJang;
	//모임일자
	private java.util.Date meetTime;
	
	public int getMtapplyNo() {
		return mtapplyNo;
	}
	public void setMtapplyNo(int mtapplyNo) {
		this.mtapplyNo = mtapplyNo;
	}
	public int getMeetNo() {
		return meetNo;
	}
	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMtapplyYn() {
		return mtapplyYn;
	}
	public void setMtapplyYn(String mtapplyYn) {
		this.mtapplyYn = mtapplyYn;
	}
	public String getMeetSj() {
		return meetSj;
	}
	public void setMeetSj(String meetSj) {
		this.meetSj = meetSj;
	}
	public String getMeetJang() {
		return meetJang;
	}
	public void setMeetJang(String meetJang) {
		this.meetJang = meetJang;
	}
	public java.util.Date getMeetTime() {
		return meetTime;
	}
	public void setMeetTime(java.util.Date meetTime) {
		this.meetTime = meetTime;
	}
	
}
