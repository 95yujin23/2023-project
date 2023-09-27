package me.bobit.myapp;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RootController {
	
	@GetMapping("/")
	String index(HttpSession session, Model model) {
		String msg = (String) session.getAttribute("msg");
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			session.removeAttribute("msg");
		}
		
		return "home";
	}
	
	@GetMapping("/temp")
	String temp() {
		return "index";
	}
	
	@GetMapping("/kamp")
	String map() {
		return "kamp";
	}
	
	@GetMapping("/sungsim")
	String sungsim() {
		return "sungsim";
	}

}
