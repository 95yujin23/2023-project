package me.bobit.myapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import me.bobit.myapp.alert.service.AlertService;
import me.bobit.myapp.board.service.BoardService;
import me.bobit.myapp.board.service.BoardVO;
import me.bobit.myapp.meet.service.MeetService;
import me.bobit.myapp.meet.service.MeetVO;
import me.bobit.myapp.member.service.MemberVO;
import me.bobit.myapp.mtapply.service.MtapplyVO;

@Controller
public class RootController {
	
	@Autowired
	MeetService mservice;
	
	@Autowired
	BoardService bservice;
	
	@Autowired
	AlertService aservice;
	
	@GetMapping("/")
	String index(HttpSession session, Model model) {
		String msg = (String) session.getAttribute("msg");
		if(msg != null) {
			model.addAttribute("msg", msg);
			session.removeAttribute("msg");}
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		if(myvo != null ) {
			List<MeetVO> list = mservice.selectIndexList();
			model.addAttribute("list", list);
			int newalert = aservice.newAlert(myvo.getMemNick());
			session.setAttribute("newalert", newalert);
		}
		
		return "home";
	}
	

	
	@GetMapping("admin")
	String admin(HttpSession session, MemberVO vo) {
		if("관리자".equals(session.getAttribute("memType"))) {
		return "admin";}
		else return "home";
	}
	
	@GetMapping("/bobit")
	String bobit() {
		return "bobit";
	}
	@GetMapping("/teamBobit")
	String teamBobit() {
		return "teamBobit";
	}
	@GetMapping("/board/myBoard")
	String myBoard(Model model, HttpSession session, Pager pager) throws Exception {
		MemberVO mybvo = (MemberVO) session.getAttribute("member");
		String myNick = mybvo.getMemNick();
		pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
		pager.setMemNick(myNick);
		List<BoardVO> list = bservice.myBoard(pager);
			model.addAttribute("list", list);
			return "/board/myBoard";
	}
	
	//내 모임목록 보기
		@GetMapping("/meet/myMeet")
		String myMeet(Model model, Pager pager, Pager apager, HttpSession session) throws Exception{
			MemberVO myvo = (MemberVO) session.getAttribute("member");
			String mynick = myvo.getMemNick();
			pager.setMemNick(mynick);
			apager.setMemNick(mynick);
			pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
			apager.setCurPage((apager.getPage()-1)*apager.getPerPage());
			List<MeetVO> list = mservice.selectMeetJangList(pager);
			model.addAttribute("list", list);
			List<MtapplyVO> alist = mservice.selectMeetApplyList(apager);
			model.addAttribute("alist", alist);
			
			return "/meet/myMeet";
		}
}
