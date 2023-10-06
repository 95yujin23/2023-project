<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>BOBIT 관리자</title>
		<meta name="description" content="BOBIT 관리자">
		<meta name="author" content="minks">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <!-- Google Fonts -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
        <script>
          WebFont.load({
            google: {"families":["Montserrat:400,500,600,700","Noto+Sans:400,700"]},
            active: function() {
                sessionStorage.fonts = true;
            }
          });
        </script>
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/img/favicon.ico">
		<link rel="apple-touch-icon" href="assets/img/favicon.ico">
        
        <!-- Stylesheet -->
        <link type="text/css" rel="stylesheet" href="assets/css/reset.css">
        <link type="text/css" rel="stylesheet" href="assets/vendors/css/base/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="assets/vendors/css/base/elisyam-1.5.min.css">
        <link type="text/css" rel="stylesheet" href="assets/css/datepicker/daterangepicker.css">
        <link type="text/css" rel="stylesheet" href="assets/css/datepicker/bootstrap-datepicker3.css">
        <link type="text/css" rel="stylesheet" href="assets/css/datepicker/bootstrap-timepicker.css">
        <link type="text/css" rel="stylesheet" href="assets/css/swiper.min.css">
        <link type="text/css" rel="stylesheet" href="assets/css/slick.css">
        <link type="text/css" rel="stylesheet" href="assets/css/slick-theme.css">
        <link type="text/css" rel="stylesheet" href="assets/css/main.css">
        <link type="text/css" rel="stylesheet" href="assets/css/admin-main.css">
        
        <!-- Tweaks for older IEs -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <!-- Begin Vendor Js -->
        <script src="assets/vendors/js/base/jquery.min.js"></script>
        <script src="assets/vendors/js/base/core.js"></script>
        <script src="assets/js/jquery-ui-sortable.js"></script>
        <!-- End Vendor Js -->
        
        <!-- Begin Page Vendor Js -->
        <script src="assets/vendors/js/nicescroll/nicescroll.min.js"></script>
        <script src="assets/vendors/js/chart/chart.min.js"></script>
        <script src="assets/vendors/js/datepicker/moment.min.js"></script>
        <script src="assets/vendors/js/datepicker/moment-with-locales.js"></script>
        <script src="assets/vendors/js/datepicker/daterangepicker.js"></script>
        <script src="assets/vendors/js/datepicker/bootstrap-datepicker.js"></script>
        <script src="assets/vendors/js/datepicker/bootstrap-datepicker.ko.min.js"></script>
        <script src="assets/vendors/js/datepicker/bootstrap-timepicker.js"></script>
        <script src="assets/vendors/js/app/app.js"></script>
        <!-- End Page Vendor Js -->
        
        <!-- Begin Page Snippets -->
        <script src="assets/js/components/validation/validation.min.js"></script>
        <script src="assets/js/components/datepicker/datepicker.js"></script>
        <script src="assets/js/swiper.min.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/admin-main.js"></script>
        <!-- End Page Snippets -->
	</head>

	<body class="bg-navy">
        <!-- Begin Preloader -->
        <div id="preloader">
            <div class="canvas">
                <img src="" alt="preloader-img" class="loader-logo">
                <div class="spinner"></div>   
            </div>
        </div>
        <!-- End Preloader -->
        
        <!-- Begin Container -->
        <div class="container-fluid no-padding h-100">
            <!-- Begin Row -->
            <div class="row flex-row h-100 bg-navy justify-content-center">
                <!-- Begin Right Content -->
                <div class="col my-auto no-padding">
                    <!-- Begin Form -->
                    <div class="authentication-form mx-auto">
                        <div class="logo-centered">
                            <img src="" alt="login-img">
                        </div>
                        
                        <h3>BOBIT</h3>
                        
                        <form id="" name="" method="" action="">
                            <div class="group material-input">
							    <input type="text" id="" name="" required>
							    <span class="highlight"></span>
							    <span class="bar"></span>
							    <label>아이디</label>
                            </div>
                            
                            <div class="group material-input">
							    <input type="password" id="" name="" required>
							    <span class="highlight"></span>
							    <span class="bar"></span>
							    <label>비밀번호</label>
                            </div>
                            
                            <!-- login-feedback : 로그인시 유효하지 않을 경우 노출되는 문구, on 클래스가 있을 경우 문구가 노출됨 -->
                            <div class="login-feedback on">가입하지 않은 아이디 이거나, 잘못된 비밀번호 입니다.</div>
                        </form>
                        
                        <div class="sign-btn text-center">
                            <a href="javascript:void(0);" class="btn btn-lg btn-gradient-06" onclick="location.href='index.html';">로그인</a>
                        </div>
                    </div>
                    <!-- End Form -->                        
                </div>
                <!-- End Right Content -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Container -->
        
        <!-- Begin Modal -->
        <!-- alert창 -->
        <div id="modal-alert" class="modal fade">
            <div class="modal-background"></div>
            <div class="modal-dialog modal-sm modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="modal-body-text mt-3 mb-3"></div>
                    </div>
                    <div class="modal-footer justify-content-center p-0">
                        <button type="button" class="btn btn-style01 w-100 m-0 btn-confirm" data-dismiss="modal"><span>확인</span></button>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" id="modal-alert-btn" class="btn btn-hidden" data-toggle="modal" data-target="#modal-alert">보기</button>
        
        <!-- confirm창 -->
        <div id="modal-confirm" class="modal fade">
            <div class="modal-background"></div>
            <div class="modal-dialog modal-sm modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="modal-body-text mt-3 mb-3"></div>
                    </div>
                    <div class="modal-footer justify-content-center p-0">
                        <button type="button" class="btn btn-style03 w-50 m-0 btn-cancel" data-dismiss="modal"><span>취소</span></button>
                        <button type="button" class="btn btn-style01 w-50 m-0 btn-confirm" data-dismiss="modal"><span>확인</span></button>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" id="modal-confirm-btn" class="btn btn-hidden" data-toggle="modal" data-target="#modal-confirm">보기</button>
        <!-- End Modal -->
        
        <!-- Begin Page Snippets -->
        <script src="assets/js/components/chartjs/chartjs.js"></script>
        <!-- End Page Snippets -->
    </body>
</html>