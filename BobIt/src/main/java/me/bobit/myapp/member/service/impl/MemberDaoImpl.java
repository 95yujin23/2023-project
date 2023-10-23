package me.bobit.myapp.member.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.member.service.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("member.total", pager);
	}

	@Override
	public List<MemberVO> selectMemberList(Pager pager) {
		return sql.selectList("member.selectmemberlist", pager);
	}

	@Override
	public void insertMember(MemberVO vo) {
		sql.insert("member.insertmember", vo);
	}

	@Override
	public MemberVO selectMember(String memNick) {
		return sql.selectOne("member.selectmember", memNick);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sql.update("member.updatemember", vo);
	}

	@Override
	public void deleteMember(String memNick) {
		sql.update("member.deletemember", memNick);
	}

	@Override
	public void kickMember(String memNick) {
		sql.update("member.kickmember", memNick);
	}

	@Override
	public void updateMemberImg(Map<String, Object> map) {
		sql.update("member.updatememberimg", map);
	}
	
	@Override
	public void addMember(MemberVO vo) {
		sql.insert("member.addmember", vo);
		
	}
}
