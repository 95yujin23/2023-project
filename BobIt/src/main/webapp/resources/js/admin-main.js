//메모 일련번호가 없어서 임의로 추가함. 실제 개발시에는 primary key로 설정해주시면 될 것 같습니다.
var tempMemoIdx = 0;

$(function() {
    //header,nav 가로 스크롤되도록 설정
    $("nav.navbar,.default-sidebar").css("left", 0 - $(window).scrollLeft());
    
    //스크롤시
    $(window).on("scroll", function() {
        //header,nav 가로 스크롤되도록 설정
        $("nav.navbar,.default-sidebar").css("left", 0 - $(this).scrollLeft());
    });
    
    //20221213 수정부분 start
    //리사이즈시
    $(window).on("resize", function() {
        if ($(".mri-slide-area").length > 0) {
            //리사이즈시 slick 슬라이드 이미지 높이 동일하게 설정
            var reForImgHeight = 0;
            var reNavImgHeight = 0;

            $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height","");
            $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height","");

            $(".mri-slide-area .slider-for .slick-slide .slider-for-item").each(function() {
                var reForItemHeight = parseFloat($(this).height());

                if (reForItemHeight > reForImgHeight) {
                    reForImgHeight = reForItemHeight;
                }
            });

            $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item").each(function() {
                var reNavItemHeight = parseFloat($(this).find(".slider-nav-image").height());

                if (reNavItemHeight > reNavImgHeight) {
                    reNavImgHeight = reNavItemHeight;
                }
            });

            $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height",reForImgHeight);
            $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height",reNavImgHeight);
        }
    });
    //20221213 수정부분 end
    
    //숫자만 입력
    $(".number-control").on("keyup", function() {
        //20221213 수정부분 start
        $(this).val(addComma($(this).val().replace(/[^0-9]/g,"")));
        //20221213 수정부분 end
    });
    
    //메모 일련번호가 없어서 임의로 추가함. 실제 개발시에는 primary key로 설정해주시면 될 것 같습니다.
    if ($(".memo-area .memo-list").length > 0) {        
        $(".memo-area .memo-list>li").each(function() {
            tempMemoIdx++;
            
            $(this).attr("data-memo-idx",tempMemoIdx);
        });
    }
    
    //20221213 수정부분 start
    //텍스트에 천단위 콤마 추가
    $(".text-add-comma").each(function() {
        $(this).text(addComma($(this).text()));
    });
    
    //숫자 입력창에 천단위 콤마 추가
    $(".number-control").each(function() {
        $(this).val(addComma($(this).val()));
    });
    
    //첨부파일 추가
    $(".file-control-area .file-control-btn .file-control").change(function(event) {
        var agent = navigator.userAgent.toLowerCase(); //브라우저 체크
        var dataName = ($(this).attr("data-name")) ? $(this).attr("data-name") : "fileControl"; //첨부파일 name 값 (기본값 : fileControl)
        var datafile = $(this).clone(true); //첨부파일 복사
        
        var obj = $(this);
        var file = event.target.files[0];
        var reader = new FileReader();
        
        //첨부파일명 추출
        var fileName = "";

        if (window.FileReader) {
            //기본 브라우저
            fileName = $(this)[0].files[0].name;
        } else {
            //old IE
            fileName = $(this).val().split('/').pop().split('\\').pop();
        }
        
        //첨부파일명에서 확장자 제거
        if (fileName != "" && fileName != null && fileName != undefined) {
            var lastDot = fileName.lastIndexOf('.');
            
            fileName = fileName.substring(0,lastDot);
        }
        
        reader.onload = function(e) {
            $(obj).closest(".file-control-area").find(".file-control-list").append(datafile);
            datafile.attr("name", dataName + "[]");
            datafile.wrap("<li></li>");
            datafile.after("<span class='file-control-delete' onclick='delFileControl(this);'><i class='ion-close-circled'></i></span>");
            datafile.after("<span class='file-control-text'>" + fileName + "</span>");
            datafile.after("<span class='file-control-image' style='background-image: url(\"" + e.target.result + "\");'></span>");
        }
        
        //첨부파일 미리보기 경로 추출
        reader.readAsDataURL(file);
        
        //첨부파일 버튼 초기화
        if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
            //브라우저가 ie일 경우
            $(this).replaceWith($(this).clone(true));
        } else {
            //브라우저가 ie가 아닐 경우
            $(this).val("");
        }
    });
    
    if ($(".mri-slide-area").length > 0) {
        //slick 슬라이드 전 기존의 슬라이드가 있을 경우 제거
        if ($(".mri-slide-area .slider-for.slick-initialized").length > 0) {
            $(".mri-slide-area .slider-for").slick("unslick");
        }

        if ($(".mri-slide-area .slider-nav.slick-initialized").length > 0) {
            $(".mri-slide-area .slider-nav").slick("unslick");
        }

        //slick 슬라이드 (등록사진)
        $(".mri-slide-area .slider-for").slick({
            infinite: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            dots: false,
            fade: false,
            asNavFor: '.slider-nav',
            autoplay: false,
            pauseOnHover: true
        });

        $(".mri-slide-area .slider-nav").slick({
            infinite: false,
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: false,
            dots: false,
            fade: false,
            asNavFor: '.slider-for',
            focusOnSelect: true
        });

        //slick 슬라이드 후 이미지 높이 동일하게 설정
        var forImgHeight = 0;
        var navImgHeight = 0;

        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height","");
        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height","");

        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").each(function() {
            var forItemHeight = parseFloat($(this).height());

            if (forItemHeight > forImgHeight) {
                forImgHeight = forItemHeight;
            }
        });

        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item").each(function() {
            var navItemHeight = parseFloat($(this).find(".slider-nav-image").height());

            if (navItemHeight > navImgHeight) {
                navImgHeight = navItemHeight;
            }
        });

        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height",forImgHeight);
        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height",navImgHeight);
    }
    
    //일반주차장 조건에 맞게 항목 초기화
    if ($(".general-parking-form .parking-type-control").length > 0) {
        setParkingType($(".general-parking-form .parking-type-control"));
    }
    //20221213 수정부분 end
    
    //20221220 수정부분 start
    //숫자,-만 입력
    $(".tel-control").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9-]/g,""));
    });
    
    //첨부파일 업로드시 첨부파일명 추출
    $(".file-group .file-control").change(function() {        
        var fileName = "";
        
        if ($(this).val() != "") {
            if (window.FileReader) {
                //기본 브라우저
                fileName = $(this)[0].files[0].name;
            } else {
                //old IE
                fileName = $(this).val().split('/').pop().split('\\').pop();
            }
        }
        
        $(this).closest(".file-group").find(".form-control").val(fileName);
    });
    //20221220 수정부분 end
    
    //20221221 수정부분 start
    //서비스관리에서 구분 조건에 맞게 항목 초기화
    if ($(".service-type-control").length > 0) {
        setServiceType($(".service-type-control"));
    }
    
    //서비스관리에서 대상 조건에 맞게 항목 초기화
    if ($(".service-target-control").length > 0) {
        setServiceTarget($(".service-target-control"));
    }
    
    //서비스관리에서 대상이 회원별일 경우 회원ID 입력창 자동완성
    if ($(".target-member-control").length > 0) {
        //자동완성폼에 노출할 회원ID 데이터를 배열에 담음 (label: 자동완성 선택창에 노출할 텍스트, value: 자동완성 입력폼에 입력할 텍스트, itemIdx: 회원ID 인덱스번호)
        var sourceArr = [
            {label:'jang001@gmail.com',itemIdx:'111'},
            {label:'jang002@gmail.com',itemIdx:'112'},
            {label:'jang003@gmail.com',itemIdx:'113'},
            {label:'jang004@gmail.com',itemIdx:'114'},
            {label:'jang005@gmail.com',itemIdx:'115'},
            {label:'kingsman@gmail.com',itemIdx:'101'},
            {label:'jang006@gmail.com',itemIdx:'116'},
            {label:'jang007@gmail.com',itemIdx:'117'},
            {label:'jang008@gmail.com',itemIdx:'118'},
            {label:'jang009@gmail.com',itemIdx:'119'},
            {label:'jang0010@gmail.com',itemIdx:'120'}
        ];
        
        $(".target-member-control").each(function() {
            $(this).autocomplete({
                source: sourceArr,
                minLength: 3, //3자 이상 입력시 자동완성폼이 노출됨
                open: function(event,ui) {
                    $(this).autocomplete("widget").css({
                        "min-width": $(this).innerWidth()
                    });
                },
                focus: function(event,ui) {
                    return false;
                },
                select: function(event,ui) {
                    var itemVal = ui.item.value;
                    var itemIdx = ui.item.itemIdx;
                    var listObj = $(this).closest("td").find(".target-member-list");
                    var itemHtml = "";
                    
                    //회원ID 인덱스번호가 유효하고 아직 대상에 추가하지 않았을 경우
                    if ($.isNumeric(itemIdx) && $(listObj).length > 0 && $(listObj).find("li[data-item-idx='" + itemIdx + "']").length == 0) {
                        //data-item-idx : 회원ID 인덱스번호
                        itemHtml += "<li data-item-idx='" + itemIdx + "'>";
                        itemHtml += "    <div class='target-member-text'>" + itemVal + "</div>";
                        itemHtml += "    <a href='javascript:void(0);' class='target-member-btn' onclick='delTargetMember(this);'><i class='ion-close-round'></i></a>";
                        itemHtml += "</li>";
                        
                        $(listObj).append(itemHtml);
                    }
                    
                    $(this).val("");
                        
                    return false;
                }
            }).data("ui-autocomplete")._renderItem = function(ul,item) {
                var $a = $("<a></a>").text(item.label);
                highlightText(this.term, $a);
                return $("<li></li>").append($a).appendTo(ul);
            };
        });
    }
    //20221221 수정부분 end
});

