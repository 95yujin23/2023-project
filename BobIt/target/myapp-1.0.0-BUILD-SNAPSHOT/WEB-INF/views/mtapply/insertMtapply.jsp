<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임신청 작성(임시)</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>모임신청 작성(테스트)</h2>
	</div>
	<form method="post">
<div>
	
	<div>
		<label>모임번호 : </label>
		<input type="text" name="meetNo">
	</div>
	
	<div>
		<label>신청자 : </label>
		<input type="text" name="memNick">
	</div>
	
	<div>
		<button>등록</button>
		<a href="mtapplyList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>