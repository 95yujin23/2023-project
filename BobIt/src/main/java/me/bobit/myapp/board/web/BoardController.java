package me.bobit.myapp.board.web;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.alert.service.AlertService;
import me.bobit.myapp.board.service.BoardService;
import me.bobit.myapp.board.service.BoardVO;
import me.bobit.myapp.member.service.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	final String path = "board/";
	final String uploadPath = "d:/bobit/upload";
	
	@Autowired
	BoardService service;
	
	@Autowired
	AlertService aservice;
	
	@GetMapping("/boardList")
	String boardList(Model model, Pager pager, HttpSession session) throws Exception {
		pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
		List<BoardVO> list = service.selectBoardList(pager);
		model.addAttribute("list", list);
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		int newalert = aservice.newAlert(myvo.getMemNick());
		session.setAttribute("newalert", newalert);
		return path + "boardList";
	}
	
	@GetMapping("/selectBoard/{boardNo}")
	String selectBoard(@PathVariable int boardNo, Model model) throws Exception{
		BoardVO vo = service.selectBoard(boardNo);
		model.addAttribute("vo", vo);
		
		List<Map<String, Object>> attList = service.selectFileList(vo.getBoardNo());
		model.addAttribute("att", attList);
		
		return path + "selectBoard";		
	}
	
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		System.out.println(map);
		Map<String, Object> resultMap = service.selectFile(map);
		String storedFileName = (String) resultMap.get("ATT_NAME");
		String originalFileName = (String) resultMap.get("ATT_ORGNAME");
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("D:\\bobit\\upload\\"+storedFileName));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@GetMapping("/insertBoard")
	String insertBoard() {
		return path + "insertBoard";
	}
	
	@PostMapping("/insertBoard")
	String insertBoard(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		service.insertBoard(vo, mpRequest);		
		
		
		return "redirect:boardList";
	}
	
	@GetMapping("/updateBoard/{boardNo}")
	String updateBoard(@PathVariable int boardNo, Model model) throws Exception {
		BoardVO vo = service.selectBoard(boardNo);
		
		model.addAttribute("vo", vo);
		
		return path + "updateBoard";
	}
	
	@PostMapping("/updateBoard/{boardNo}")
	String updateBoard(@PathVariable int boardNo, BoardVO vo) throws Exception {
		vo.setBoardNo(boardNo);
		
		service.updateBoard(vo);
		
		return "redirect:../boardList";
	}
	
	@GetMapping("/deleteBoard/{boardNo}")
	String deleteBoard(@PathVariable int boardNo) throws Exception {
		service.deleteBoard(boardNo);
		
		return "redirect:../boardList";
	}
	
	@GetMapping("/insertNotice")
	String insertNotice(HttpSession session) {
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		if(myvo.getMemType().equals("관리자"))
			return path + "insertNotice";
		else return path + "noticeList";
	}
		
	@PostMapping("/insertNotice")
	String insertNotice(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		service.insertNotice(vo, mpRequest);		
		return "redirect:noticeList";
	}
	
	@GetMapping("/noticeList")
	String noticeList(Model model, Pager pager) throws Exception {
		pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
		List<BoardVO> list = service.selectNoticeList(pager);
		model.addAttribute("list", list);
		
		return path + "noticeList";
	}
	
	@GetMapping("/selectNotice/{boardNo}")
	String selectNotice(@PathVariable int boardNo, Model model) throws Exception{
		BoardVO vo = service.selectNotice(boardNo);
		model.addAttribute("vo", vo);
		
		List<Map<String, Object>> attList = service.selectFileList(vo.getBoardNo());
		model.addAttribute("att", attList);
		
		return path + "selectNotice";		
	}
	
	@GetMapping("/updateNotice/{boardNo}")
	String updateNotice(@PathVariable int boardNo, Model model, HttpSession session) throws Exception {
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		if(myvo.getMemType().equals("관리자")) {
			BoardVO vo = service.selectNotice(boardNo);
			model.addAttribute("vo", vo);
		return path + "updateNotice";
		}
		else return "redirect:../noticeList";
		
		
	}
	
	@PostMapping("/updateNotice/{boardNo}")
	String updateNotice(@PathVariable int boardNo, BoardVO vo) throws Exception {
		vo.setBoardNo(boardNo);
		
		service.updateBoard(vo);
		
		return "redirect:../noticeList";
	}
	
	@GetMapping("/deleteNotice/{boardNo}")
	String deleteNotice(@PathVariable int boardNo, HttpSession session) throws Exception {
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		if(myvo.getMemType().equals("관리자")) {
			service.deleteBoard(boardNo);
		return "redirect:../noticeList";
		}
		else return "redirect:../noticeList";
	}
}