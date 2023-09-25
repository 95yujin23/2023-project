<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/css/style.css">

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
				<li><a href="chat/chatList">채팅</a>
			</ul>
		</div>
	</div>
</body>
</html>