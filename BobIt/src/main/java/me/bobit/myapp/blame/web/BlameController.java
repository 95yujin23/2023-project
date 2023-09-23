package me.bobit.myapp.blame.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import me.bobit.myapp.Pager;
import me.bobit.myapp.blame.service.BlameService;
import me.bobit.myapp.blame.service.BlameVO;

@Controller
@RequestMapping("/blame")
public class BlameController {
	final String path = "/blame";
	
	@Autowired
	BlameService service;
	
	@GetMapping("/blameList")
	String blameList(Model model, Pager pager) throws Exception {
		List<BlameVO> list = service.selectBlameList(pager);
		model.addAttribute("list", list);
		return path + "blameList";
	}
	
	@GetMapping("/insertBlame")
	String insertBlame() {
		return path + "insertBlame";
	}
	
	@PostMapping("/insertBlame")
	String insertBlame(BlameVO vo) throws Exception{
		service.insertBlame(vo);
		
		return "redirect:blameList";
	}
	
	@GetMapping("takeBlame/{blameNo")
	String takeBlame(BlameVO vo) throws Exception {
		service.takeBlame(vo);
		
		return path + "blameList";
	}
	
	@GetMapping("/careBlame/{blameNo}")
	String careBlame(BlameVO vo) throws Exception {
		service.careBlame(vo);
		
		return path + "blameList";

	}
}

