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
<title>게시판</title>
<!-- 헤드 부분 인클루드 -->
<jsp:include page="../include/css.jsp"></jsp:include>
</head>
<body id="page-top">
	<div id="wrap">
		<aside id="aside">
			<jsp:include page="../include/hd.jsp"></jsp:include>
		</aside>
		<!-- //aside -->

		<main id="main">
			<article id="session">
				<div class="board_wrap">
					<div class="board_title">
						<strong>게시판</strong>
					</div>
					<div class="full-item">
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
					</div>
					<div class="board_list_wrap">
						<form method="post" enctype="multipart/form-data">
							<table class="board_list">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead class="inp-no">
									<tr class="tr-h">
									<tr>
										<th>제목</th>
										<td><input type="text" name="boardSj" class="col2"></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td><input type="text" name="memNick"
											value="${sessionScope.member.memNick}" class="col2"
											style="background: #eee;" readonly></td>
									</tr>
									<tr class="tr-last">
										<th>내용</th>
										<td><textarea rows=20 cols=147 wrap=off name="boardCn"
												class="col4"></textarea></td>
									</tr>	
							</table>
							<div id="file-inputs">
   								<input type="file" name="file" id="file-0"><br>
							</div>
							<div>
								<button type="button" id="add-file-input">파일 추가</button>
							</div>	

							<div class="bt_wrap">
								<a><button class="col3 button" type="submit">등록</button></a> <a
									href="boardList"><button type="button" class="col3 button">목록</button></a>
							</div>
						</form>
					</div>
				</div>
			</article>
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
    document.addEventListener('DOMContentLoaded', function () {
        const fileInputs = document.getElementById('file-inputs');
        const addFileButton = document.getElementById('add-file-input');
        let fileCount = 1;

        addFileButton.addEventListener('click', function () {
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
</script>
</html>