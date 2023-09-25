package me.bobit.myapp.blame.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.blame.service.BlameVO;

@Repository
public class BlameDaoImpl implements BlameDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("blame.total", pager);
	}

	@Override
	public List<BlameVO> selectBlameList(Pager pager) {
		return sql.selectList("blame.selectblamelist", pager);
	}

	@Override
	public void insertBlame(BlameVO vo) {
		sql.insert("blame.insertblame", vo);
	}

	@Override
	public BlameVO selectBlame(int blameNo) {
		return sql.selectOne("blame.selectblame", blameNo);
	}

	@Override
	public void deleteBoard(int blameNo) {
		sql.update("blame.deleteblame", blameNo);
	}

	@Override
	public void updateBlame(BlameVO vo) {
		sql.update("blame.updateblame", vo);
		
	}

	@Override
	public void takeBlame(int blameNo) {
		sql.update("blame.takeblame", blameNo);		
	}

	@Override
	public void compleBlame(int blameNo) {
		sql.update("blame.compleblame", blameNo);
		
	}
	
	@Override
	public void deleteBlame(int blameNo) {
		sql.update("blame.deleteblame", blameNo);
	}

	@Override
	public void deniedBlame(int blameNo) {
		sql.update("blame.deniedblame", blameNo);
		
	}

}
