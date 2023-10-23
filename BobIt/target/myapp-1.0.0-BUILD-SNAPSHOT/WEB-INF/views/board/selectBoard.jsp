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
								<tr class="tr-last">
									<th>내용</th>
									<td><c:out value="${vo.boardCn}" escapeXml="false" /></td>
								</tr>
						</table>
						<span>파일 목록</span>
         			    	<div>
                				<c:forEach var="att" items="${att}">
                  					<a href="#" onclick="fn_fileDown('${att.att_no}'); return false;">${att.att_orgname}</a><br>
                				</c:forEach>
              			</div>
						<div class="bt_wrap">
							<c:url var="uptUrl" value="/board/updateBoard/${vo.boardNo}">
								<c:param name="boardNo" value="${vo.boardNo}" />
							</c:url>
							<a href="${uptUrl}"><button type="button" class="col3 button">수정</button></a>

							<c:url var="delUrl" value="/board/deleteBoard/${vo.boardNo}">
								<c:param name="boardNo" value="${vo.boardNo}" />
							</c:url>
							<a href="${delUrl}" id="btn-del"><button type="button"
									class="col3 button">삭제</button></a>

							<c:url var="listUrl" value="/board/boardList" />
							<a href="${listUrl}"><button type="button"
									class="col3 button">목록</button></a>
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
  </script>
</body>
</html>