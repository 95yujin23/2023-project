<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
</head>
<body>
    <p style="margin-top:-12px">
       
    </p>
    
    <div id="map" style="width:800;height:600px;"></div>

	<div>
        주소 입력: <input id="addressInput" type="text">
        <button id="searchButton">검색</button>
    </div>
    <div>
        <p>마커 위치 (위도): <span id="latitude"></span></p>
        <p>마커 위치 (경도): <span id="longitude"></span></p>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c6d709ff2a5098858d1434b8ce6cec6&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        var mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            draggable: true // 마커를 드래그 가능하게 설정
        });

        // 마커 드래그 이벤트 리스너 추가
        kakao.maps.event.addListener(marker, 'dragend', function () {
            var newPosition = marker.getPosition();
            var latitude = newPosition.getLat();
            var longitude = newPosition.getLng();

            // 마커 위치의 위도와 경도 값을 업데이트
            document.getElementById("latitude").textContent = latitude.toFixed(6);
            document.getElementById("longitude").textContent = longitude.toFixed(6);
        });

        // 주소 검색 함수
        function searchAddress() {
            var address = document.getElementById("addressInput").value;

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(address, function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 마커를 해당 위치로 이동합니다
                    marker.setPosition(coords);

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } else {
                    alert('주소 검색 실패');
                }
            });    
        }

        // 검색 버튼 클릭 시 주소 검색 함수 실행
        document.getElementById("searchButton").addEventListener("click", searchAddress);
    </script>
</body>
</html>