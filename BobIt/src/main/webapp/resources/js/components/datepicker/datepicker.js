(function ($) {

    'use strict';
	
    // ------------------------------------------------------- //
    // Datepicker
    // ------------------------------------------------------ //	
	$(function () {
        //언어를 한국어로 설정
        moment.locale('ko');
        
        $(".date-control").each(function() {
            $(this).datepicker({
                language: "ko", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                format: "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
                orientation: 'bottom left', //달력이 노출되는 위치 설정
                templates : {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                } //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
            });
        });
        
        //20221213 수정부분 start
        $(".start-date-control").each(function() {
            $(this).datepicker({
                language: "ko", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                format: "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
                orientation: 'bottom left', //달력이 노출되는 위치 설정
                templates : {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                } //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
            }).on("changeDate", function(e) {
                var startDate = new Date(e.date.valueOf());
                
                $(e.target).siblings(".end-date-control").datepicker('setStartDate',startDate);
            });
        });
        
        $(".end-date-control").each(function() {
            $(this).datepicker({
                language: "ko", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                format: "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
                orientation: 'bottom left', //달력이 노출되는 위치 설정
                templates : {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                } //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
            }).on("changeDate", function(e) {
                var endDate = new Date(e.date.valueOf());
                
                $(e.target).siblings(".start-date-control").datepicker('setEndDate',endDate);
            });
        });
        
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
        //20221213 수정부분 end
        
        //20221221 수정부분 start
        $(".datetime-control").each(function() {
            $(this).daterangepicker({
                singleDatePicker: true, //true일 경우 한개의 날짜만 선택함, false일 경우 두개의 날짜를 선택함
                timePicker: true, //true일 경우 시간 선택 포맷이 출력됨, false일 경우 시간 선택 포맷이 출력안됨
                timePicker24Hour: true, //true일 경우 시간이 24시간으로 출력됨, false일 경우 시간이 12시간으로 출력됨
                timePickerSeconds: false, //true일 경우 초 선택 포맷이 출력됨, false일 경우 초 선택 포맷이 출력안됨
                timePickerIncrement: 1, //분 선택에 설정한 단위로 출력됨 (ex: 10으로 설정할 경우 10분 단위로 출력됨)
                showDropdowns: true, //true일 경우 년과 달을 셀렉트박스로 선택함, false일 경우 년과 달이 텍스트로 출력됨
                minDate: new Date(),
                locale: {
                    format: 'YYYY-MM-DD HH:mm:ss' //입력박스에 날짜를 출력할 포맷
                }
            });
        });
        //20221221 수정부분 end
	});
	
})(jQuery);