//메모 추가하기
function addMemoSubmit(obj) {
    var memoFormObj = $(obj).closest(".memo-form");
    var memoFormHtml = "";
    
    if ($(memoFormObj).length > 0) {
        var memoListObj = $(memoFormObj).next(".memo-list");
        var memoListHtml = "";
        
        if ($(memoListObj).length == 0) {
            memoListHtml += "<ul class='memo-list'></ul>";
            
            $(memoFormObj).after(memoListHtml);
            
            memoListObj = $(memoFormObj).next(".memo-list");
        }
        
        //메모 일련번호가 없어서 임의로 추가함. 실제 개발시에는 primary key로 설정해주시면 될 것 같습니다.
        tempMemoIdx++;
        
        var memoWriter = "skywater";
        var memoDate = "2022-04-12 12:54:21";
        var memoContent = $(memoFormObj).find("input[type='text']").val();
        
        memoFormHtml += "<li data-memo-idx='" + tempMemoIdx + "'>";
        memoFormHtml += "    <div class='memo-form'>";
        memoFormHtml += "        <div class='memo-form-item d-flex justify-content-between align-items-center'>";
        memoFormHtml += "            <div class='memo-form-left'>";
        memoFormHtml += "                <div class='memo-form-writer'>" + memoWriter + "</div>";
        memoFormHtml += "                <div class='memo-form-date'>" + memoDate + "</div>";
        memoFormHtml += "            </div>";
        memoFormHtml += "            <div class='memo-form-right'>";
        memoFormHtml += "                <a href='javascript:void(0);' class='memo-form-btn' onclick='modMemo(this);'>수정</a>";
        memoFormHtml += "                <a href='javascript:void(0);' class='memo-form-btn' onclick='openModal(\"confirm\",\"정말로 삭제하시겠습니까?\",\"delMemoSubmit(\\\"" + tempMemoIdx + "\\\");\")'>삭제</a>";
        memoFormHtml += "            </div>";
        memoFormHtml += "        </div>";
        memoFormHtml += "        <div class='memo-form-item'>";
        memoFormHtml += "            <div class='memo-form-content'>" + memoContent + "</div>";
        memoFormHtml += "        </div>";
        memoFormHtml += "    </div>";
        memoFormHtml += "</li>";
        
        $(memoListObj).append(memoFormHtml);
        
        $(memoFormObj).find("input[type='text']").val("");
    }
}

