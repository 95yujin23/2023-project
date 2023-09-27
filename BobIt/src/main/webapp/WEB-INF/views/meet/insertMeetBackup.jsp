<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임글 작성</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>모임글 작성</h2>
	</div>
	<form method="post">
<div>
	
	<div>
		<label>모임명 : </label>
		<input type="text" name="meetSj">
	</div>
	
	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick">
	</div>
	
	<div>
		<label>모임내용 : </label>
		<input type="text" name="meetCn">
	</div>
	
	<div>
		<label>지역 : </label>
		<input type="text" name="meetArea">
	</div>
	
	<div>
		<label>메뉴 : </label>
		<input type="text" name="meetMenu">
	</div>
	
	<div>
		<label>성별 : </label>
		<input type="text" name="meetFm">
	</div>
	
	<div>
		<label>연령 : </label>
		<input type="text" name="meetAge">
	</div>
	
	<div>
		<label>모집인원 : </label>
		<input type="text" name="meetMax">
	</div>
	
	<div>
		<label>모임장소위도 : </label>
		<input type="text" name="meetMapx">
	</div>
	
	<div>
		<label>모임장소경도 : </label>
		<input type="text" name="meetMapy">
	</div>
	
	<div>
		<button>등록</button>
		<a href="boardList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>