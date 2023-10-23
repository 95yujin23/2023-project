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
<title>메세지 보내기</title>
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
							<strong>메세지 보내기</strong>
						</div>
					
						<div class="board_list_wrap">
							<form method="post" enctype="multipart/form-data" onsubmit="return regist()">
								<table class="board_list">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead class="inp-no">
										<tr>
										<c:choose>
											<c:when test="${sessionScope.othermemNick == null}">
											<th>받는 사람</th>
											<td><input type="text" name="memNick" class="col2" id="memNick"></td>
											</c:when>
											<c:otherwise>
											<th>받는 사람</th>
											<td><input type="text" name="memNick" class="col2" id="memNick" value="${sessionScope.othermemNick}" readonly></td>
											</c:otherwise>
										</c:choose>	
										</tr>
										<tr>
											<th>보내는 사람</th>
											<td><input type="text" name="alertFrom"
												value="${sessionScope.member.memNick}" class="col2"
												style="background: #eee;" readonly></td>
										</tr>
										<tr class="tr-last">
											<th>내용</th>
											<td><textarea rows=20 cols=147 wrap=off name="alertCn" id="alertCn"
													class="col4"></textarea></td>
										</tr>
								</table>
								
								<div class="bt_wrap">
									<a><button class="col3 button btn-bd" type="submit" id="btn-reg">보내기</button></a> 
									<a href="alertList"><button type="button" class="col3 button btn-bd">목록</button></a>
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
		if($("#memNick").val() === ""){
			alert("받는사람을 입력하세요.");
			$("#memNick").focus();
			return false;
		} 
		if($("#alertCn").val() === ""){
			alert("내용을 입력해주세요.");
			$("#alertCn").focus();
			return false;
		}	
	}
	$(document).ready(function() {
		//게시 글 수정
		$("#btn-reg").click(function() {
			if(!confirm("메세지를 보내시겠습니까?")) {
				return false;
			}
		});
	});
</script>
</html>