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
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<title>main</title>
</head>
<%@ page import="me.bobit.myapp.member.service.MemberVO"%>
<% if (session.getAttribute("member") != null) {
    String memType = ((MemberVO) session.getAttribute("member")).getMemType();
    if (memType.equals("관리자")) { %>
<!-- 관리자에게 보여질 내용 -->
<link rel="stylesheet" href="/css/admin.css">
<h1>
	<a href="/" class="logo"><img src="/img/logo.png"></a>
</h1>
<div class="toploganArea">
	<c:choose>
		<c:when test="${sessionScope.newalert > 0}">
			<a href="/alert/alertList" class="myPage_mypageLink"> <img
				src="/img/message-new.png" style="width: 30px; height: 30px;">
			</a>
		</c:when>
		<c:otherwise>
			<a href="/alert/alertList" class="myPage_mypageLink"> <img
				src="/img/message.png" style="width: 30px; height: 30px;">
			</a>
		</c:otherwise>
	</c:choose>
	<a href="/" class="myPage _mypageLink"><img alt="settingImg"
		src="/img/detail-btn.png"></a> <a
		href="/member/selectMember/${sessionScope.member.memNick}"
		class="myPage _mypageLink"> <img
		src="/profileimg/${sessionScope.member.memImg}" alt="user-icon"
		style="border-radius: 30px;">
	</a>
	<p class="message"><%= ((MemberVO) session.getAttribute("member")).getMemNick() %>님
		환영합니다.
	</p>
	<a href="/logout" class="login _loginLink">로그아웃</a>
</div>
<% } else { %>
<!-- 관리자가 아닌 경우에 보여질 내용 -->
<link rel="stylesheet" href="/css/main1.css">
<h1>
	<a href="/" class="logo"><img src="/img/logo.png"></a>
</h1>
<div class="toploganArea">
	<c:choose>
		<c:when test="${sessionScope.newalert > 0}">
			<a href="/alert/alertList" class="myPage_mypageLink"> <img
				src="/img/message-new.png" style="width: 30px; height: 30px;">
			</a>
		</c:when>
		<c:otherwise>
			<a href="/alert/alertList" class="myPage_mypageLink"> <img
				src="/img/message.png" style="width: 30px; height: 30px;">
			</a>
		</c:otherwise>
	</c:choose>
	<a href="/member/selectMember/${sessionScope.member.memNick}"
		class="myPage _mypageLink "> <img
		src="/profileimg/${sessionScope.member.memImg}" alt="user-icon"
		style="border-radius: 30px;">
	</a>
	<p class="message"><%= ((MemberVO) session.getAttribute("member")).getMemNick() %>님
		환영합니다.
	</p>
	<a href="/logout" class="login _loginLink">로그아웃</a>
</div>
<% }
} else { %>
<!-- 로그인 하지 않은 경우에 보여질 내용 -->
<link rel="stylesheet" href="/css/main1.css">
<h1>
	<a href="/" class="logo"><img src="/img/logo.png"></a>
</h1>

<div class="toploganArea">
	<a href="/member/addMember" class="signUp _signUpLink">회원가입</a> <a
		href="/login" class="login _loginLink">로그인</a>
</div>
<% } %>