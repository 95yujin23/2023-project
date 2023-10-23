package me.bobit.myapp.alert.service;

public class AlertVO {
	//쪽지번호
	private int alertNo;
	//받는사람
	private String memNick;
	//쪽지내용
	private String alertCn;
	//보낸시간
	private java.util.Date alertDate;
	//확인여부
	private String alertCheck;
	//삭제여부
	private String alertUse;
	//보낸사람
	private String alertFrom;
	
	public int getAlertNo() {
		return alertNo;
	}
	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getAlertCn() {
		return alertCn;
	}
	public void setAlertCn(String alertCn) {
		this.alertCn = alertCn;
	}
	public java.util.Date getAlertDate() {
		return alertDate;
	}
	public void setAlertDate(java.util.Date alertDate) {
		this.alertDate = alertDate;
	}
	public String getAlertCheck() {
		return alertCheck;
	}
	public void setAlertCheck(String alertCheck) {
		this.alertCheck = alertCheck;
	}
	public String getAlertUse() {
		return alertUse;
	}
	public void setAlertUse(String alertUse) {
		this.alertUse = alertUse;
	}
	public String getAlertFrom() {
		return alertFrom;
	}
	public void setAlertFrom(String alertFrom) {
		this.alertFrom = alertFrom;
	}

}
