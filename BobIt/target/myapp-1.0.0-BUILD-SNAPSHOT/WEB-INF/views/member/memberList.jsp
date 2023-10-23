<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
	<div>
		<h2>테스트회원리스트</h2>
	</div>
	<div>
		<table>
			<tr>
				<th>닉네임</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>성별</th>
				<th>연령</th>
				<th>지역</th>
				<th>회원상태</th>
				<th>회원관리</th>
			</tr>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.memNick}</td>
							<td>${vo.memId}</td>
							<th>${vo.memMail}</th>
							<td>${vo.memFm}</td>
							<td>${vo.memAge}</td>
							<td>${vo.memArea}</td>
							<td>${vo.memCheck}</td>
							<td><a href="deleteMember/${vo.memNick}">삭제</a>
									<a href="updateMember/${vo.memNick}">수정</a>
									<a href="kickMember/${vo.memNick}">강제추방</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	<div>
		<a href="insertMember">등록</a>
	</div>
</body>
</html>