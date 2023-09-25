package me.bobit.myapp.chat.service;

public class ChatVO {
	private int chatNo;
	private String chatAdmin;
	private String memNick;
	private String chatSj;
	private java.util.Date chatDate;
	private String chatComp;
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
