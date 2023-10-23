<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOBIT소개페이지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        ul,
        li {
            list-style: none;
        }

        a {
            color: #000;
            text-decoration: none;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background: #dcbbaa70;
            min-height: 100vh;
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

        .container {
            width: 90%;
            min-height: 1000px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .container>div:hover {
            border-radius: 30px;
            scale: 1.1;
        }

        .container .card {
            position: relative;
            width: 600px;
            height: 700px;
            margin: 50px;
            box-shadow: 0 20px 50px rgba(72, 39, 4, 0.81);

        }

        .container .card:hover {
            background: #f1d9cca3;
            overflow: hidden;
            opacity: 1;
        }

        .container .card::before {
            content: '';
            position: absolute;
            left: 2px;
            top: 2px;
            bottom: 2px;
            width: 60%;
            background: rgb(92, 53, 18);
            pointer-events: none;
            border-radius: 0 1000px 1000px 0;
            opacity: 0.2;
        }

        .container .card:hover::before {
            background-color: #6f3804;
            opacity: 0.5;
        }

        .container .card .content {
            padding: 30px;
            text-align: center;
        }

        .container .card .content h2 {
            position: absolute;
            right: 30px;
            top: 15px;
            font-size: 4rem;
            color: #0f0058;
            font-weight: 800;
            opacity: 0.2;
            transition: all 0.5s;
        }

        .container .card:hover .content h2 {
            opacity: 1;
        }

        .container .card .content h3 {
            position: absolute;
            width: 100%;
            left: 50%;
            transform: translateX(-50%);
            top: 130px;
            font-size: 1.5rem;
            color: #630000;
            opacity: 0.2;
            letter-spacing: 3px;
            transition: all 0.5s;
            font-size: 30px;
        }

        .container .card:hover .content h3 {
            opacity: 1;
        }

        .container .card .content p {
            position: absolute;
            width: 90%;
            left: 50%;
            transform: translateX(-50%);
            top: 220px;
            font-size: 1rem;
            color: #00082e;
            opacity: 0.2;
            overflow: hidden;
            text-overflow: ellipsis;
            word-wrap: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 8;
            -webkit-box-orient: vertical;
            font-size: 23px;
            line-height: 2;
            text-align: left;
        }

        .container .card:hover .content p {
            opacity: 1;
        }

        .container .card .content a {
            text-decoration: none;
            display: inline-block;
            padding: 8px 15px;
            font-size: 1rem;
            color: #a7d7ff;
            font-weight: 500;
            text-transform: uppercase;
            background: #e3ebff;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: 30px;
            transition: all 0.5s;
        }

        .container .card:hover .content a {
            background: #4c7fff;
            color: #ffe6e6;
            border-radius: 20px;
        }

        .container .card span {
            transition: all 0.5s;
            opacity: 0;
        }

        .container .card:hover span {
            opacity: 1;
        }

        .container .card span:nth-child(1) {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(to right, transparent, #1779ff);
            animation: animate 2s linear infinite;
        }

        .container .card span:nth-child(2) {
            position: absolute;
            right: 0;
            top: 0;
            width: 3px;
            height: 100%;
            background: linear-gradient(to bottom, transparent, #1779ff);
            animation: animate2 2s linear infinite;
            animation-delay: 1s;
        }

        .container .card span:nth-child(3) {
            position: absolute;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(to left, transparent, #1779ff);
            animation: animate3 2s linear infinite;
            animation-delay: 2s;
        }

        .container .card span:nth-child(4) {
            position: absolute;
            left: 0;
            top: 0;
            width: 3px;
            height: 100%;
            background: linear-gradient(to top, transparent, #1779ff);
            animation: animate4 2s linear infinite;
            animation-delay: 3s;
        }

        @keyframes animate {
            0% {
                transform: translateX(-100%);
            }

            100% {
                transform: translateX(100%);
            }
        }

        @keyframes animate2 {
            0% {
                transform: translateY(-100%);
            }

            100% {
                transform: translateY(100%);
            }
        }

        @keyframes animate3 {
            0% {
                transform: translateX(100%);
            }

            100% {
                transform: translateX(-100%);
            }
        }

        @keyframes animate4 {
            0% {
                transform: translateY(100%);
            }

            100% {
                transform: translateY(-100%);
            }
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

        .backHome {
            width: 100%;
            height: 50px;
            margin: 0 auto;
            text-align: center;
            margin-bottom: 20px;
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
                    <h2>BOBIT을 소개합니다.</h2>
                </div>
                <button type="button" class="back">이전으로</button>
            </div>
        </header>
        <div class="container">
            <div class="card">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <div class="content">
                    <h2>01</h2>
                    <h3>BOBIT은 왜 BOBIT(밥잇)인가요?</h3>
                    <p>네이밍을 할 때 서로 만나 밥을 먹는 것을 <br> 밥상을 잇다로 표현하면 어떨까 하는 생각과<br>
                        먹다의 발음이 잇이라 <br>밥을먹다로 풀어내보았습니다.</p>
                </div>
            </div>
            <div class="card">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <div class="content">
                    <h2>02</h2>
                    <h3>BOBIT을 소개해주세요</h3>
                    <p>BOBIT은 혼자 밥을 먹게 되면 의사소통이 없고 <br> 밥을 먹으면서 휴대폰 등의 전자기기를 쳐다보는 <br>모습을
                        자주 접할 수 있는데 같이 먹음으로써 <br> 정서적인 행복을 얻을 수 있고 <br>또한, 까다로운
                        입맛을 고칠 수 있다는 <br>연구 결과를 보고 혼자 밥을 먹는 사람들끼리 <br>매칭하여 서로 만나
                        밥을 먹는 것은 어떨까 하며 <br> 제작하게 되었습니다.</p>
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
    </div>
    <script>
        document.querySelector('.back').onclick = function() {
            history.back();
        }
    </script>
</body>

</html>