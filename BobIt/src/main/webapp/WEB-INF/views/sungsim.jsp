<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>성심당 본점 지도</title>
</head>
<body class="back-ye">
    <div id="map" style="width:800px;height:600px;"></div>
    <div>
        주소로 검색: <input id="addressInput" type="text">
        <button id="searchButton">검색</button>
    </div>
    <div>
        X값 : <input id="Xvalue" type="text">
        Y값 : <input id="Yvalue" type="text"> 
        <button id="updateButton">Update</button>
    </div>
    <div>
        <p>현재 X값 : <span id="currentX"></span></p>
        <p>현재 Y값 : <span id="currentY"></span></p>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c6d709ff2a5098858d1434b8ce6cec6"></script>
    <script>
        // 기본 좌표 값
        let element1 = 36.327;
        let element2 = 127.427;

        // 페이지 로드 시 좌표를 입력란에 표시
        document.getElementById("Xvalue").value = element1;
        document.getElementById("Yvalue").value = element2;

        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(element1, element2), 
            level: 3
        };
        var map = new kakao.maps.Map(container, options);
      
        // 마커가 표시될 위치입니다 
        var markerPosition  = new kakao.maps.LatLng(element1, element2);
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 버튼 클릭 시 좌표 값을 변경하고 지도를 다시 초기화
        document.getElementById("updateButton").addEventListener("click", function() {
            element1 = parseFloat(document.getElementById("Xvalue").value);
            element2 = parseFloat(document.getElementById("Yvalue").value);
            
            // 마커 위치 업데이트
            var newMarkerPosition = new kakao.maps.LatLng(element1, element2);
            marker.setPosition(newMarkerPosition);
            marker.setDraggable(true); 
            
            // 지도 중심 업데이트
            var newCenter = new kakao.maps.LatLng(element1, element2);
            map.setCenter(newCenter);

            document.getElementById("currentX").textContent = element1.toFixed(4);
            document.getElementById("currentY").textContent = element2.toFixed(4);
        });

        // 마커 드래그 이벤트 리스너 추가
        kakao.maps.event.addListener(marker, 'dragend', function () {
            var newPosition = marker.getPosition();
            document.getElementById("Xvalue").value = newPosition.getLat().toFixed(4);
            document.getElementById("Yvalue").value = newPosition.getLng().toFixed(4);

            document.getElementById("currentX").textContent = newPosition.getLat().toFixed(4);
            document.getElementById("currentY").textContent = newPosition.getLng().toFixed(4);
        });

        // 주소 검색 기능 추가
        document.getElementById("searchButton").addEventListener("click", function() {
            var address = document.getElementById("addressInput").value;
            
            // 주소로 좌표를 검색합니다
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    
                    marker.setPosition(coords);
                    map.setCenter(coords);

                    document.getElementById("Xvalue").value = coords.getLat().toFixed(4);
                    document.getElementById("Yvalue").value = coords.getLng().toFixed(4);

                    document.getElementById("currentX").textContent = coords.getLat().toFixed(4);
                    document.getElementById("currentY").textContent = coords.getLng().toFixed(4);
                } else {
                    alert('주소 검색 실패');
                }
            });
        });

        // 페이지 로드 시 초기 지도 표시
        marker.setMap(map);
        marker.setDraggable(true); 
    </script>
</body>
</html>