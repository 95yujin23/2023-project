package me.bobit.myapp.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.member.service.MemberService;
import me.bobit.myapp.member.service.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override
	public List<MemberVO> selectMemberList(Pager pager) throws Exception {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.selectMemberList(pager);
	}

	@Override
	public void insertMember(MemberVO vo) throws Exception {
		dao.insertMember(vo);
	}

	@Override
	public MemberVO selectMember(String memNick) throws Exception {
		return dao.selectMember(memNick);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);
	}

	@Override
	public void deleteMember(String memNick) throws Exception {
		dao.deleteMember(memNick);
	}

	@Override
	public void kickMember(String memNick) throws Exception {
		dao.kickMember(memNick);
	}

}
