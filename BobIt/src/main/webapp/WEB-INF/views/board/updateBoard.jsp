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
<title>게시판</title>
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
							<strong>게시판</strong>
						</div>
						<!-- <div class="full-item">
							<form class="d-flex" id="searchForm" action="board/list">
								<select name="searchType">

									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="total">제목+내용</option>
								</select>
								<script type="text/javascript">
									//	document.querySelector('[name="searchType"]').value = "";
									if ('') {
										$('[name="searchType"]').val('');
									}
								</script>
								<input class="form-control" placeholder="search" type="text"
									name="searchWord" value="" /> <input type="hidden"
									name="currentPageNo" value="1" /> <input type="submit"
									value="검색" class="sea-btn" />
							</form>
						</div> -->
						<div class="board_list_wrap">
							<form method="post" enctype="multipart/form-data" onsubmit="return regist()">
								<table class="board_list">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead class="inp-no">
										<tr>
											<th>글번호</th>
											<td><input type="number" name="boardNo" class="col2"
												value="${vo.boardNo}" readonly /></td>
										</tr>
										<tr>
											<th>제목</th>
											<td><input type="text" name="boardSj" class="col2" id="boardSj"
												value="${vo.boardSj}" /></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="text" name="memNick"
												value="${vo.memNick}" class="col2" style="background: #eee;"
												readonly></td>
										</tr>
										<tr class="tr-last">
											<th>내용</th>
											<td><textarea rows=20 cols=147 wrap=off name="boardCn" id="boardCn"
													class="col4">${vo.boardCn}</textarea></td>
										</tr>
								</table>

								<div class="bt_wrap">
									<a><button class="col3 button btn-bd" type="submit" id="btn-submit">변경</button></a> 
									<a href="../boardList"><button type="button" class="col3 button btn-bd ">목록</button></a>
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
	$(document).ready(function() {
		//게시 글 수정
		$("#btn-submit").click(function() {
			if(!confirm("수정하시겠습니까?")) {
				return false;
			}
		});
	});
	function regist(){
		if($("#boardSj").val() === ""){
			alert("제목을 입력해주세요.");
			$("#boardSj").focus();
			return false;
		} 
		if($("#boardCn").val() === ""){
			alert("내용을 입력해주세요.");
			$("#boardCn").focus();
			return false;
		}	
	}	
	</script>
</body>
</html>