package me.bobit.myapp.cdetail.service;

public class CdetailVO {
	
	//채팅번호
	private int cdetailNo;
	
	//채팅방번호
	private int chatNo;
	
	//보낸사람닉네임
	private String memNick;
	
	//내용
	private String cdetailCn;
	
	//생성일자
	private java.util.Date cdetailDate;

	
	//getters and setters
	public int getCdetailNo() {
		return cdetailNo;
	}

	public void setCdetailNo(int cdetailNo) {
		this.cdetailNo = cdetailNo;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getCdetailCn() {
		return cdetailCn;
	}

	public void setCdetailCn(String cdetailCn) {
		this.cdetailCn = cdetailCn;
	}

	public java.util.Date getCdetailDate() {
		return cdetailDate;
	}

	public void setCdetailDate(java.util.Date cdetailDate) {
		this.cdetailDate = cdetailDate;
	}
	
	
	
}
