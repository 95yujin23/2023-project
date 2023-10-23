package me.bobit.myapp.mtapply.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import me.bobit.myapp.Pager;
import me.bobit.myapp.mtapply.service.MtapplyService;
import me.bobit.myapp.mtapply.service.MtapplyVO;

@Controller
@RequestMapping("/mtapply")
public class MtapplyController {
	final String path = "mtapply/";
	
	
	@Autowired
	MtapplyService service;
	
	@GetMapping("/mtapplyList")
	String mtapplyList(Model model, Pager pager) throws Exception{
		List<MtapplyVO> list = service.selectMtapplyList(pager);
		model.addAttribute("list", list);
		return path + "mtapplyList";
	}
	
	@GetMapping("/selectMtapply/{mtapplyNo}")
	String selectMyapply(@PathVariable int mtapplyNo, Model model) throws Exception{
		MtapplyVO vo = service.selectMtapply(mtapplyNo);
		model.addAttribute("vo", vo);
		return path + "selectMtapply";
	}
	
	@GetMapping("/insertMtapply")
	String insertMtapply() {
		return path + "insertMtapply";

	}
	
	@PostMapping("/insertMtapply")
	String insertMtapply(MtapplyVO vo, HttpSession session) throws Exception{
		service.insertMtapply(vo, session);
		
		return "redirect:mtapplyList";
	}
	//승낙
	@GetMapping("/agreeMtapply/{mtapplyNo}")
	String agreeMtapply(@PathVariable int mtapplyNo, HttpSession session) throws Exception{
		service.agreeMtapply(mtapplyNo);
		int meetno = (Integer) session.getAttribute("meetNo");
		return "redirect:../../meet/selectMeet/" + meetno;
	}
	
	//거절
	@GetMapping("/deniedMtapply/{mtapplyNo}")
	String deniedMtapply(@PathVariable int mtapplyNo, HttpSession session) throws Exception{
		service.deniedMtapply(mtapplyNo);
		int meetno = (Integer) session.getAttribute("meetNo");
		return "redirect:../../meet/selectMeet/" + meetno;
	}
	
	//대기
	@GetMapping("/waitMtapply/{mtapplyNo}")
	String waitMtapply(@PathVariable int mtapplyNo, HttpSession session) throws Exception{
		service.waitMtapply(mtapplyNo);
		int meetno = (Integer) session.getAttribute("meetNo");
		return "redirect:../../meet/selectMeet/" + meetno;
	}
}
