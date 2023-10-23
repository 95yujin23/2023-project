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
<link rel="stylesheet" href="/css/home1.css">
</head>
<body id="page-top">
	<div id="wrap">
		<aside id="aside">
			<h1 class="logo">
				<a href="/"><img alt="logo" src="/img/long_logo.png"></a>
			</h1>
			<nav class="nav">
				<ul>
					<li><a href="#">메뉴1</a>
						<ul class="submenu">
							<li><a href="#">서브메뉴1-1</a></li>
							<li><a href="#">서브메뉴1-2</a></li>
							<li><a href="#">서브메뉴1-3</a></li>
							<li><a href="#">서브메뉴1-4</a></li>
						</ul></li>
					<li><a href="#">메뉴2</a>
						<ul class="submenu">
							<li><a href="#">서브메뉴2-1</a></li>
							<li><a href="#">서브메뉴2-2</a></li>
							<li><a href="#">서브메뉴2-3</a></li>
							<li><a href="#">서브메뉴2-4</a></li>
						</ul></li>
					<li><a href="#">메뉴3</a>
						<ul class="submenu">
							<li><a href="#">서브메뉴3-1</a></li>
							<li><a href="#">서브메뉴3-2</a></li>
							<li><a href="#">서브메뉴3-3</a></li>
							<li><a href="#">서브메뉴3-4</a></li>
						</ul></li>
					<li><a href="#">메뉴4</a>
						<ul class="submenu">
							<li><a href="#">서브메뉴4-1</a></li>
							<li><a href="#">서브메뉴4-2</a></li>
							<li><a href="#">서브메뉴4-3</a></li>
							<li><a href="#">서브메뉴4-4</a></li>
						</ul></li>
				</ul>
			</nav>

		</aside>
		<!-- //aside -->

		<main id="main">
			<article id="slider">
				<div class="sliderWrap">
					<div class="slide">
						<!-- <h1>BOBIT</h1>
						<p>맛있는 밥 함께 먹어요</p> -->
						<div class="slide_link">
							<a href="/join"><button onclick="location.href='/join'" class="btn-link">가입하기</button></a>
							<br><br>
							<a href="/login"><button onclick="location.href='/login'" class="btn-link">로그인</button></a>
						</div>

					</div>
				</div>
			</article>
			<!-- //slider -->

			<!-- <article id="link"></article>
			//link

			<section id="contents">
				<div class="content1"></div>
				<div class="content2"></div>
			</section>
			//contents -->
		</main>
		<!-- //main -->

		<footer id="footer">
			<div class="copy">
				© 2023 Project BOBIT Corp.
			</div>
		</footer>
		<!-- //footer -->
	</div>
	<!-- //wrap -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- <script>
        $(function(){
            $(".nav > ul > li").mouseover(function(){
                $(this).find(".submenu").stop().slideDown();
            });
            $(".nav > ul > li").mouseout(function(){
                $(this).find(".submenu").stop().slideUp();
            });
        })
    </script> -->
	<script>
        window.onload = function(){
            let navList = document.querySelectorAll(".nav > ul > li");

            navList.forEach(navItem => {
                navItem.addEventListener("mouseover", function() {
                    this.querySelector(".submenu").style.height = "155px";
                });
            });
            navList.forEach(navItem => {
                navItem.addEventListener("mouseout", function() {
                    this.querySelector(".submenu").style.height = "0px";
                });
            });
        }
    </script>
</body>
</html>