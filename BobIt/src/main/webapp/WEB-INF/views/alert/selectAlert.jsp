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
<title>메세지 확인</title>
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
							<strong>메세지 확인</strong>
						</div>
						<div class="board_list_wrap">
							<table class="board_list">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr class="tr-h">
									<tr>
										<th>보낸이</th>
										<td><a href="/member/selectMember/${vo.alertFrom}">${vo.alertFrom}</a></td>
									</tr>
									<tr>
										<th>작성일</th>
										<td><fmt:formatDate value="${vo.alertDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
									<tr class="tr-last">
										<th>내용</th>
										<td><c:out value="${vo.alertCn}" escapeXml="false" /></td>
									</tr>
							</table>
														
							<div class="bt_wrap">
								<c:url var="delUrl" value="/alert/deleteAlert/${vo.alertNo}">
									<c:param name="alertNo" value="${vo.alertNo}" />
								</c:url>
								<a href="${delUrl}" id="btn-del"><button type="button"
										class="col3 button btn-bd">삭제</button></a>
								<c:url var="listUrl" value="/alert/alertList" />
								<a href="${listUrl}"><button type="button"
										class="col3 button btn-bd">목록</button></a>
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
		$(document).ready(function() {
			//게시 글 삭제
			$("#btn-del").click(function() {
				if(!confirm("삭제하시겠습니까?")) {
					return false;
				}
			});
		});
	</script>
</body>
</html>