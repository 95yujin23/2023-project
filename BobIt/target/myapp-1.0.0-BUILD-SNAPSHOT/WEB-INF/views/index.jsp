<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
	<c:if test="${sessionScope.member == null}">
		<div>
			<a href="/login">로그인</a>
		</div>
	</c:if>
	<c:if test="${sessionScope.member != null}">
		<div>
			${sessionScope.member.memNick}님 환영합니다. 
		</div>
		<div>
		<a href="/logout">로그아웃</a>
		</div>
	</c:if>
		<nav>

		</nav>
		<div>
			<ul>
				<li><a href="board/boardList">게시판CRUD</a>
				<li><a href="member/memberList">맴버관리</a>
				<li><a href="blame/blameList">신고게시판</a>
				<li><a href="chat/chatList">채팅(기능확인용)</a>
				<li><a href="cdetail/cdetailList">채팅상세(기능확인용)</a>
				<li><a href="meet/meetList">모임</a>
				<c:if test="${sessionScope.member.memType == '관리자'}"><li><a href="admin">관리자 메뉴</a></c:if>
				
			</ul>
		</div>

	</div>
	
</body>
</html>