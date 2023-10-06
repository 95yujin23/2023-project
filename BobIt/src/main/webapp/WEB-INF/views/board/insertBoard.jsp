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
<title>글쓰기</title>
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

			<div class="content-inner">
				<div class="container-fluid">

					<!-- c-list + c-evaluation -->
					<section class="c-list c-evaluation">
						<div class="center-ct">
							<div class="c-list-area">
								<div class="c-list-top">
									<div class="tit">글쓰기</div>
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
											</div>
										</div>
										<div class="c-list-search-bundle">
											<div class="c-list-search-btn">
												<button type="button" class="c-default-btn08 search-btn"
													onclick="">
													<span>검색</span>
												</button>
											</div>
										</div>
									</div>

									<!-- c-list-header-table : 리스트 header 테이블 -->
									<div class="c-list-table-area c-list-header-table">
										<div>
											<label class="col1">제목 : </label> <br> <input
												type="text" name="boardSj" class="col2">
										</div>

										<div>
											<label class="col1">작성자 : </label> <br> <input
												type="text" name="memNick" class="col2">
										</div>

										<div>
											<label class="col1"> 내용 : </label> <br>
											<textarea rows=10 cols=30 wrap=off name="boardCn"
												class="col4"></textarea>
										</div>

										<div class="submitBt">
											<button class="col3 button">등록</button>
											<a href="boardList"><button type="button"
													class="col3 button">목록</button></a>
										</div>
									</div>



									
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- 푸터 부분 인클루드 -->
			<jsp:include page="../include/ft.jsp"></jsp:include>
		</div>
	</div>
	<!-- End Page Content -->
	</div>
</body>
</html>