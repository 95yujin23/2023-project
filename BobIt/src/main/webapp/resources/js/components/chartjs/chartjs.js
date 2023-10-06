let maCtx;
let mmCtx;
let mpCtx;
let mgCtx;

let maChart;
let mmChart;
let mpChart;
let mgChart;

let mainOptions = {}; //메인 차트에 대한 옵션 설정

mainOptions = {
    legend: {
        display: false
    },
    layout: {
        padding: {
            top: 10
        }
    },
    tooltips: {
        backgroundColor: "rgba(2,0,56,0.8)",
        titleFontColor: "#ffffff",
        titleFontSize: 14,
        caretSize: 0,
        cornerRadius: 4,
        xPadding: 10,
        yPadding: 10,
        displayColors: false,
        callbacks: {
            label: function(tooltipItem,data) {
                var label = data.datasets[tooltipItem.datasetIndex].label || '';
                var value = tooltipItem.yLabel;
                
                if (label) label += ': ';
                
                if (value) value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                
                label += value;
                
                return label;
            }
        }
    },
    scales: {
        yAxes: [{
            ticks: {
                display: true,
                beginAtZero: true,
                suggestedMin: 0,
                suggestedMax: 2000000,
                stepSize: 500000,
                callback: function(value,index) {
                    if (value.toString().length > 4) {
                        return (Math.round(value / 10000)).toString() + "만";
                    }
                }
            },
            gridLines: {
                display: true,
                drawBorder: true
            }
        }],
        xAxes: [{
            ticks: {
                display: true,
                minRotation: 0,
                maxRotation: 0,
                maxTicksLimit: 4
            },
            gridLines: {
                display: false,
                drawBorder: true
            }
        }]
    }
};

(function ($) {

    'use strict';
	
    // ------------------------------------------------------- //
    // Line Chart
    // ------------------------------------------------------ //
    //전체 매출 실적 차트
    if ($("#main-all-chart").length > 0) {
        maCtx = document.getElementById("main-all-chart").getContext("2d");

        maChart = new Chart(maCtx, {
            type: 'line',
            data: {
                datasets: [{
                    label: "전체 매출 실적1",
                    borderColor: "#020038",
                    pointBackgroundColor: "#020038",
                    pointHoverBackgroundColor: "#020038",
                    pointBorderColor: "#020038",
                    pointHoverBorderColor: "#020038",
                    fill: true,
                    backgroundColor: "transparent"
                },
                {
                    label: "전체 매출 실적2",
                    borderColor: "#fb8c00",
                    pointBackgroundColor: "#fb8c00",
                    pointHoverBackgroundColor: "#fb8c00",
                    pointBorderColor: "#fb8c00",
                    pointHoverBorderColor: "#fb8c00",
                    fill: true,
                    backgroundColor: "transparent"
                }]
            },
            options: mainOptions
        });
    }
    
    //일일 사용자 차트
    if ($("#main-member-chart").length > 0) {
        mmCtx = document.getElementById("main-member-chart").getContext("2d");

        mmChart = new Chart(mmCtx, {
            type: 'line',
            data: {
                datasets: [{
                    label: "일일 사용자1",
                    borderColor: "#020038",
                    pointBackgroundColor: "#020038",
                    pointHoverBackgroundColor: "#020038",
                    pointBorderColor: "#020038",
                    pointHoverBorderColor: "#020038",
                    fill: true,
                    backgroundColor: "transparent"
                },
                {
                    label: "일일 사용자2",
                    borderColor: "#fb8c00",
                    pointBackgroundColor: "#fb8c00",
                    pointHoverBackgroundColor: "#fb8c00",
                    pointBorderColor: "#fb8c00",
                    pointHoverBorderColor: "#fb8c00",
                    fill: true,
                    backgroundColor: "transparent"
                }]
            },
            options: mainOptions
        });
    }
    
    //공유 주차장 매출 차트
    if ($("#main-parking-chart").length > 0) {
        mpCtx = document.getElementById("main-parking-chart").getContext("2d");

        mpChart = new Chart(mpCtx, {
            type: 'line',
            data: {
                datasets: [{
                    label: "공유 주차장 매출1",
                    borderColor: "#020038",
                    pointBackgroundColor: "#020038",
                    pointHoverBackgroundColor: "#020038",
                    pointBorderColor: "#020038",
                    pointHoverBorderColor: "#020038",
                    fill: true,
                    backgroundColor: "transparent"
                },
                {
                    label: "공유 주차장 매출2",
                    borderColor: "#fb8c00",
                    pointBackgroundColor: "#fb8c00",
                    pointHoverBackgroundColor: "#fb8c00",
                    pointBorderColor: "#fb8c00",
                    pointHoverBorderColor: "#fb8c00",
                    fill: true,
                    backgroundColor: "transparent"
                }]
            },
            options: mainOptions
        });
    }
    
    //차고지 임대 매출 차트
    if ($("#main-garage-chart").length > 0) {
        mgCtx = document.getElementById("main-garage-chart").getContext("2d");

        mgChart = new Chart(mgCtx, {
            type: 'line',
            data: {
                datasets: [{
                    label: "차고지 임대 매출1",
                    borderColor: "#020038",
                    pointBackgroundColor: "#020038",
                    pointHoverBackgroundColor: "#020038",
                    pointBorderColor: "#020038",
                    pointHoverBorderColor: "#020038",
                    fill: true,
                    backgroundColor: "transparent"
                },
                {
                    label: "차고지 임대 매출2",
                    borderColor: "#fb8c00",
                    pointBackgroundColor: "#fb8c00",
                    pointHoverBackgroundColor: "#fb8c00",
                    pointBorderColor: "#fb8c00",
                    pointHoverBorderColor: "#fb8c00",
                    fill: true,
                    backgroundColor: "transparent"
                }]
            },
            options: mainOptions
        });
    }
    
    //메인 차트 데이터 설정
    if ($(".main-chart-control").length > 0) {
        getmainChartData($(".main-chart-control"));
    }
	
})(jQuery);

