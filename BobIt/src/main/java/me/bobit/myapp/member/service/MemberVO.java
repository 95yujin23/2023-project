package me.bobit.myapp.member.service;

public class MemberVO {
	public static final String member = "A";
	
	
	//닉네임
	private String memNick;
	//아이디
	private String memId;
	//비밀번호
	private String memPwd;
	//이메일
	private String memMail;
	//성별(female, male)
	private String memFm;
	//연령
	private String memAge;
	//지역
	private String memArea;
	//회원유형(a->user, d->daum, n->naver, g->관리자)
	private String memType;
	//회원관리(y->가입, n->탈퇴, x->강제탈퇴)
	private String memCheck;
	//회원프사
	private String memImg;
	
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemFm() {
		return memFm;
	}
	public void setMemFm(String memFm) {
		this.memFm = memFm;
	}
	public String getMemAge() {
		return memAge;
	}
	public void setMemAge(String memAge) {
		this.memAge = memAge;
	}
	public String getMemArea() {
		return memArea;
	}
	public void setMemArea(String memArea) {
		this.memArea = memArea;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public String getMemCheck() {
		return memCheck;
	}
	public void setMemCheck(String memCheck) {
		this.memCheck = memCheck;
	}
	public String getMemImg() {
		return memImg;
	}
	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}

}
