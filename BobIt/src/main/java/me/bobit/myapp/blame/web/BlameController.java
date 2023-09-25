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
import me.bobit.myapp.board.service.BoardVO;

@Controller
@RequestMapping("/blame")
public class BlameController {
	final String path = "blame/";
	
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
	
	@GetMapping("/selectBlame/{blameNo}")
	String selectBlame(@PathVariable int blameNo, Model model) throws Exception{
		BlameVO vo = service.selectBlame(blameNo);
		model.addAttribute("vo", vo);
		
		return path + "/selectBlame";
	}
	
	@GetMapping("/updateBlame/{blameNo}")
	String updateBlame(@PathVariable int blameNo, Model model) throws Exception {
		BlameVO vo = service.selectBlame(blameNo);
		
		model.addAttribute("vo", vo);
		
		return path + "/updateBlame";
	}
	
	@PostMapping("/updateBlame/{blameNo}")
	String updateBlame(@PathVariable int blameNo, BlameVO vo) throws Exception {
		vo.setBlameNo(blameNo);
		
		service.updateBlame(vo);
		
		return "redirect:../blameList";
	}
	
	@GetMapping("/takeBlame/{blameNo}")
	String takeBlame(@PathVariable int blameNo) throws Exception {
		service.takeBlame(blameNo);
		
		return "redirect:../blameList";
	}
	
	@GetMapping("/compleBlame/{blameNo}")
	String compleBlame(@PathVariable int blameNo) throws Exception {
		service.compleBlame(blameNo);
		
		return "redirect:../blameList";
	}
	
	@GetMapping("/deniedBlame/{blameNo}")
	String deniedBlame(@PathVariable int blameNo) throws Exception {
		service.deniedBlame(blameNo);
		
		return "redirect:../blameList";
	}

	@GetMapping("/deleteBlame/{blameNo}")
	String deleteBlame(@PathVariable int blameNo) throws Exception {
		service.deleteBlame(blameNo);
		
		return "redirect:../blameList";
	}
}

