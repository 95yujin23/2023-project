package me.bobit.myapp.login.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import me.bobit.myapp.login.service.LoginService;
import me.bobit.myapp.member.service.MemberVO;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	@GetMapping("login")
	String login() {
		return "login";
	}
	
	@PostMapping("/login")
	String login(MemberVO vo, HttpSession session) {
		Boolean result = loginService.login(vo);
		
		if(result) {
			session.setAttribute("msg", "환영합니다");
			session.setAttribute("member", vo);
			session.setAttribute("memType", vo.getMemType());
			session.setAttribute("img", vo.getMemImg());
			
		} else
			session.setAttribute("msg", "로그인에 실패하였습니다.");
		return "redirect:/";	
	}
	
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}