//메인 차트 데이터 설정
function getmainChartData(obj) {
    var val = $(obj).val(); //메인 차트 날짜 선택창 값
    var dateArr = []; //날짜 배열
    
    //차트 x축에 노출할 날짜 설정
    if (val == "오늘 현재까지") {
        //오늘 현재까지일 경우 차트를 가운데에 노출하기 위해 앞뒤로 날짜 하나씩 더 추가함
        for (var i=1; i>-2; i--) {
            var nowDate = new Date();
            var targetDate = new Date(nowDate.setDate(nowDate.getDate() - i));
            var year = targetDate.getFullYear();
            var month = ('0' + (targetDate.getMonth() + 1)).slice(-2);
            var day = ('0' + targetDate.getDate()).slice(-2);

            dateArr.push(year + "-" + month + "-" + day);
        }
    } else if (val == "어제 및 지난주 같은 요일") {
        for (var i=7; i>0; i=i-6) {
            var nowDate = new Date();
            var targetDate = new Date(nowDate.setDate(nowDate.getDate() - i));
            var year = targetDate.getFullYear();
            var month = ('0' + (targetDate.getMonth() + 1)).slice(-2);
            var day = ('0' + targetDate.getDate()).slice(-2);

            dateArr.push(year + "-" + month + "-" + day);
        }
    } else if (val == "최근 7일 및 이전 7일") {
        for (var i=7; i>0; i--) {
            var nowDate = new Date();
            var targetDate = new Date(nowDate.setDate(nowDate.getDate() - i));
            var year = targetDate.getFullYear();
            var month = ('0' + (targetDate.getMonth() + 1)).slice(-2);
            var day = ('0' + targetDate.getDate()).slice(-2);

            dateArr.push(year + "-" + month + "-" + day);
        }
    } else if (val == "최근 한달 및 이전 한달") {
        var endDate = new Date();
        var endDateTime = endDate.getTime();
        var startDate = new Date(endDate.setMonth(endDate.getMonth() - 1));
        var startDateTime = startDate.getTime();
        var gapDate = Math.abs((endDateTime - startDateTime) / (1000 * 60 * 60 * 24));
        
        for (var i=gapDate; i>0; i--) {
            var nowDate = new Date();
            var targetDate = new Date(nowDate.setDate(nowDate.getDate() - i));
            var year = targetDate.getFullYear();
            var month = ('0' + (targetDate.getMonth() + 1)).slice(-2);
            var day = ('0' + targetDate.getDate()).slice(-2);

            dateArr.push(year + "-" + month + "-" + day);
        }
    }
    
    //전체 매출 실적 차트 데이터 업데이트
    if (maChart != undefined) {
        var dataArr = []; //첫번째 차트 데이터 배열
        var dataArr2 = []; //두번째 차트 데이터 배열
        
        if (val == "오늘 현재까지") {
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
            
            //첫번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
            
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
        } else {
            //첫번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
        }
        
        maChart.data.labels = dateArr;
        maChart.data.datasets[0].data = dataArr;
        maChart.data.datasets[1].data = dataArr2;
        maChart.update();
    }
    
    //일일 사용자 차트 데이터 업데이트
    if (mmChart != undefined) {
        var dataArr = []; //첫번째 차트 데이터 배열
        var dataArr2 = []; //두번째 차트 데이터 배열
        
        if (val == "오늘 현재까지") {
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
            
            //첫번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
            
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
        } else {
            //첫번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
        }
        
        mmChart.data.labels = dateArr;
        mmChart.data.datasets[0].data = dataArr;
        mmChart.data.datasets[1].data = dataArr2;
        mmChart.update();
    }
    
    //공유 주차장 매출 차트 데이터 업데이트
    if (mpChart != undefined) {
        var dataArr = []; //첫번째 차트 데이터 배열
        var dataArr2 = []; //두번째 차트 데이터 배열
        
        if (val == "오늘 현재까지") {
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
            
            //첫번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
            
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
        } else {
            //첫번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
        }
        
        mpChart.data.labels = dateArr;
        mpChart.data.datasets[0].data = dataArr;
        mpChart.data.datasets[1].data = dataArr2;
        mpChart.update();
    }
    
    //차고지 임대 매출 차트 데이터 업데이트
    if (mgChart != undefined) {
        var dataArr = []; //첫번째 차트 데이터 배열
        var dataArr2 = []; //두번째 차트 데이터 배열
        
        if (val == "오늘 현재까지") {
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
            
            //첫번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정 (앞뒤로 추가한 날짜 값은 null이므로 제외하고 설정함)
            for (var j=0; j<(dateArr.length - 2); j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
            
            //오늘 현재까지일 경우 앞뒤로 추가한 날짜 값을 null로 설정
            dataArr.push(null);
            dataArr2.push(null);
        } else {
            //첫번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr.push(random);
            }

            //두번째 차트 데이터에 랜덤으로 값 설정
            for (var j=0; j<dateArr.length; j++) {
                var random = Math.round(Math.random() * 2000000);

                dataArr2.push(random);
            }
        }
        
        mgChart.data.labels = dateArr;
        mgChart.data.datasets[0].data = dataArr;
        mgChart.data.datasets[1].data = dataArr2;
        mgChart.update();
    }
}