package me.bobit.myapp.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("board.total", pager);
	}

	@Override
	public List<BoardVO> selectBoardList(Pager pager) {
		return sql.selectList("board.selectboardlist", pager);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		sql.insert("board.insertboard", vo);
	}

	@Override
	public BoardVO selectBoard(Long boardId) {
		return sql.selectOne("board.selectboard", boardId);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		sql.update("board.updateboard", vo);

	}

	@Override
	public void deleteBoard(Long boardId) {
		sql.delete("board.deleteboard", boardId);
	}

}
