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
<title>메세지함</title>

<!-- 헤드 부분 인클루드 -->
</head>

<%@ page import="me.bobit.myapp.member.service.MemberVO"%>
<%
if (session.getAttribute("member") != null) {
	String memType = ((MemberVO) session.getAttribute("member")).getMemType();
	if (memType.equals("관리자")) {
%>
<!-- 관리자에게 보여질 내용 -->
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="/css/adm_nav.css">

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
							<strong>메세지함</strong>
							
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
										<th>내용</th>
										<th>시간</th>
										<th>보낸이</th>
										<th>확인</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${list}" var="vo" varStatus="status">
										<tr>
											<c:choose>
												<c:when test="${fn:length(vo.alertCn) > 14}">
												<td><a href="/alert/selectAlert/${vo.alertNo}"><c:out value="${fn:substring(vo.alertCn, 0, 14)}"/>...</a></td>
												</c:when>
												<c:otherwise>
												<td><a href="/alert/selectAlert/${vo.alertNo}">${vo.alertCn}</a></td>
												</c:otherwise>
											</c:choose>
											<td><fmt:formatDate value="${vo.alertDate}" pattern="yyyy-MM-dd HH:mm" /></td>
											<td><a href="/member/selectMember/${vo.alertFrom}">${vo.alertFrom}</a></td>
											<c:choose>
												<c:when test="${vo.alertCheck == '미확인'}">
												<td style="color : red">${vo.alertCheck}</td>
												</c:when>
											<c:otherwise>
												<td>${vo.alertCheck}</td>
											</c:otherwise>
											</c:choose>
											<td class="coBtn"><a href="deleteAlert/${vo.alertNo}" class="button bt-ho coBtn1" id="btn-del">삭제</a>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot class="tf-bor-none">
									<tr>
										<td colspan="15">
											<ul class="pagination">
												<li class="page-item"><a class="page-link"
													href="?page=1${pager.query}">처음</a></li>
												<li class="page-item"><a class="page-link"
													href="?page=${pager.prev}${pager.query}">이전</a></li>
												<c:forEach var="page" items="${pager.list}">
													<li class="page-item"><a
														class="page-link ${page == pager.page ? 'active' : ''}"
														href="?page=${page}${pager.query} ">${page}</a></li>
												</c:forEach>
												<li class="page-item"><a class="page-link"
													href="?page=${pager.next}&${pager.query}">다음</a></li>
												<li class="page-item"><a class="page-link"
													href="?page=${pager.last}&${pager.query}">마지막</a></li>
											</ul>

										</td>
									</tr>
								</tfoot>
								<%
								} else {
								%>
								<!-- 관리자가 아닌 경우에 보여질 내용 -->
								<link rel="stylesheet" href="/css/main1.css">
								<link rel="stylesheet" href="/css/nav.css">
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
															<strong>메세지함</strong>
															
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
										<th>내용</th>
										<th>시간</th>
										<th>보낸이</th>
										<th>확인</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${list}" var="vo" varStatus="status">
										<tr>
											<c:choose>
												<c:when test="${fn:length(vo.alertCn) > 14}">
												<td><a href="/alert/selectAlert/${vo.alertNo}"><c:out value="${fn:substring(vo.alertCn, 0, 14)}"/>...</a></td>
												</c:when>
												<c:otherwise>
												<td><a href="/alert/selectAlert/${vo.alertNo}">${vo.alertCn}</a></td>
												</c:otherwise>
											</c:choose>
											<td><fmt:formatDate value="${vo.alertDate}" pattern="yyyy-MM-dd HH:mm" /></td>
											<td><a href="/member/selectMember/${vo.alertFrom}">${vo.alertFrom}</a></td>
											<c:choose>
												<c:when test="${vo.alertCheck == '미확인'}">
												<td style="color : red">${vo.alertCheck}</td>
												</c:when>
											<c:otherwise>
												<td>${vo.alertCheck}</td>
											</c:otherwise>
											</c:choose>
											<td class="coBtn"><a href="deleteAlert/${vo.alertNo}" class="button bt-ho coBtn1" id="btn-del">삭제</a>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot class="tf-bor-none">
									<tr>
										<td colspan="15">
											<ul class="pagination">
												<li class="page-item"><a class="page-link"
													href="?page=1${pager.query}">처음</a></li>
												<li class="page-item"><a class="page-link"
													href="?page=${pager.prev}${pager.query}">이전</a></li>
												<c:forEach var="page" items="${pager.list}">
													<li class="page-item"><a
														class="page-link ${page == pager.page ? 'active' : ''}"
														href="?page=${page}${pager.query} ">${page}</a></li>
												</c:forEach>
												<li class="page-item"><a class="page-link"
													href="?page=${pager.next}&${pager.query}">다음</a></li>
												<li class="page-item"><a class="page-link"
													href="?page=${pager.last}&${pager.query}">마지막</a></li>
											</ul>

										</td>
									</tr>
								</tfoot>
								<%
								}
								%>

								<%
								}
								%>
							</table>

							<div class="bt_wrap">
								<%-- <c:if test='${sid eq "admin"}'>  --%>
								<a href="sendAlert"><button type="button"
										class="col3 button btn-bd">쪽지보내기</button></a>
								<%-- </c:if> --%>
							</div>

						</div>
					</div>
				</article>
				<!-- //slider -->

			</aside>
			<article id="session"></article>
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
		//쪽지 삭제
		$("#btn-del").click(function() {
			if(!confirm("삭제하시겠습니까?")) {
				return false;
			}
		});
	});
	</script>
</body>
</html> 