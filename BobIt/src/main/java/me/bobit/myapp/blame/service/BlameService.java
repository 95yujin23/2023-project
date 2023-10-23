package me.bobit.myapp.blame.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardVO;

public interface BlameService {
	
	//신고 목록 가져오기
	List<BoardVO> selectBlameList(Pager pager) throws Exception;

	//신고글작성
	void insertBlame(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//신고글보기
	BoardVO selectBlame(int boardNo) throws Exception;
	
	//신고글 수정하기(진행으로 바뀌면 수정불가)
	void updateBlame(BoardVO vo) throws Exception;
	
	//신고글 접수->진행으로 바꾸기(관리자 전용기능)
	void takeBlame(int boardNo) throws Exception;

	//신고글 진행->완료하기(관리자 전용기능)
	void compleBlame(int boardNo)throws Exception;
	
	//신고글 진행->기각하기(관리자 전용기능)
	void deniedBlame(int boardNo)throws Exception;
	
	//신고글 처리하기(신고글 작성자 or 관리자가 필요할때 삭제 가능)
	void deleteBlame(int boardNo) throws Exception;

}
