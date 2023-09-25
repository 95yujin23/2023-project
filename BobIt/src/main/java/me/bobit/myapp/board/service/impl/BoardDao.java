package me.bobit.myapp.board.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardVO;

public interface BoardDao {

	int total(Pager pager);
	
	List<BoardVO> selectBoardList(Pager pager);

	BoardVO selectBoard(int boardNo);

	void insertBoard(BoardVO vo);

	void updateBoard(BoardVO vo);

	void deleteBoard(int boardNo);

}
