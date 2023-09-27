<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
	const msg = "${msg}";
	if(msg)
		alert(msg);
</script>
</head>
<body>
	<div class="container">
		<div>
			<h1>밥잇 임시페이지</h1>
		</div>
		<nav>

		</nav>
		<div>
			<ul>
				<li><a href="board/boardList">게시판CRUD</a>
				<li><a href="member/memberList">맴버관리</a>
				<li><a href="blame/blameList">신고게시판</a>
				<li><a href="chat/chatList">채팅</a>
				<li><a href="cdetail/cdetailList">채팅상세</a>
				<li><a href="meet/meetList">모임</a>
				<li><a href="kamp">지도 검색</a>
				<li><a href="sungsim">성심당 본점 지도</a>
				<li><a href="mapmarker">(테스트중)지도 마커관련 종합</a>
			</ul>
		</div>

	</div>
	
</body>
</html>