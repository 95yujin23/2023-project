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
<title>회원 정보</title>
<!-- 헤드 부분 인클루드 -->
</head>
<body id="page-top">
	<div id="wrap">
		<header id="header" class="header">
			<jsp:include page="../include/hd.jsp"></jsp:include>
		</header>
		<!-- //aside -->

		<main id="main">
			<aside id="aside">
				<nav class="nav">
					<jsp:include page="../include/nav.jsp"></jsp:include>
				</nav>
				<article id="slider">
					<div class="sliderWrap">
						<div class="board_title">
							<strong>회원 정보</strong>
						</div>
						<br/>
						<div class="board_list_wrap">
						<div class="board_profile">
						<img src="/profileimg/${vo.memImg}" alt="user-icon" style="border-radius: 30px; width: 400px; height: 300px;">
						</div>
							<table class="board_list">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead class="inp-no">
										<tr>
											<th>닉네임</th>
											<td><input type="text" name="memNick" value="${vo.memNick}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>성별(남,녀)</th>
											<td><input type="text" name="memFm" value="${vo.memFm}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>나이</th>
											<td><input type="text" name="memAge" value="${vo.memAge}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>지역</th>
											<td><input type="text" name="memArea" value="${vo.memArea}" class="col2" readonly></td>
										</tr>
								</table>
								<div class="bt_wrap">
									<a href="../../alert/sendAlert"><button type="button" class="col3 button btn-bd">쪽지 보내기</button></a>
									<a href="../../meet/meetList"><button type="button" class="col3 button btn-bd">모임목록</button></a>
								</div>
							
						</div>
					</div>
				</article>
			</aside>
		</main>
		<!-- //main -->

		<footer id="footer">
			<jsp:include page="../include/ft.jsp"></jsp:include>
		</footer>
		<!-- //footer -->
	</div>
	<!-- //wrap -->
</body>
</html>