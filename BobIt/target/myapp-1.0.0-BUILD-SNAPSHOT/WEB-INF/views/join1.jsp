<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="https://kit.fontawesome.com/8c58089f6a.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/join.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="join.js"></script>
<script src="../jquery-3.5.1.js"></script>
<script>
        $(function(){
            $("#userid").keyup(function(){
                idCheck();
            });
            $("#userPw").keyup(function(){
                pwCheck();
            });
            $("#checkPw").keyup(function(){
                checkpwsame();
            });
            $("#emailSel").change(function(){
                emailSelect();
            })
            $("#apply").click(function(){
                userinfo();
            })
            $("#pw1").mousedown(function(){
                hidepw1();
                $("#pw1").addClass("far fa-eye").removeClass("fas fa-eye-slash");
            }).mouseup(function(){
                showpw1();
                $("#pw1").addClass("fas fa-eye-slash").removeClass("far fa-eye");
            })
            $("#pw2").mousedown(function(){
                hidepw2();
                $("#pw2").addClass("far fa-eye").removeClass("fas fa-eye-slash");
            }).mouseup(function(){
                showpw2();
                $("#pw2").addClass("fas fa-eye-slash").removeClass("far fa-eye");
            })
        });
        function idCheck(){
            var id = $("#userid").val();
            if(id.length == 0){
                $("#idResult").css("color", "red").text("아이디는 필수입니다.");
            } else if(id.length < 4 || id.length > 10){
                $("#idResult").css("color", "red").text("아이디의 길이가 맞지않습니다.");
            } else if (id.length >= 4 && id.length <= 10){
                $("#idResult").css("color", "green").text("Good");
            }
        }
        function pwCheck(){
            var pw = $("#userPw").val();
            if(pw.length == 0){
                $("#pwResult").css("color", "red").text("비밀번호는 필수입니다.");
            } else if(pw.length < 8 || pw.length > 16){
                $("#pwResult").css("color", "red").text("비밀번호의 길이가 맞지않습니다.");
            } else if (pw.length >= 8 && pw.length <= 16){
                $("#pwResult").css("color", "green").text("Good");
            }
        }
        function checkpwsame(){
            var userpw = $("#userPw").val();
            var checkpw = $("#checkPw").val();
            if(userpw == checkpw){
                $("#checkresult").css("color", "green").text("비밀번호가 일치합니다.");
            } else {
                $("#checkresult").css("color", "red").text("비밀번호가 일치하지 않습니다.");
            }
        }
        function emailSelect(){
            var email = $("#emailSel").val();
            $("#inputEmail").val(email);
        }
        function hidepw1(){
            var id = document.querySelector("#userPw");
            if(id.type === "password"){
                id.type = "text";
            }
        }
        function hidepw2(){
            var input = document.querySelector("#checkPw");
            if(input.type === "password"){
                input.type = "text";
            }
        }
        function showpw1(){
            var id = document.querySelector("#userPw");
            if(id.type === "text"){
                id.type = "password";
            }
        }
        function showpw2(){
            var input = document.querySelector("#checkPw");
            if(input.type === "text"){
                input.type = "password";
            }
        }
        function userinfo(){
            var Id = "아이디 : " + $("#userid").val();
            var password = "비밀번호 : " + $("#userPw").val();
            var name = "이름 : " + $("#name").val();
            var birth = "생년월일 : " + $("#birth").val();
            var email = "이메일 : " + $("#email").val() + " @ " + $("#inputEmail").val();
            var add = "주소 : " + $("#sample6_address").val() + " " + $("#sample6_detailAddress").val();
            var text = Id + "\n" + password + "\n" + name + "\n" + birth + "\n" + email + "\n" + add;
            alert(text);
        }
        </script>
</head>
<body>
	<h2>회원가입</h2>
	<table>
		<tr>
			<td><i class="fas fa-id-card"></i></td>
			<td class="fontcolor">아이디</td>
			<td><input type="text" name="id" placeholder="4~10자리"
				id="userid"><span id="idResult"></span></td>
		</tr>
		<tr>
			<td><i class="fas fa-key"></i></td>
			<td class="fontcolor">비밀번호</td>
			<td><input type="password" name="password" placeholder="8~16자리"
				id="userPw"><i class="fas fa-eye-slash" id="pw1"></i><span
				id="pwResult"></span></td>
		</tr>
		<tr>
			<td><i class="fas fa-check-circle"></i></td>
			<td class="fontcolor">비밀번호확인</td>
			<td><input type="password" name="checkPw" id="checkPw"><i
				class="fas fa-eye-slash" id="pw2"></i><span id="checkresult"></span></td>
		</tr>
		<tr>
			<td><i class="fas fa-user-circle"></i></td>
			<td class="fontcolor">이름</td>
			<td><input type="text" id="name"></td>
		</tr>
		<tr>
			<td><i class="fas fa-birthday-cake"></i></td>
			<td class="fontcolor">생년월일</td>
			<td><input type="date" id="birth"></td>
		</tr>
		<tr>
			<td><i class="fas fa-envelope"></i></td>
			<td class="fontcolor">이메일</td>
			<td><input type="text" id="email">@<input type="text"
				id="inputEmail"> <select name="email" id="emailSel">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
			</select></td>
		</tr>
		<tr>
			<td><i class="fas fa-userGender"></i></td>
			<td class="fontcolor">성별</td>
			<td><label><input type="radio" name="userGender" value="남">남자</label>
			<label><input type="radio" name="userGender" value="여">여자</label></td>
		</tr>
		<!-- <tr>
			<td><i class="fas fa-map-marked-alt"></i></td>
			<td class="fontcolor">주소</td>
			<td><input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()"
				value="우편번호 찾기" id="address" class="button"><br> <input
				type="text" id="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</td>
		</tr> -->
		<tr>
			<td colspan="3" style="text-align: center;"><button
					class="button" id="apply">회원가입</button></td>
		</tr>
	</table>
</body>
</html>