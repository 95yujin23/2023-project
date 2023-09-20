package me.bobit.myapp.member.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface MemberService {

	//맴버 목록 가져오기
	List<MemberVO> selectMemberList(Pager pager) throws Exception;
	
	//회원 가입
	void insertMember(MemberVO vo) throws Exception;
	
	//회원 상제정보
	MemberVO selectMember(String memNick) throws Exception;
	
	//회원 수정하기
	void updateMember(MemberVO vo) throws Exception;
	
	//회원 탈퇴하기
	void deleteMember(String memNick) throws Exception;
	
	//회원 강퇴하기
	void kickMember(String memNick) throws Exception;
}