//메모 수정폼 보이기
function modMemo(obj) {
    var memoFormObj = $(obj).closest(".memo-form");
    var memoFormHtml = "";
    
    if ($(memoFormObj).length > 0) {
        var memoWriter = $(memoFormObj).find(".memo-form-writer").text();
        var memoDate = $(memoFormObj).find(".memo-form-date").text();
        var memoContent = $(memoFormObj).find(".memo-form-content").text();
        
        memoFormHtml += "<div class='memo-form-item d-flex justify-content-between align-items-center'>";
        memoFormHtml += "    <div class='memo-form-left'>";
        memoFormHtml += "        <div class='memo-form-writer'>" + memoWriter + "</div>";
        memoFormHtml += "        <div class='memo-form-date'>" + memoDate + "</div>";
        memoFormHtml += "    </div>";
        memoFormHtml += "    <div class='memo-form-right'>";
        memoFormHtml += "        <a href='javascript:void(0);' class='memo-form-btn' onclick='modMemoCancel(this);'>수정취소</a>";
        memoFormHtml += "    </div>";
        memoFormHtml += "</div>";
        memoFormHtml += "<div class='memo-form-item'>";
        memoFormHtml += "    <div class='form-group'>";
        memoFormHtml += "        <div class='input-group'>";
        memoFormHtml += "            <input type='hidden' id='' name='' value='" + memoContent + "'>";
        memoFormHtml += "            <input type='text' id='' name='' class='form-control' value='" + memoContent + "'>";
        memoFormHtml += "            <button type='button' class='btn btn-style02' onclick='modMemoSubmit(this);'><span>입력</span></button>";
        memoFormHtml += "        </div>";
        memoFormHtml += "    </div>";
        memoFormHtml += "</div>";
        
        $(memoFormObj).html(memoFormHtml);
    }
}

//메모 수정폼 숨기기
function modMemoCancel(obj) {
    var memoFormObj = $(obj).closest(".memo-form");
    var memoFormHtml = "";
    
    if ($(memoFormObj).length > 0) {
        var memoIdx = parseInt($(memoFormObj).parent("li").attr("data-memo-idx"));
        var memoWriter = $(memoFormObj).find(".memo-form-writer").text();
        var memoDate = $(memoFormObj).find(".memo-form-date").text();
        var oriMemoContent = $(memoFormObj).find("input[type='hidden']").val();
        var memoContent = $(memoFormObj).find("input[type='text']").val();
        
        memoFormHtml += "<div class='memo-form-item d-flex justify-content-between align-items-center'>";
        memoFormHtml += "    <div class='memo-form-left'>";
        memoFormHtml += "        <div class='memo-form-writer'>" + memoWriter + "</div>";
        memoFormHtml += "        <div class='memo-form-date'>" + memoDate + "</div>";
        memoFormHtml += "    </div>";
        memoFormHtml += "    <div class='memo-form-right'>";
        memoFormHtml += "        <a href='javascript:void(0);' class='memo-form-btn' onclick='modMemo(this);'>수정</a>";
        memoFormHtml += "        <a href='javascript:void(0);' class='memo-form-btn' onclick='openModal(\"confirm\",\"정말로 삭제하시겠습니까?\",\"delMemoSubmit(\\\"" + memoIdx + "\\\");\")'>삭제</a>";
        memoFormHtml += "    </div>";
        memoFormHtml += "</div>";
        memoFormHtml += "<div class='memo-form-item'>";
        memoFormHtml += "    <div class='memo-form-content'>" + oriMemoContent + "</div>";
        memoFormHtml += "</div>";
        
        $(memoFormObj).html(memoFormHtml);
    }
}

