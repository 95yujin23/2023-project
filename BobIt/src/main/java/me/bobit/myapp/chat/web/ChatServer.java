package me.bobit.myapp.chat.web;

import java.util.Vector;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatServer extends TextWebSocketHandler {
	Vector<WebSocketSession> list = new Vector<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		list.add(session);
		
		System.out.println("����: " + session.getRemoteAddress());
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("����: " + session.getRemoteAddress());
		super.afterConnectionClosed(session, status);
		
		list.remove(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		super.handleTextMessage(session, message);
		
		String user = (String) session.getAttributes().get("user");
		
		System.out.println("�޼���: (" + user + ") " + message.getPayload());
		
		for(WebSocketSession client : list)
			client.sendMessage(new TextMessage(message.getPayload()));
	}
	

}