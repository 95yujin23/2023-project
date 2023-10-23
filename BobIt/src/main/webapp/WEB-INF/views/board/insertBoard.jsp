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
							<strong>글 등록</strong>
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
											<th>제목</th>
											<td><input type="text" name="boardSj" id="boardSj" class="col2"></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="text" name="memNick"
												value="${sessionScope.member.memNick}" class="col2"
												style="background: #eee;" readonly></td>
										</tr>
										<tr class="tr-last">
											<th>내용</th>
											<td><textarea rows=20 cols=147 wrap=off name="boardCn" id="boardCn"
													class="col4"></textarea></td>
										</tr>
										</thead>
								</table>
								<div id="file-inputs">
									<input type="file" name="file" id="file-0"><br>
								</div>
								<div class="add-file">
									
									<button type="button" id="add-file-input"><img src="/img/file_add.png" alt="fileAddBtn" style="width: 20px;">파일 추가</button>
								</div>
								

								<div class="bt_wrap">
									<a><button class="col3 button btn-bd" type="submit" id="btn-reg">등록</button></a> 
									<a href="boardList"><button type="button" class="col3 button btn-bd">목록</button></a>
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
	document.addEventListener('DOMContentLoaded', function() {
		const fileInputs = document.getElementById('file-inputs');
		const addFileButton = document.getElementById('add-file-input');
		let fileCount = 1;

		addFileButton.addEventListener('click', function() {
			const newFileInput = document.createElement('input');
			newFileInput.type = 'file';
			newFileInput.name = 'file' + fileCount;
			newFileInput.id = 'file-' + fileCount;
			newFileInput.addEventListener('change', handleFileChange);
			const br = document.createElement('br');
			fileInputs.appendChild(newFileInput);
			fileInputs.appendChild(br);
			fileCount++;
		});
		
		

		function handleFileChange(event) {
			// 파일 변경 이벤트를 처리할 필요가 있다면 여기에서 처리하세요.
		}
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
		$(document).ready(function() {
			//게시 글 수정
			$("#btn-reg").click(function() {
				if(!confirm("등록하시겠습니까?")) {
					return false;
				}
			});
		});
</script>
</html>