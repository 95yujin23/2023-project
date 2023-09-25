<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
	width: 100vw;
	height: 100vh;
	font-size: 62.5%;
	margin: auto;
}

body {
	font-size: 1.6rem;
	background: #fffffe;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

#boardPage {
	width: 100%;
	height: auto;
}

#reportpage-board {
	width: 100%;
	height: 200px;
	margin: auto;
}

#aside {
	width: 100%;
	height: 150px;
}

#inmenu {
	background-color: orange;
	height: 15vh;
}

#headerTitle {
	position: relative;
	top: 5vh;
	font-weight: bold;
	font-size: 30pt;
	color: white;
	text-align: center;
}

#reportarticle {
	width: 100%;
	margin: 0 auto;
	margin-top: 20px;
	text-align: center;
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
	width: 70vw;
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
	margin-left: 20px;
	position: absolute;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<div id="boardPage">
		<div id="reportpage-board">
			<div id="aside">
				<div id="inmenu">
					<h3 id="headerTitle">게시글 작성</h3>
				</div>
			</div>
			<div id="reportarticle">
				<form method="post">
					<div>

						<div>
							<label class="col1">제목 : </label> <input type="text"
								name="boardSj" class="col2">
						</div>

						<div>
							<label class="col1">작성자 : </label> <input type="text"
								name="memNick" class="col2">
						</div>

						<div>
							<label class="col1">내용 : </label> <input type="text"
								name="boardCn" class="col2">
						</div>

						<div class="submitBt">
							<button class="col3">등록</button>
							<a href="boardList"><button type="button" class="col3">목록</button></a>
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>