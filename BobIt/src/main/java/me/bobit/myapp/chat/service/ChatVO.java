package me.bobit.myapp.chat.service;

public class ChatVO {
	
	//채팅방번호
	private int chatNo;

	//관리자아이디
	private String chatAdmin;
	
	//채팅방장닉네임
	private String memNick;
	
	//채팅제목
	private String chatSj;
	
	//생성일
	private java.util.Date chatDate;
	
	//완료여부
	private String chatComp;

	
	//getters and setters
	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getChatAdmin() {
		return chatAdmin;
	}

	public void setChatAdmin(String chatAdmin) {
		this.chatAdmin = chatAdmin;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getChatSj() {
		return chatSj;
	}

	public void setChatSj(String chatSj) {
		this.chatSj = chatSj;
	}

	public java.util.Date getChatDate() {
		return chatDate;
	}

	public void setChatDate(java.util.Date chatDate) {
		this.chatDate = chatDate;
	}

	public String getChatComp() {
		return chatComp;
	}

	public void setChatComp(String chatComp) {
		this.chatComp = chatComp;
	}
	
	
	
}
