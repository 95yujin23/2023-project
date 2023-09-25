package me.bobit.myapp.blame.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.blame.service.BlameVO;

public interface BlameDao {

	int total(Pager pager);

	List<BlameVO> selectBlameList(Pager pager);

	void insertBlame(BlameVO vo);

	BlameVO selectBlame(int blameNo);

	void deleteBoard(int blameNo);

	void updateBlame(BlameVO vo);

	void takeBlame(BlameVO vo);

	void compleBlame(BlameVO vo);

	void deleteBlame(BlameVO vo);

	void deniedBlame(BlameVO vo);

}
