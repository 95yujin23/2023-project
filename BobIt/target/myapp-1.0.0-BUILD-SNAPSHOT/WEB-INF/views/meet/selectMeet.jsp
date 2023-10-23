<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용 게시판</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
</head>
<body>
<div class="container">
	<div>
		<div>
			<div>
				<dl>
					<dt>모임번호</dt>
					<dd><c:out value="${vo.meetNo}"/></dd>
				</dl>
				<dl>
					<dt>제목</dt>
					<dd><c:out value="${vo.meetSj}"/></dd>
				</dl>
				<dl>
					<dt>작성자</dt>
					<dd><c:out value="${vo.memNick}"/></dd>
				</dl>
				<dl>
					<dt>모임시간</dt>
					<dd><fmt:formatDate value="${vo.meetTime}" pattern="yyyy-MM-dd"/></dd>
				</dl>
				<dl>
					<dt>지역</dt>
					<dd><c:out value="${vo.meetArea}"/></dd>
				</dl>
				<dl>
					<dt>메뉴</dt>
					<dd><c:out value="${vo.meetMenu}"/></dd>
				</dl>
				<dl>
					<dt>성별</dt>
					<dd><c:out value="${vo.meetFm}"/></dd>
				</dl>
				<dl>
					<dt>연령대</dt>
					<dd><c:out value="${vo.meetAge}0대"/></dd>
				</dl>
				<dl>
					<dt>인원</dt>
					<dd><c:out value="${vo.meetNow}"/>/<c:out value="${vo.meetMax}"/></dd>
				</dl>
				
				<dl>
					<dt>내용</dt>
					<dd><c:out value="${vo.meetCn}" escapeXml="false"/></dd>
				</dl>
                <c:choose>
                    <c:when test="${not empty vo.meetArea}">
                        <a href="https://map.kakao.com/?q=${vo.meetArea}" target="_blank">지도로 보기</a>
                    </c:when>
                    <c:otherwise>
                        <a href="https://map.kakao.com/?q=${vo.meetMapx},${vo.meetMapy}" target="_blank">지도로 보기</a>
                    </c:otherwise>
                </c:choose>
			</div>			

			
			
		</div>
			<div>
				<c:url var="applyUrl" value="/meet/applyMeet/${vo.meetNo}">
					<c:param name="meetNo" value="${vo.meetNo}"/>
				</c:url>
				<a href="${applyUrl}"><button type="button">참가신청</button></a>
			</div>
			<div class="btn-cont ar">
				<c:url var="uptUrl" value="/meet/updateMeet/${vo.meetNo}">
					<c:param name="meetNo" value="${vo.meetNo}"/>
				</c:url>
				<a href="${uptUrl}"><button type="button">수정</button></a>
						
				<c:url var="delUrl" value="/meet/deleteMeet/${vo.meetNo}">
					<c:param name="meetNo" value="${vo.meetNo}"/>
				</c:url>
				<a href="${delUrl}" id="btn-del"><button type="button">삭제</button></a>
						
				<c:url var="listUrl" value="/meet/meetList" />
						<a href="${listUrl}"><button type="button">목록</button></a>
			</div>
			<div>
			<h3>신청자 현황</h3>
			</div>
			<div>
				<table>
					<tr>
						<th>닉네임</th>
						<th>상태</th>
						<th>관리</th>
					</tr>
					<tbody>
						<c:forEach var="item" items="${mvo}">
							<tr>
								<td>${item.memNick}</td>
								<td>${item.mtapplyYn}</td>
								<td><c:url var="uptUrl" value="/mtapply/agreeMtapply/${item.mtapplyNo}">
										<c:param name="mtapplyNo" value="${item.mtapplyNo}"/>
										</c:url>
										<a href="${uptUrl}" id="btn-yes"><button type="button">승낙</button></a>
										<c:url var="delUrl" value="/mtapply/deniedMtapply/${item.mtapplyNo}">
										<c:param name="mtapplyNo" value="${item.mtapplyNo}"/>
										</c:url>
										<a href="${delUrl}" id="btn-del"><button type="button">거절</button></a>
										<c:url var="waitUrl" value="/mtapply/waitMtapply/${item.mtapplyNo}">
										<c:param name="mtapplyNo" value="${item.mtapplyNo}"/>
										</c:url>
										<a href="${waitUrl}"><button type="button">대기</button></a>				
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>		
	</div>	
 

</body>
</html>