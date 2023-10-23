package me.bobit.myapp.board.service.impl;

import java.util.List;
import java.util.Map;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.AttVO;
import me.bobit.myapp.board.service.BoardVO;

public interface BoardDao {

	int total(Pager pager);
	
	List<BoardVO> selectBoardList(Pager pager); 

	BoardVO selectBoard(int boardNo);

	void insertBoard(BoardVO vo);

	void updateBoard(BoardVO vo);

	void deleteBoard(int boardNo);

	List<AttVO> selectAttList(int boardNo);

	int lastInsertedboardNo();

	void insertFile(Map<String, Object> map);
	
	List<Map<String, Object>> selectFileList(int boardNo);
	
	Map<String, Object> selectFile(Map<String, Object> map);

	void insertNotice(BoardVO vo);

	List<BoardVO> selectNoticeList(Pager pager);

	BoardVO selectNotice(int boardNo);

	List<BoardVO> myBoard(Pager pager);
	
	// 게시판 조회수
	void boardHit(int boardNo) throws Exception;

	int myBoardTotal(Pager pager);

	int noticeTotal(Pager pager);

	


}
