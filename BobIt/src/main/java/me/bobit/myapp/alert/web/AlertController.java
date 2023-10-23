package me.bobit.myapp.alert.web;

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
import me.bobit.myapp.alert.service.AlertService;
import me.bobit.myapp.alert.service.AlertVO;
import me.bobit.myapp.member.service.MemberVO;

@Controller
@RequestMapping("/alert")
public class AlertController {
	final String path = "alert/";
	
	@Autowired
	AlertService service;
	
	//쪽지 가져오기
	@GetMapping("/alertList")
	String alertList(Model model, Pager pager, HttpSession session) throws Exception {
		session.removeAttribute("othermemNick");
		MemberVO myvo = (MemberVO) session.getAttribute("member");
		String mynick = myvo.getMemNick();
		pager.setMemNick(mynick);
		pager.setCurPage((pager.getPage()-1)*pager.getPerPage());
		List<AlertVO> list = service.selectAlertList(pager);
		model.addAttribute("list", list);
		
		return path + "alertList";
		
	}
	
	//쪽지 선택하기
	@GetMapping("/selectAlert/{alertNo}")
	String selectAlert(@PathVariable int alertNo, Model model) throws Exception{
		AlertVO vo = service.selectAlert(alertNo);
		model.addAttribute("vo", vo);
		
		return path + "selectAlert";		
	}
	
	//쪽지 작성하기
	@GetMapping("/sendAlert")
	String sendAlert() throws Exception {
		return path + "sendAlert";
	}
	
	@PostMapping("/sendAlert")
	String sendAlert(AlertVO vo, HttpSession session) throws Exception {
		service.sendAlert(vo);
		session.removeAttribute("othermemNick");
		return "redirect:alertList";
	}
	
	
	//쪽지 삭제하기
	@GetMapping("/deleteAlert/{alertNo}")
	String deleteBoard(@PathVariable int alertNo) throws Exception {
		service.deleteAlert(alertNo);
		return "redirect:../alertList";
	}
	
}
