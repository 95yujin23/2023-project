<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section class="popup-wrap">
	<div class="popup-view">
		<h3>기능준비중입니다.</h3>
		<p>
			안녕하세요. BOBIT입니다.<br> 아직 개발중인 기능입니다.<br> 감사합니다.
		</p>
		<a href="#" class="popup-close">닫기</a>
	</div>
</section>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(".popup-btn").click(function() {
		$(".popup-view").show();
	});
	$(".popup-close").click(function() {
		$(".popup-view").hide();
	});
</script>

<section class="popup-wrap1">
	<div class="popup-view1">
		<h3>BOBIT을 소개합니다.</h3>

		<b>1. BOBIT을 만들게 된 계기가 무엇인가요?</b>

		<p>
			BOBIT은 혼자 밥을 먹게 되면 의사소통이 없고, 밥을 먹으면서 휴대폰 등의 전자기기를 쳐다보는 모습을 자주 접할 수
			있는데 <br>같이 밥을 먹음으로써 정서적인 행복을 얻을 수 있고, 까다로운 입맛을 고칠 수 있다는 연구 결과를
			보고 <br> 혼자 밥을 먹는 사람들끼리 매칭하여 서로 만나 밥을 먹는 것은 어떨까 싶어 제작하게 되었습니다.
		</p>

		<b>2. 왜 하필 BOBIT(밥잇) 인가요?</b>

		<p>
			네이밍을 할 때 서로 만나 밥을 먹는 것을 밥상을 잇다로 표현하면 어떨까 하는 생각과 <br> 먹다의 발음이 잇이라
			밥을먹다로 풀어내보았습니다.
		</p>
		<a href="#" class="popup-close1">닫기</a>
	</div>
</section>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(".popup-btn1").click(function() {
		$(".popup-view1").show();
	});
	$(".popup-close1").click(function() {
		$(".popup-view1").hide();
	});
</script>