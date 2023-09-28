<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- meetMapx와 meetMapy를 선언합니다. --%>
<%
    double meetMapx = 0.0; // 초기값을 설정하세요.
    double meetMapy = 0.0; // 초기값을 설정하세요.
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 맵</title>
    <script src="https://code.jquery.com/jquery-Latest.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&libraries=services"></script>
</head>
<body>
    <div id="map" style="width: 100%; height: 600px;"></div>
    <script>
	    var meetMapx = <%= meetMapx %>; // Java에서 가져온 meetMapx 값을 할당
    	var meetMapy = <%= meetMapy %>; // Java에서 가져온 meetMapy 값을 할당
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(<%= meetMapy %>, <%= meetMapx %>), // 서버에서 받은 위도와 경도를 사용합니다.
            level: 3
        };
        var map = new kakao.maps.Map(mapContainer, mapOption);
    </script>
</body>
</html>