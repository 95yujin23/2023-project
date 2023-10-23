package me.bobit.myapp.board.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.AttVO;
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
	public BoardVO selectBoard(int boardNo) {
		return sql.selectOne("board.selectboard", boardNo);
	}
	
	@Override
	public void insertBoard(BoardVO vo) {
		sql.insert("board.insertboard", vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		sql.update("board.updateboard", vo);

	}

	@Override
	public void deleteBoard(int boardNo) {
		sql.update("board.deleteboard", boardNo);
	}

	@Override
	public List<AttVO> selectAttList(int boardNo) {
		return sql.selectList("board.selectattlist", boardNo);
	}

	@Override
	public int lastInsertedboardNo() {
		return sql.selectOne("board.lastinsertedboardno");
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		sql.insert("board.insertfile", map);		
	}

	@Override
	public List<Map<String, Object>> selectFileList(int boardNo) {
		return sql.selectList("board.selectfilelist", boardNo);
	}

	@Override
	public Map<String, Object> selectFile(Map<String, Object> map) {
		return sql.selectOne("board.selectfile", map);
	}

	@Override
	public void insertNotice(BoardVO vo) {
		sql.insert("board.insertnotice", vo);
		
	}

	@Override
	public List<BoardVO> selectNoticeList(Pager pager) {
		return sql.selectList("board.selectnoticelist", pager);
	}

	@Override
	public BoardVO selectNotice(int boardNo) {
		return sql.selectOne("board.selectnotice", boardNo);
	}

	@Override
	public List<BoardVO> myBoard(Pager pager) {
		return sql.selectList("board.myboard", pager);
	}

	//조회수
		@Override
		public void boardHit(int boardNo) {
			sql.update("board.boardHit", boardNo);
		}

		@Override
		public int myBoardTotal(Pager pager) {
			return sql.selectOne("board.myboardtotal", pager);
		}

		@Override
		public int noticeTotal(Pager pager) {
			return sql.selectOne("board.noticetotal", pager);
		}
	
}
