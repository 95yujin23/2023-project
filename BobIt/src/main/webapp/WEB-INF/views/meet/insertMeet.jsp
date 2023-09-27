<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임글 작성</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>모임글 작성</h2>
	</div>
	<div id="map" style="width:400;height:300px;"></div>

    <div>
        주소 입력: <input id="addressInput" type="text">
        <button id="searchButton">검색</button>
    </div>
    <div>
        <p>마커 위치 (위도): <span id="latitude"></span></p>
        <p>마커 위치 (경도): <span id="longitude"></span></p>
    </div>
	
	<form method="post">
	
	<div>
		<label>모임명 : </label>
		<input type="text" name="meetSj">
	</div>
	
	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick">
	</div>
	
	<div>
		<label>모임내용 : </label>
		<input type="text" name="meetCn">
	</div>
	
	<div>
		<label>지역 : </label>
		<input type="text" name="meetArea">
	</div>
	
	<div>
		<label>메뉴 : </label>
		<input type="text" name="meetMenu">
	</div>
	
	<div>
		<label>성별 : </label>
		<input type="text" name="meetFm">
	</div>
	
	<div>
		<label>연령 : </label>
		<input type="text" name="meetAge">
	</div>
	
	<div>
		<label>모집인원 : </label>
		<input type="text" name="meetMax">
	</div>
	
	 <div>
            <label>모임장소위도 : </label>
            <input type="text" name="meetMapx" id="meetMapx">
        </div>
        
        <div>
            <label>모임장소경도 : </label>
            <input type="text" name="meetMapy" id="meetMapy">
        </div>
        
        <div>
            <button type="submit">등록</button>
            <a href="boardList"><button type="button">목록</button></a>
        </div>
    </form>
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
            document.getElementById("latitude").textContent = latitude.toFixed(4);
            document.getElementById("longitude").textContent = longitude.toFixed(4);

            // 모임 정보를 입력하는 부분의 meetMapx와 meetMapy 필드에 위도와 경도 값을 넣습니다
            document.getElementById("meetMapx").value = latitude.toFixed(4);
            document.getElementById("meetMapy").value = longitude.toFixed(4);
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