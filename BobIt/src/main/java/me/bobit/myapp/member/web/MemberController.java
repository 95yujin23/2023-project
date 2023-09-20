package me.bobit.myapp.member.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import me.bobit.myapp.Pager;
import me.bobit.myapp.member.service.MemberService;
import me.bobit.myapp.member.service.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	final String path = "member/";
	
	@Autowired
	MemberService service;
	
	@GetMapping("/memberList")
	String memberList(Model model, Pager pager) throws Exception {
		List<MemberVO> list = service.selectMemberList(pager);
		model.addAttribute("list", list);
		return path + "memberList";
	}
	
	@GetMapping("/insertMember")
	String insertMember() {
		return path + "insertMember";
	}
	
	@PostMapping("/insertMember")
	String insertMember(MemberVO vo) throws Exception{
		int realage = vo.getMemAge();
		realage = realage/10;
		vo.setMemAge(realage);
		
		service.insertMember(vo);
		
		return "redirect:memberList";
	}
	
	@GetMapping("/updateMember/{memNick}")
	String updateMember(@PathVariable String memNick, Model model) throws Exception {
		MemberVO vo = service.selectMember(memNick);
		model.addAttribute("vo", vo);
		return path + "updateMember";
	}
	
	@PostMapping("/updateMember/{memNick}")
	String updateBoard(@PathVariable String memNick, MemberVO vo) throws Exception {
		vo.setMemNick(memNick);
		int realage = vo.getMemAge();
		realage = vo.getMemAge(); //실제나이에서 10나누면 연령대 나옴
		realage = realage/10;
		vo.setMemAge(realage);
		service.updateMember(vo);
		
		return "redirect:../memberList";
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
