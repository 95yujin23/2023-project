package me.bobit.myapp.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.chat.service.ChatService;
import me.bobit.myapp.chat.service.ChatVO;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired
	ChatDao dao;

	@Override
	public List<ChatVO> selectChatList(Pager pager) throws Exception {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.selectChatList(pager);
	}

	@Override
	public ChatVO selectChat(int chatNo) throws Exception {
		return dao.selectChat(chatNo);
	}
	
	@Override
	public void insertChat(ChatVO vo) throws Exception {
		dao.insertChat(vo);		
	}

	@Override
	public void updateChat(ChatVO vo) throws Exception {
		dao.updateChat(vo);
		
	}

	@Override
	public void deleteChat(int chatNo) throws Exception {
		dao.deleteChat(chatNo);		
	}
	


	
	
}
