<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div>
			<h1>밥잇 관리자임시페이지</h1>
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
		<c:if test="${sessionScope.member.memType == '관리자'}">
		<div>
			<ul>
				<li><a href="board/boardList">공지글 작성</a>
				<li><a href="member/memberList">회원관리</a>
				<li><a href="blame/blameList">신고관리</a>				
			</ul>
		</div>
		</c:if>
	</div>
	
</body>
</html>