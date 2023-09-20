package me.bobit.myapp.board.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface BoardService {

	//게시물 목록 가져오기
	List<BoardVO> selectBoardList(Pager pager) throws Exception;
	
	//게시물 등록
	void insertBoard(BoardVO vo) throws Exception;
	
	//게시물 상세정보
	BoardVO selectBoard(Long boardNo) throws Exception;
	
	//게시물 수정하기
	void updateBoard(BoardVO vo) throws Exception;
	
	//게시물 삭제하기
	void deleteBoard(Long boardNo) throws Exception;
	
}
