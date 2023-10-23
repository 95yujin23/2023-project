package me.bobit.myapp.login.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.member.service.MemberVO;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired
	SqlSession sql;
	
	@Override
	public MemberVO login(MemberVO vo) {
		
		return sql.selectOne("login.trylogin", vo);
	}

}
