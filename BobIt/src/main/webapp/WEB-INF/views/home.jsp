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
<title>게시판</title>
<link rel="stylesheet" href="/css/home.css">
<!-- 헤드 부분 인클루드 -->
<jsp:include page="include/head.jsp"></jsp:include>
</head>
<body id="page-top">
	<div class="page">
		<div class="wrap">
			<div class="page-content d-flex align-items-stretch">
				<jsp:include page="include/hd.jsp"></jsp:include>
				<div class="intro">
					<img src="/img/logo_b.png" alt="BOBIT">
					<h1>BOBIT</h1>
					<p>맛있는 밥 함께 먹어요</p>
				</div>
				<div class="tab">
					<div class="tabUp">
						<button onclick="location.href='/join'">가입하기</button>
						<button onclick="location.href='/login'">로그인</button>
					</div>
					<!-- 푸터 부분 인클루드 -->
					<jsp:include page="include/ft.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</body>
</html>