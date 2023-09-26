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

<div class="tit_intro_step">
    <ul>
        <li>약관동의</li>
        <li class="current">회원유형</li>
        <li>정보입력</li>
        <li>가입완료</li>
    </ul>
</div>

<h2 class="icon1">회원유형 선택</h2>

<form id="frm" name="frm" action="/join/memberRegist.do" method="post">
	<input type="hidden" name="agree01" value="${searchVO.agree01}"/>
	<input type="hidden" name="agree02" value="${searchVO.agree02}"/>
	<input type="hidden" name="agree03" value="${searchVO.agree03}"/>
	<input type="hidden" name="loginType" value="normal"/>

	<div class="confirm-area user-area">
		<article>
			<h3 class="icon2 ico-user">일반회원</h3>
	        <div class="confirm_box">
				<p class="mB20">일반회원 </p>
				<div class="btn-cont">
					<a href="/join/memberRegist.do?loginType=normal" class="btn spot member-type btn-regist"><span>회원가입</span></a>
				</div>
			</div>
		</article>
		
		<article>
			<h3 class="icon2 ico-user">SNS회원</h3>
	        <div class="confirm_box">
				<p class="mB20">카카오 회원</p>
				<div class="btn-cont">
					<a class="btn-kakao" href="#" data-type="join">
						<img src="http://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="150" alt="카카오 로그인 버튼"/>
					</a>
				</div>
			</div>
		</article>
		
		<article>
			<h3 class="icon2 ico-user">SNS회원</h3>
	        <div class="confirm_box">
				<p class="mB20">네이버 회원</p>
				<div class="btn-cont">
					<a class="btn-naver" href="${naverAuthUrl}" data-type="join">
						<img src="/asset/front/images/common/btn-naver.png" width="150" alt="네이버 로그인 버튼"/>
					</a>
				</div>
			</div>
		</article>
	</div>
</form>

<%-- 2023-06-21에 추가 됨 학생들 코드랑 다름 --%>
<script>
$(document).ready(function(){
	$(".btn-regist").click(function(){
		$("#frm").submit();
		return false;
	});
});
</script>

<form id="joinFrm" name="joinFrm" method="post" action="/join/insertMember.do">
	<input type="hidden" name="loginType" value=""/>
	<input type="hidden" name="emplyrId"/>
	<input type="hidden" name="userNm"/>
	<input type="hidden" name="emailAdres"/>
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
Kakao.init('2b7dd86a5c5b0e1a49c9c8ee866e8d76');

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
					$("input[name=emplyrId]").val(response.id);
					$("input[name=userNm]").val(response.properties.nickname);
					$("input[name=emailAdres]").val(response.kakao_account.email);
					$("#joinFrm").submit();
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

<c:if test="${not empty message}">
	alert("${message}");
</c:if>

<c:if test="${not empty loginMessage}">
	alert("${loginMessage}");
</c:if>

</script>

</body>
</html>