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
<title>회원리스트</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="/css/adm_nav.css">
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
							<strong>밥잇회원리스트</strong>
							<ul class="siteMap">
								<li><a href="/">home</a></li>
								<li><a href="#">멤버관리</a></li>
								<li><a href="/member/memberList">멤버리스트</a></li>
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
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr class="tr-h">
										<th>닉네임</th>
										<th>아이디</th>
										<th>이메일</th>
										<th>성별</th>
										<th>연령</th>
										<th>지역</th>
										<th>회원상태</th>
										<th>회원관리</th>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach var="vo" items="${list}">
										<tr>
											<td>${vo.memNick}</td>
											<td>${vo.memId}</td>
											<th>${vo.memMail}</th>
											<td>${vo.memFm}</td>
											<td>${vo.memAge}</td>
											<td>${vo.memArea}</td>
											<td class="memCheckColor"><a>${vo.memCheck}</a></td>
											<td class="coBtn"><a href="deleteMember/${vo.memNick}" class="coBtn1" id="btn-del">삭제</a> 
											<a href="updateMember/${vo.memNick}" class="coBtn2">수정</a> 
											<a href="kickMember/${vo.memNick}" class="coBtn3" id="btn-dp">강제추방</a></td>
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
								<a href="insertMember"><button type="button"
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
// 모든 클래스가 "memCheckColor"인 요소를 선택합니다.
const buttons = document.querySelectorAll('.memCheckColor > a');

buttons.forEach(button => {
const dbValue = button.textContent; // 요소의 텍스트 내용을 가져옵니다.

// 데이터베이스 값에 따라 색상을 설정
if (dbValue === "탈퇴") {
button.style.backgroundColor = '#457D24';
} else if (dbValue === "추방") {
button.style.backgroundColor = '#AC2527';
} else {
// 기본 색상 설정
button.style.backgroundColor = '#3A488A';
}
});

$(document).ready(function() {
	//멤버 삭제
	$("#btn_del").click(function() {
	if(!confirm("삭제하시겠습니까?")) {
	return false;
	}
	});
	});
	$(document).ready(function() {
	//멤버 강제추방
	$("#btn_dp").click(function() {
	if(!confirm("강제추방하시겠습니까?")) {
	return false;
	}
	});

	});
</script>
</body>
</html>