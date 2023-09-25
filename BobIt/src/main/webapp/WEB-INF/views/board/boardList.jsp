<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용 게시판</title>
<link href="${path}/css/boardStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script src="/js/bobit.js"></script>
<script src="https://kit.fontawesome.com/7fe498c607.js"
	crossorigin="anonymous"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72764d4407eae4771ae834fbbe85f476"></script>
<style>
* {
	margin: 0 auto;
}

html {
	width: 100vw;
    height: 100vh;
	font-size: 62.5%;
}

body {
	font-size: 1.6rem;
	background: #fffffe;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

#boardPage {
  width : 100%;
  height : auto;
  background-color: white;
}

#boardHeader {
  background-color: orange; /* 원하는 배경색을 선택 */
  height: 20vh; /* 원하는 높이 */
  width: 100%;
  text-align: center;
}

#boardArticle{
  background-color: #FBF8EF;
  height: 90vh;
  width: 90%;
}

#boardFooter{
  background-color: orange;
  height: 20vw;
  width: 100%;
}

#headerTitle{
  position: relative;
  top: 5vh;
  font-weight: bold;
  font-size: 30px;
  color: white;
}

#headerUl{
  list-style: none;
  display: flex;
  justify-content: space-between;
  padding: 0;
  color: white;
  position: relative;
  top: 10vh;
}

#headerLi{
  display: flex;
  justify-content: center;
  margin: 0;
  flex: 1; /* 아이템의 공간을 균등하게 분배 */
}

.headerManuLink{
  color: white; /* 링크 텍스트 색상 설정 */
  text-decoration: none; /* 밑줄 제거 */
}

#insert {
  width: 80%;
  height: 800px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  margin-top: 200px; /* 조정할 여백 값을 설정하세요 */
}

#content{
  width: 400%; /* 원하는 크기로 조정 */
  height:500px;
  margin: 0 auto; /* 가운데 정렬을 위한 설정 */
  display: block; /* 가운데 정렬을 위해 블록 요소로 변경 */
}

#WriteBtn2{
  text-decoration: none; /* 밑줄 제거 */
  color: black; /* 원하는 색상으로 변경 */
  font-weight: bold; /* 글씨체를 굵게 설정 */
  position: relative;
  background-color: orange;
  padding: 15px;
  left: 50%;
  top: 10%;
}

#WriteLink2{
  text-decoration: none; /* 밑줄 제거 */
  color: white; /* 원하는 색상으로 변경 */
  font-weight: bold; /* 글씨체를 굵게 설정 */
}


th, td{
text-align: center;}  

  
td a{
text-decoration: none;
color: black;
text-align: center;
}

</style>
</head>
<body>
	<div id="boardPage">
		<div id="boardHeader">
			<h3 id="headerTitle">테스트용 게시판</h3>
		</div>
		<div id="boardArticle">
			<div id="insert">
				<table class="table table-hover" style="text-align: content;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardNo}</a></td>
								<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardSj}</a></td>
								<td>${vo.memNick}</td>
								<td>${vo.boardDate}</td>
								<td>
									<a href="deleteBoard/${vo.boardNo}" class="btn btn-outline-info">삭제</a> 
									<a href="updateBoard/${vo.boardNo}" class="btn btn-outline-info">수정</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="WriteBtn2" class="btn btn-outline-dark">
					<a id="WriteLink2" href="insertBoard">등록</a>
				</div>
			</div>
		</div>
		<div>
			<div id="boardFooter"></div>
		</div>
	</div>

</body>
</html>