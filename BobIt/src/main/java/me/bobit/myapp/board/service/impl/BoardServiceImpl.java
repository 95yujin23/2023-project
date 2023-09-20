package me.bobit.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardService;
import me.bobit.myapp.board.service.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;

	@Override
	public List<BoardVO> selectBoardList(Pager pager) throws Exception {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.selectBoardList(pager);
	}

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		dao.insertBoard(vo);
		
	}

	@Override
	public BoardVO selectBoard(Long boardId) throws Exception {
		return dao.selectBoard(boardId);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(Long boardId) throws Exception {
		dao.deleteBoard(boardId);		
	}
	


	
	
}
