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
		<h2>게시글 변경</h2>
	</div>
	<form method="post">
<div>
	<div>
		<label>채팅번호 : </label>
		<input type="number" name="cdetailNo" value="${vo.cdetailNo}" readonly>
	</div>
	
	<div>
		<label>채팅방번호 : </label>
		<input type="number" name="chatNo" value="${vo.chatNo}" readonly>
	</div>
	
	<div>
		<label>보낸사람닉네임 : </label>
		<input type="text" name="memNick" value="${vo.memNick}" readonly>
	</div>
	
	<div>
		<label>내용 : </label>
		<input type="text" name="cdetailCn" value="${vo.cdetailCn}">
	</div>
	
	<div>
		<button>변경</button>
		<a href="../cdetailList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>