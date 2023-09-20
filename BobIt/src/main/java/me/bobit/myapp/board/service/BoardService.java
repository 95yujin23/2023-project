package me.bobit.myapp.board.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface BoardService {

	//게시물 목록 가져오기
	public List<BoardVO> selectBoardList(Pager pager) throws Exception;
	
	//게시물 목록 수
	public int selectBoardListCnt(BoardVO vo) throws Exception;
	
	//게시물 등록
	public String insertBoard(BoardVO vo) throws Exception;
	
	//게시물 상세정보
	public BoardVO selectBoard(BoardVO vo) throws Exception;
	
	//게시물 수정하기
	public void updateBoard(BoardVO vo) throws Exception;
	
	//게시물 삭제하기
	public void deleteBoard(BoardVO vo) throws Exception;
	 
	
	
}
