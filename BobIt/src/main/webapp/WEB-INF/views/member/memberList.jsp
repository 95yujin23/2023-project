<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원리스트</title>
<!-- 헤드 부분 인클루드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<header id="header">
		<!-- 헤더 부분 인클루드 -->
		<jsp:include page="../include/hd.jsp"></jsp:include>
	</header>
	<div class="content" id="contents">
		<div class="row column text-center">
			<h3 class="h1">회원리스트</h3>
			<hr>
			<div class="container">
				<div id="insert">
					<div class="in-l" style="text-align: center;">
						<aside class="side-container">
							<div class="vertical-menu ">

								<div class="m-link">
									<a href="#"><i class="fas"></i><span>&nbsp; 공지사항</span></a>
								</div>
								<div class="m-link">
									<a href="#"><i class=" fas"></i><span>&nbsp; 게시판1 </span></a>
								</div>
								<div class="m-link">
									<a href="#"><i class=" fas"></i><span>&nbsp; 게시판2 </span></a>
								</div>
							</div>
						</aside>
					</div>
					<div class="in-r" style="text-align: center;">
						<table>
							<tr>
								<th>닉네임</th>
								<th>아이디</th>
								<th>이메일</th>
								<th>성별</th>
								<th>연령</th>
								<th>지역</th>
								<th>회원상태</th>
								<th>회원관리</th>
							</tr>
							<tbody>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td>${vo.memNick}</td>
										<td>${vo.memId}</td>
										<th>${vo.memMail}</th>
										<td>${vo.memFm}</td>
										<td>${vo.memAge}0대</td>
										<td>${vo.memArea}</td>
										<td>${vo.memCheck}</td>
										<td><a href="deleteMember/${vo.memNick}">삭제</a> <a
											href="updateMember/${vo.memNick}">수정</a> <a
											href="kickMember/${vo.memNick}">강제추방</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div>
							<a href="insertMember">등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>