	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
	<!DOCTYPE html>
	<html>
	<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>모집 게시판</title>
	</head>
	<body>
		<div>
			<h2>모집 게시판</h2>
		</div>
		<div>
			<form>
				<div>
				<select name="sido1" id="sido1"></select>
				<select name="gugun1" id="gugun1"></select>
				<input type="text" name="keyword" value="${pager.keyword}">
				<select name="searchmenu">
					<option value="0">메뉴선택</option>
					<option value="1" ${pager.searchmenu == 1 ? "selected" : "" }>한식</option>
					<option value="2" ${pager.searchmenu == 2 ? "selected" : "" }>중식</option>
					<option value="3" ${pager.searchmenu == 3 ? "selected" : "" }>양식</option>
					<option value="4" ${pager.searchmenu == 4 ? "selected" : "" }>일식</option>
					<option value="5" ${pager.searchmenu == 5 ? "selected" : "" }>분식</option>
					<option value="6" ${pager.searchmenu == 6 ? "selected" : "" }>기타</option>
				</select>
				<select name="searchfm">
					<option value="0">희망성별</option>
					<option value="1" ${pager.searchfm == 1 ? "selected" : "" }>여성</option>
					<option value="2" ${pager.searchfm == 2 ? "selected" : "" }>남성</option>
				</select>
				<select name="searchage">
					<option value="0">희망연령</option>
					<option value="1" ${pager.searchage == 1 ? "selected" : "" }>10대</option>
					<option value="2" ${pager.searchage == 2 ? "selected" : "" }>20대</option>
					<option value="3" ${pager.searchage == 3 ? "selected" : "" }>30대</option>
					<option value="4" ${pager.searchage == 4 ? "selected" : "" }>40대</option>
					<option value="5" ${pager.searchage == 5 ? "selected" : "" }>50대</option>
					<option value="6" ${pager.searchage == 6 ? "selected" : "" }>60대</option>
					<option value="7" ${pager.searchage == 7 ? "selected" : "" }>70대</option>
					<option value="8" ${pager.searchage == 8 ? "selected" : "" }>80대</option>
				</select>
				<button>검색</button></div>
				
			</form>
		</div>
		
		<div>
			<table>
				<tr>
					<th>모임번호</th>
					<th>모임제목</th>
					<th>작성자</th>
					<th>모임시간</th>
					<th>지역</th>
					<th>메뉴</th>
					<th>성별</th>
					<th>연령대</th>
					<th>인원</th>
					<th>신청자수</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
					<tbody>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td><a href="/meet/selectMeet/${vo.meetNo}">${vo.meetNo}</a></td>
								<td><a href="/meet/selectMeet/${vo.meetNo}">${vo.meetSj}</a></td>
								<td>${vo.memNick}</td>
								<td><fmt:formatDate value="${vo.meetTime}" pattern="(yyyy-MM-dd) hh:mm"/></td>
								<td>${vo.meetArea}</td>
								<td>${vo.meetMenu}</td>
								<td>${vo.meetFm}</td>
								<td>${vo.meetAge}</td>
								<td>${vo.meetNow} / ${vo.meetMax}</td>
								<td>${vo.meetReq}</td>
								<td>${vo.meetStts}</td>
								<td><a href="deleteMeet/${vo.meetNo}">삭제</a>
										<a href="updateMeet/${vo.meetNo}">수정</a>
										<a href="../mtapply/insertMtapply/${vo.meetNo}">신청(작업중)</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
		</div>
		<div>
			<a href="insertMeet">등록</a>
		</div>
<script>
$('document').ready(function() {
	 var area0 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주특별자치도", "세종특별자치시"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	   var area17 = ["세종"];

	 

	 // 시/도 선택 박스 초기화

	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });

	 

	 // 시/도 선택시 구/군 설정

	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
	 // 시/도와 구/군 선택이 변경될 때 memArea 업데이트
	    $("select[name^=sido]").change(function() {
	        updateMemArea();
	    });

	    $("select[name^=gugun]").change(function() {
	        updateMemArea();
	    });

	    function updateMemArea() {
	        var selectedSido = $("option:selected", $("select[name=sido1]")).text();
	        var selectedGugun = $("option:selected", $("select[name=gugun1]")).text();
	        var memAreaField = $("input[name=keyword]");

	        if (selectedSido !== "시/도 선택" && selectedGugun !== "구/군 선택") {
	            memAreaField.val(selectedSido + " " + selectedGugun);
	        } else {
	            memAreaField.val(""); // 선택이 초기 값인 경우 지역 값을 비움
	        }
	    }
	});
</script>
	</body>
	</html>