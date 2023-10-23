package me.bobit.myapp.meet.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MeetVO {
	//모임번호
	private int meetNo;
	//모임제목
	private String meetSj;
	//닉네임
	private String memNick;
	//모임내용
	private String meetCn;
	//모임시간
	private java.util.Date meetTime;
	//지역
	private String meetArea;
	//메뉴
	private String meetMenu;
	//성별
	private String meetFm;
	//연령대
	private String meetAge;
	//모임신청인원(신청된 모든 인원)
	private int meetReq;	
	//현재모임인원(승낙된 인원만 뽑아옴)
	private int meetNow;	
	//모임최대인원
	private int meetMax;
	//모임상태 (기본값 : w(waiting), 꽉참 : f(full), 완료 : c(complete), 실패or취소 : x);
	private String meetStts;
	//지도X값
	private float meetMapx;
	//지도Y값
	private float meetMapy;
	//이미지값
	private String meetImg;
	
	public float getMeetMapx() {
		return meetMapx;
	}
	public void setMeetMapx(float meetMapx) {
		this.meetMapx = meetMapx;
	}
	public float getMeetMapy() {
		return meetMapy;
	}
	public void setMeetMapy(float meetMapy) {
		this.meetMapy = meetMapy;
	}
	public int getMeetNo() {
		return meetNo;
	}
	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}
	public String getMeetSj() {
		return meetSj;
	}
	public void setMeetSj(String meetSj) {
		this.meetSj = meetSj;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public Date getMeetTime() {
		return meetTime;
	}
	public void setMeetTime(Date meetTime) {
	    this.meetTime = meetTime;       
	}
	public String getMeetArea() {
		return meetArea;
	}
	public void setMeetArea(String meetArea) {
		this.meetArea = meetArea;
	}
	public String getMeetMenu() {
		return meetMenu;
	}
	public void setMeetMenu(String meetMenu) {
		this.meetMenu = meetMenu;
	}
	public String getMeetFm() {
		return meetFm;
	}
	public void setMeetFm(String meetFm) {
		this.meetFm = meetFm;
	}
	public String getMeetAge() {
		return meetAge;
	}
	public void setMeetAge(String meetAge) {
		this.meetAge = meetAge;
	}
	public int getMeetMax() {
		return meetMax;
	}
	public void setMeetMax(int meetMax) {
		this.meetMax = meetMax;
	}
	public String getMeetStts() {
		return meetStts;
	}
	public void setMeetStts(String meetStts) {
		this.meetStts = meetStts;
	}
	public String getMeetCn() {
		return meetCn;
	}
	public void setMeetCn(String meetCn) {
		this.meetCn = meetCn;
	}
	public int getMeetNow() {
		return meetNow;
	}
	public void setMeetNow(int meetNow) {
		this.meetNow = meetNow;
	}
	public int getMeetReq() {
		return meetReq;
	}
	public void setMeetReq(int meetReq) {
		this.meetReq = meetReq;
	}
	public String getMeetImg() {
		return meetImg;
	}
	public void setMeetImg(String meetImg) {
		this.meetImg = meetImg;
	} 
}
