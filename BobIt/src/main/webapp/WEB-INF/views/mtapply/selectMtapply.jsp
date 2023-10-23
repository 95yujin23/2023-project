<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/img/favicon.ico" type="image/x-icon">
<title>모임신청 보기(임시)</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
</head>
<body>
<div class="container">
	<div>
		<div>
			<div>
				<dl>
					<dt>신청번호</dt>
					<dd><c:out value="${vo.mtapplyNo}" escapeXml="false"/></dd>
				</dl>
				<dl>
					<dt>모임번호</dt>
					<dd><c:out value="${vo.meetNo}" escapeXml="false"/></dd>
				</dl>
				<dl>
					<dt>작성자</dt>
					<dd><c:out value="${vo.memNick}" escapeXml="false"/></dd>
				</dl>
				<dl>
					<dt>신청현황</dt>
					<dd><c:out value="${vo.mtapplyYn}" escapeXml="false"/></dd>
				</dl>
				
			</div>
		</div>
			<div class="btn-cont ar">
				<c:url var="uptUrl" value="/mtapply/agreeMtapply/${vo.mtapplyNo}">
					<c:param name="mtapplyNo" value="${vo.mtapplyNo}"/>
				</c:url>
				<a href="${uptUrl}" id="btn-yes"><button type="button">승낙</button></a>
						
				<c:url var="delUrl" value="/mtapply/deniedMtapply/${vo.mtapplyNo}">
					<c:param name="mtapplyNo" value="${vo.mtapplyNo}"/>
				</c:url>
				<a href="${delUrl}" id="btn-del"><button type="button">거절</button></a>
				
				<c:url var="waitUrl" value="/mtapply/waitMtapply/${vo.mtapplyNo}">
					<c:param name="mtapplyNo" value="${vo.mtapplyNo}"/>
				</c:url>
				<a href="${waitUrl}"><button type="button">대기</button></a>
				
						
				<c:url var="listUrl" value="/mtapply/mtapplyList" />
						<a href="${listUrl}"><button type="button">목록</button></a>
			</div>
		</div>		
	</div>	
<script>
$(document).ready(function() {
	//요청승낙
	$("#btn-yes").click(function() {
		if(!confirm("승낙하시겠습니까?")) {
			return false;
		}
	});
	//요청거절
	$("#btn-del").click(function() {
		if(!confirm("거절하시겠습니까?")) {
			return false;
		}
	});
});
</script>	
</body>
</html>