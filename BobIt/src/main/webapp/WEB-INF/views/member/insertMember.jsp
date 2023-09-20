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
		<h2>회원 추가</h2>
	</div>
	<form method="post">
<div>
	
	<div>
		<label>닉네임 : </label>
		<input type="text" name="memNick">
	</div>
	
	<div>
		<label>아이디 : </label>
		<input type="text" name="memId">
	</div>
	
	<div>
		<label>비밀번호 : </label>
		<input type="text" name="memPwd">
	</div>
	
	<div>
		<label>이메일 : </label>
		<input type="text" name="memMail">
	</div>
	
	<div>
		<label>성별(남,녀) : </label>
		<input type="text" name="memFm">
	</div>
	
	<div>
		<label>나이 : </label>
		<input type="text" name="memAge">
	</div>
	
	<div>
		<label>지역 : </label>
		<input type="text" name="memArea">
	</div>
	
	<div>
		<button>등록</button>
		<a href="../memberList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>