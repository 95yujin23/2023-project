package me.bobit.myapp.blame.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface BlameService {
	
	//신고 목록 가져오기
	List<BlameVO> selectBlameList(Pager pager) throws Exception;

	//신고글작성
	void insertBlame(BlameVO vo) throws Exception;
	
	//신고글보기
	BlameVO selectBlame(int blameNo) throws Exception;
	
	//신고글 수정하기(진행으로 바뀌면 수정불가)
	void updateBlame(BlameVO vo) throws Exception;
	
	//신고글 접수->진행으로 바꾸기(관리자 전용기능)
	void takeBlame(BlameVO vo) throws Exception;

	//신고글 진행->완료하기(관리자 전용기능)
	void compleBlame(BlameVO vo)throws Exception;
	
	//신고글 진행->기각하기(관리자 전용기능)
	void deniedBlame(BlameVO vo)throws Exception;
	
	//신고글 처리하기(신고글 작성자 or 관리자가 필요할때 삭제 가능)
	void deleteBlame(BlameVO vo) throws Exception;

}
