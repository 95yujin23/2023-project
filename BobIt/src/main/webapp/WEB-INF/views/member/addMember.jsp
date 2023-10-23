<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/join1.css">
    <link rel="stylesheet" href="/css/main1.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
#form__wrap {
margin: 20px auto;
width: 800px;
font-size: 14px;
}

#form__wrap .terms__check__all {
display: flex;
margin-bottom: 35px;
}

#form__wrap .terms__check__all label {
margin-left: 3px;
text-decoration: underline;
}

.terms__list .terms__box {
margin: 20px 0;
}

.contents label {
font-weight: 700;
}

label.required::after {
margin-left: 4px;
font-size: 13px;
font-weight: 400;
line-height: 24px;
color: #0086ff;
content: "(필수)";
}

.terms__list .terms__content {
height: 88px;
overflow: auto;
margin-top: 8px;
padding: 12px;
border: 1px solid #dadada;
background: #fff;
font-size: 12px;
}

.next-button {
width: 100%;
height: 50px;
outline: none;
cursor: pointer;
background-color: #6f5035;
color: #ffffff;
border: none;
border-radius: 5px;
transition-duration: 0.2s;
}

.next-button:hover:enabled {
background-color: #a3a2a2;
}

.next-button:disabled {
opacity: 0.2;
cursor: not-allowed;
}

@media ( max-width : 768px) {
.wrap {
min-width: 280px;
padding: 20px;
}
#form__wrap {
max-width: 460px;
width: auto;
}
}

.contents {
display: block;
padding: 20px;
background-color: #99a3c41c;
}

.contents.active {
display: none; /* 버튼 클릭 시 내용을 접음 */
}

.contents.active {
background-color: #fff;
box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
}
.contents.active::before, .contents.active::after {
content: '\f075';
font-family: 'Font Awesome 5 Free';
color: #2ecc71;
font-size: 7rem;
position: absolute;
opacity: 0.2;
top: 20px;
left: 20px;
z-index: 0;
}
.contents.active::before {
color: #3498db;
top: -10px;
left: -30px;
transform: rotateY(180deg);
}
</style>
    <title>회원가입</title>
</head>

<body>
    <header id="header" class="header">
        <jsp:include page="../include/hd.jsp"></jsp:include>
    </header>
