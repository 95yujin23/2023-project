package me.bobit.myapp.board.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardVO;

public interface BoardDao {

	int total(Pager pager);
	
	List<BoardVO> selectBoardList(Pager pager);

	void insertBoard(BoardVO vo);

	BoardVO selectBoard(Long boardId);

	void updateBoard(BoardVO vo);

	void deleteBoard(Long boardId);

}
