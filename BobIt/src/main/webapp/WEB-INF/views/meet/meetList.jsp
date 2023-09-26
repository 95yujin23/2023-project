<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집 게시판</title>
</head>
<body>
	<div>
		<h2>모집 게시판</h2>
	</div>
	<div>
		<table>
			<tr>
				<th>모임번호</th>
				<th>모임제목</th>
				<th>작성자</th>
				<th>모임시간</th>
				<th>지역</th>
				<th>메뉴</th>
				<th>성별</th>
				<th>연령대</th>
				<th>인원</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td><a href="/meet/selectMeet/${vo.meetNo}">${vo.meetNo}</a></td>
							<td><a href="/meet/selectMeet/${vo.meetNo}">${vo.meetSj}</a></td>
							<td>${vo.memNick}</td>
							<td>${vo.meetTime}</td>
							<td>${vo.meetArea}</td>
							<td>${vo.meetMenu}</td>
							<td>${vo.meetFm}</td>
							<td>${vo.meetAge}</td>
							<td>예정 / ${vo.meetMax}</td>
							<td>${vo.meetStts}</td>
							<td><a href="deleteMeet/${vo.meetNo}">삭제</a>
									<a href="updateMeet/${vo.meetNo}">수정</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	<div>
		<a href="insertMeet">등록</a>
	</div>
</body>
</html>