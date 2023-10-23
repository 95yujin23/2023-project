<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<nav class="navbar">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a href="" class="nav-link">공지사항 관리</a>
            <ul class="navbar-nav subnav">
                <li class="nav-item"><a href="/Board/list" class="nav-link">공지사항 목록</a></li>
                <li class="nav-item"><a href="/AddBoard" class="nav-link">공지사항 등록</a></li>
                <li class="nav-item"><a href="" class="nav-link"></a></li>
            </ul>
        </li>
        <li class="nav-item"><a href="">자유게시판 관리</a>
            <ul class="navbar-nav subnav">
                <li class="nav-item"><a href="/Free/list" class="nav-link">상품목록</a></li>
                <li class="nav-item"><a href="/AddProduct" class="nav-link">상품등록</a></li>
                <li class="nav-item"><a href="/AddReceive" class="nav-link">입고</a></li>
                <li class="nav-item"><a href="" class="nav-link"></a></li>
            </ul>
        </li>
        <li class="nav-item"><a href="">커뮤니티 게시판 관리</a>
            <ul class="navbar-nav subnav">
                <li class="nav-item"><a href="/ProList" class="nav-link">상품목록</a></li>
                <li class="nav-item"><a href="/AddProduct" class="nav-link">상품등록</a></li>
                <li class="nav-item"><a href="/AddReceive" class="nav-link">입고</a></li>
                <li class="nav-item"><a href="" class="nav-link"></a></li>
            </ul>
        </li>
    </ul>
</nav>