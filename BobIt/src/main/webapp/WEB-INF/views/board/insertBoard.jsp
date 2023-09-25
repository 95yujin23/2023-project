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
	#reportpage-board{
	
	}
	</style>
</head>
<body>
	<div id="reportpage-board">
		<div id="aside">
			<div id="inmenu">
				<h3 id="tit">게시글 작성</h3>
			</div>
		</div>
		<div id="reportarticle">
		<form method="post">
			<div>

				<div>
					<label>제목 : </label> <input type="text" name="boardSj">
				</div>

				<div>
					<label>작성자 : </label> <input type="text" name="memNick">
				</div>

				<div>
					<label>내용 : </label> <input type="text" name="boardCn">
				</div>

				<div>
					<button>등록</button>
					<a href="boardList"><button type="button">목록</button></a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>