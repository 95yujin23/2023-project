package me.bobit.myapp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public List<BoardVO> selectBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectBoardListCnt(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	
}
