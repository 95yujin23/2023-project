<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
	const msg = "${msg}";
	if(msg)
		alert(msg);
</script>
</head>
<body>
	<div class="container">
		<div>
			<h1>폴리북스</h1>
		</div>
		<nav>

		</nav>
		<div>
			<ul>
				<li><a href="book/list">도서관리</a>
				<li><a href="customer/list">고객관리</a>
				<li><a href="orders/list">주문관리</a>				
			</ul>
		</div>
	</div>
</body>
</html>