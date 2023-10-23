<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>main</title>
<link rel="stylesheet" href="/css/main1.css">
</head>

<c:if test="${sessionScope.member == null}">
	<!-- 로그인 하지 않은 경우에 보여질 헤더 내용 -->
	<h1>
		<a href="/" class="logo"><img src="/img/logo.png"></a>
	</h1>

	<div class="toploganArea">
		<a href="/join" class="signUp _signUpLink">회원가입</a> 
		<a href="/login" class="login _loginLink">로그인</a>
	</div>

</c:if>

<c:if test="${sessionScope.member != null}">
	<!-- 로그인 한 경우에 보여질 헤더 내용 -->
	<h1>
		<a href="/" class="logo"><img src="/img/logo.png"></a>
	</h1>
	<div class="toploganArea">
		<a href="mypage" class="myPage _mypageLink">
			<img src="/img/user-icon.png" alt="user-icon">
		</a>
		<p class="message">${sessionScope.member.memNick}님 환영합니다.</p>
		<a href="/logout" class="login _loginLink">로그아웃</a>
	</div>
</c:if>