//메모 수정하기
function modMemoSubmit(obj) {
    var memoFormObj = $(obj).closest(".memo-form");
    var memoFormHtml = "";
    
    if ($(memoFormObj).length > 0) {
        var memoIdx = parseInt($(memoFormObj).parent("li").attr("data-memo-idx"));
        var memoWriter = $(memoFormObj).find(".memo-form-writer").text();
        var memoDate = $(memoFormObj).find(".memo-form-date").text();
        var oriMemoContent = $(memoFormObj).find("input[type='hidden']").val();
        var memoContent = $(memoFormObj).find("input[type='text']").val();
        
        memoFormHtml += "<div class='memo-form-item d-flex justify-content-between align-items-center'>";
        memoFormHtml += "    <div class='memo-form-left'>";
        memoFormHtml += "        <div class='memo-form-writer'>" + memoWriter + "</div>";
        memoFormHtml += "        <div class='memo-form-date'>" + memoDate + "</div>";
        memoFormHtml += "    </div>";
        memoFormHtml += "    <div class='memo-form-right'>";
        memoFormHtml += "        <a href='javascript:void(0);' class='memo-form-btn' onclick='modMemo(this);'>수정</a>";
        memoFormHtml += "        <a href='javascript:void(0);' class='memo-form-btn' onclick='openModal(\"confirm\",\"정말로 삭제하시겠습니까?\",\"delMemoSubmit(\\\"" + memoIdx + "\\\");\")'>삭제</a>";
        memoFormHtml += "    </div>";
        memoFormHtml += "</div>";
        memoFormHtml += "<div class='memo-form-item'>";
        memoFormHtml += "    <div class='memo-form-content'>" + memoContent + "</div>";
        memoFormHtml += "</div>";
        
        $(memoFormObj).html(memoFormHtml);
    }
}

//메모 삭제하기
function delMemoSubmit(memoIdx) {
    var memoFormObj = $(".memo-area .memo-list>li[data-memo-idx='" + memoIdx + "']");
    
    if ($(memoFormObj).length > 0) {
        $(memoFormObj).remove();
    }
}

//20221213 수정부분 start
//천단위 콤마 추가
function addComma(val) {
    val = val.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    return val;
}

//천단위 콤마 삭제
function delComma(val) {
    val = val.replace(/[^\d]+/g, "");
    
    return val;
}

//첨부파일 삭제
function delFileControl(obj) {
    var fileControlObj = $(obj).closest("li");
    
    if ($(fileControlObj).length > 0) {
        $(fileControlObj).remove();
    }
}

//일반주차장 등록에서 주차장유형 변경시
function setParkingType(obj) {
    var typeVal = $(obj).val();
    
    //주차장유형 선택창 값에 따라 해당 주차장 항목 보이기&숨기기
    if (typeVal == "민영") {
        $(obj).closest(".general-parking-form").find(".parking-type-public").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest(".general-parking-form").find(".parking-type-public").removeClass("on");
        $(obj).closest(".general-parking-form").find(".parking-type-private").find("input,select,textarea,button").prop("disabled",false);
        $(obj).closest(".general-parking-form").find(".parking-type-private").addClass("on");
    } else {
        $(obj).closest(".general-parking-form").find(".parking-type-private").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest(".general-parking-form").find(".parking-type-private").removeClass("on");
        $(obj).closest(".general-parking-form").find(".parking-type-public").find("input,select,textarea,button").prop("disabled",false);
        $(obj).closest(".general-parking-form").find(".parking-type-public").addClass("on");
    }
}

