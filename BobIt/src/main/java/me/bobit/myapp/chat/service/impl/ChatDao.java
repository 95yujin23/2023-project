package me.bobit.myapp.chat.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.chat.service.ChatVO;

public interface ChatDao {

	int total(Pager pager);
	
	List<ChatVO> selectChatList(Pager pager);

	ChatVO selectChat(int chatNo);

	void insertChat(ChatVO vo);

	void updateChat(ChatVO vo);

	void deleteChat(int chatNo);

}
