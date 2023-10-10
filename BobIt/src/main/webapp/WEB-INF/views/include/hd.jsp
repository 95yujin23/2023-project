<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>

<header class="header">
	<h1 class="not-view">header</h1>

	<div class="h-main-area">
		<div class="center-ct">
			<div class="navbar-header">
				<a href="/temp" class="navbar-brand"> <img src="/img/logo_bl.png"
					alt="logo" class="logo-big"><br> 
				</a>
				
			</div>

			<ul class="h-main-menu cf">
				<li><a href="javascript:void(0);" class="myinfo-btn on">관리자님</a>
				</li>
				<li>
					<button type="button" class="c-default-btn01 logout-btn"
						onclick="location.href='/login';">
						<span>로그아웃</span>
					</button>
				</li>
			</ul>
		</div>
	</div>
</header>