<aside class="contents">
<form action="/" method="POST" id="form__wrap">
<div class="board_title">
<strong>약관동의</strong>
</div>
<div class="terms__check__all">
<input type="checkbox" name="checkAll" id="checkAll" /> <label
for="checkAll">BOBIT 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두
동의합니다.</label>
</div>
<ul class="terms__list">
<li class="terms__box">
<div class="input__check">
<input type="checkbox" name="agreement" id="termsOfService"
value="termsOfService" required /> <label for="termsOfService"
class="required">BOBIT 이용약관 동의</label>
</div>
<div class="terms__content">여러분을 환영합니다. BOBIT 서비스 및 제품(이하
‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 BOBIT 서비스의 이용과 관련하여 BOBIT 서비스를
제공하는 BOBIT 주식회사(이하 ‘BOBIT’)와 이를 이용하는 BOBIT 서비스 회원(이하 ‘회원’) 또는
비회원과의 관계를 설명하며, 아울러 여러분의 BOBIT 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고
있습니다. BOBIT 서비스를 이용하시거나 BOBIT 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영
정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</div>
</li>
<li class="terms__box">
<div class="input__check">
<input type="checkbox" name="agreement" id="privacyPolicy"
value="privacyPolicy" required /> <label for="privacyPolicy"
class="required">개인정보 수집 및 이용 동의</label>
</div>
<div class="terms__content">개인정보보호법에 따라 BOBIT에 회원가입 신청하시는 분께
수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시
불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. BOBIT은 회원제 서비스를 이용하기
위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</div>
</li>

<li class="terms__box">
<div class="input__check">
<input type="checkbox" name="agreement" id="allowPromotions"
value="allowPromotions" /> <label for="allowPromotions">프로모션
정보 수신 동의</label>
</div>
<div class="terms__content">BOBIT에서 제공하는 이벤트/혜택 등 다양한 정보를
휴대전화(BOBIT앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나
BOBIT 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수
있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.</div>
</li>
</ul>
<button type="button" class="next-button" id="confirmButton" disabled>확인</button>

</form>
</aside>    
    <main>
	<div class="blur"></div>
        <form method="post" enctype="multipart/form-data" class="joinForm">
            <div class="joinBtn">
                <h2>회원가입</h2>
                <div class="textForm">
                    <span>아이디 :</span> <input name="memId" type="text" class="id" placeholder="아이디" required></input>
                </div>
                <div class="textForm">
                    <span>비밀번호 :</span> <input name="memPwd" type="password" class="pw" placeholder="비밀번호" required>
                </div>
                <div class="textForm">
                    <span>닉네임 :</span> <input name="memNick" type="text" class="name" placeholder="닉네임" required>
                </div>
                <div class="textForm">
                    <span>이메일 :</span> <input name="memMail" type="text" class="email" placeholder="이메일" required>
                </div>
                <div class="textForm">
                    <span>성별 :</span> <select name="memFm">
                        <option value="0">성별을 선택하세요</option>
                        <option value="남">남성</option>
                        <option value="여">여성</option>
                    </select>
                </div>
                <div class="textForm">
                    <span>나이 :</span> <input name="memAge" type="number" class="memAge" placeholder="나이" required>
                </div>
                <div class="textForm">
                    <span>지역 :</span> <select name="sido1" id="sido1"></select> <select name="gugun1" id="gugun1"></select> <input type="text" name="memArea" style="display: none;">
                </div>
                <input type="submit" class="btn" value="J O I N" />
            </div>
        </form>
    </main>
    <footer id="footer">
        <jsp:include page="../include/ft.jsp"></jsp:include>
    </footer>
<section class="popup-wrap">
<div class="popup-view">
<h3>기능준비중입니다.</h3>
<p>
안녕하세요. BOBIT입니다.<br> 아직 개발중인 기능입니다.<br> 감사합니다.
</p>
<a href="#" class="popup-close">닫기</a>
</div>
</section>
    <script>
        $('document')
            .ready(
                function() {
                    var area0 = ["시/도 선택", "서울", "인천", "대전", "광주", "대구",
                        "울산", "부산", "경기", "강원", "충북", "충남", "전북", "전남",
                        "경북", "경남", "제주특별자치도", "세종특별자치시"
                    ];
                    var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
                        "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
                        "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구",
                        "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"
                    ];
                    var area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구",
                        "연수구", "중구", "강화군", "옹진군"
                    ];
                    var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
                    var area4 = ["광산구", "남구", "동구", "북구", "서구"];
                    var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구",
                        "중구", "달성군"
                    ];
                    var area6 = ["남구", "동구", "북구", "중구", "울주군"];
                    var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구",
                        "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
                        "중구", "해운대구", "기장군"
                    ];
                    var area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
                        "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
                        "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
                        "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
                        "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"
                    ];
                    var area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
                        "태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
                        "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"
                    ];
                    var area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군",
                        "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"
                    ];
                    var area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시",
                        "아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
                        "연기군", "예산군", "청양군", "태안군", "홍성군"
                    ];
                    var area12 = ["군산시", "김제시", "남원시", "익산시", "전주시",
                        "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
                        "임실군", "장수군", "진안군"
                    ];
                    var area13 = ["광양시", "나주시", "목포시", "순천시", "여수시",
                        "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
                        "보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
                        "장흥군", "진도군", "함평군", "해남군", "화순군"
                    ];
                    var area14 = ["경산시", "경주시", "구미시", "김천시", "문경시",
                        "상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
                        "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
                        "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"
                    ];
                    var area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시",
                        "양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
                        "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
                        "함안군", "함양군", "합천군"
                    ];
                    var area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];
                    var area17 = ["세종"];

                    // 시/도 선택 박스 초기화

                    $("select[name^=sido]")
                        .each(
                            function() {
                                $selsido = $(this);
                                $
                                    .each(
                                        eval(area0),
                                        function() {
                                            $selsido
                                                .append("<option value='" + this + "'>" +
                                                    this +
                                                    "</option>");
                                        });
                                $selsido
                                    .next()
                                    .append(
                                        "<option value=''>구/군 선택</option>");
                            });

                    // 시/도 선택시 구/군 설정

                    $("select[name^=sido]")
                        .change(
                            function() {
                                var area = "area" +
                                    $("option", $(this))
                                    .index(
                                        $(
                                            "option:selected",
                                            $(this))); // 선택지역의 구군 Array
                                var $gugun = $(this).next(); // 선택영역 군구 객체
                                $("option", $gugun).remove(); // 구군 초기화

                                if (area == "area0")
                                    $gugun
                                    .append("<option value=''>구/군 선택</option>");
                                else {
                                    $
                                        .each(
                                            eval(area),
                                            function() {
                                                $gugun
                                                    .append("<option value='" + this + "'>" +
                                                        this +
                                                        "</option>");
                                            });
                                }
                            });
                    // 시/도와 구/군 선택이 변경될 때 memArea 업데이트
                    $("select[name^=sido]").change(function() {
                        updateMemArea();
                    });

                    $("select[name^=gugun]").change(function() {
                        updateMemArea();
                    });

                    function updateMemArea() {
                        var selectedSido = $("option:selected",
                            $("select[name=sido1]")).text();
                        var selectedGugun = $("option:selected",
                            $("select[name=gugun1]")).text();
                        var memAreaField = $("input[name=memArea]");

                        if (selectedSido !== "시/도 선택" &&
                            selectedGugun !== "구/군 선택") {
                            memAreaField.val(selectedSido + " " +
                                selectedGugun);
                        } else {
                            memAreaField.val(""); // 선택이 초기 값인 경우 지역 값을 비움
                        }
                    }
                });
    </script>
    <script>
    $('document').ready(function() {

        $("form").submit(function(event) {
            var id = $("input[name='memId']").val();
            var pw = $("input[name='memPwd']").val();
            var name = $("input[name='memNick']").val();
            var email = $("input[name='memMail']").val();
            var age = $("input[name='memAge']").val();
            var area = $("input[name='memArea']").val();

            if (id === '' || pw === '' || name === '' || email === '' || age === '' || area === '') {
                event.preventDefault(); // 폼 제출 막기

                alert("입력하지 않은 정보가 있습니다."); // 알림 표시
            }
        });
    });
    </script>

    <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
