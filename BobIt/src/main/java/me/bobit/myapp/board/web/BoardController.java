package me.bobit.myapp.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import me.bobit.myapp.Pager;
import me.bobit.myapp.board.service.BoardService;
import me.bobit.myapp.board.service.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	final String path = "board/";
	
	@Autowired
	BoardService service;
	
	@GetMapping("/boardList")
	String boardList(Model model, Pager pager) throws Exception {
		List<BoardVO> list = service.selectBoardList(pager);
		model.addAttribute("list", list);
		return path + "boardList";
	}
	
	@GetMapping("/insertBoard")
	String insertBoard() {
		return path + "insertBoard";
	}
	
	@PostMapping("/insertBoard")
	String insertBoard(BoardVO vo) throws Exception {
		service.insertBoard(vo);
		
		return "redirect:boardList";
	}
	
	@GetMapping("/updateBoard/{boardNo}")
	String updateBoard(@PathVariable Long boardNo, Model model) throws Exception {
		BoardVO vo = service.selectBoard(boardNo);
		
		model.addAttribute("vo", vo);
		
		return path + "updateBoard";
	}
	
	@PostMapping("/updateBoard/{boardNo}")
	String updateBoard(@PathVariable Long boardNo, BoardVO vo) throws Exception {
		vo.setBoardNo(boardNo);
		
		service.updateBoard(vo);
		
		return "redirect:../boardList";
	}
	
	@GetMapping("/deleteBoard/{boardNo}")
	String delete(@PathVariable Long boardNo) throws Exception {
		service.deleteBoard(boardNo);
		
		return "redirect:../boardList";
	}
}
