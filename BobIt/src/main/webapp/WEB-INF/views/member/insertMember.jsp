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
<title>회원추가</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
							<strong>회원추가</strong>
						</div>
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
									</colgroup>
									<thead class="inp-no">
										<tr>
											<th>닉네임</th>
											<td><input type="text" name="memNick" id="memNick" class="col2"></td>
										</tr>
										<tr>
											<th>아이디</th>
											<td><input type="text" name="memId" id="memId" class="col2"></td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td><input type="text" name="memPwd" id="memPwd" class="col2"></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="text" name="memMail" id="memMail" class="col2"></td>
										</tr>
										<tr>
											<th>성별(남,여)</th>
											<td><select name="memFm" id="memFm">
													<option value="0">성별을 선택하세요</option>
													<option value="남">남성</option>
													<option value="여">여성</option>
											</select></td>
										</tr>
										<tr>
											<th>나이</th>
											<td><input type="text" name="memAge" id="memAge" class="col2"></td>
										</tr>
										<tr>
											<th>지역</th>
											<td><select name="sido1" id="sido1"><option value="1">시/도 선택</option></select> <select
												name="gugun1" id="gugun1"></select> <input type="text"
												name="memArea" style="display: none;"></td>
										</tr>
								</table>


								<div class="bt_wrap">
									<a><button class="col3 button btn-bd" type="submit" id="btn-reg">등록</button></a>
									<a href="../member/memberList"><button type="button"
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
<script>
	$('document')
			.ready(
					function() {
						var area0 = [ "서울", "인천", "대전", "광주", "대구",
								"울산", "부산", "경기", "강원", "충북", "충남", "전북", "전남",
								"경북", "경남", "제주특별자치도", "세종특별자치시" ];
						var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
								"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
								"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구",
								"양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
						var area2 = [ "계양구", "남구", "남동구", "동구", "부평구", "서구",
								"연수구", "중구", "강화군", "옹진군" ];
						var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
						var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
						var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
								"중구", "달성군" ];
						var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
						var area7 = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구",
								"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
								"중구", "해운대구", "기장군" ];
						var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
								"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
								"시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
								"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
								"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
						var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
								"태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
								"정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
						var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
								"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
						var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시",
								"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
								"연기군", "예산군", "청양군", "태안군", "홍성군" ];
						var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시",
								"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
								"임실군", "장수군", "진안군" ];
						var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시",
								"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
								"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
								"장흥군", "진도군", "함평군", "해남군", "화순군" ];
						var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시",
								"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
								"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
								"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
						var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시",
								"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
								"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
								"함안군", "함양군", "합천군" ];
						var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];
						var area17 = [ "세종" ];

						// 시/도 선택 박스 초기화

						$("select[name^=sido]")
								.each(
										function() {
											$selsido = $(this);
											$
													.each(
															eval(area0),
															function() {
																$selsido
																		.append("<option value='"+this+"'>"
																				+ this
																				+ "</option>");
															});
											$selsido
													.next()
													.append(
															"<option value=''>구/군 선택</option>");
										});

						// 시/도 선택시 구/군 설정

						$("select[name^=sido]")
								.change(
										function() {
											var area = "area"
													+ $("option", $(this))
															.index(
																	$(
																			"option:selected",
																			$(this))); // 선택지역의 구군 Array
											var $gugun = $(this).next(); // 선택영역 군구 객체
											$("option", $gugun).remove(); // 구군 초기화

											if (area == "area0")
												$gugun
														.append("<option value=''>구/군 선택</option>");
											else {
												$
														.each(
																eval(area),
																function() {
																	$gugun
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
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
							var selectedSido = $("option:selected",
									$("select[name=sido1]")).text();
							var selectedGugun = $("option:selected",
									$("select[name=gugun1]")).text();
							var memAreaField = $("input[name=memArea]");

							if (selectedSido !== "시/도 선택"
									&& selectedGugun !== "구/군 선택") {
								memAreaField.val(selectedSido + " "
										+ selectedGugun);
							} else {
								memAreaField.val(""); // 선택이 초기 값인 경우 지역 값을 비움
							}
						}
					});
	function regist(){
		if($("#memNick").val() === ""){
		alert("닉네임을 입력해주세요.");
		$("#memNick").focus();
		return false;
		}
		if($("#memId").val() === ""){
		alert("아이디를 입력해주세요.");
		$("#memId").focus();
		return false;
		}
		if($("#memPwd").val() === ""){
		alert("비밀번호 입력해주세요.");
		$("#memPwd").focus();
		return false;
		}
		if($("#memMail").val() === ""){
		alert("이메일을 입력해주세요.");
		$("#memMail").focus();
		return false;
		}
		if($("#memFm").val() === "0"){
		alert("성별을 선택해주세요.");
		$("#memFm").focus();
		return false;
		}
		if($("#memAge").val() === ""){
		alert("나이를 입력해주세요.");
		$("#memAge").focus();
		return false;
		}
		if($("#sido1").val() === "1"){
		alert("지역을 선택해주세요.");
		$("#sido1").focus();
		return false;
		}

		}
		$(document).ready(function() {
		//회원 가입
		$("#btn-reg").click(function() {
		if(!confirm("등록하시겠습니까?")) {
		return false;
		}
		});

		});
</script>
</html>