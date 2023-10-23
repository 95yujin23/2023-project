package me.bobit.myapp.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.member.service.MemberFileUtils;
import me.bobit.myapp.member.service.MemberService;
import me.bobit.myapp.member.service.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberFileUtils fileUtils;
	
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
	public void updateMember(MemberVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.updateMember(vo);
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);		
		int size = list.size();
		for(int i=0; i<size; i++) {
		dao.updateMemberImg(list.get(i));
		} 
	}

	@Override
	public void deleteMember(String memNick) throws Exception {
		dao.deleteMember(memNick);
	}

	@Override
	public void kickMember(String memNick) throws Exception {
		dao.kickMember(memNick);
	}

	@Override
	public void addMember(MemberVO vo) throws Exception {
		dao.addMember(vo);
		
	}
}
