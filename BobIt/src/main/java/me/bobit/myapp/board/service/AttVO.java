package me.bobit.myapp.board.service;

import org.springframework.web.multipart.MultipartFile;

public class AttVO {
	private int attNo;
	
	private String attName;
	
	private String attOrgname;
	
	private int boardNo;
	
	private MultipartFile uploadFile;

	public int getAttNo() {
		return attNo;
	}

	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	public String getAttName() {
		return attName;
	}

	public void setAttName(String attName) {
		this.attName = attName;
	}

	public String getAttOrgname() {
		return attOrgname;
	}

	public void setAttOrgname(String attOrgname) {
		this.attOrgname = attOrgname;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
}
