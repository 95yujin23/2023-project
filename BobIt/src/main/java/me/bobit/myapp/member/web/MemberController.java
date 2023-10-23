package me.bobit.myapp.member.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.login.service.LoginService;
import me.bobit.myapp.member.service.MemberService;
import me.bobit.myapp.member.service.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	final String path = "member/";
	final String memberuploadPath = "d:/bobit/profileimg";
	@Autowired
	MemberService service;
	
	@Autowired
	LoginService loginservice;
	
	@GetMapping("/memberList")
	String memberList(Model model, Pager pager) throws Exception {
		pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
		List<MemberVO> list = service.selectMemberList(pager);
		model.addAttribute("list", list);
		return path + "memberList";
	}
	
	@GetMapping("/selectMember/{memNick}")
	String selectMember(Model model, Pager pager, @PathVariable String memNick, HttpSession session) throws Exception {
		MemberVO vo = service.selectMember(memNick);
		session.setAttribute("othermemNick", vo.getMemNick());
		model.addAttribute("vo",vo);
		String img = vo.getMemImg();
		session.setAttribute("img", img);
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		String mynick = myvo.getMemNick();
		if(vo.getMemNick().equals(mynick)) {
			return "redirect:../updateMember/{memNick}"; //내정보 보기
		}
		else	return path + "selectMember"; //내가 아닌사람 정보 보기
		
	}
	
	@GetMapping("/insertMember")
	String insertMember() {
		return path + "insertMember";
	}
	
	@PostMapping("/insertMember")
	String insertMember(MemberVO vo) throws Exception{
		int realage = Integer.parseInt(vo.getMemAge());
		if(realage > 10) {
		realage = realage/10;
		String dividedage = realage + "0대";
		vo.setMemAge(dividedage);
		}
		else {
		vo.setMemAge("어린이");	
		}
		service.addMember(vo);
		
		return "redirect:memberList";
	}
	
	@GetMapping("/addMember")
	String addMember() {
		return path + "addMember";
	}
	
	@PostMapping("/addMember")
	String addMember(MemberVO vo, HttpSession session) throws Exception{
		int realage = Integer.parseInt(vo.getMemAge());
		if(realage > 10) {
		realage = realage/10;
		String dividedage = realage + "0대";
		vo.setMemAge(dividedage);
		}
		else {
		vo.setMemAge("어린이");	
		}
		service.addMember(vo);
		Boolean result = loginservice.login(vo);
		
		if(result) {
			session.setAttribute("msg", "환영합니다");
			session.setAttribute("member", vo);
			session.setAttribute("memType", vo.getMemType());
			session.setAttribute("img", vo.getMemImg());
			
		} else
			session.setAttribute("msg", "회원가입에 실패하였습니다.");
	
		return "redirect:/";
	}
	
	@GetMapping("/updateMember/{memNick}")
	String updateMember(@PathVariable String memNick, Model model) throws Exception {
		MemberVO vo = service.selectMember(memNick);
		model.addAttribute("vo", vo);
		return path + "updateMember";
	}
	
	@PostMapping("/updateMember/{memNick}")
	String updateBoard(@PathVariable String memNick, MemberVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		service.updateMember(vo, mpRequest); 
		
		return "redirect:/";
	}
	
	@GetMapping("/deleteMember/{memNick}")
	String deleteMember(@PathVariable String memNick) throws Exception {
		service.deleteMember(memNick);
		
		return "redirect:../memberList";
	}
	
	@GetMapping("/kickMember/{memNick}")
	String kickMember(@PathVariable String memNick) throws Exception{
		service.kickMember(memNick);
		
		return "redirect:../memberList";
	}
}
