<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script src="/js/bobit.js"></script>
<script src="https://kit.fontawesome.com/7fe498c607.js"
	crossorigin="anonymous"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72764d4407eae4771ae834fbbe85f476"></script>
<link href='https://unpkg.com/css.gg@2.0.0/icons/css/youtube.css'
	rel='stylesheet'>
<link href='https://unpkg.com/css.gg@2.0.0/icons/css/instagram.css'
	rel='stylesheet'>
<link href='https://unpkg.com/css.gg@2.0.0/icons/css/facebook.css'
	rel='stylesheet'>
<style>
* {
	margin: 0 auto;
}

html {
	width: 100%;
	height: 100%;
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
	width: 100%;
	height: auto;
	background-color: white;
}

#boardHeader {
	background-color: orange; /* 원하는 배경색을 선택 */
	height: 15vh; /* 원하는 높이 */
	width: 100%;
	text-align: center;
}

#boardArticle {
	background-color: #FBF8EF;
	height: 80vh;
	width: 100%;
}

#boardFooter {
	background-color: orange;
	height: 17vw;
	width: 100%;
}

#headerTitle {
	position: relative;
	top: 5vh;
	font-weight: bold;
	font-size: 30px;
	color: white;
}

#headerUl {
	list-style: none;
	display: flex;
	justify-content: space-between;
	padding: 0;
	color: white;
	position: relative;
	top: 10vh;
}

#headerLi {
	display: flex;
	justify-content: center;
	margin: 0;
	flex: 1; /* 아이템의 공간을 균등하게 분배 */
}

.headerManuLink {
	color: white; /* 링크 텍스트 색상 설정 */
	text-decoration: none; /* 밑줄 제거 */
}

#insert {
	width: 100%;
	height: 1000px;
}

#WriteBtn2 {
	text-decoration: none; /* 밑줄 제거 */
	color: black; /* 원하는 색상으로 변경 */
	font-weight: bold; /* 글씨체를 굵게 설정 */
	position: relative;
	background-color: orange;
	padding: 15px;
	left: 50%;
	top: 10%;
}

#WriteLink2 {
	text-decoration: none; /* 밑줄 제거 */
	color: white; /* 원하는 색상으로 변경 */
	font-weight: bold; /* 글씨체를 굵게 설정 */
}

th, td {
	text-align: center;
}

td a {
	text-decoration: none;
	color: black;
	text-align: center;
}

#m1first {
	width: 120px;
	height: 100px;
	border: 2px dotted orange;
	border-bottom: none;
	padding-bottom: 10px;
	padding-left: 0;
	list-style: none;
	text-align: center;
}

#m1first:nth-child(3) {
	border-bottom: 2px dotted orange;
}

.in-l {
	float: left;
	width: 12%;
	height: 800px;
	text-align: center;
	background-color: orange;
}

.in-r {
	float: left;
	width: 88%;
	margin: 25px 0 1px 0;
	height: 800px;
}

#m-link {
	text-decoration: none;
	line-height: 2rem;
	color: black;
	padding: 10px;
}

#menu {
	margin-top: 20px;
}

.col1 {
	background-color: #faf9f4;
	padding: 20px;
	width: 11vw;
	text-align: left;
	font-weight: bold;
	font-size: 0.8em;
	text-align: center;
	margin: 5px;
	margin-top: 30px;
}

.col2 {
	width: 800px;
	text-align: left;
	padding: 15px 0;
	font-size: 1em;
}

.col3 {
	background-color: orange;
	padding: 10px;
	width: 11vw;
	text-align: left;
	font-weight: bold;
	font-size: 0.8em;
	text-align: center;
	margin: 5px;
	margin-top: 50px;
}

.submitBt {
	margin-top: 30px;
	margin-left: 70px;
	/* position: absolute;
	left: 50%;
	transform: translate(-50%, -50%); */
}
</style>
</head>
<body>
	<div id="boardPage">
		<div id="boardHeader">
			<h3 id="headerTitle">게시판 수정</h3>
		</div>
		<div id="boardArticle">
			<div id="insert">
				<nav class="in-l">
					<ul id="menu">
						<li id="m1first"><a href="/" id="m-link">공지사항</a></li>
						<li id="m1first"><a href="/" id="m-link">매칭 게시판</a></li>
						<li id="m1first"><a href="/" id="m-link">신고 게시판</a></li>
					</ul>
				</nav>
				<div class="in-r" style="text-align: center;">
					<div>
							<label class="col1">글번호 : </label> <input class="col2"
								type="number" name="boardNo" value="${vo.boardNo}" readonly>
						</div>

						<div>
							<label class="col1">제목 : </label> <input class="col2" type="text"
								name="boardSj" value="${vo.boardSj}">
						</div>

						<div>
							<label class="col1">작성자 : </label> <input class="col2"
								type="text" name="memNick" value="${vo.memNick}" readonly>
						</div>

						<div>
							<label class="col1">내용 : </label> <input class="col2" type="text"
								name="boardCn" value="${vo.boardCn}">
						</div>

						<div class="submitBt">
							<button class="col3">변경</button>
							<a href="../boardList"><button type="button" class="col3">목록</button></a>
						</div>
				</div>

			</div>
		</div>
	</div>
	<div>
		<div id="boardFooter"></div>
	</div>

</body>
</html>