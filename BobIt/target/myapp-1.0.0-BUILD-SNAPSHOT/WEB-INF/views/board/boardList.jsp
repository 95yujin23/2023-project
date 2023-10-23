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
<jsp:include page="../include/css.jsp"></jsp:include>
</head>
<body id="page-top">
	<div id="wrap">
		<aside id="aside">
			<jsp:include page="../include/hd.jsp"></jsp:include>
		</aside>
		<!-- //aside -->

		<main id="main">
			<article id="session">
				<div class="board_wrap">
					<div class="board_title">
						<strong>게시판</strong>
					</div>
					<div class="full-item">
						<form class="d-flex" id="searchForm" action="board/list">
							<select name="searchType">

								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="total">제목+내용</option>
							</select>
							<script type="text/javascript">
								//	document.querySelector('[name="searchType"]').value = "";
								if ('') {
									$('[name="searchType"]').val('');
								}
							</script>
							<input class="form-control" placeholder="search" type="text"
								name="searchWord" value="" /> <input type="hidden"
								name="currentPageNo" value="1" /> <input type="submit"
								value="검색" class="sea-btn" />
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
							</colgroup>
							<thead>
								<tr class="tr-h">
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody class="td-cen">
								<c:forEach items="${list}" var="vo" varStatus="status">
									<tr>
										<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardNo}</a></td>
										<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardSj}</a></td>
										<td>${vo.memNick}</td>
										<td><fmt:formatDate value ="${vo.boardDate}" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
										<td><a href="deleteBoard/${vo.boardNo}" class="button">삭제</a>
											<a href="updateBoard/${vo.boardNo}" class="button">수정</a></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot class="tf-bor-none">
								<tr>
									<td colspan="15">
										<ul class="pagination">
											<li class="page-item"><a class="page-link"
												href="?page=1${pager.query}}">처음</a></li>
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
							<a href="insertBoard"><button type="button" class="col3 button">등록</button></a>
							<%-- </c:if> --%>
						</div>
						
					</div>
				</div>
			</article>
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