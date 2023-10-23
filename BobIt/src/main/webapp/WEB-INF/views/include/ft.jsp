<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 푸터 내용 기술 -->
<div class="footer1">
	<img alt="footerLogo" src="/img/logo-b.png">
</div>
<div class="footer2">
	<div class="footer2-1">
		<ul>
			<li><a href="#" class="popup-btn1">개인정보처리방침</a></li>
			<li><a href="#" class="popup-btn1">저작권보호정책</a></li>
			<li><a href="#" class="popup-btn1">이메일무단수집거부</a></li>
		</ul>
	</div>
	<div class="footer2-2">COPYRIGHT 2023, All Rights Reseved</div>
</div>
		<section class="popup-wrap1">
			<div class="popup-view1">
				<h3>기능준비중입니다.</h3>
				<p>
					안녕하세요. BOBIT입니다.<br> 아직 개발중인 기능입니다.<br> 감사합니다.
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