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
						<form method="post" enctype="multipart/form-data">
							<table class="board_list">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead class="inp-no">
									<tr class="tr-h">
									<tr>
										<th>글번호</th>
										<td><input
										type="number" name="boardNo" class="col2"
										value="${vo.boardNo}" readonly /></td>
									</tr>
									<tr>
										<th>제목</th>
										<td><input type="text"
										name="boardSj" class="col2" value="${vo.boardSj}" /></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td><input type="text" name="memNick"
											value="${vo.memNick}" class="col2"
											style="background: #eee;" readonly></td>
									</tr>
									<tr class="tr-last">
										<th>내용</th>
										<td><textarea rows=20 cols=147 wrap=off name="boardCn"
												class="col4">${vo.boardCn}</textarea></td>
									</tr>
							</table>

							<div class="bt_wrap">
								<a><button class="col3 button" type="submit">변경</button></a> 
								<a href="boardList"><button type="button" class="col3 button">목록</button></a>
							</div>
						</form>
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