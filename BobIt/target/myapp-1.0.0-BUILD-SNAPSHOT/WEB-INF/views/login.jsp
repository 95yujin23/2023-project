<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/login.css">
<link rel="stylesheet" href="/css/main1.css">
<title>로그인</title>
</head>
<body>
	<header id="header" class="header">
		<jsp:include page="include/hd.jsp"></jsp:include>
	</header>
	<main>
		<form method="post">
			<section class="loginBtn">
				<h2>로그인</h2>
				<ul>
					<li><input type="text" name="memId" placeholder="아이디"
						title="아이디입력"></li>
					<li><input type="password" name="memPwd" placeholder="비밀번호"
						title="비밀번호입력"></li>
					<li><input type="checkbox" id="chk_id"><label
						for="chk_id">아이디저장</label></li>
					<li><button>로그인</button></li>
				</ul>
				<div>
					<ul>
						<li><a href="/join">회원가입</a></li>
						<li><a href="/findid">아이디 찾기</a></li>
						<li><a href="/findpw">비밀번호 찾기</a></li>
					</ul>
				</div>
			</section>
		</form>
	</main>
	<footer><jsp:include page="include/ft.jsp"></jsp:include></footer>
</body>
</html>