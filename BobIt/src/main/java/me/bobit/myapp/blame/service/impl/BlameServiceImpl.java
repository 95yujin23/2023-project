package me.bobit.myapp.blame.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.blame.service.BlameService;
import me.bobit.myapp.blame.service.BlameVO;
import me.bobit.myapp.member.service.impl.MemberDao;

@Service
public class BlameServiceImpl implements BlameService {
	@Autowired
	BlameDao blamedao;
	
	@Autowired
	MemberDao memberdao;
	
	@Override
	public List<BlameVO> selectBlameList(Pager pager) throws Exception {
		int total = blamedao.total(pager);
		
		pager.setTotal(total);
		
		return blamedao.selectBlameList(pager);
	}

	@Override
	public void insertBlame(BlameVO vo) throws Exception {
		blamedao.insertBlame(vo);
	}

	@Override
	public BlameVO selectBlame(int blameNo) throws Exception {
		return blamedao.selectBlame(blameNo);
	}

	@Override
	public void updateBlame(BlameVO vo) throws Exception {
		blamedao.updateBlame(vo);		
	}
	
	@Override
	public void takeBlame(BlameVO vo) throws Exception {
		blamedao.takeBlame(vo);
		
	}
	
	@Override
	public void compleBlame(BlameVO vo) throws Exception {
		blamedao.compleBlame(vo);		
	}

	@Override
	public void deniedBlame(BlameVO vo) throws Exception {
		blamedao.deniedBlame(vo);
	}
	
	@Override
	public void deleteBlame(BlameVO vo) throws Exception {
		blamedao.deleteBlame(vo);		
	}

	

}
