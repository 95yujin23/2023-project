<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고글 작성</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>신고글 변경</h2>
	</div>
	<form method="post">
<div>
	<div>
		<label>글번호 : </label>
		<input type="number" name="blameNo" value="${vo.blameNo}" readonly>
	</div>

	<div>
		<label>제목 : </label>
		<input type="text" name="blameSj" value="${vo.blameSj}">
	</div>
	
	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick" value="${vo.memNick}" readonly>
	</div>
	
	<div>
		<label>내용 : </label>
		<input type="text" name="blameCn" value="${vo.blameCn}">
	</div>
	
	<div>
		<button>변경</button>
		<a href="../blameList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>