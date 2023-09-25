package me.bobit.myapp.chat.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.chat.service.ChatVO;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("chat.total", pager);
	}

	@Override
	public List<ChatVO> selectChatList(Pager pager) {
		return sql.selectList("chat.selectchatlist", pager);
	}

	@Override
	public ChatVO selectChat(int chatNo) {
		return sql.selectOne("chat.selectchat", chatNo);
	}
	
	@Override
	public void insertChat(ChatVO vo) {
		sql.insert("chat.insertchat", vo);
	}

	@Override
	public void updateChat(ChatVO vo) {
		sql.update("chat.updatechat", vo);

	}

	@Override
	public void deleteChat(int chatNo) {
		sql.delete("chat.deletechat", chatNo);
	}

}
