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
							<strong>신고게시판</strong>
						</div>
						<div class="board_list_wrap">
							<table class="board_list">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr class="tr-h">
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
										<th>처리상황</th>
										<td><c:out value="${vo.boardUse}"/></td>
									</tr>
									<tr class="tr-last">
										<th>신고내용</th>
										<td><c:out value="${vo.boardCn}" escapeXml="false" /></td>
									</tr>
							</table>
							<span>파일 목록</span>
							<div>
								<c:forEach var="att" items="${att}">
									<a href="#"
										onclick="fn_fileDown('${att.att_no}'); return false;">${att.att_orgname}</a>
									<br>
								</c:forEach>
							</div>
							<div class="bt_wrap">
								<c:if test="${sessionScope.member.memType == '관리자'}">
								<c:url var="uptUrl" value="/blame/updateBlame/${vo.boardNo}">
									<c:param name="boardNo" value="${vo.boardNo}" />
								</c:url>
								<a href="${uptUrl}"><button type="button"
										class="col3 button btn-bd">수정</button></a>
							
								<c:url var="delUrl" value="/blame/deleteBlame/${vo.boardNo}">
									<c:param name="boardNo" value="${vo.boardNo}" />
								</c:url>
								<a href="${delUrl}" id="btn-del"><button type="button"
										class="col3 button btn-bd">삭제</button></a>
								</c:if>
								<c:url var="listUrl" value="/blame/blameList" />
								<a href="${listUrl}"><button type="button"
										class="col3 button btn-bd">목록</button></a>
								<c:if test="${sessionScope.member.memType == '관리자'}">
								<a href="/blame/takeBlame/${vo.boardNo}"><button type="button" class="col3 button btn-bd">진행</button></a>
								<a href="/blame/compleBlame/${vo.boardNo}"><button type="button" class="col3 button btn-bd">완료</button></a>
								<a href="/blame/deniedBlame/${vo.boardNo}"><button type="button" class="col3 button btn-bd">기각</button></a>
								</c:if>		
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
	<script>
		function fn_fileDown(att_no) {
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', '<c:url value="/board/fileDown" />'); // 실제 다운로드 URL로 대체

			var input = document.createElement('input');
			input.setAttribute('type', 'hidden');
			input.setAttribute('name', 'att_no');
			input.setAttribute('value', att_no);

			form.appendChild(input);
			document.body.appendChild(form);

			form.submit();
		}
		
		$(document).ready(function() {
			//신고글 삭제
			$("#btn-del").click(function() {
			if(!confirm("삭제하시겠습니까?")) {
			return false;
			}
		});
	});
	</script>
</body>
</html>