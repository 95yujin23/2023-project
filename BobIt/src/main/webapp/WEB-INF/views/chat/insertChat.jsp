<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>채팅 작성</h2>
	</div>
	<form method="post">
<div>
	
	<div>
		<label>제목 : </label>
		<input type="text" name="chatSj">
	</div>
	
	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick">
	</div>
	
	<div>
		<button>등록</button>
		<a href="chatList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>