//일반주차장 그룹할인 추가
function addParkingDiscount(obj) {
    var parkingDiscountObj = $(obj).closest(".parking-discount-area");
    var parkingDiscountHtml = "";
    
    if ($(parkingDiscountObj).length > 0) {
        parkingDiscountHtml += "<tr>";
        parkingDiscountHtml += "    <td>";
        parkingDiscountHtml += "        <select id='' name='' class='custom-select form-control w-auto'>";
        parkingDiscountHtml += "            <option value=''>회원그룹선택</option>";
        parkingDiscountHtml += "            <option value='일반'>일반</option>";
        parkingDiscountHtml += "            <option value='제휴'>제휴</option>";
        parkingDiscountHtml += "            <option value='전기 자동차'>전기 자동차</option>";
        parkingDiscountHtml += "            <option value='국가 유공자'>국가 유공자</option>";
        parkingDiscountHtml += "        </select>";
        parkingDiscountHtml += "    </td>";
        parkingDiscountHtml += "    <td class='text-highlight'>";
        parkingDiscountHtml += "        <div class='d-flex align-items-center justify-content-center'>";
        parkingDiscountHtml += "            <input type='text' id='' name='' class='form-control number-control text-right mr-2'>";
        parkingDiscountHtml += "            %";
        parkingDiscountHtml += "        </div>";
        parkingDiscountHtml += "    </td>";
        parkingDiscountHtml += "    <td>";
        parkingDiscountHtml += "        <button type='button' class='btn btn-style03' onclick='delParkingDiscount(this);'><span>삭제</span></button>";
        parkingDiscountHtml += "    </td>";
        parkingDiscountHtml += "</tr>";
        
        $(parkingDiscountObj).find(".table").find("tbody").append(parkingDiscountHtml);
    }
    
    //숫자만 입력
    $(".number-control").on("keyup", function() {
        $(this).val(addComma($(this).val().replace(/[^0-9]/g,"")));
    });
    
    //숫자 입력창에 천단위 콤마 추가
    $(".number-control").each(function() {
        $(this).val(addComma($(this).val()));
    });
}

//일반주차장 그룹할인 삭제
function delParkingDiscount(obj) {
    var parkingDiscountObj = $(obj).closest("tr");
    
    if ($(parkingDiscountObj).length > 0) {
        $(parkingDiscountObj).remove();
    }
}

//일반주차장 주차권 추가
function addParkingVoucher(obj) {
    var parkingVoucherObj = $(obj).closest(".parking-voucher-area");
    var parkingVoucherHtml = "";
    
    if ($(parkingVoucherObj).length > 0) {
        parkingVoucherHtml += "<tr>";
        parkingVoucherHtml += "    <td>";
        parkingVoucherHtml += "        <input type='text' id='' name='' class='form-control'>";
        parkingVoucherHtml += "    </td>";
        parkingVoucherHtml += "    <td>";
        parkingVoucherHtml += "        <div class='d-flex align-items-center justify-content-center'>";
        parkingVoucherHtml += "            <select id='' name='' class='custom-select form-control w-auto mr-2'>";
        parkingVoucherHtml += "                <option value='전체'>전체</option>";
        parkingVoucherHtml += "                <option value='평일'>평일</option>";
        parkingVoucherHtml += "                <option value='주말'>주말</option>";
        parkingVoucherHtml += "            </select>";
        parkingVoucherHtml += "            <div class='time-control-area'>";
        parkingVoucherHtml += "                <input type='text' id='' name='' class='form-control time-control' autocomplete='off'>";
        parkingVoucherHtml += "                <span class='text-split'>~</span>";
        parkingVoucherHtml += "                <input type='text' id='' name='' class='form-control time-control' autocomplete='off'>";
        parkingVoucherHtml += "            </div>";
        parkingVoucherHtml += "        </div>";
        parkingVoucherHtml += "    </td>";
        parkingVoucherHtml += "    <td class='text-highlight'>";
        parkingVoucherHtml += "        <div class='d-flex align-items-center justify-content-center'>";
        parkingVoucherHtml += "            구매당일";
        parkingVoucherHtml += "            <div class='time-control-area ml-2'>";
        parkingVoucherHtml += "                <input type='text' id='' name='' class='form-control time-control' autocomplete='off'>";
        parkingVoucherHtml += "                <span class='text-split'>~</span>";
        parkingVoucherHtml += "                <input type='text' id='' name='' class='form-control time-control' autocomplete='off'>";
        parkingVoucherHtml += "            </div>";
        parkingVoucherHtml += "        </div>";
        parkingVoucherHtml += "    </td>";
        parkingVoucherHtml += "    <td class='text-highlight'>";
        parkingVoucherHtml += "        <div class='d-flex align-items-center justify-content-center'>";
        parkingVoucherHtml += "            <input type='text' id='' name='' class='form-control number-control text-right mr-2'>";
        parkingVoucherHtml += "            원";
        parkingVoucherHtml += "        </div>";
        parkingVoucherHtml += "    </td>";
        parkingVoucherHtml += "    <td>";
        parkingVoucherHtml += "        <button type='button' class='btn btn-style03' onclick='delParkingVoucher(this);'><span>삭제</span></button>";
        parkingVoucherHtml += "    </td>";
        parkingVoucherHtml += "</tr>";
        
        $(parkingVoucherObj).find(".table").find("tbody").append(parkingVoucherHtml);
    }
    
    //숫자만 입력
    $(".number-control").on("keyup", function() {
        $(this).val(addComma($(this).val().replace(/[^0-9]/g,"")));
    });
    
    //숫자 입력창에 천단위 콤마 추가
    $(".number-control").each(function() {
        $(this).val(addComma($(this).val()));
    });
    
    //시간선택창 노출
    $(".time-control").each(function() {
        $(this).timepicker({
            minuteStep: 1, //변경되는 분단위 설정
            defaultTime: false, //기본값 설정
            showMeridian: false, //false : 24시간, true : 12시간
            showInputs: false, //시간 입력 못하게 설정
            icons: {
                up: 'la la-angle-up', //위로 화살표 설정
                down: 'la la-angle-down' //아래로 화살표 설정
            }
        });
    });
}

