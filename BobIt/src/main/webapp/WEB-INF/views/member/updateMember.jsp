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
<title>회원 수정</title>
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
							<strong>회원 수정</strong>
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
										<col>
									</colgroup>
									<thead class="inp-no">
										<tr>
											<th>프로필이미지</th>
											<td>
												<div class="filebox">
													<img src="/profileimg/${vo.memImg}" alt="user-icon" style="border-radius: 20px; width: 300px; height: 300px; border: 2px solid #ddd; margin: 15px;">
													<label for="file">변경</label> <input type="file" id="file" name="file">
													<input class="upload-name" value="첨부파일명" placeholder="첨부파일">
												</div>
											</td>
										</tr>
										<tr>
											<th>닉네임</th>
											<td><input type="text" name="memNick" id="memNick" value="${vo.memNick}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>아이디</th>
											<td><input type="text" name="memId" id="memId" value="${vo.memId}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td><input type="password" name="memPwd" id="memPwd" value="${vo.memPwd}" class="col2"></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="text" name="memMail" id="memMail" value="${vo.memMail}" class="col2"></td>
										</tr>
										<tr>
											<th>성별(남,녀)</th>
											<td><input type="text" name="memFm" id="memFm" value="${vo.memFm}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>나이</th>
											<td><input type="text" name="memAge" id="memAge" value="${vo.memAge}" class="col2" readonly></td>
										</tr>
										<tr>
											<th>지역</th>
											<td><input type="text" name="memArea" id="memArea" value="${vo.memArea}" class="col2" readonly></td>
										</tr>
									</table>
								<div class="bt_wrap">
									<a><button class="col3 button btn-bd" type="submit" id="btn-submit">수정</button></a> 
									<a href="../memberList"><button type="button" class="col3 button btn-bd">목록</button></a>
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
function regist(){
if($("#memPwd").val() === ""){
alert("비밀번호를 입력해주세요.");
$("#memPwd").focus();
return false;
}
if($("#memMail").val() === ""){
alert("이메일을 입력해주세요.");
$("#memMail").focus();
return false;
}
}


$(document).ready(function() {
//회원 수정
$("#btn-submit").click(function() {
if(!confirm("수정하시겠습니까?")) {
return false;
}
});
});
</script>
</html>