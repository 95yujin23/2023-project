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
<title>신고글 작성</title>
</head>
<body>
	<div class="container">
	<div>
		<h2>신고글 작성</h2>
	</div>
	<form method="post" enctype="multipart/form-data"> 
<div>
	
	<div>
		<label>제목 : </label>
		<input type="text" name="boardSj">
	</div>
	
	<div>
		<label>작성자 : </label>
		<input type="text" name="memNick" value="${sessionScope.member.memNick}" readonly>
	</div>
	
	<div>
		<label>내용 : </label>
		<input type="text" name="boardCn">
	</div>
	<div id="file-inputs">
		<input type="file" name="file" id="file-0"><br>
	</div>
	<div>
		<button type="button" id="add-file-input">파일 추가</button>
	</div>	
	<div>
		<button>등록</button>
		<a href="blameList"><button type="button">목록</button></a>
	</div>
</div>
</form>
</div>
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
</body>
</html>