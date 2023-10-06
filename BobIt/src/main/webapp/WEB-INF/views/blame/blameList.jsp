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
<title>신고 게시판</title>
<!-- 헤드 부분 인클루드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<style>
a {
	
}
</style>
</head>
<body>
	<header id="header">
		<!-- 헤더 부분 인클루드 -->
		<jsp:include page="../include/hd.jsp"></jsp:include>
	</header>

	<div class="content" id="contents">
		<div class="row column text-center">
			<h3 class="h1">신고 게시판</h3>
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
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>처리상황</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td><a href="/blame/selectBlame/${vo.blameNo}">${vo.blameNo}</a></td>
										<td><a href="/blame/selectBlame/${vo.blameNo}">${vo.blameSj}</a></td>
										<td>${vo.memNick}</td>
										<td>${vo.blameDate}</td>
										<td>${vo.blameStts }</td>
										<td><a href="deleteBlame/${vo.blameNo}" class="button">삭제</a> <a
											href="updateBlame/${vo.blameNo}" class="button">수정</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- <c:if test='${sid eq "admin"}'>  --%>
						<div class="button-group">
							<a class="col3 button" href="insertBoard"><span>등록</span></a>
						</div>
						<%-- </c:if> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>