<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/asset/member/css/login.css">
</head>
<body>

<h2 class="icon1">로그인</h2>
<p class="mB20">밥잇홈페이지에 오신걸 환영합니다.</p>

<div class="login_box">
	<div class="mem_login">
		<div class="smartshool login">
			<div class="login_inp_wrap">
				<div class="login_inp">
					<form action="/login/actionLogin.do" name="frmGnrlLogin" method="post" id="frmGnrlLogin" onsubmit="return checkGnrlLogin(this)">
						<fieldset>
							<legend>로그인 입력폼</legend>
							<span>
								<label for="id"><img src="/asset/member/images/member/ico_id.svg" alt="아이디"></label>
								<input type="text" id="id" name="id" value="" class="inp" title="아이디를 입력하세요." placeholder="아이디를 입력하세요.">
							</span>
							<span>
								<label for="pwd"><img src="/asset/member/images/member/ico_pw.svg" alt="패스워드"></label>
								<input type="password" id="pwd" name="password" value="" class="inp" title="비밀번호를 입력하세요." placeholder="비밀번호를 입력하세요." autocomplete="off">
							</span>
                            <button type="submit" class="btn-lg spot p10">로그인</button>
                            <div class="btn-cont">
								<a class="btn-kakao" href="#" data-type="login">
									<img src="http://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
								</a>
								<a class="btn-naver" href="${naverAuthUrl}" data-type="login">
									<img src="/asset/front/images/common/btn-naver.png" width="180" alt="네이버 로그인 버튼"/>
								</a>
							</div>
						</fieldset>
					</form>
				</div>

				<ul>
					<li><p>회원으로 가입하시겠습니까?</p><a href="/join/siteUseAgree">회원가입</a></li>
					<li><p>아이디를 잊으셨나요?</p><a href="/member/findId">아이디찾기</a></li>
					<li><p>비밀번호를 잊으셨나요?</p><a href="/member/findPassword">패스워드 찾기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>


<script>
<c:if test="${not empty message}">
alert("${message}");
</c:if>

<c:if test="${not empty loginMessage}">
	alert("${loginMessage}");
</c:if>

function checkGnrlLogin(frm) {
	if(frm.id.value == "") {
		alert("아이디를  입력해주세요");
		frm.id.focus();
		return false;
	}
	
	if(frm.pwd.value == "") {
		alert("비밀번호를  입력해주세요");
		frm.pwd.focus();
		return false;
	}
	
	$("#frmGnrlLogin");
}

$(document).ready(function(){
	//아이디 입력 창 포커스 설정
	$('#id').focus();
});

</script>

<%-- form구조 다 바뀜 emplyrId => id로 변경 등 --%>
<form id="frmLogin" name="frmLogin" method="post" action="/login/actionLogin.do">
	<input type="hidden" name="loginType" value=""/>
	<input type="hidden" id="snsId" name="id"/>
</form>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(document).ready(function(){
	//카카오 로그인 버튼
	$(".btn-kakao").click(function(){
		const type = $(this).data("type"); 
		kakaoLogin(type);
		return false;
	});
});

//카카오 키 정보 입력
Kakao.init('');

//카카오SDK 초기화
Kakao.isInitialized();

//카카오로그인
function kakaoLogin(type) {
	Kakao.Auth.login({
		success: function (response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function (response) {
					console.log(response)
					$("input[name=loginType]").val("KAKAO");
					$("#snsId").val(response.id);
					$("#frmLogin").submit();
				},
          		fail: function (error) {
            		console.log(error)
          		},
        	})
      }, fail: function (error) {
			console.log(error)
      },
    })
}
</script>

</body>
</html>