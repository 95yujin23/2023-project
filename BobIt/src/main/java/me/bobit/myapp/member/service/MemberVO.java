package me.bobit.myapp.member.service;

public class MemberVO {
	
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
	private int memAge;
	//지역
	private String memArea;
	//회원유형(a->normal, d->daum, n->naver, g->관리자)
	private String memType;
	//회원관리(y->가입, n->탈퇴, x->강제탈퇴)
	private String memCheck;
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
	public int getMemAge() {
		return memAge;
	}
	public void setMemAge(int memAge) {
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
}
