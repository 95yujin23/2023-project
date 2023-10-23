package me.bobit.myapp.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.AttVO;
import me.bobit.myapp.board.service.BoardService;
import me.bobit.myapp.board.service.BoardVO;
import me.bobit.myapp.board.service.FileUtils;

@Service
public class BoardServiceImpl implements BoardService {
	 
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	BoardDao dao;
	
	@Override
	public List<BoardVO> selectBoardList(Pager pager) throws Exception {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.selectBoardList(pager);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED) //조회수
	@Override
	public BoardVO selectBoard(int boardNo) throws Exception {
		//조회수
		dao.boardHit(boardNo);
		return dao.selectBoard(boardNo);
	}

	
	@Override
	public void insertBoard(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.insertBoard(vo);
		int lastboardno = dao.lastInsertedboardNo();
		vo.setBoardNo(lastboardno);
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(int boardNo) throws Exception {
		dao.deleteBoard(boardNo);		
	}

	@Override
	public List<AttVO> selectAttList(int boardNo) {
		return dao.selectAttList(boardNo);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int boardNo) {
		return dao.selectFileList(boardNo);
	}

	@Override
	public Map<String, Object> selectFile(Map<String, Object> map) throws Exception {
		return dao.selectFile(map);
	}

	@Override
	public void insertNotice(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {	
			dao.insertNotice(vo);
			int lastboardno = dao.lastInsertedboardNo();
			vo.setBoardNo(lastboardno);
			List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
			int size = list.size();
			for(int i=0; i<size; i++){ 
				dao.insertFile(list.get(i));  
			}
		}

	@Override
	public List<BoardVO> selectNoticeList(Pager pager) {
		int total = dao.noticeTotal(pager);
		
		pager.setTotal(total);
		
		return dao.selectNoticeList(pager);
	}

	@Override
	public BoardVO selectNotice(int boardNo) {
		return dao.selectNotice(boardNo);
	}

	@Override
	public List<BoardVO> myBoard(Pager pager) {
		int total = dao.myBoardTotal(pager);
		
		pager.setTotal(total);
		
		return dao.myBoard(pager);
	}
	
	
}

