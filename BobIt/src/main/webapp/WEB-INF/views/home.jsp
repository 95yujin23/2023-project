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
<link rel="shortcut icon" href="/img/bobit.ico">
<title>밥잇!</title>
<link rel="stylesheet" href="/css/main1.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	const msg = "${msg}";
	if(msg)
		alert(msg);
</script>
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
								href="/member/addMember" class="button _signupBtn -bgWhite">회원가입</a>
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
								<p class="explanation">성별, 연령, 지역, 메뉴별 매칭서비스로 모임을 시작하세요.
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
								<strong class="title2">조건별 검색</strong>
								<p class="explanation">내가 원하는 조건으로 검색이 가능합니다.</p>
							</div>

						</li>

					</ul>


				</div>
			</div>

		</main>
		<footer id="footer"><jsp:include page="include/ft.jsp"></jsp:include></footer>
	</c:if>

	<c:if test="${sessionScope.member != null}">
		<!-- 로그인 한 경우에 보여질 헤더 내용 -->
		<aside id="aside">
			<nav class="nav">
				<jsp:include page="include/nav.jsp"></jsp:include>
			</nav>
			<article id="slider">
				<div class="sliderWrap">
					<div class="board_title">
						<strong>밥상을 잇다 : 밥잇입니다.</strong>
					</div>
					<div class="imgBoardWrap">
						<ul class="imgBoardList">
							<li class="listItem"><a href="/meet/insertMeet">
									<div class="itemImg">
										<span class="itemIcon"> <span>+</span>
										</span>
									</div>
							</a>
								<div class="itemName">
									<p>새로운 모임 생성</p>
								</div></li>
							<c:forEach var="vo" items="${list}">
								<a href="meet/selectMeet/${vo.meetNo}"><li class="listItem">
								<div class="itemImg">
									<img src="/meetimg/${vo.meetImg}"/>
								</div>
								<div class="itemName">
									<c:choose>
									<c:when test="${fn:length(vo.meetSj) > 14}">
									<p><c:out value='${fn:substring(vo.meetSj, 0, 14)}'/>...</p>
									</c:when>
									<c:otherwise>
										<p><c:out value="${vo.meetSj}"/></p>
									</c:otherwise>
									</c:choose>
									<c:choose>
									<c:when test="${fn:length(vo.meetCn) > 14}">
									<p><c:out value='${fn:substring(vo.meetCn, 0, 14)}'/>...</p>
									</c:when>
									<c:otherwise>
										<p><c:out value="${vo.meetCn}"/></p>
									</c:otherwise>
									</c:choose>
									<c:choose>
									<c:when test="${fn:length(vo.meetArea) > 14}">
									<p><c:out value='${fn:substring(vo.meetArea, 0, 14)}'/>...</p>
									</c:when>
									<c:otherwise>
										<p><c:out value="${vo.meetArea}"/></p>
									</c:otherwise>
									</c:choose>
									<p> 메뉴 : <c:out value="${vo.meetMenu}"/>
									 현재 : <c:out value="${vo.meetNow}"/>/<c:out value="${vo.meetMax}"/></p>
								</div></li></a>				
							</c:forEach>
							<%-- <li class="listItem">
							<%
					            // 가상의 데이터베이스에서 게시물 목록을 가져오는 코드
					            List<Post> posts = Database.getPosts(); // 가상의 데이터베이스로부터 게시물 목록을 가져옴
					
					            // 각 게시물의 썸네일과 제목을 표시하는 코드
					            for (Post post : posts) {
					        %>
								<div class="itemImg">
									<a href="<%= post.getDetailLink() %>">
                   						 <img src="<%= post.getThumbnailUrl() %>" alt="썸네일 이미지" style="width: 200px; height: 200px;">
                					</a>
								</div>
								<div class="itemName">
									<p><%= post.getTitle() %></p>
								</div>
								<%
						            }
						        %>
							</li> --%>
						</ul>


					</div>
				</div>
			</article>
			<!-- //slider -->
		</aside>
		<!-- //aside -->

		<footer id="footer"><jsp:include page="include/ft.jsp"></jsp:include></footer>
		
	</c:if>
	<%-- <c:if test="${sessionScope.member.memType == '관리자'}">
	
		<footer id="footer"><jsp:include page="include/ft.jsp"></jsp:include></footer>
	</c:if> --%>
</body>
</html>