<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용 게시판</title>
</head>
<body>
	<div>
		<h2>채팅상세 게시판</h2>
	</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td><a href="/cdetail/selectCdetail/${vo.cdetailNo}">${vo.cdetailNo}</a></td>
							<td>${vo.memNick}</td>
							<td>${vo.cdetailDate}</td>
							<td><a href="deleteCdetail/${vo.cdetailNo}">삭제</a>
									<a href="updateCdetail/${vo.cdetailNo}">수정</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	<div>
		<a href="insertCdetail">등록</a>
	</div>
</body>
</html>