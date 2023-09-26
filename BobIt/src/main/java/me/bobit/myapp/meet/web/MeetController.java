package me.bobit.myapp.meet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import me.bobit.myapp.Pager;
import me.bobit.myapp.meet.service.MeetService;
import me.bobit.myapp.meet.service.MeetVO;


@Controller
@RequestMapping("/meet")
public class MeetController {
	final String path = "meet/";
	
	@Autowired
	MeetService service;
	
//	@Autowired
//	MtapplyService mtservice;
	
	@GetMapping("/meetList")
	String meetList(Model model, Pager pager) throws Exception{
		List<MeetVO> list = service.selectMeetList(pager);
		model.addAttribute("list", list);
		return path + "meetList";
	}
	
	@GetMapping("/insertMeet")
	String insertMeet() {
		return path + "insertMeet";
	}
	
	@PostMapping("/insertMeet")
	String insertMeet(MeetVO vo) throws Exception{
		service.insertMeet(vo);
		//mtservice.insertMtapply(null); 생성한 모임장도 mtapply로 넣을지 구상중
		
		return "redirect:meetList";
	}
	
	@GetMapping("/selectMeet/{meetNo}")
	String selectMeet(@PathVariable int meetNo, Model model) {
		MeetVO vo = service.selectMeet(meetNo);
		
		model.addAttribute("vo", vo);
		
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
	}