document.addEventListener("DOMContentLoaded", function () {
const form = document.querySelector("#form__wrap");
const checkBoxes = document.querySelectorAll(".input__check input");
const checkAll = document.querySelector(".terms__check__all input");
const submitButton = document.querySelector("button#confirmButton");
const contents = document.querySelector(".contents");

const agreements = {
termsOfService: false,
privacyPolicy: false,
allowPromotions: false
};

form.addEventListener("submit", (e) => {
if (!agreements.termsOfService || !agreements.privacyPolicy) {
e.preventDefault(); // 약관 동의가 필요합니다.
alert("약관에 동의해야 합니다.");
}
});

checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

function toggleCheckbox(e) {
const { checked, id } = e.target;
agreements[id] = checked;
this.parentNode.classList.toggle("active");
checkAllStatus();
}

function checkAllStatus() {
const { termsOfService, privacyPolicy, allowPromotions } = agreements;
if (termsOfService && privacyPolicy && allowPromotions) {
checkAll.checked = true;
} else {
checkAll.checked = false;
}
toggleSubmitButton();
}

function toggleSubmitButton() {
const { termsOfService, privacyPolicy } = agreements;
if (termsOfService && privacyPolicy) {
submitButton.disabled = false;
} else {
submitButton.disabled = true;
}
}

checkAll.addEventListener("click", (e) => {
const { checked } = e.target;
checkBoxes.forEach((item) => {
item.checked = checked;
agreements[item.id] = checked;
item.parentNode.classList.toggle("active", checked);
});
toggleSubmitButton();
});

submitButton.addEventListener("click", (e) => {
contents.classList.toggle("active"); // 약관 내용 확장/축소
});
});
    </script>
</body>

</html>