package me.bobit.myapp.chat.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface ChatService {

	//게시물 목록 가져오기
	List<ChatVO> selectChatList(Pager pager) throws Exception;
	
	//게시물 상세정보
	ChatVO selectChat(int chatNo) throws Exception;
	
	//게시물 등록
	void insertChat(ChatVO vo) throws Exception;
	
	//게시물 수정하기
	void updateChat(ChatVO vo) throws Exception;
	
	//게시물 삭제하기
	void deleteChat(int chatNo) throws Exception;
	
}
