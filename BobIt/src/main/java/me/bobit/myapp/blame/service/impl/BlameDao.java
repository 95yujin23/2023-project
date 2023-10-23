package me.bobit.myapp.blame.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardVO;

public interface BlameDao {

	int total(Pager pager);

	List<BoardVO> selectBlameList(Pager pager);

	void insertBlame(BoardVO vo);

	BoardVO selectBlame(int boardNo);

	void deleteBoard(int boardNo);

	void updateBlame(BoardVO vo);

	void takeBlame(int boardNo);

	void compleBlame(int boardNo);

	void deleteBlame(int boardNo);

	void deniedBlame(int boardNo);

}
