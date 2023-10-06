<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 쓰기</title>
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
			<h3 class="h1">상세보기</h3>
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
						<div class="table-container">
							<table class="custom-table">
								<tr>
									<th>제목</th>
									<td><c:out value="${vo.boardSj}" /></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td><c:out value="${vo.memNick}" /></td>
								</tr>
								<tr>
									<th>작성일</th>
									<td><fmt:formatDate value="${vo.boardDate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><c:out value="${vo.boardCn}" escapeXml="false" /></td>
								</tr>
							</table>
						</div>
						<div class="btn-cont ar">
							<c:url var="uptUrl" value="/board/updateBoard/${vo.boardNo}">
								<c:param name="boardNo" value="${vo.boardNo}" />
							</c:url>
							<a href="${uptUrl}"><button type="button" class="col3 button">수정</button></a>

							<c:url var="delUrl" value="/board/deleteBoard/${vo.boardNo}">
								<c:param name="boardNo" value="${vo.boardNo}" />
							</c:url>
							<a href="${delUrl}" id="btn-del"><button type="button" class="col3 button">삭제</button></a>

							<c:url var="listUrl" value="/board/boardList" />
							<a href="${listUrl}"><button type="button" class="col3 button">목록</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer id="footer" class="footer-nav row expanded collapse">
		<!-- 푸터 부분 인클루드 -->
		<jsp:include page="../include/ft.jsp"></jsp:include>
	</footer>
	<script>
		$(document).ready(function() {
			//게시 글 삭제
			$("#btn-del").click(function() {
				if (!confirm("삭제하시겠습니까?")) {
					return false;
				}
			});
		});
	</script>
</body>
</html>