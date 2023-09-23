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
		blamedao.inserBlame(vo);
	}

	@Override
	public BlameVO selectBlame(int blameNo) throws Exception {
		return blamedao.selectBlame(blameNo);
	}

	@Override
	public void careBlame(BlameVO vo) throws Exception {
		blamedao.careBlame(vo);
	}

	@Override
	public void deleteBlame(int blameNo) throws Exception {
		blamedao.deleteBoard(blameNo);
	}

}
