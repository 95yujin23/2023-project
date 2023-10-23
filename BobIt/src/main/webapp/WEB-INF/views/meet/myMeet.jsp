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
							<strong>모임 생성 현황</strong>
							
						</div>
						
						<div class="board_list_wrap">
							<table class="board_list">
								
								<colgroup>
									<col>
									<col>
									<col>	
								</colgroup>
								<thead>
									<tr class="tr-h">
										<th>모임명</th>
										<th>모임일자</th>
										<th>현재인원</th>										
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${list}" var="vo" varStatus="status">
										<tr>
											<c:choose>
											<c:when test="${fn:length(vo.meetSj) > 14}">
											<td><a href="selectMeet/${vo.meetNo}"><c:out value='${fn:substring(vo.meetSj, 0, 14)}'/>...</a></td>
											</c:when>
											<c:otherwise>
											<td><a href="selectMeet/${vo.meetNo}"><c:out value="${vo.meetSj}"/></a></td>
											</c:otherwise>
											</c:choose>
											<td><fmt:formatDate value="${vo.meetTime}"
													pattern="yyyy-MM-dd HH:mm" /></td>
										
										
											<td><c:out value="${vo.meetNow}"/>/<c:out value="${vo.meetMax}"/></td>
										</tr>	
									</c:forEach>
								</tbody>
								<tfoot class="tf-bor-none">
									<tr>
										<td colspan="15">
											
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						
						<div class="board_title">
							<strong>모임신청 현황</strong>
							
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
										<th>모임명</th>
										<th>모임일자</th>
										<th>모임장</th>
										<th>신청현황</th>
									</tr>
								</thead>
								<tbody class="td-cen">
									<c:forEach items="${alist}" var="avo" varStatus="status">
										<tr>
											<td><a href="/meet/selectMeet/${avo.meetNo}">${avo.meetSj}</a></td>
											<td><fmt:formatDate value="${avo.meetTime}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td><a href="/member/selectMember/${avo.meetJang}">${avo.meetJang}</a></td>
											<td>${avo.mtapplyYn}</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot class="tf-bor-none">
									<tr>
										
										</td>
									</tr>
								</tfoot>
								
							</table>

							<div class="bt_wrap">
								
								<a href="/meet/meetList"><button type="button"
										class="col3 button btn-bd">모임게시판</button></a>
				
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