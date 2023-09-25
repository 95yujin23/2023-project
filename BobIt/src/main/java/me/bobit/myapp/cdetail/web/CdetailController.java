package me.bobit.myapp.cdetail.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import me.bobit.myapp.Pager;
import me.bobit.myapp.cdetail.service.CdetailService;
import me.bobit.myapp.cdetail.service.CdetailVO;

@Controller
@RequestMapping("/cdetail")
public class CdetailController {
	final String path = "cdetail/";
	
	@Autowired
	CdetailService service;
	
	@GetMapping("/cdetailList")
	String cdetailList(Model model, Pager pager) throws Exception {
		List<CdetailVO> list = service.selectCdetailList(pager);
		model.addAttribute("list", list);
		return path + "cdetailList";
	}
	
	@GetMapping("/selectCdetail/{cdetailNo}")
	String selectCdetail(@PathVariable int cdetailNo, Model model) throws Exception{
		CdetailVO vo = service.selectCdetail(cdetailNo);
		model.addAttribute("vo", vo);
		
		return path + "selectCdetail";
		
	}
	
	@GetMapping("/insertCdetail")
	String insertCdetail() {
		return path + "insertCdetail";
	}
	
	@PostMapping("/insertCdetail")
	String insertCdetail(CdetailVO vo) throws Exception {
		service.insertCdetail(vo);
		
		return "redirect:cdetailList";
	}
	
	@GetMapping("/updateCdetail/{cdetailNo}")
	String updateCdetail(@PathVariable int cdetailNo, Model model) throws Exception {
		CdetailVO vo = service.selectCdetail(cdetailNo);
		
		model.addAttribute("vo", vo);
		
		return path + "updateCdetail";
	}
	
	@PostMapping("/updateCdetail/{cdetailNo}")
	String updateCdetail(@PathVariable int cdetailNo, CdetailVO vo) throws Exception {
		vo.setCdetailNo(cdetailNo);
		
		service.updateCdetail(vo);
		
		return "redirect:../cdetailList";
	}
	
	@GetMapping("/deleteCdetail/{cdetailNo}")
	String deleteCdetail(@PathVariable int cdetailNo) throws Exception {
		service.deleteCdetail(cdetailNo);
		
		return "redirect:../cdetailList";
	}
}
