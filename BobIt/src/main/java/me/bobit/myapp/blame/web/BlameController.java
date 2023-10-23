package me.bobit.myapp.blame.web;

import java.util.List;
import java.util.Map;

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
import me.bobit.myapp.alert.service.AlertService;
import me.bobit.myapp.blame.service.BlameService;
import me.bobit.myapp.board.service.BoardService;
import me.bobit.myapp.board.service.BoardVO;
import me.bobit.myapp.member.service.MemberVO;

@Controller
@RequestMapping("/blame")
public class BlameController {
	final String path = "blame/";
	final String uploadPath = "d:/bobit/upload";
	
	@Autowired
	BlameService service;
	
	@Autowired
	BoardService bservice;
	
	@Autowired
	AlertService aservice;
	
	@GetMapping("/blameList")
	String blameList(Model model, Pager pager, HttpSession session) throws Exception {
		pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
		List<BoardVO> list = service.selectBlameList(pager);
		model.addAttribute("list", list);
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		int newalert = aservice.newAlert(myvo.getMemNick());
		session.setAttribute("newalert", newalert);		
		return path + "blameList";
	}
	
	@GetMapping("/insertBlame")
	String insertBlame() {
		return path + "insertBlame";
	}
	
	@PostMapping("/insertBlame")
	String insertBlame(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception{
		service.insertBlame(vo, mpRequest);
		
		return "redirect:blameList";
	}
	
	@GetMapping("/selectBlame/{boardNo}")
	String selectBlame(@PathVariable int boardNo, Model model) throws Exception{
		BoardVO vo = service.selectBlame(boardNo);
		model.addAttribute("vo", vo);
		
		List<Map<String, Object>> attList = bservice.selectFileList(vo.getBoardNo());
		model.addAttribute("att", attList);
		
		return path + "/selectBlame";
	}
	
	@GetMapping("/updateBlame/{boardNo}")
	String updateBlame(@PathVariable int boardNo, Model model) throws Exception {
		BoardVO vo = service.selectBlame(boardNo);
		
		model.addAttribute("vo", vo);
		
		return path + "/updateBlame";
	}
	
	@PostMapping("/updateBlame/{boardNo}")
	String updateBlame(@PathVariable int boardNo, BoardVO vo) throws Exception {
		vo.setBoardNo(boardNo);
		
		service.updateBlame(vo);
		
		return "redirect:../blameList";
	}
	
	@GetMapping("/takeBlame/{boardNo}")
	String takeBlame(@PathVariable int boardNo) throws Exception {
		service.takeBlame(boardNo);
		
		return "redirect:../blameList";
	}
	
	@GetMapping("/compleBlame/{boardNo}")
	String compleBlame(@PathVariable int boardNo) throws Exception {
		service.compleBlame(boardNo);
		
		return "redirect:../blameList";
	}
	
	@GetMapping("/deniedBlame/{boardNo}")
	String deniedBlame(@PathVariable int boardNo) throws Exception {
		service.deniedBlame(boardNo);
		
		return "redirect:../blameList";
	}

	@GetMapping("/deleteBlame/{boardNo}")
	String deleteBlame(@PathVariable int boardNo) throws Exception {
		service.deleteBlame(boardNo);
		
		return "redirect:../blameList";
	}
}

