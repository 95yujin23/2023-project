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
<title>BOBIT 팀원소개</title>
<link rel="stylesheet" href="style.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:wght@200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

a {
	color: #000;
	text-decoration: none;
}

body {
	line-height: 1;
	min-width: 1200px;
	margin: 0 auto;
}

#wrap {
	width: 100%;
	height: auto;
}

#header {
	min-width: 100%;
}

#header .header_container {
	display: flex;
	justify-content: space-between;
	padding: 10px;
	border-bottom: 2px solid #2a3038;
	min-height: 80px;
	align-items: center;
}

#header .header_container .logo {
	width: 20%;
	height: 80px;
	text-align: center;
	vertical-align: baseline;
}

#header .header_container .intro {
	width: 75%;
	height: 80px;
	text-align: center;
	vertical-align: baseline;
	position: relative;
}

#header .header_container button {
	width: 5%;
	height: 80px;
	background-color: #2a3038;
	color: #eee;
	margin-right: 150px;
	border-radius: 7px;
}

#header .header_container .intro h2 {
	position: absolute;
	font-size: 50px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.card {
	width: 1000px;
	height: 700px;
	background: rgba(255, 255, 255, 0.4);
	border-radius: 30px;
	border: 2px solid rgba(255, 255, 255, 0.5);
	box-shadow: 0 0 30px 5px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: 0.5s;
	margin: 20px auto;
	
}

.tabs {
	width: 875px;
	height: 60px;
	margin: 50px 60px;
	background: rgba(0, 0, 0, 0.1);
	border-radius: 20px;
}

.tabs ul {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.tabs ul li {
	width: 25%;
	height: 110%;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 20px;
	border: 2px solid transparent;
	cursor: pointer;
	-webkit-user-select: none;
	user-select: none;
	transition: 0.5s ease;
}

.tabs ul li.active {
	font-weight: 700;
	height: 110%;
	background: slategray;
	color: #eee;
	border: 2px solid rgba(255, 255, 255, 0.5);
	box-shadow: 0 0 20px 2px rgba(0, 0, 0, 0.1);
}

.team-info {
	display: none;
	padding: 10px;
}

.team-info>div {
	border-radius: 50px;
}

.team-info img {
	width: 300px;
	height: 300px;
}

.team-info h2 {
	padding-left: 10px;
	font-size: 60px;
}

.team-info p {
	padding-left: 20px;
	font-size: 40px;
	padding-top: 20px;
}

.team-info.active {
	display: block;
}

footer {
	width: 100%;
	display: flex;
	background: #2a3038;
	padding: 10px 0;
	text-align: center;
	color: #fff;
	justify-content: space-between;
	min-height: 130px;
	align-items: center;
}

#footer .footer1 {
	width: 200px;
	height: 80px;
}

#footer img {
	height: 70px;
	opacity: 0.8;
	padding-left: 5px;
}

#footer .footer2 {
	width: 80%;
}

#footer .footer2 .footer2-1 {
	width: 100%;
	height: 50px;
	text-align: center;
}

#footer .footer2 .footer2-1 ul {
	padding-top: 24px;
}

#footer .footer2 .footer2-1 li {
	display: inline-block;
	border-right: 1px solid #fff;
}

#footer .footer2 .footer2-1 li:last-child {
	border: 0;
}

#footer .footer2 .footer2-1 li a {
	padding: 10px;
	color: #f6f8fa;
	font-family: 'Cafe24SsurroundAir';
}

#footer .footer2 .footer2-1 li a:hover {
	text-decoration: underline;
}

#footer .footer2 .footer2-2 {
	width: 100%;
	height: 50px;
	text-align: center;
	padding-top: 10px;
	box-sizing: border-box;
	font-family: 'Cafe24SsurroundAir';
}

#header img {
	height: 75px;
}
</style>
</head>
<body>
	<div id="wrap">
		<header id="header">
			<div class="header_container">
				<h1 class="logo">
					<a href="/" class="logo"><img src="/img/logo.png"></a>
				</h1>
				<div class="intro">
					<h2>BOBIT 팀원소개</h2>
				</div>
				<button type="button" class="back">이전으로</button>
			</div>
		</header>
		<div class="card">
			<div class="tabs">
				<ul>
					<li class="active">BOBIT</li>
					<li>이성진</li>
					<li>이유진</li>
					<li>이태형</li>
				</ul>
			</div>
			<div class="team">
				<div class="team-info active">
					<!-- BOBIT 정보 -->
					<div>
						<img src="/img/ch_BI.gif">
					</div>
					<h2>BOBIT 팀</h2>
					<p>2023.09 ~ 현재 팀프로젝트 개발중입니다.</p>
					<p>혼밥말고 함께 밥잇 하실래요?</p>
				</div>
				<div class="team-info">
					<!-- 이성진 정보 -->
					<div>
						<img src="/img/ch_SJ.gif">
					</div>
					<h2>이성진</h2>
					<p>웹 개발? 껌값이지 자신감 뿜뿜~</p>
				</div>
				<div class="team-info">
					<!-- 이유진 정보 -->
					<div>
						<img src="/img/ch_YJ.gif">
					</div>
					<h2>이유진</h2>
					<p>후... 힘들었어요...</p>
				</div>
				<div class="team-info">
					<!-- 이태형 정보 -->
					<div>
						<img src="/img/ch_TH.gif">
					</div>
					<h2>이태형</h2>
					<p>팀 리더로서 팀원들을 이끌며 개발하는 멋쟁이</p>
				</div>
			</div>
		</div>
		<footer id="footer">
			<div class="footer1">
				<img alt="footerLogo" src="/img/logo-b.png">
			</div>
			<div class="footer2">
				<div class="footer2-1">
					<ul>
						<li><a href="#" class="popup-btn">개인정보처리방침</a></li>
						<li><a href="#" class="popup-btn">저작권보호정책</a></li>
						<li><a href="#" class="popup-btn">이메일무단수집거부</a></li>
					</ul>
				</div>
				<div class="footer2-2">COPYRIGHT 2023, All Rights Reseved</div>
			</div>
		</footer>
		<!-- //footer -->
	</div>
	<script>
        const allTabs = document.querySelectorAll('.tabs li');
        const allTeamInfo = document.querySelectorAll('.team-info');
        
        function removeActive() {
            allTabs.forEach((tab) => {
                tab.classList.remove('active');
            });
            allTeamInfo.forEach((info) => {
                info.classList.remove('active');
            });
        }
        
        allTabs.forEach((tab, index) => {
            tab.addEventListener('click', () => {
                removeActive();
                tab.classList.add('active');
                allTeamInfo[index].classList.add('active');
            });
        });
    </script>
    <script>
     document.querySelector('.back').onclick = function(){
         history.back();
     }
    </script>
</body>
</html>
