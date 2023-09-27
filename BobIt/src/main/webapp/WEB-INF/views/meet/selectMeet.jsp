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
					<dt>최대인원</dt>
					<dd><c:out value="${vo.meetMax}"/></dd>
				</dl>
				
				<dl>
					<dt>내용</dt>
					<dd><c:out value="${vo.meetCn}" escapeXml="false"/></dd>
				</dl>
				
			</div>
			
			<div id="map" style="width: 400px; height: 300px;"></div>
			
			
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
						
				<c:url var="listUrl" value="/board/boardList" />
						<a href="${listUrl}"><button type="button">목록</button></a>
			</div>
		</div>		
	</div>	
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c6d709ff2a5098858d1434b8ce6cec6&libraries=services"></script>
    <script>
        // 장소의 경도와 위도 값을 가져옵니다.
        var meetMapx = ${vo.meetMapx}; // 이 값은 서버에서 가져와야 합니다.
        var meetMapy = ${vo.meetMapy}; // 이 값은 서버에서 가져와야 합니다.

        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        var mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
        var map = new kakao.maps.Map(container, options);
    });
    

    
</script>

</body>
</html>