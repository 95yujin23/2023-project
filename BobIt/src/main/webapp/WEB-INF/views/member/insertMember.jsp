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
<title>글 쓰기</title>
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
			<h3 class="h1">글쓰기</h3>
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
	
	<div>
		<label>닉네임 : </label>
		<input type="text" name="memNick">
	</div>
	
	<div>
		<label>아이디 : </label>
		<input type="text" name="memId">
	</div>
	
	<div>
		<label>비밀번호 : </label>
		<input type="text" name="memPwd">
	</div>
	
	<div>
		<label>이메일 : </label>
		<input type="text" name="memMail">
	</div>
	
	<div>
		<label>성별(남,녀) : </label>
		<input type="text" name="memFm">
	</div>
	
	<div>
		<label>나이 : </label>
		<input type="text" name="memAge">
	</div>
	
	<div>
		<label>지역 : </label>
		<input type="text" name="memArea">
	</div>
	
	<div>
		<button>등록</button>
		<a href="../memberList"><button type="button">목록</button></a>
	</div>
</div>
</form>
					</div>
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