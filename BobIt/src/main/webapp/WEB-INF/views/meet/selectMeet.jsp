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
<title>모임상세</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<script>
	const already = "${already}";
	if(already)
		alert(already);
</script>
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
							<strong>모임 상세</strong>
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
			<col>
			<col>
		</colgroup>
		<thead>
			<tr class="tr-h">
			<tr>
				<th>모임명</th>
				<td><c:out value="${vo.meetSj}"/></td>
			</tr>
			<tr>
				<th>모임장</th>
				<td><a href="/member/selectMember/${vo.memNick}" target="_blank"><c:out value="${vo.memNick}"/></a></td>
			</tr>
			<tr>
				<th>모임시간</th>
				<td><fmt:formatDate value="${vo.meetTime}" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
			<tr>
				<th>모임장소</th>
				<td><c:out value="${vo.meetArea}"/></td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td><c:out value="${vo.meetMenu}"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><c:out value="${vo.meetFm}"/></td>
			</tr>							
			<tr>
				<th>연령대</th>
				<c:choose>
				<c:when test="${vo.meetAge == '상관없음'}">
				<td><c:out value="${vo.meetAge}"/></td>
				</c:when>
				<c:otherwise>
				<td><c:out value="${vo.meetAge}0대"/></td>
				</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>인원</th>
				<td><c:out value="${vo.meetNow}"/>/<c:out value="${vo.meetMax}"/></td>
			</tr>
			<tr class="tr-last">
				<th>내용</th>
				<td><c:out value="${vo.meetCn}" escapeXml="false"/></td>
			</tr>
			<tr>
				<th>
				<c:choose>
                    <c:when test="${not empty vo.meetArea}">
                        <td><a href="https://map.kakao.com/?q=${vo.meetArea}" target="_blank">모임 장소 지도 보기</a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="https://map.kakao.com/?q=${vo.meetMapx},${vo.meetMapy}" target="_blank">모임 장소 지도 보기</a></td>
                    </c:otherwise>
                </c:choose>
			</tr>	
		</thead>	
		</table>
			<div class="bt_wrap">

			<div class="btn-cont ar">
				<c:if test="${sessionScope.member.memNick != vo.memNick && vo.meetNow < vo.meetMax}">
					<c:url var="applyUrl" value="/meet/applyMeet/${vo.meetNo}">
					<c:param name="meetNo" value="${vo.meetNo}"/>
				</c:url>
					<a href="${applyUrl}"><button type="button" id="btn-bd" class="col3 button btn-bd">참가신청</button></a>
				</c:if>
				<c:if test="${sessionScope.member.memNick == vo.memNick}">
				<c:url var="uptUrl" value="/meet/updateMeet/${vo.meetNo}">
					<c:param name="meetNo" value="${vo.meetNo}"/>
				</c:url>
				<a href="${uptUrl}"><button type="button" class="col3 button btn-bd">수정</button></a>
						
				<c:url var="delUrl" value="/meet/deleteMeet/${vo.meetNo}">
					<c:param name="meetNo" value="${vo.meetNo}"/>
				</c:url>
				<a href="${delUrl}" id="btn-del"><button type="button" class="col3 button btn-bd">삭제</button></a>
				</c:if>		
				<c:url var="listUrl" value="/meet/meetList" />
						<a href="${listUrl}"><button type="button" class="col3 button btn-bd">목록</button></a>	
			</div>		
		</div>

		<div class="board_title">
				<strong>신청자 현황</strong>
			</div>
				<div class="board_list_wrap">
				</div>
			</div>
				<table class="board_list">
					<colgroup>
						<col>
						<col>
						<c:if test="${sessionScope.member.memNick == vo.memNick}">
						<col>
						</c:if>
					</colgroup>
					<thead>
						<tr class="tr-h">
							<th>닉네임</th>
							<th>상태</th>
							<c:if test="${sessionScope.member.memNick == vo.memNick}">
							<th>관리</th>
							</c:if>
						</tr>
					</thead>
					<tbody class="td-cen">
						<c:forEach var="item" items="${mvo}" varStatus="status">
							<tr>
								<td><a href="/member/selectMember/${item.memNick}" target="_blank">${item.memNick}</a></td>
								<td>${item.mtapplyYn}</td>
								<c:if test="${sessionScope.member.memNick == vo.memNick}">
								<td><c:url var="uptUrl" value="/mtapply/agreeMtapply/${item.mtapplyNo}">
										<c:param name="mtapplyNo" value="${item.mtapplyNo}"/>
										</c:url>
										<a href="${uptUrl}" id="btn-yes"><button type="button" class="col3 button btn-bd">승낙</button></a>
										<c:url var="delUrl" value="/mtapply/deniedMtapply/${item.mtapplyNo}">
										<c:param name="mtapplyNo" value="${item.mtapplyNo}"/>
										</c:url>
										<a href="${delUrl}" id="btn-del"><button type="button" class="col3 button btn-bd">거절</button></a>
										<c:url var="waitUrl" value="/mtapply/waitMtapply/${item.mtapplyNo}">
										<c:param name="mtapplyNo" value="${item.mtapplyNo}"/>
										</c:url>
										<a href="${waitUrl}"><button type="button" class="col3 button btn-bd">대기</button></a>				
								</td>
								</c:if>
							</tr>
						</c:forEach>
								
					</tbody>
				</table>
					<div class="bt_wrap">
						<c:url var="listUrl" value="/meet/meetList" />
						<a href="${listUrl}"><button type="button" class="col3 button btn-bd">목록</button></a>
					</div>	
			</div>
				
			</article>
		

	</aside>
</main>

<footer id="footer">
	<jsp:include page="../include/ft.jsp"></jsp:include>
</footer>

</div>
<script>
$(document).ready(function() {
//게시 글 삭제
$("#btn-del").click(function() {
if(!confirm("삭제하시겠습니까?")) {
return false;
}
});
});
$(document).ready(function() {
//참가 신청
$("#btn-bd").click(function() {
if(!confirm("참가신청을 하시겠습니까?")) {
return false;
}
});
});
</script>			
</body>
</html>