<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정</title>
<!-- 헤드 부분 인클루드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<header id="header">
		<!-- 헤더 부분 인클루드 -->
		<jsp:include page="../include/hd.jsp"></jsp:include>
	</header>

	<div class="content" id="contents">
		<div class="row column text-center">
			<h3 class="h1">수정</h3>
			<hr>
			<div class="container">
				<div id="insert">
					<div class="in-l" style="text-align: center;">
						<aside class="side-container">
							<div class="vertical-menu ">

								<div class="m-link">
									<a href="#"><i class="fas"></i><span>&nbsp; 공지사항</span></a>
								</div>
								<div class="m-link">
									<a href="#"><i class=" fas"></i><span>&nbsp; 게시판1 </span></a>
								</div>
								<div class="m-link">
									<a href="#"><i class=" fas"></i><span>&nbsp; 게시판2 </span></a>
								</div>
							</div>
						</aside>
					</div>
					<div class="in-r" style="text-align: center;">
						<form method="post">
							<div>
								<%-- <div>

									<label class="col1">글번호 : </label> <br> <input
										type="number" name="boardNo" class="col2"
										value="${vo.boardNo}" readonly />

								</div> --%>
								<div>
									<label class="col1"><b>제목</b></label> <br> <input type="text"
										name="boardSj" class="col2" value="${vo.boardSj}" />

								</div>
								<div>
									<label class="col1">작성자 : </label> <br> <input type="text"
										name="memNick" class="col2" value="${vo.memNick}" readonly />

								</div>
								<div>
									<label class="col1">내용 : </label><br>
									<textarea rows="10" cols="30" wrap="off" name="boardCn"
										class="col4">${vo.boardCn}</textarea>
								</div>

								<div>
									<button class="col3 button">변경</button>
									<a href="../boardList"><button type="button" class="col3 button">목록</button></a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<footer id="footer" class="footer-nav row expanded collapse">
			<!-- 푸터 부분 인클루드 -->
			<jsp:include page="../include/ft.jsp"></jsp:include>
		</footer>
</body>
</html>