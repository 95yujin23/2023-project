package me.bobit.myapp.chat.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import me.bobit.myapp.Pager;
import me.bobit.myapp.chat.service.ChatService;
import me.bobit.myapp.chat.service.ChatVO;

@Controller
@RequestMapping("/chat")
public class ChatController {
	final String path = "chat/";
	
	@Autowired
	ChatService service;
	
	@GetMapping("/chatList")
	String chatList(Model model, Pager pager) throws Exception {
		List<ChatVO> list = service.selectChatList(pager);
		model.addAttribute("list", list);
		return path + "chatList";
	}
	
	@GetMapping("/selectChat/{chatNo}")
	String selectChat(@PathVariable int chatNo, Model model) throws Exception{
		ChatVO vo = service.selectChat(chatNo);
		model.addAttribute("vo", vo);
		
		return path + "selectChat";
		
	}
	
	@GetMapping("/insertChat")
	String insertChat() {
		return path + "insertChat";
	}
	
	@PostMapping("/insertChat")
	String insertChat(ChatVO vo) throws Exception {
		service.insertChat(vo);
		
		return "redirect:chatList";
	}
	
	@GetMapping("/updateChat/{chatNo}")
	String updateChat(@PathVariable int chatNo, Model model) throws Exception {
		ChatVO vo = service.selectChat(chatNo);
		
		model.addAttribute("vo", vo);
		
		return path + "updateChat";
	}
	
	@PostMapping("/updateChat/{chatNo}")
	String updateChat(@PathVariable int chatNo, ChatVO vo) throws Exception {
		vo.setChatNo(chatNo);
		
		service.updateChat(vo);
		
		return "redirect:../chatList";
	}
	
	@GetMapping("/deleteChat/{chatNo}")
	String deleteChat(@PathVariable int chatNo) throws Exception {
		service.deleteChat(chatNo);
		
		return "redirect:../chatList";
	}
}
