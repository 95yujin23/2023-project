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
<title>main</title>
<link rel="stylesheet" href="/css/main1.css">
</head>
<body>
	<header id="header" class="header">
		<jsp:include page="include/hd.jsp"></jsp:include>
	</header>
	<c:if test="${sessionScope.member == null}">
		<!-- 로그인 하지 않은 경우에 보여질 헤더 내용 -->
		<main>
			<!-- section1 -->
			<div class="sloganArea">
				<div class="sloganInner">
					<div>
						<img src="/img/bg_sloganimg.png" alt="BOBIT IMG">
					</div>
					<div>
						<h2 class="title">
							이제 혼자 밥 안먹는다.<br> <span>같이 모여서 맛있게 식사합시다.</span>
						</h2>
						<p class="explanation">당신도 이제 같이해요.</p>

						<div class="buttonBox">
							<a href="/login" class="button _loginBtn">로그인 </a> <a
								href="/join" class="button _signupBtn -bgWhite">회원가입</a>
						</div>
					</div>

				</div>
			</div>

			<!-- section2 -->
			<div class="introArea">
				<div data-viewname="DIntroUseCaseView">

					<div class="imagesSection color-wh">
						<h3 class="title">외로운 식사는 이제 그만!</h3>
						<p class="explanation">함께 하면 더 행복합니다. 같이 모여서 맛있게 식사합시다.</p>
					</div>

					<ul class="seoList">
						<li>
							<div>
								<img src="/img/img1.jpg" alt="매칭게시판">
							</div>
							<div>
								<strong class="title2">매칭게시판</strong>
								<p class="explanation">성별, 연령, 지역, 메뉴별 매칭서비스로 원하는 식당을 예약하세요.
								</p>
							</div>
						</li>

						<li>
							<div>
								<img src="/img/img2.jpg" alt="">
							</div>
							<div>
								<strong class="title2">일반게시판</strong>
								<p class="explanation">후기, 잡담, 맛집 추천 게시판으로 서로의 공감대를 함께 나눠봐요.
								</p>
							</div>
						</li>

						<li>
							<div>
								<img src="/img/img3.jpg" alt="">
							</div>
							<div>
								<strong class="title2">지역별 검색</strong>
								<p class="explanation">내가 원하는 조건으로 지역별 검색이 가능합니다.</p>
							</div>

						</li>

					</ul>


				</div>
			</div>

		</main>
	</c:if>

	<c:if test="${sessionScope.member != null}">
		<!-- 로그인 한 경우에 보여질 헤더 내용 -->
		<aside id="aside">
			<nav class="nav">
				<jsp:include page="include/nav.jsp"></jsp:include>
			</nav>
			<article id="slider">
				<div class="sliderWrap"></div>
			</article>
			<!-- //slider -->
		</aside>
		<!-- //aside -->
	</c:if>
	<footer id="footer"><jsp:include page="include/ft.jsp"></jsp:include></footer>
</body>
</html>