<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
	crossorigin="anonymous" />
<%@ page import="me.bobit.myapp.member.service.MemberVO"%>
<% if (session.getAttribute("member") != null) {
    String memType = ((MemberVO) session.getAttribute("member")).getMemType();
    if (memType.equals("관리자")) { %>
<!-- 관리자에게 보여질 내용 -->
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="/css/adm_nav.css">

<ul class="mainmenu">

	<li><a href="/board/boardList">게시판관리</a>
		<ul class="submenu">
			<li><a href="/board/noticeList">공지사항관리</a></li>
			<li><a href="/board/boardList">자유게시판관리</a></li>
			<li><a href="/meet/meetList">매칭게시판관리</a></li>
			<li><a href="#">후기게시판관리</a></li>
			<li class="popup-btn2"><a href="#">FAQ</a></li>
		</ul></li>
	<li><a href="/member/memberList">멤버관리</a>
		<ul class="submenu">
			<li><a href="/member/memberList">멤버 리스트</a></li>
			<li><a href="/member/addMember">회원가입</a></li>
		</ul></li>

	<li><a href="/blame/blameList">신고관리</a></li>
</ul>

<% } else { %>
<!-- 관리자가 아닌 경우에 보여질 내용 -->
<link rel="stylesheet" href="/css/main1.css">
<link rel="stylesheet" href="/css/nav.css">

<ul class="mainmenu">
	<li><a href="#">About</a>
		<ul class="submenu">
			<li><a href="/bobit">BOBIT소개</a></li>
			<li><a href="/teamBobit">BOBIT</a></li>
		</ul></li>
	<li><a href="/board/boardList">Community</a>
		<ul class="submenu">
			<li><a href="/board/noticeList">공지사항</a></li>
			<li><a href="/board/boardList">자유게시판</a></li>
			<li><a href="/meet/meetList">매칭게시판</a></li>
			<li><a href="/board/boardList">후기게시판</a></li>
		</ul></li>
	<li><a href="/member/selectMember/${sessionScope.member.memNick}">Mypage</a>
		<ul class="submenu">
			<li><a
				href="/member/selectMember/${sessionScope.member.memNick}">개인정보변경</a></li>
			<li><a href="/board/myBoard">작성글내역</a></li>
			<li><a href="/meet/myMeet">모임내역</a></li>
			<li><a href="/alert/alertList">메세지함</a>
		</ul></li>
	<li><a href="/blame/blameList">Support</a>
		<ul class="submenu">
			<li><a href="#">FAQ</a></li>
			<li><a href="/blame/blameList">신고게시판</a></li>
		</ul></li>
</ul>
<% } %>
<% } %>
<section class="popup-wrap1">
	<div class="popup-view1">
		<h3>기능준비중입니다.</h3>
		<p>
			안녕하세요. BOBIT입니다.<br> 아직 개발중인 기능입니다.<br> 감사합니다.
		</p>
		<a href="#" class="popup-close1">닫기</a>
	</div>
</section>
<section class="popup-wrap2">
	<div class="popup-view2">
		<h1>자주 묻는 질문</h1>
		<div class="faq-container">
			<div class="faq">
				<h3 class="faq-title">자주 묻는 질문 1</h3>
				<p class="faq-text">대답 1</p>
				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
			<div class="faq">
				<h3 class="faq-title">자주 묻는 질문 2</h3>
				<p class="faq-text">대답 2</p>
				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
			<div class="faq">
				<h3 class="faq-title">자주 묻는 질문 3</h3>
				<p class="faq-text">대답 3</p>
				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
			<div class="faq">
				<h3 class="faq-title">자주 묻는 질문 4</h3>
				<p class="faq-text">대답 4</p>
				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<a href="#" class="popup-close2">닫기</a>
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
    
    $(".popup-btn2").click(function() {
        $(".popup-view2").show();
    });
    $(".popup-close2").click(function() {
        $(".popup-view2").hide();
    });
</script>
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<script>
        const toggles = document.querySelectorAll(".faq-toggle");

        toggles.forEach((toggle) => {
            toggle.addEventListener("click", () => {
                toggle.parentNode.classList.toggle("active");
            });
        });
    </script>

<script type="text/javascript">
    /* window.onload = function(){
    let navList = document.querySelectorAll(".nav > ul > li");
    
    navList.forEach(function(navItem){
        navItem.addEventListener("mouseover", function(){
            this.querySelector(".submenu").style.height = "155px";
        });
    });
    navList.forEach(function(navItem){
        navItem.addEventListener("mouseout", function(){
            this.querySelector(".submenu").style.height = "0px";
        });
    });
} */


    //메뉴
    $(".nav > ul > li").mouseover(function() {
        $(this).find(".submenu").stop().slideDown(300);
    });
    $(".nav > ul > li").mouseout(function() {
        $(this).find(".submenu").stop().slideUp(300);
    });

    function openNewWindow(url) {
        mywin = window.open(url, '_blank');
    }

    /* // 'popup-btn1' 클래스를 가진 요소를 클릭했을 때 새 창을 열도록 이벤트 핸들러를 추가
    document.querySelector('.popup-btn1').addEventListener('click', function () {
        openNewWindow('../bobit.html');
    });

    let mywin = null;
    document.querySelector('.popup-btn1').onclick = function(){
        window.open('../bobit.html');
    } */
</script>