<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
    <div id="map" style="width:600px; height:450px;"></div>

    <div>
        모임 주소 검색: <input id="addressInput" type="text">
        <button id="searchButton">검색</button>
    </div>
    <div style="display: none;">
        <p>마커 위치 (위도): <span id="latitude"></span></p>
        <p>마커 위치 (경도): <span id="longitude"></span></p>
    </div>
    <br/>
    <form method="post">    
    <div>
        <label>모임명 : </label>
        <input type="text" name="meetSj">
    </div>
    
    <div style="display: none;">
        <label>작성자 : </label>
        <input type="text" name="memNick" value="${sessionScope.member.memNick}" readonly>
    </div>
    
    <div>
        <label>모임내용 : </label>
        <input type="text" name="meetCn">
    </div>
    
    <div style="display: none;">
        <label>지역 : </label>
        <input type="text" name="meetArea" id="meetArea">
    </div>
    
    <div>
        <label>메뉴 : </label>
        <select name="meetMenu">
        	<option value="상관없음">상관없음</option>
        	<option value="한식">한식</option>
        	<option value="중식">중식</option>
        	<option value="양식">양식</option>
        	<option value="일식">일식</option>
        	<option value="분식">분식</option>
        	<option value="그외">그 외</option>
        </select>
    </div>
    
    <div>
        <label>희망성별 : </label>
        	<select name="meetFm">
        		<option value="상관없음">상관없음</option>
        		<option value="남">남성</option>
        		<option value="여">여성</option>
        	</select>
    </div>
    
    <div>
        <label>희망연령 : </label>
        <select name="meetAge">
        	<option value="상관없음">상관없음</option>
        	<option value="1">10대</option>
        	<option value="2">20대</option>
        	<option value="3">30대</option>
        	<option value="4">40대</option>
        	<option value="5">50대</option>
        	<option value="6">60대</option>
        	<option value="7">70대</option>
        	<option value="8">80대</option>
        </select>
        	
    </div>
    
    <div>
        <label>모집인원 : </label>
        <input type="number" name="meetMax">
    </div>
    
     <div>
            <input type="text" name="meetMapx" id="meetMapx" value="0.0000" hidden="true">
        </div>
        
        <div>
            <input type="text" name="meetMapy" id="meetMapy" value="0.0000" hidden="true">
        </div>
        <br/>
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
        
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
        });

        // 마커 드래그 이벤트 리스너 추가
        kakao.maps.event.addListener(marker, 'dragend', function () {
            var newPosition = marker.getPosition();
            var latitude = newPosition.getLat();
            var longitude = newPosition.getLng();

            // 마커 위치의 위도와 경도 값을 업데이트
            document.getElementById("latitude").textContent = latitude.toFixed(4);
            document.getElementById("longitude").textContent = longitude.toFixed(4);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 좌표로 주소를 검색합니다
            geocoder.coord2Address(longitude, latitude, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var address = result[0].address.address_name;
                    document.getElementById("meetArea").value = address;
                    
                    // 인포윈도우에 주소를 표시합니다
                    infowindow.setContent('<div style="width:200px;text-align:center;padding:6px 0;">' + address + '</div>');
                    infowindow.open(map, marker);
                }
            });

            // 모임 정보를 입력하는 부분의 meetMapx와 meetMapy 필드에 위도와 경도 값을 넣습니다
            document.getElementById("meetMapx").value = latitude.toFixed(4);
            document.getElementById("meetMapy").value = longitude.toFixed(4);
            
            // 인포윈도우의 위치를 업데이트합니다
            infowindow.setPosition(newPosition);
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

                    // 인포윈도우의 위치도 업데이트합니다
                    infowindow.setPosition(coords);

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                     infowindow.setContent('<div style="width:200px;text-align:center;padding:6px 0;">' + address + '</div>');
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                    
                    // 검색된 주소를 모임 지역 필드에 자동으로 입력
                    document.getElementById("meetArea").value = result[0].address.address_name;
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