<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용 신고게시판</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
</head>
<body>
<div class="container">
	<div>
		<div>
			<div>
				<dl>
					<dt>제목</dt>
					<dd><c:out value="${vo.blameSj}"/></dd>
				</dl>
				<dl>
					<dt>작성자</dt>
					<dd><c:out value="${vo.memNick}"/></dd>
					<dt>작성일</dt>
					<dd><fmt:formatDate value="${vo.blameDate}" pattern="yyyy-MM-dd"/></dd>
					<dt>처리상황</dt>
					<dd><c:out value="${vo.blameStts}"/></dd>
				</dl>
				<dl>
					<dt>내용</dt>
					<dd><c:out value="${vo.blameCn}" escapeXml="false"/></dd>
				</dl>
				
			</div>
		</div>
			<div class="btn-cont ar">
				<c:url var="uptUrl" value="/blame/updateBlame/${vo.blameNo}">
					<c:param name="blameNo" value="${vo.blameNo}"/>
				</c:url>
				<a href="${uptUrl}"><button type="button">수정</button></a>
														
				<c:url var="delUrl" value="/board/deleteBoard/${vo.blameNo}">
					<c:param name="boardNo" value="${vo.blameNo}"/>
				</c:url>
				<a href="${delUrl}" id="btn-del"><button type="button">삭제</button></a>
				
				<a href="/blame/takeBlame/${vo.blameNo}"><button type="button">진행</button></a>
				<a href="/blame/compleBlame/${vo.blameNo}"><button type="button">완료</button></a>
				<a href="/blame/deniedBlame/${vo.blameNo}"><button type="button">기각</button></a>
				
						
				<c:url var="listUrl" value="/board/boardList" />
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