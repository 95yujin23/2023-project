package me.bobit.myapp.login.service.impl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.login.service.LoginService;
import me.bobit.myapp.member.service.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao dao;
	
	@Override
	public Boolean login(MemberVO vo) {
		MemberVO result = dao.login(vo);
		if(result != null) {			
			BeanUtils.copyProperties(result, vo);			
			vo.setMemPwd(null);
			
			return true;
		}
		return false;
	}

}
