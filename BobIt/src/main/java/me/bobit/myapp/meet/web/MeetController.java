package me.bobit.myapp.meet.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.alert.service.AlertService;
import me.bobit.myapp.meet.service.MeetService;
import me.bobit.myapp.meet.service.MeetVO;
import me.bobit.myapp.member.service.MemberVO;
import me.bobit.myapp.mtapply.service.MtapplyService;
import me.bobit.myapp.mtapply.service.MtapplyVO;


@Controller
@RequestMapping("/meet")
public class MeetController {
	final String path = "meet/";
	final String meetuploadPath = "d:/bobit/meetimg";
	
	@Autowired
	MeetService service;
	
	@Autowired
	MtapplyService mservice;
	
	@Autowired
	AlertService aservice;
	
	@GetMapping("/meetList")
	String meetList(Model model, Pager pager, HttpSession session) throws Exception{
		pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
		List<MeetVO> list = service.selectMeetList(pager);
		model.addAttribute("list", list);
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		int newalert = aservice.newAlert(myvo.getMemNick());
		session.setAttribute("newalert", newalert);
		return path + "meetList";
	}
	
	@GetMapping("/insertMeet")
	String insertMeet() {
		return path + "insertMeet";
	}
	
	
	@PostMapping("/insertMeet")
	String insertMeet(MeetVO vo, MeetVO jvo, MultipartHttpServletRequest mpRequest) throws Exception{
		service.insertMeet(vo, jvo, mpRequest);
		
		return "redirect:meetList";
	}
	
	
	@GetMapping("/selectMeet/{meetNo}")
	String selectMeet(@PathVariable int meetNo, Model model, HttpSession session) throws Exception {
		String already = (String) session.getAttribute("already");
		if(already != null) {
			model.addAttribute("already", already);
			session.removeAttribute("already");}
		MeetVO vo = service.selectMeet(meetNo);
		session.setAttribute("meetvo", vo);
		List<MtapplyVO> mvo = mservice.selectMeetApplyList(meetNo);
		session.setAttribute("meetNo", vo.getMeetNo());
		session.setAttribute("meetSj", vo.getMeetSj());		
		model.addAttribute("vo", vo);
		model.addAttribute("mvo" ,mvo);
		
		return path + "/selectMeet";
	}
	
	@GetMapping("/updateMeet/{meetNo}")
	String updateMeet(@PathVariable int meetNo, Model model) {
		MeetVO vo = service.selectMeet(meetNo);
		
		model.addAttribute("vo", vo);
		
		return path + "/updateMeet";
	}

	@PostMapping("/updateMeet/{meetNo}")
	String updateMeet(@PathVariable int meetNo, MeetVO vo) {
		vo.setMeetNo(meetNo);
		
		service.updateMeet(vo);
		
		return "redirect:../meetList";
	}
	
	@GetMapping("/deleteMeet/{meetNo}")
	String deleteMeet(@PathVariable int meetNo) {
		service.deleteMeet(meetNo);
			
		return "redirect:../meetList";	
		}
	

	@GetMapping("/applyMeet/{meetNo}")
	String applyMeet(@PathVariable int meetNo, MtapplyVO mvo, HttpSession session) throws Exception {
		mvo = new MtapplyVO();
		mvo.setMeetNo(meetNo);
		MemberVO member= (MemberVO) session.getAttribute("member");
		mvo.setMemNick(member.getMemNick());
		mservice.insertMtapply(mvo, session);
				
		return "redirect:../selectMeet/" + meetNo;
	}
	
	@ControllerAdvice
	public class DateBinder {
	    @InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	    }
	}
}
