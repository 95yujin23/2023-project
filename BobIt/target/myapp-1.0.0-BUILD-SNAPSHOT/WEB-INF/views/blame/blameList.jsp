<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용 신고게시판</title>
</head>
<body>
	<div>
		<h2>테스트용 신고게시판</h2>
	</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>처리상황</th>
				<th>관리</th>
			</tr>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td><a href="/blame/selectBlame/${vo.boardNo}">${vo.boardNo}</a></td>
							<td><a href="/blame/selectBlame/${vo.boardNo}">${vo.boardSj}</a></td>
							<td>${vo.memNick}</td>
							<td><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"/></td>
							<td>${vo.boardUse}</td>
							<td><a href="deleteBlame/${vo.boardNo}">삭제</a>
									<a href="updateBlame/${vo.boardNo}">수정</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	<div>
		<a href="insertBlame">등록</a>
	</div>
</body>
</html>