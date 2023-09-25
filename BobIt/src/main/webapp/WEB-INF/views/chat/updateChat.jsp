<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 작성</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>게시글 변경</h2>
	</div>
	<form method="post">
<div>
	<div>
		<label>글번호 : </label>
		<input type="number" name="chatNo" value="${vo.chatNo}" readonly>
	</div>

	<div>
		<label>제목 : </label>
		<input type="text" name="chatSj" value="${vo.chatSj}">
	</div>
	
	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick" value="${vo.memNick}" readonly>
	</div>
	
	<div>
		<button>변경</button>
		<a href="../chatList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>