//일반주차장 주차권 삭제
function delParkingVoucher(obj) {
    var parkingVoucherObj = $(obj).closest("tr");
    
    if ($(parkingVoucherObj).length > 0) {
        $(parkingVoucherObj).remove();
    }
}

//수리완료창에서 loT장비 수리결과 변경시
function setMrcResult(obj) {
    var resultVal = $(obj).val();
    
    //loT장비 수리결과 선택창 값에 따라 교체할 loT장비 S/N 항목 보이기&숨기기
    if (resultVal == "교체") {
        $(obj).closest(".modal-body-form").find(".mrc-result-area").find("select").prop("disabled",false);
        $(obj).closest(".modal-body-form").find(".mrc-result-area").addClass("on");
    } else {
        $(obj).closest(".modal-body-form").find(".mrc-result-area").find("select").prop("disabled",true);
        $(obj).closest(".modal-body-form").find(".mrc-result-area").removeClass("on");
    }
}
//20221213 수정부분 end

//20221221 수정부분 start
//자동완성 기능에서 일치하는 글자에 클래스 추가
function highlightText(text,$node) {
    var searchText = $.trim(text).toLowerCase(), currentNode = $node.get(0).firstChild, matchIndex, newTextNode, newSpanNode;
    while ((matchIndex = currentNode.data.toLowerCase().indexOf(searchText)) >= 0) {
        newTextNode = currentNode.splitText(matchIndex);
        currentNode = newTextNode.splitText(searchText.length);
        newSpanNode = document.createElement("span");
        newSpanNode.className = "highlight";
        currentNode.parentNode.insertBefore(newSpanNode, currentNode);
        newSpanNode.appendChild(newTextNode);
    }
}

//서비스관리에서 구분 변경시
function setServiceType(obj) {
    var typeVal = $(obj).val();
    
    //구분 선택창 값에 따라 해당 항목 보이기&숨기기
    if (typeVal == "예약 푸쉬") {
        $(obj).closest("table").find(".service-type-common").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("table").find(".service-type-common").removeClass("on");
        $(obj).closest("table").find(".service-type-reserve").find("input,select,textarea,button").prop("disabled",false);
        $(obj).closest("table").find(".service-type-reserve").addClass("on");
    } else {
        $(obj).closest("table").find(".service-type-reserve").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("table").find(".service-type-reserve").removeClass("on");
        $(obj).closest("table").find(".service-type-common").find("input,select,textarea,button").prop("disabled",false);
        $(obj).closest("table").find(".service-type-common").addClass("on");
    }
}

//서비스관리에서 대상 변경시
function setServiceTarget(obj) {
    var targetVal = $(obj).val();
    
    //대상 선택창 값에 따라 해당 항목 보이기&숨기기
    if (targetVal == "회원별") {
        $(obj).closest("td").find(".service-target-area").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-area").removeClass("on");
        $(obj).closest("td").find(".service-target-age").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-age").removeClass("on");
        $(obj).closest("td").find(".service-target-member").find("input,select,textarea,button").prop("disabled",false);
        $(obj).closest("td").find(".service-target-member").addClass("on");
    } else if (targetVal == "연령별") {
        $(obj).closest("td").find(".service-target-area").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-area").removeClass("on");
        $(obj).closest("td").find(".service-target-member").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-member").removeClass("on");
        $(obj).closest("td").find(".service-target-age").find("input,select,textarea,button").prop("disabled",false);
        $(obj).closest("td").find(".service-target-age").addClass("on");
    } else if (targetVal == "지역별") {
        $(obj).closest("td").find(".service-target-age").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-age").removeClass("on");
        $(obj).closest("td").find(".service-target-member").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-member").removeClass("on");
        $(obj).closest("td").find(".service-target-area").find("input,select,textarea,button").prop("disabled",false);
        $(obj).closest("td").find(".service-target-area").addClass("on");
    } else {
        $(obj).closest("td").find(".service-target-area").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-area").removeClass("on");
        $(obj).closest("td").find(".service-target-age").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-age").removeClass("on");
        $(obj).closest("td").find(".service-target-member").find("input,select,textarea,button").prop("disabled",true);
        $(obj).closest("td").find(".service-target-member").removeClass("on");
    }
}

//서비스관리에서 대상이 회원별일 경우 설정한 회원 삭제
function delTargetMember(obj) {
    var targetMemberObj = $(obj).closest("li");
    
    if ($(targetMemberObj).length > 0) {
        $(targetMemberObj).remove();
    }
}
//20221221 수정부분 end

//modal창 열기 (type : modal창 종류 (alert / confirm), msg : 메시지 내용, fun : 확인 버튼 클릭시 실행할 함수 (함수가 여러개일 경우 세미콜론으로 구분))
function openModal(type, msg, fun) {
    $("#modal-" + type + " .modal-body .modal-body-text").html(msg);
    
    $("#modal-" + type + " .modal-footer .btn-confirm").removeAttr("onclick");
    $("#modal-" + type + " .modal-footer .btn-confirm").attr("onclick", fun);
    
    $("#modal-" + type + "-btn").trigger("click");
}

