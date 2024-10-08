<!-- 기본틀 index page -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html lang="ko">
<head>

<%@include file="include/head.jsp"%>
<link rel="stylesheet"
	href="${path }/resources/assets/js/plugin/fullcalendar/main.min.css">
<link rel="stylesheet"
	href="${path }/resources/assets/css/fullcalendar.css">
<style type="text/css">
.fc-event-time {
	display: none !important
}

.fc-event-title {
	color: #000 !important
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="include/sideBar.jsp"%>

		<div class="main-panel">
			<%@include file="include/header.jsp"%>


			<div class="container">
				<div class="page-inner" style="padding-bottom: 0">
					<div class="">
						<h3 class="fw-bold mb-3">MMS</h3>

					</div>
				</div>


				<div class="row page-inner">


					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title">건전성 모니터링 기울기 계측 시스템</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<canvas id="barChart" style="width:100%; height:800px"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<!-- /.content-wrapper -->
			</div>

		</div>

		<%@include file="include/footer.jsp"%>
	</div>

	<%@include file="include/script.jsp"%>
	<script
		src="${path }/resources/assets/js/plugin/jquery-ui/jquery-ui.min.js"></script>
	<script src="${path }/resources/assets/js/plugin/moment/moment.min.js"></script>

	<script src="${path }/resources/assets/js/plugin/fullcalendar/main.js"></script>



<script>
$(document).ready(function() {
    $.ajax({
        url: '/resources/assets/structure_tiltmeter.json', // JSON 파일 URL
        method: 'GET',
        dataType: 'json',

        success: function(data) {
            const date = data.map(item => item.opdatetime); // 날짜 데이터
            const tiltData = [];
            const channelNames = []; // 채널 이름을 저장할 배열
            
            for (let i = 1; i <= 7; i++) {
                const tiltX = data.map(item => item['tilt-0' + i + '-x'] || 0);
                const tiltY = data.map(item => item['tilt-0' + i + '-y'] || 0);
                const tiltAngle = tiltX.map((x, index) => Math.sqrt(x * x + tiltY[index] * tiltY[index])); // 기울기 계산
                tiltData.push(tiltAngle);
                channelNames.push('Tilt-0' + i);
            }

            console.log("Tilt Data:", tiltData); // 디버깅 로그

            const colors = [];
            for (let index = 0; index < channelNames.length; index++) {
                const r = (index * 40) % 256;
                const g = (index * 80) % 256;
                const b = (index * 120) % 256;
                colors.push("rgb(" + r + ", " + g + ", " + b + ")");
            }
            
            const datasets = tiltData.map((data, index) => ({
                label: channelNames[index],
                data: data,
                borderColor: colors[index],
                backgroundColor:"rgba(255,255,255,0",
                borderWidth: 1,
                hidden: true // 초기에는 숨김
            }));

            const flatTiltData = tiltData.reduce((acc, val) => acc.concat(val), []); // 평탄화
            console.log("Flat Tilt Data:", flatTiltData); // 디버깅 로그
            
            const ctx = document.getElementById('barChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: date,
                    datasets: datasets
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        x: {
                            ticks: {
                                autoSkip: false,
                                maxRotation: 45,
                                minRotation: 45
                            },
                            grid: {
                                display: true,
                                color: "rgba(0, 0, 0, 0.1)"
                            },
                        },
                        y: {
                            beginAtZero: true,
                        }
                    },
                    plugins: {
                        legend: {
                            onClick: function(e, legendItem, legend) {
                                const index = legendItem.datasetIndex;
                                const meta = legend.chart.getDatasetMeta(index);
                                meta.hidden = !meta.hidden; // 숨김/표시 전환
                                legend.chart.update();
                            }
                        }
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 오류:", status, error);
            alert("데이터를 가져오는 데 오류가 발생했습니다.");
        }
    });
});
</script>


</body>
</html>
