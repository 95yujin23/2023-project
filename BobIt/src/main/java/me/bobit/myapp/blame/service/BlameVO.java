package me.bobit.myapp.blame.service;

public class BlameVO {
	//신고번호
	private int blameNo;
	//닉네임
	private String memNick;
	//신고제목
	private String blameSj;
	//신고내용
	private String blameCn;
	//신고날짜
	private java.util.Date blameDate;
	//첨부파일
	private String blameAtch;
	//처리상황
	private String blameStts;
	//사용여부
	private String blameUse;
	public int getBlameNo() {
		return blameNo;
	}
	public void setBlameNo(int blameNo) {
		this.blameNo = blameNo;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getBlameSj() {
		return blameSj;
	}
	public void setBlameSj(String blameSj) {
		this.blameSj = blameSj;
	}
	public String getBlameCn() {
		return blameCn;
	}
	public void setBlameCn(String blameCn) {
		this.blameCn = blameCn;
	}
	public java.util.Date getBlameDate() {
		return blameDate;
	}
	public void setBlameDate(java.util.Date blameDate) {
		this.blameDate = blameDate;
	}
	public String getBlameAtch() {
		return blameAtch;
	}
	public void setBlameAtch(String blameAtch) {
		this.blameAtch = blameAtch;
	}
	public String getBlameStts() {
		return blameStts;
	}
	public void setBlameStts(String blameStts) {
		this.blameStts = blameStts;
	}
	public String getBlameUse() {
		return blameUse;
	}
	public void setBlameUse(String blameUse) {
		this.blameUse = blameUse;
	}
	
}