//등록카드창 열기
function openModalRegisterCard(obj) {
    $("#modal-register-card-btn").trigger("click");
}

//등록차량창 열기
function openModalRegisterCar(obj) {
    $("#modal-register-car-btn").trigger("click");
}

//첨부파일창 열기
function openModalAttachmentFile(obj) {
    $("#modal-attachment-file-btn").trigger("click");
    
    //첨부파일창 타이틀에 첨부파일명 설정
    var modalTitle = $(obj).text();
    
    if (modalTitle != "" && modalTitle != null && modalTitle != undefined) {
        $("#modal-attachment-file .modal-header .modal-title").text(modalTitle);
    }
}

//사업자등록증창 열기
function openModalBusinessLicense(obj) {
    $("#modal-business-license-btn").trigger("click");
}

//고장접수창 열기
function openModalTroubleReceipt(obj) {
    $("#modal-trouble-receipt-btn").trigger("click");
}

//등록사진창 열기
function openModalRegisterImage(obj) {    
    $("#modal-register-image-btn").trigger("click");
    
    //slick 슬라이드 전 기존의 슬라이드가 있을 경우 제거
    if ($(".mri-slide-area .slider-for.slick-initialized").length > 0) {
        $(".mri-slide-area .slider-for").slick("unslick");
    }
    
    if ($(".mri-slide-area .slider-nav.slick-initialized").length > 0) {
        $(".mri-slide-area .slider-nav").slick("unslick");
    }
    
    //slick 슬라이드 (등록사진)
    $(".mri-slide-area .slider-for").slick({
        infinite: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        fade: false,
        asNavFor: '.slider-nav',
        autoplay: false,
        pauseOnHover: true
    });
    
    $(".mri-slide-area .slider-nav").slick({
        infinite: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        fade: false,
        asNavFor: '.slider-for',
        focusOnSelect: true
    });
    
    //slick 슬라이드 후 이미지 높이 동일하게 설정
    var forImgHeight = 0;
    var navImgHeight = 0;
    
    $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height","");
    $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height","");
    
    $(".mri-slide-area .slider-for .slick-slide .slider-for-item").each(function() {
        var forItemHeight = parseFloat($(this).height());
        
        if (forItemHeight > forImgHeight) {
            forImgHeight = forItemHeight;
        }
    });
    
    $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item").each(function() {
        var navItemHeight = parseFloat($(this).find(".slider-nav-image").height());
        
        if (navItemHeight > navImgHeight) {
            navImgHeight = navItemHeight;
        }
    });
    
    $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height",forImgHeight);
    $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height",navImgHeight);
    
    //리사이즈시
    $(window).on("resize", function() {
        //리사이즈시 slick 슬라이드 이미지 높이 동일하게 설정
        var reForImgHeight = 0;
        var reNavImgHeight = 0;
        
        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height","");
        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height","");

        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").each(function() {
            var reForItemHeight = parseFloat($(this).height());

            if (reForItemHeight > reForImgHeight) {
                reForImgHeight = reForItemHeight;
            }
        });

        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item").each(function() {
            var reNavItemHeight = parseFloat($(this).find(".slider-nav-image").height());

            if (reNavItemHeight > reNavImgHeight) {
                reNavImgHeight = reNavItemHeight;
            }
        });

        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height",reForImgHeight);
        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height",reNavImgHeight);
    });
}

//임대계약서창 열기
function openModalGarageContract(obj) {
    $("#modal-garage-contract-btn").trigger("click");
}

//차고지증명서창 열기
function openModalGarageCertificate(obj) {
    $("#modal-garage-certificate-btn").trigger("click");
}

//누적임대창 열기
function openModalGarageRent(obj) {
    $("#modal-garage-rent-btn").trigger("click");
}

//20221213 수정부분 start
//일반주차장 회원ID 검색창 열기
function openModalAllianceMemberSearch(obj) {
    $("#modal-alliance-member-search-btn").trigger("click");
}

//고장접수창 열기
function openModalTroubleReceipt(obj) {
    $("#modal-trouble-receipt-btn").trigger("click");
    
    //textarea 줄바꿈 적용
    if ($("#modal-trouble-receipt .modal-body textarea").length > 0) {
        var textareaVal = $("#modal-trouble-receipt .modal-body textarea").val().replace(/(<br>|<br\/>|<br \/>)/g, "\r\n");
        
        $("#modal-trouble-receipt .modal-body textarea").val(textareaVal);
    }
}

//운영정지창 열기
function openModalOperateStop(obj) {
    $("#modal-operate-stop-btn").trigger("click");
    
    //textarea 줄바꿈 적용
    if ($("#modal-operate-stop .modal-body textarea").length > 0) {
        var textareaVal = $("#modal-operate-stop .modal-body textarea").val().replace(/(<br>|<br\/>|<br \/>)/g, "\r\n");
        
        $("#modal-operate-stop .modal-body textarea").val(textareaVal);
    }
}

