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
							<strong>게시판</strong>
							<ul class="siteMap">
								<li><a href="/">home</a></li>
								<li><a href="board/boardList">게시판관리</a></li>
								<li><a href="board/boardList">자유게시판</a></li>
							</ul>
						</div>
						<div class="full-item">
							<form class="formType" id="searchForm">
								<select name="search">
									<option value="0">검색</option>
									<option value="1" ${pager.search == 1 ? "selected" : "" }>제목</option>
									<option value="2" ${pager.search == 2 ? "selected" : "" }>내용</option>
									<option value="3" ${pager.search == 3 ? "selected" : "" }>작성자</option>
								</select>
								<input class="form-control" placeholder="search"
																	type="text" name="keyword" value="${pager.keyword}" />
								<button class="sea-btn btn-bd">검색</button>
							</form>
						</div>
						<div class="board_list_wrap">
							<table class="board_list">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr class="tr-h">
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>첨부</th>
										<th>조회수</th> <!-- 조회수 -->
										<th>관리</th>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${list}" var="vo" varStatus="status">
										<tr>
											<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardNo}</a></td>
											<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardSj}</a></td>
											<td>${vo.memNick}</td>
											<td><fmt:formatDate value="${vo.boardDate}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td><c:if test="${vo.boardAtch > 0}"><img src="/img/icon_attached_file.png"></c:if></td>
											<td><c:out value="${vo.boardHit}"/></td> <!-- 조회수 -->
											<td class="coBtn"><a href="deleteBoard/${vo.boardNo}" class="button bt-ho coBtn1" id="btn-del">삭제</a>
												<a href="updateBoard/${vo.boardNo}" class="button bt-ho coBtn2">수정</a></td>
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
															<strong>게시판</strong>
															<ul class="siteMap">
																<li><a href="/">home</a></li>
																<li><a href="#">community</a></li>
																<li><a href="/board/boardList">자유게시판</a></li>
															</ul>
														</div>
														<div class="full-item">
															<form class="formType" id="searchForm">
								<select name="search">
									<option value="0">검색</option>
									<option value="1" ${pager.search == 1 ? "selected" : "" }>제목</option>
									<option value="2" ${pager.search == 2 ? "selected" : "" }>내용</option>
									<option value="3" ${pager.search == 3 ? "selected" : "" }>작성자</option>
								</select>
																<input class="form-control" placeholder="search"
																	type="text" name="keyword" value="${pager.keyword}" />
																<button class="sea-btn btn-bd">검색</button>	
															</form>
														</div>
														<div class="board_list_wrap">
															<table class="board_list">								
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr class="tr-h">
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>첨부</th>
										<th>조회수</th> <!-- 조회수 -->
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${list}" var="vo" varStatus="status">
										<tr>
											<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardNo}</a></td>
											<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardSj}</a></td>
											<td>${vo.memNick}</td>
											<td><fmt:formatDate value="${vo.boardDate}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td><c:if test="${vo.boardAtch > 0}"><img src="/img/icon_attached_file.png"></c:if></td>
											<td><c:out value="${vo.boardHit}"/></td> <!-- 조회수 -->
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
								<a href="insertBoard"><button type="button"
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