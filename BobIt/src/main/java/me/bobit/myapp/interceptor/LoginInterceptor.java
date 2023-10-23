package me.bobit.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import me.bobit.myapp.member.service.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false); //false= 세션이 없으면 null, true= 세션이 없으면 세션 생성.
		
		
		if(session == null) {
			response.sendRedirect(request.getContextPath()+"/");
				return false;
			}
		else {
			MemberVO member = (MemberVO) session.getAttribute("member");
			if(member == null)
		{
			response.sendRedirect(request.getContextPath()+"/");	
			return false;
		}
	}
		
	return true;
	
	}
	
}