//심사완료창 열기
function openModalExaminationComplete(obj) {
    $("#modal-examination-complete-btn").trigger("click");
    
    //textarea 줄바꿈 적용
    if ($("#modal-examination-complete .modal-body textarea").length > 0) {
        var textareaVal = $("#modal-examination-complete .modal-body textarea").val().replace(/(<br>|<br\/>|<br \/>)/g, "\r\n");
        
        $("#modal-examination-complete .modal-body textarea").val(textareaVal);
    }
}

//심사반려창 열기
function openModalExaminationReturn(obj) {
    $("#modal-examination-return-btn").trigger("click");
    
    //textarea 줄바꿈 적용
    if ($("#modal-examination-return .modal-body textarea").length > 0) {
        var textareaVal = $("#modal-examination-return .modal-body textarea").val().replace(/(<br>|<br\/>|<br \/>)/g, "\r\n");
        
        $("#modal-examination-return .modal-body textarea").val(textareaVal);
    }
}

//현장방문창 열기
function openModalSiteVisit(obj) {
    $("#modal-site-visit-btn").trigger("click");
    
    //textarea 줄바꿈 적용
    if ($("#modal-site-visit .modal-body textarea").length > 0) {
        var textareaVal = $("#modal-site-visit .modal-body textarea").val().replace(/(<br>|<br\/>|<br \/>)/g, "\r\n");
        
        $("#modal-site-visit .modal-body textarea").val(textareaVal);
    }
}

//수리완료창 열기
function openModalRepairComplete(obj) {
    $("#modal-repair-complete-btn").trigger("click");
    
    //loT장비 수리결과 초기화
    if ($("#modal-repair-complete .modal-body .mrc-result-control").length > 0) {
        setMrcResult($("#modal-repair-complete .modal-body .mrc-result-control"));
    }
    
    //textarea 줄바꿈 적용
    if ($("#modal-repair-complete .modal-body textarea").length > 0) {
        var textareaVal = $("#modal-repair-complete .modal-body textarea").val().replace(/(<br>|<br\/>|<br \/>)/g, "\r\n");
        
        $("#modal-repair-complete .modal-body textarea").val(textareaVal);
    }
}
//20221213 수정부분 end

//20221220 수정부분 start
//제휴문의 회원ID 검색창 열기
function openModalMemberSearch(obj) {
    $("#modal-member-search-btn").trigger("click");
}

//증빙사진창 열기
function openModalEvidenceImage(obj) {    
    $("#modal-evidence-image-btn").trigger("click");
    
    //slick 슬라이드 전 기존의 슬라이드가 있을 경우 제거
    if ($(".mri-slide-area .slider-for.slick-initialized").length > 0) {
        $(".mri-slide-area .slider-for").slick("unslick");
    }
    
    if ($(".mri-slide-area .slider-nav.slick-initialized").length > 0) {
        $(".mri-slide-area .slider-nav").slick("unslick");
    }
    
    //slick 슬라이드 (등록사진)
    $(".mri-slide-area .slider-for").slick({
        infinite: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        fade: false,
        asNavFor: '.slider-nav',
        autoplay: false,
        pauseOnHover: true
    });
    
    $(".mri-slide-area .slider-nav").slick({
        infinite: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        fade: false,
        asNavFor: '.slider-for',
        focusOnSelect: true
    });
    
    //slick 슬라이드 후 이미지 높이 동일하게 설정
    var forImgHeight = 0;
    var navImgHeight = 0;
    
    $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height","");
    $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height","");
    
    $(".mri-slide-area .slider-for .slick-slide .slider-for-item").each(function() {
        var forItemHeight = parseFloat($(this).height());
        
        if (forItemHeight > forImgHeight) {
            forImgHeight = forItemHeight;
        }
    });
    
    $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item").each(function() {
        var navItemHeight = parseFloat($(this).find(".slider-nav-image").height());
        
        if (navItemHeight > navImgHeight) {
            navImgHeight = navItemHeight;
        }
    });
    
    $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height",forImgHeight);
    $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height",navImgHeight);
    
    //리사이즈시
    $(window).on("resize", function() {
        //리사이즈시 slick 슬라이드 이미지 높이 동일하게 설정
        var reForImgHeight = 0;
        var reNavImgHeight = 0;
        
        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height","");
        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height","");

        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").each(function() {
            var reForItemHeight = parseFloat($(this).height());

            if (reForItemHeight > reForImgHeight) {
                reForImgHeight = reForItemHeight;
            }
        });

        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item").each(function() {
            var reNavItemHeight = parseFloat($(this).find(".slider-nav-image").height());

            if (reNavItemHeight > reNavImgHeight) {
                reNavImgHeight = reNavItemHeight;
            }
        });

        $(".mri-slide-area .slider-for .slick-slide .slider-for-item").css("height",reForImgHeight);
        $(".mri-slide-area .slider-nav .slick-slide .slider-nav-item .slider-nav-image").css("height",reNavImgHeight);
    });
}
//20221220 수정부분 end

//20221221 수정부분 start
//loT장비 사용하기창 열기
function openModalLotEquipmentUse(obj) {
    $("#modal-lot-equipment-use-btn").trigger("click");
}
//20221221 수정부분 end

