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
		<h2>채팅 작성</h2>
	</div>
	<form method="post">
<div>
	
	<div>
		<label>보낸사람닉네임 : </label>
		<input type="text" name="memNick">
	</div>
	
	<div>
		<label>내용 : </label>
		<input type="text" name="cdetailCn">
	</div>
	
	<div>
		<button>등록</button>
		<a href="cdetailList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>