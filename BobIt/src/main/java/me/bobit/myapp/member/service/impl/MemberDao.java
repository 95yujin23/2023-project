package me.bobit.myapp.member.service.impl;

import java.util.List;
import java.util.Map;

import me.bobit.myapp.Pager;
import me.bobit.myapp.member.service.MemberVO;

public interface MemberDao {

	int total(Pager pager);
	
	List<MemberVO> selectMemberList(Pager pager);
	
	void insertMember(MemberVO vo);
	
	MemberVO selectMember(String memNick);
	
	void updateMember(MemberVO vo);
	
	void deleteMember(String memNick);
	
	void kickMember(String memNick);

	void updateMemberImg(Map<String, Object> list);
	
	void addMember (MemberVO vo);
}

