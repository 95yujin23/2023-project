package me.bobit.myapp.blame.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardVO;

@Repository
public class BlameDaoImpl implements BlameDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("blame.total", pager);
	}

	@Override
	public List<BoardVO> selectBlameList(Pager pager) {
		return sql.selectList("blame.selectblamelist", pager);
	}

	@Override
	public void insertBlame(BoardVO vo) {
		sql.insert("blame.insertblame", vo);
	}

	@Override
	public BoardVO selectBlame(int boardNo) {
		return sql.selectOne("blame.selectblame", boardNo);
	}

	@Override
	public void deleteBoard(int boardNo) {
		sql.update("blame.deleteblame", boardNo);
	}

	@Override
	public void updateBlame(BoardVO vo) {
		sql.update("blame.updateblame", vo);
		
	}

	@Override
	public void takeBlame(int boardNo) {
		sql.update("blame.takeblame", boardNo);		
	}

	@Override
	public void compleBlame(int boardNo) {
		sql.update("blame.compleblame", boardNo);
		
	}
	
	@Override
	public void deleteBlame(int boardNo) {
		sql.update("blame.deleteblame", boardNo);
	}

	@Override
	public void deniedBlame(int boardNo) {
		sql.update("blame.deniedblame", boardNo);
		
	}

}
