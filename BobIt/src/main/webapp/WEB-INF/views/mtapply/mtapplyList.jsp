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
	<link rel="icon" href="/img/favicon.ico" type="image/x-icon">
<title>모임신청 리스트</title>
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
							<strong>모임신청 리스트</strong>
							<ul class="siteMap">
								<li><a href="/">home</a></li>
								<li><a href="/member/memberList">멤버관리</a></li>
								<li><a href="/mtapply/mtapplyList">모임신청 리스트</a></li>
							</ul>
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
										<th>신청번호</th>
										<th>모임번호</th>
										<th>신청자</th>
										<th>신청현황</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach var="vo" items="${list}">
										<tr>
											<td><a href="/mtapply/selectMtapply/${vo.mtapplyNo}">${vo.mtapplyNo}</a></td>
											<td><a href="/mtapply/selectMtapply/${vo.mtapplyNo}">${vo.meetNo}</a></td>
											<td>${vo.memNick}</td>
											<td>${vo.mtapplyYn}</td>
											<td><a href="agreeMtapply/${vo.mtapplyNo}">승낙</a> <a
												href="deniedMtapply/${vo.mtapplyNo}">거절</a> <a
												href="waitMtapply/${vo.mtapplyNo}">대기</a></td>
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
							</table>

							<div class="bt_wrap">
								<%-- <c:if test='${sid eq "admin"}'>  --%>
								<a href="insertMtapply"><button type="button"
										class="col3 button btn-bd">등록</button></a>
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
</body>
</html>