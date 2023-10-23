<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임글 변경</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>모임글 변경</h2>
	</div>
	<form method="post">
<div>
	<div>
		<label>모임번호 : </label>
		<input type="number" name="meetNo" value="${vo.meetNo}" readonly>
	</div>

	<div>
		<label>모임제목 : </label>
		<input type="text" name="meetSj" value="${vo.meetSj}">
	</div>

	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick" value="${vo.memNick}" readonly>
	</div>

	<div>
		<label>모임내용 : </label>
		<input type="text" name="meetCn" value="${vo.meetCn}">
	</div>

	<div>
		<label>모임지역 : </label>
		<input type="text" name="meetArea" value="${vo.meetArea}" readonly>
	</div>

	 <div>
        <label>메뉴 : </label>
        <select name="meetMenu">
        	<option value="X" ${vo.meetMenu== '0' ? 'selected' : ''}>상관없음</option>
        	<option value="한식" ${vo.meetMenu== '한식' ? 'selected' : ''}>한식</option>
        	<option value="중식" ${vo.meetMenu== '중식' ? 'selected' : ''}>중식</option>
        	<option value="양식" ${vo.meetMenu== '양식' ? 'selected' : ''}>양식</option>
        	<option value="일식" ${vo.meetMenu== '일식' ? 'selected' : ''}>일식</option>
        	<option value="분식" ${vo.meetMenu== '분식' ? 'selected' : ''}>분식</option>
        	<option value="그외" ${vo.meetMenu== '그외' ? 'selected' : ''}>그 외</option>
        </select>
    </div>

	<div>
        <label>희망성별 : </label>
        	<select name="meetFm" >
        		<option value="0" ${vo.meetFm== '0' ? 'selected' : ''}>상관없음</option>
        		<option value="남" ${vo.meetFm== '남' ? 'selected' : ''}>남성</option>
        		<option value="여" ${vo.meetFm== '여' ? 'selected' : ''}>여성</option>
        	</select>
    </div>

	<div>
		<label>연령대 : </label>
		<select name="meetAge">
			<option value="X" ${vo.meetAge== 'X' ? 'selected' : ''}>상관없음</option>
        	<option value="1" ${vo.meetAge== '1' ? 'selected' : ''}>10대</option>
        	<option value="2" ${vo.meetAge== '2' ? 'selected' : ''}>20대</option>
        	<option value="3" ${vo.meetAge== '3' ? 'selected' : ''}>30대</option>
        	<option value="4" ${vo.meetAge== '4' ? 'selected' : ''}>40대</option>
        	<option value="5" ${vo.meetAge== '5' ? 'selected' : ''}>50대</option>
        	<option value="6" ${vo.meetAge== '6' ? 'selected' : ''}>60대</option>
        	<option value="7" ${vo.meetAge== '7' ? 'selected' : ''}>70대</option>
        	<option value="8" ${vo.meetAge== '8' ? 'selected' : ''}>80대</option>
		</select>
	</div>

	<div>
		<label>모임인원 : </label>
		<input type="number" name="meetMax" value="${vo.meetMax}">
	</div>

	<div>
		<button>변경</button>
		<a href="../boardList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
</body>
</html>