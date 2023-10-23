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
					<dd><c:out value="${vo.boardSj}"/></dd>
				</dl>
				<dl>
					<dt>작성자</dt>
					<dd><c:out value="${vo.memNick}"/></dd>
					<dt>작성일</dt>
					<dd><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd hh:mm"/></dd>
					<dt>처리상황</dt>
					<dd><c:out value="${vo.boardUse}"/></dd>
				</dl>
				<dl>
					<dt>내용</dt>
					<dd><c:out value="${vo.boardCn}" escapeXml="false"/></dd>
				</dl>
				<span>파일 목록</span>
              <div>
                <c:forEach var="att" items="${att}">
                  <a href="#" onclick="fn_fileDown('${att.att_no}'); return false;">${att.att_orgname}</a><br>
                </c:forEach>
              </div>
			</div>
		</div>
			<div class="btn-cont ar">
				<c:url var="uptUrl" value="/blame/updateBlame/${vo.boardNo}">
					<c:param name="boardNo" value="${vo.boardNo}"/>
				</c:url>
				<a href="${uptUrl}"><button type="button">수정</button></a>
														
				<c:url var="delUrl" value="/blame/deleteBlame/${vo.boardNo}">
					<c:param name="boardNo" value="${vo.boardNo}"/>
				</c:url>
				<a href="${delUrl}" id="btn-del"><button type="button">삭제</button></a>
				
				<a href="/blame/takeBlame/${vo.boardNo}"><button type="button">진행</button></a>
				<a href="/blame/compleBlame/${vo.boardNo}"><button type="button">완료</button></a>
				<a href="/blame/deniedBlame/${vo.boardNo}"><button type="button">기각</button></a>
				
						
				<c:url var="listUrl" value="/blame/blameList" />
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
function fn_fileDown(att_no) {
  var form = document.createElement('form');
  form.setAttribute('method', 'post');
  form.setAttribute('action', '<c:url value="/board/fileDown" />'); // 실제 다운로드 URL로 대체

  var input = document.createElement('input');
  input.setAttribute('type', 'hidden');
  input.setAttribute('name', 'att_no');
  input.setAttribute('value', att_no);

  form.appendChild(input);
  document.body.appendChild(form);

  form.submit();
}
</script>	
</body>
</html>