package me.bobit.myapp.blame.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.blame.service.BlameService;
import me.bobit.myapp.board.service.BoardVO;
import me.bobit.myapp.board.service.FileUtils;
import me.bobit.myapp.board.service.impl.BoardDao;

@Service
public class BlameServiceImpl implements BlameService {
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	BlameDao blamedao;
	
	@Autowired
	BoardDao dao;
	
	@Override
	public List<BoardVO> selectBlameList(Pager pager) throws Exception {
		int total = blamedao.total(pager);
		
		pager.setTotal(total);
		
		return blamedao.selectBlameList(pager);
	}

	@Override
	public void insertBlame(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		blamedao.insertBlame(vo);
		int lastboardno = dao.lastInsertedboardNo();
		vo.setBoardNo(lastboardno);
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	
		
	}

	@Override
	public BoardVO selectBlame(int boardNo) throws Exception {
		return blamedao.selectBlame(boardNo);
	}

	@Override
	public void updateBlame(BoardVO vo) throws Exception {
		blamedao.updateBlame(vo);		
	}
	
	@Override
	public void takeBlame(int boardNo) throws Exception {
		blamedao.takeBlame(boardNo);
		
	}
	
	@Override
	public void compleBlame(int boardNo) throws Exception {
		blamedao.compleBlame(boardNo);		
	}

	@Override
	public void deniedBlame(int boardNo) throws Exception {
		blamedao.deniedBlame(boardNo);
	}
	
	@Override
	public void deleteBlame(int boardNo) throws Exception {
		blamedao.deleteBlame(boardNo);		
	}

	

}
