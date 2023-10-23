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
<title>모임글 변경</title>
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
							<strong>모임글 변경</strong>
						</div>

						<div class="board_list_wrap">
							<%-- <div class="board_profile">
								<img src="/profileimg/${vo.memImg}" alt="user-icon"
									style="border-radius: 30px; width: 400px; height: 300px;">
							</div> --%>
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
									</colgroup>
									<thead class="inp-no">

										<tr>
											<th>모임번호</th>
											<td><input type="number" name="meetNo"
												value="${vo.meetNo}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>모임명</th>
											<td><input type="text" name="meetSj" id="meetSj"
												value="${vo.meetSj}" class="col2"></td>
										</tr>
										<tr style="display: none;">
											<th>작성자</th>
											<td><input type="text" name="memNick"
												value="${sessionScope.member.memNick}" class="col2"
												style="background: #eee;" readonly></td>
										</tr>
										<tr class="tr-last">
											<th>모임내용</th>
											<%-- <td><input type="text" name="meetCn"
												value="${vo.meetCn}" class="col4"></td> --%>
											<td><textarea rows=20 cols=147 wrap=off name="meetCn" id="meetCn"
													id="meetCn" class="col4">${vo.meetCn}</textarea></td>
										</tr>
										<tr style="display: none;">
											<th>모임지역</th>
											<td><input type="text" name="meetArea"
												value="${vo.meetArea}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>시간</th>
											<td><input type="datetime-local" name="meetTime" id="meetTime"
												id="meetTime" class="col2" value="${vo.meetTime}"></td>
										</tr>
										<tr class="inlineTr">
											<th>메뉴</th>
											<td class="text-l"><select name="meetMenu" id="meetMenu">
													<option value="X" ${vo.meetMenu== '0' ? 'selected' : ''}>상관없음</option>
													<option value="한식" ${vo.meetMenu== '한식' ? 'selected' : ''}>한식</option>
													<option value="중식" ${vo.meetMenu== '중식' ? 'selected' : ''}>중식</option>
													<option value="양식" ${vo.meetMenu== '양식' ? 'selected' : ''}>양식</option>
													<option value="일식" ${vo.meetMenu== '일식' ? 'selected' : ''}>일식</option>
													<option value="분식" ${vo.meetMenu== '분식' ? 'selected' : ''}>분식</option>
													<option value="그외" ${vo.meetMenu== '그외' ? 'selected' : ''}>그
														외</option>
											</select></td>
										</tr>
										<tr class="inlineTr">
											<th>희망성별</th>
											<td class="text-l"><select name="meetFm">
													<option value="0" ${vo.meetFm== '0' ? 'selected' : ''}>상관없음</option>
													<option value="남" ${vo.meetFm== '남' ? 'selected' : ''}>남성</option>
													<option value="여" ${vo.meetFm== '여' ? 'selected' : ''}>여성</option>
											</select></td>
										</tr>
										<tr class="inlineTr">
											<th>희망연령</th>
											<td class="text-l"><select name="meetAge">
													<option value="상관없음" ${vo.meetAge== 'X' ? 'selected' : ''}>상관없음</option>
													<option value="1" ${vo.meetAge== '1' ? 'selected' : ''}>10대</option>
													<option value="2" ${vo.meetAge== '2' ? 'selected' : ''}>20대</option>
													<option value="3" ${vo.meetAge== '3' ? 'selected' : ''}>30대</option>
													<option value="4" ${vo.meetAge== '4' ? 'selected' : ''}>40대</option>
													<option value="5" ${vo.meetAge== '5' ? 'selected' : ''}>50대</option>
													<option value="6" ${vo.meetAge== '6' ? 'selected' : ''}>60대</option>
													<option value="7" ${vo.meetAge== '7' ? 'selected' : ''}>70대</option>
													<option value="8" ${vo.meetAge== '8' ? 'selected' : ''}>80대</option>
											</select></td>
										</tr>
										<tr>
											<th>모집인원</th>
											<td class="text-l"><input type="number" name="meetMax" id="meetMax"
												value="${vo.meetMax}"
												style="width: 228px; height: 43px; padding-left: 15px;"></td>
										</tr>
								</table>

								<div class="bt_wrap">
									<a><button class="col3 button btn-bd" type="submit" id="btn-submit">변경</button></a>
									<a href="../meetList"><button type="button"
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
	<script>
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

if($("#meetMax").val() === ""){
alert("모집인원을 입력하세요.");
$("#meetMax").focus();
return false;
}
}
$(document).ready(function() {
//게시 글 수정
$("#btn-submit").click(function() {
if(!confirm("변경하시겠습니까?")) {
return false;
}
});
});
</script>
</body>
</html>