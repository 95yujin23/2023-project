<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/css/main1.css">
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

<script type="text/javascript">
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
