<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 게시판</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
</head>
<body>
<div class="container">
	<div>
		<div>
			<div>
				<dl>
					<dt>제목</dt>
					<dd><c:out value="${vo.chatSj}"/></dd>
				</dl>
				<dl>
					<dt>작성자</dt>
					<dd><c:out value="${vo.memNick}"/></dd>
					<dt>작성일</dt>
					<dd><fmt:formatDate value="${vo.chatDate}" pattern="yyyy-MM-dd"/></dd>
				</dl>
				
			</div>
		</div>
			<div class="btn-cont ar">
				<c:url var="uptUrl" value="/chat/updateChat/${vo.chatNo}">
					<c:param name="chatNo" value="${vo.chatNo}"/>
				</c:url>
				<a href="${uptUrl}"><button type="button">수정</button></a>
						
				<c:url var="delUrl" value="/chat/deleteChat/${vo.chatNo}">
					<c:param name="chatNo" value="${vo.chatNo}"/>
				</c:url>
				<a href="${delUrl}" id="btn-del"><button type="button">삭제</button></a>
						
				<c:url var="listUrl" value="/chat/chatList" />
						<a href="${listUrl}"><button type="button">목록</button></a>
			</div>
		</div>		
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
</script>	
</body>
</html>