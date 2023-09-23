package me.bobit.myapp.blame.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.blame.service.BlameVO;

public interface BlameDao {

	int total(Pager pager);

	List<BlameVO> selectBlameList(Pager pager);

	void inserBlame(BlameVO vo);

	BlameVO selectBlame(int blameNo);

	void careBlame(BlameVO vo);

	void deleteBoard(int blameNo);

}
