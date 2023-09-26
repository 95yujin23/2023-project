<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임글 변경</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>모임글 변경</h2>
	</div>
	<form method="post">
<div>
	<div>
		<label>모임번호 : </label>
		<input type="number" name="meetNo" value="${vo.meetNo}" readonly>
	</div>

	<div>
		<label>모임제목 : </label>
		<input type="text" name="meetSj" value="${vo.meetSj}">
	</div>
	
	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick" value="${vo.memNick}" readonly>
	</div>
	
	<div>
		<label>모임내용 : </label>
		<input type="text" name="meetCn" value="${vo.meetCn}">
	</div>
	
	<div>
		<label>모임지역 : </label>
		<input type="text" name="meetArea" value="${vo.meetArea}">
	</div>
	
	<div>
		<label>성별 : </label>
		<input type="text" name="meetFm" value="${vo.meetFm}">
	</div>
	
	<div>
		<label>연령대 : </label>
		<input type="text" name="meetAge" value="${vo.meetAge}">
	</div>
	
	<div>
		<label>모임인원 : </label>
		<input type="text" name="meetMax" value="${vo.meetMax}">
	</div>
	
	<div>
		<button>변경</button>
		<a href="../boardList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>