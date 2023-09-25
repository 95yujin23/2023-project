<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .chat-container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .chat-messages {
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
        }

        .chat-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 10px;
        }

        .send-button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="chat-messages" id="chat-messages">
            <!-- 채팅 메시지가 여기에 표시됩니다. -->
        </div>
        <input type="text" class="chat-input" id="message-input" placeholder="메시지를 입력하세요...">
        <button class="send-button" id="send-button">보내기</button>
    </div>

    <script>
        // JavaScript 코드를 사용하여 채팅 기능을 추가합니다.
        const chatMessages = document.getElementById('chat-messages');
        const messageInput = document.getElementById('message-input');
        const sendButton = document.getElementById('send-button');

        // 메시지 전송 이벤트 처리
        sendButton.addEventListener('click', () => {
            const message = messageInput.value;
            if (message.trim() !== '') {
                appendMessage(message);
                messageInput.value = '';
            }
        });

        // 메시지를 화면에 추가하는 함수
        function appendMessage(message) {
            const messageElement = document.createElement('div');
            messageElement.innerText = message;
            chatMessages.appendChild(messageElement);
            // 새로운 메시지가 추가될 때 스크롤을 아래로 이동
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }
    </script>
    
    <script>
		const url = "ws://" + window.location.hostname + ":" + window.location.port + "/kopo/chatServer";
		
		const socket = new WebSocket(url);
		
		let connect = false;
		
		socket.onopen = () => {
			connect = true;
			alert("서버에 연결되었습니다");
		};
		
		socket.onclose = () => {
			connect = false;
			alert("서버에 연결이 종료되었습니다");
		};
		
		socket.onmessage = msg => {
			console.dir(msg);
			const chat = document.getElementById("chat"); 
			chat.innerHTML += "<li>" +msg.data + "</li>";
			
		};
	
		function send(){
			if(connect){
				const msg = document.getElementById("msg");
				
				socket.send(msg.value);
				
				msg.value = " "; //입력값 자동 지우기 
			}
		}
	</script>
</body>
</html>