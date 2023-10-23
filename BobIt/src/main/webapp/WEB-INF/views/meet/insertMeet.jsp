<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="/img/favicon.ico" type="image/x-icon">
<title>모임글 작성</title>
<!-- 헤드 부분 인클루드 -->
</head>

<body id="page-top">
	<div id="wrap">
		<header id="header" class="header">
			<jsp:include page="../include/hd.jsp"></jsp:include>
		</header>

		<!-- //aside -->

		<main id="main">
			<aside id="aside">
				<nav class="nav">
					<jsp:include page="../include/nav.jsp"></jsp:include>
				</nav>
				<article id="slider">
					<div class="sliderWrap">
						<div class="board_title">
							<strong>모임글 작성</strong>
						</div>
							<div id="map"></div>
						<div
							style="margin: 10px 0 0 150px; font-weight: 600; font-size: 20px;">
							모임 주소 검색: <input id="addressInput" type="text" style="width: 930px; height: 40px; padding-left: 10px; border-radius: 5px; border: 2px solid #ccc;">
							<button id="searchButton" class="col3 button btn-bd">검색</button>
						</div>
						<div style="display: none;">
							<p>
								마커 위치 (위도): <span id="latitude"></span>
							</p>
							<p>
								마커 위치 (경도): <span id="longitude"></span>
							</p>
						</div>
						<br />
						<div class="board_list_wrap">
							<form method="POST" enctype="multipart/form-data" onsubmit="return regist()">
								<table class="board_list">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead class="inp-no">
										<tr>
											<th>모임명</th>
											<td><input type="text" name="meetSj" id="meetSj" class="col2"></td>
										</tr>
										<tr style="display: none;">
											<th>작성자</th>
											<td><input type="text" name="memNick"
												value="${sessionScope.member.memNick}" class="col2"
												style="background: #eee;" readonly></td>
										</tr>
										<tr class="tr-last">
											<th>내용</th>
											<td><textarea rows=20 cols=147 wrap=off name="meetCn"
													id="meetCn" class="col4"></textarea></td>
										</tr>
										<tr><!--  style="display: none;"> -->
											<th>지역</th>
											<td><input type="text" name="meetArea" id="meetArea"
												class="col2"></td>
										</tr>
										<tr>
											<th>시간</th>
											<td><input type="datetime-local" name="meetTime" id="meetTime" class="col2"></td>
										</tr>
										<tr class="inlineTr">
											<th>메뉴</th>
											<td class="text-l"><select
												name="meetMenu" id="meetMenu">
													<option value="상관없음">상관없음</option>
													<option value="한식">한식</option>
													<option value="중식">중식</option>
													<option value="양식">양식</option>
													<option value="일식">일식</option>
													<option value="분식">분식</option>
													<option value="기타">기타</option>
											</select></td>
										</tr>
										<tr class="inlineTr">
											<th>희망성별</th>
											<td class="text-l"><select
												name="meetFm" id="meetFm">
													<option value="상관없음">상관없음</option>
													<option value="남">남성</option>
													<option value="여">여성</option>
											</select></td>
										</tr>
										<tr class="inlineTr">
											<th>희망연령</th>
											<td class="text-l"><select
												name="meetAge" id="meetAge">
													<option value="상관없음">상관없음</option>
													<option value="1">10대</option>
													<option value="2">20대</option>
													<option value="3">30대</option>
													<option value="4">40대</option>
													<option value="5">50대</option>
													<option value="6">60대</option>
													<option value="7">70대</option>
													<option value="8">80대</option>
											</select></td>
										</tr>
										<tr>
											<th>모집인원</th>
											<td class="text-l"><input
												type="number" name="meetMax" id="meetMax" placeholder="숫자를 입력하세요"
												style="width: 228px; height: 43px; padding-left: 15px;">
											</td>
										</tr>
										<tr>
											<th>이미지 첨부</th>
											<td><input type="file" name="file" style="height: 34px; padding-top: 9px;"></td>
										</tr>
									</thead>
								</table>
							
								</div>
								<div>
									<input type="text" name="meetMapx" id="meetMapx" value="0.0000"
										hidden="true">
								</div>
								<div>
									<input type="text" name="meetMapy" id="meetMapy" value="0.0000"
										hidden="true">
								</div>
								<div class="bt_wrap">
									<a><button class="col3 button btn-bd" type="submit" id="btn-reg">등록</button></a>
									<a href="meetList"><button type="button"
											class="col3 button btn-bd">목록</button></a>
								</div>
							</form>
						</div>
					</div>
				</article>
			</aside>
		</main>
		<!-- //main -->

		<footer id="footer">
			<jsp:include page="../include/ft.jsp"></jsp:include>
		</footer>
		<!-- //footer -->
	</div>
	<!-- //wrap -->
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c6d709ff2a5098858d1434b8ce6cec6&libraries=services"></script>
<script>
    // member.memArea 값 가져와서 주소로 좌표를 설정하는 함수
    function setMapCenterWithMemberArea() {
        var memberArea = "${sessionScope.member.memArea}"; // 세션에서 멤버의 지역 주소 가져오기

        if (memberArea) {
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(memberArea, function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    map.setCenter(coords); // 지도의 중심을 멤버 지역 주소의 좌표로 설정
                    
                    // 초기 위치에 마커 추가
                    addInitialMarker(coords);
                    
                 // meetArea 값을 업데이트
                    document.getElementById("meetArea").value = result[0].address.address_name;
                }
            });
        }
    }

    // 페이지 로딩 시 실행
    window.onload = setMapCenterWithMemberArea;
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
        // 초기 위치에 마커를 추가하는 함수
        function addInitialMarker(coords) {
            // 마커를 해당 위치에 추가합니다
            marker.setPosition(coords);
            marker.setMap(map);

            // 인포윈도우의 위치도 업데이트합니다
            infowindow.setPosition(coords);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);

            // 초기 위치의 위도와 경도 값을 업데이트
            document.getElementById("latitude").textContent = coords.getLat().toFixed(4);
            document.getElementById("longitude").textContent = coords.getLng().toFixed(4);
        }
        
        
        // 검색 버튼 클릭 시 주소 검색 함수 실행
        document.getElementById("searchButton").addEventListener("click", searchAddress);

        function regist(){
        	if($("#meetSj").val() === ""){
        	alert("모임명을 입력해주세요.");
        	$("#meetSj").focus();
        	return false;
        	}
        	if($("#meetCn").val() === ""){
        	alert("내용을 입력해주세요.");
        	$("#meetCn").focus();
        	return false;
        	}
        	if($("#meetTime").val() === ""){
        	alert("시간을 정해주세요.");
        	$("#meetTime").focus();
        	return false;
        	}
        	if($("#meetMax").val() === ""){
        	alert("모집인원을 입력하세요.");
        	$("#meetMax").focus();
        	return false;
        	}
        	}
        	$(document).ready(function() {
        	//게시 글 수정
        	$("#btn-reg").click(function() {
        	if(!confirm("등록하시겠습니까?")) {
        	return false;
        	}
        	});
        	});

    </script>



</html>