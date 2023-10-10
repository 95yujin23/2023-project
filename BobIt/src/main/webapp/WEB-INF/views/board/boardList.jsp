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
<title>게시판</title>
<!-- 헤드 부분 인클루드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body id="page-top">
	<div class="page">
		<!-- Begin Header -->
		<jsp:include page="../include/hd.jsp"></jsp:include>
		<!-- End Header -->

		<!-- Begin Page Content -->
		<div class="page-content d-flex align-items-stretch">
			<!-- Begin Left Sidebar -->
			<div class="default-sidebar">
				<!-- Begin Side Navbar -->
				<nav class="side-navbar box-scroll sidebar-scroll">
					<!-- Begin Main Navigation -->
					<ul class="list-unstyled">
						<li><a href="#dropdown-admin" aria-expanded="false"
							data-toggle="collapse"> <i class="la la-cog"></i><span>메인메뉴</span>
						</a>
							<ul id="dropdown-admin" class="collapse list-unstyled pt-0"
								data-step="1">
								<li><a href="#">서브메뉴</a></li>
							</ul></li>
						<li><a href="#dropdown-member" aria-expanded="false"
							data-toggle="collapse"> <i class="la la-user"></i><span>메인메뉴</span>
						</a>
							<ul id="dropdown-member" class="collapse list-unstyled pt-0"
								data-step="1">
								<li><a href="#">서브메뉴</a></li>
							</ul></li>
						<li><a href="#dropdown-parking" aria-expanded="false"
							data-toggle="collapse"> <i class="la la-share-alt"></i><span>메인메뉴</span>
						</a>
							<ul id="dropdown-parking" class="collapse list-unstyled pt-0"
								data-step="1">
								<li><a href="#">서브메뉴</a></li>
							</ul></li>
						<li><a href="#dropdown-gogo" aria-expanded="false"
							data-toggle="collapse"> <i class="la la-car"></i><span>메인메뉴</span>
						</a>
							<ul id="dropdown-gogo" class="collapse list-unstyled pt-0"
								data-step="1">
								<li><a href="#">서브메뉴</a></li>
							</ul></li>
						<li><a href="#dropdown-customer" aria-expanded="false"
							data-toggle="collapse"> <i class="la la-phone"></i><span>메인메뉴</span>
						</a>
							<ul id="dropdown-customer" class="collapse list-unstyled pt-0"
								data-step="1">
								<li><a href="#">서브메뉴</a></li>
							</ul></li>
						<li><a href="#dropdown-payment" aria-expanded="false"
							data-toggle="collapse"> <i class="la la-credit-card"></i><span>메인메뉴</span>
						</a>
							<ul id="dropdown-payment" class="collapse list-unstyled pt-0"
								data-step="1">
								<li><a href="#">서브메뉴</a></li>
							</ul></li>
						<li><a href="#dropdown-service" aria-expanded="false"
							data-toggle="collapse"> <i class="la la-wrench"></i><span>메인메뉴</span>
						</a>
							<ul id="dropdown-service" class="collapse list-unstyled pt-0"
								data-step="1">
								<li><a href="#">서브메뉴</a></li>
							</ul></li>
					</ul>
					<!-- End Main Navigation -->
				</nav>
				<!-- End Side Navbar -->
			</div>
			<!-- End Left Sidebar -->



			<!-- c-list + c-evaluation -->
			<section class="c-list c-evaluation">
				<div class="center-ct">
					<div class="c-list-area">
						<div class="c-list-top">
							<div class="tit">게시판</div>
						</div>

						<div class="c-list-main">
							<div class="c-list-search-area">
								<div class="c-list-search-bundle">
									<!-- <div class="c-list-search-item">
												<div class="tit">매칭상태</div>
												<div class="con">
													<div class="c-checkbox">
														<input type="checkbox" id="evaluation-state-1"
															name="evaluation-state-1"> <label
															for="evaluation-state-1">진행중</label>
													</div>
													<div class="c-checkbox">
														<input type="checkbox" id="evaluation-state-2"
															name="evaluation-state-2"> <label
															for="evaluation-state-2">종료</label>
													</div>
												</div>
											</div> -->
									<!-- full-item : 검색영역을 꽉채울 경우 추가 -->
									<div class="c-list-search-item full-item">
										<div class="tit">검색</div>
										<div class="con">
											<input type="text" id="" name="" placeholder="검색어">
										</div>
										<div class="c-list-search-btn">
											<button type="button" class="c-default-btn08 search-btn"
												onclick="">
												<span>검색</span>
											</button>
										</div>
									</div>
								</div>
							</div>

							<!-- c-list-header-table : 리스트 header 테이블 -->
							<div class="c-list-table-area c-list-header-table">
								<table class="c-list-table">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="vo" varStatus="status">
											<tr>
												<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardNo}</a></td>
												<td><a href="/board/selectBoard/${vo.boardNo}">${vo.boardSj}</a></td>
												<td>${vo.memNick}</td>
												<td>${vo.boardDate}</td>
												<td><a href="deleteBoard/${vo.boardNo}" class="button">삭제</a>
													<a href="updateBoard/${vo.boardNo}" class="button">수정</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<%-- <c:if test='${sid eq "admin"}'>  --%>
								<div class="button-group">
									<a class="col3 button" href="insertBoard"><span>등록</span></a>
								</div>
								<%-- </c:if> --%>
							</div>



							<div class="c-list-paging-area">
								<ul class="c-list-paging">
									<li class="arrow first-arrow disabled"><a href="#"></a></li>
									<li class="arrow prev-arrow disabled"><a href="#"></a></li>
									<li class="on"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li class="arrow next-arrow disabled"><a href="#"></a></li>
									<li class="arrow last-arrow disabled"><a href="#"></a></li>
								</ul>
			</section>
		</div>

	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/ft.jsp"></jsp:include>
	</div>
	<!-- End Page Content -->
</body>
</html>