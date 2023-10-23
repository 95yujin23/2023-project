<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임신청 게시판(임시)</title>
</head>
<body>
	<div>
		<h2>모임신청 게시판(임시)</h2>
	</div>
	<div>
		<table>
			<tr>
				<th>신청번호</th>
				<th>모임번호</th>
				<th>신청자</th>
				<th>신청현황</th>
			</tr>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td><a href="/mtapply/selectMtapply/${vo.mtapplyNo}">${vo.mtapplyNo}</a></td>
							<td><a href="/mtapply/selectMtapply/${vo.mtapplyNo}">${vo.meetNo}</a></td>
							<td>${vo.memNick}</td>
							<td>${vo.mtapplyYn}</td>
							<td><a href="agreeMtapply/${vo.mtapplyNo}">승낙</a>
									<a href="deniedMtapply/${vo.mtapplyNo}">거절</a>
									<a href="waitMtapply/${vo.mtapplyNo}">대기</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	<div>
		<a href="insertMtapply">등록</a>
	</div>
</body>
</html>