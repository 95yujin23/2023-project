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
							<ul class="siteMap">
								<li><a href="/">home</a></li>
								<li><a href="#">support</a></li>
								<li><a href="/blame/blameList">신고게시판</a></li>
							</ul>
						</div>
						<div class="full-item">
							<form class="formType" id="searchForm" action="board/list">
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
									value="검색" class="sea-btn btn-bd" />
							</form>
						</div>
						<div class="board_list_wrap">
							<table class="board_list">
								<%@ page import="me.bobit.myapp.member.service.MemberVO"%>
								<%
								if (session.getAttribute("member") != null) {
									String memType = ((MemberVO) session.getAttribute("member")).getMemType();
									if (memType.equals("관리자")) {
								%>
								<!-- 관리자에게 보여질 내용 -->
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
										<th>처리상황</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${list}" var="vo" varStatus="status">
										<tr>
											<td><a href="/blame/selectBlame/${vo.boardNo}">${vo.boardNo}</a></td>
											<td><a href="/blame/selectBlame/${vo.boardNo}">${vo.boardSj}</a></td>
											<td>${vo.memNick}</td>
											<td><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd HH:mm"/></td>
											<td><c:if test="${vo.boardAtch > 0}"><img src="/img/icon_attached_file.png"></c:if></td>
											<td class="memCheckColor"><a>${vo.boardUse}</a></td>
											<td class="coBtn"><a href="deleteBlame/${vo.boardNo}" class="coBtn1" id="btn-del">삭제</a>
													<a href="updateBlame/${vo.boardNo}" class="coBtn2">수정</a>
											</td>
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
										<th>처리상황</th>
										<c:if test="${sessionScope.member.memType == '관리자'}">
										<th>관리</th>
										</c:if>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${list}" var="vo" varStatus="status">
										<tr>
											<td><a href="/blame/selectBlame/${vo.boardNo}">${vo.boardNo}</a></td>
											<td><a href="/blame/selectBlame/${vo.boardNo}">${vo.boardSj}</a></td>
											<td>${vo.memNick}</td>
											<td><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd HH:mm"/></td>
											<td><c:if test="${vo.boardAtch > 0}"><img src="/img/icon_attached_file.png"></c:if></td>
											<td class="memCheckColor"><a>${vo.boardUse}</a></td>
											<c:if test="${sessionScope.member.memType == '관리자'}">
											<td class="coBtn"><a href="deleteBlame/${vo.boardNo}" class="coBtn1" id="btn-del">삭제</a>
													<a href="updateBlame/${vo.boardNo}" class="coBtn2">수정</a>
											</td>
											</c:if>
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
								<a href="insertBlame"><button type="button"
										class="col3 button btn-bd" id="">등록</button></a>
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
   // 모든 클래스가 "memCheckColor"인 요소를 선택합니다.
   const buttons = document.querySelectorAll('.memCheckColor > a');

   buttons.forEach(button => {
       const dbValue = button.textContent; // 요소의 텍스트 내용을 가져옵니다.

       // 데이터베이스 값에 따라 색상을 설정
       if (dbValue === "접수중") {
           button.style.backgroundColor = '#457D24';
       } else if (dbValue === "처리중") {
           button.style.backgroundColor = '#E8C051';
       } else if (dbValue === "거절") {
           button.style.backgroundColor = '#AC2527';
       } else {
           // 기본 색상 설정
           button.style.backgroundColor = '#3A488A';
       }
   });
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