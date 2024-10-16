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
								<div><p>기울기 공식: <strong>m = (y<sub>2</sub> - y<sub>1</sub>) / (x<sub>2</sub> - x<sub>1</sub>)</strong></p></div>
								<div>
									<select id="sensor1">
									    <option value="1">Sensor 1</option>
									    <option value="2">Sensor 2</option>
									    <option value="3">Sensor 3</option>
									    <option value="4">Sensor 4</option>
									    <option value="5">Sensor 5</option>
									    <option value="6">Sensor 6</option>
									    <option value="7">Sensor 7</option>
									</select>
									
									<select id="sensor2">
									    <option value="1">Sensor 1</option>
									    <option value="2">Sensor 2</option>
									    <option value="3">Sensor 3</option>
									    <option value="4">Sensor 4</option>
									    <option value="5">Sensor 5</option>
									    <option value="6">Sensor 6</option>
									    <option value="7">Sensor 7</option>
									</select>
									
									<button id="calculate">Calculate Slope</button>
								</div>
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
            $('#calculate').on('click', function() {
                const sensor1Index = parseInt($('#sensor1').val());
                const sensor2Index = parseInt($('#sensor2').val());

                const tiltX1 = data.map(item => item['tilt-0' + sensor1Index + '-x'] || 0);
                const tiltY1 = data.map(item => item['tilt-0' + sensor1Index + '-y'] || 0);
                const tiltX2 = data.map(item => item['tilt-0' + sensor2Index + '-x'] || 0);
                const tiltY2 = data.map(item => item['tilt-0' + sensor2Index + '-y'] || 0);

                const slopes = [];

                for (let j = 0; j < tiltX1.length - 1; j++) {
                    const deltaX = tiltX2[j + 1] - tiltX1[j + 1];
                    const deltaY = tiltY2[j + 1] - tiltY1[j + 1];

                    if (deltaX !== 0) {
                        const slope = deltaY / deltaX;
                        slopes.push(slope);
                    } else {
                        slopes.push(Infinity); // 수직 기울기
                    }
                }

                // 결과를 차트에 표시
                const ctx = document.getElementById('barChart').getContext('2d');
                const myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: data.map(item => item.opdatetime).slice(0, slopes.length), // 날짜 레이블
                        datasets: [{
                            label: 'Slope between Sensor ' + sensor1Index + ' and Sensor ' + sensor2Index,
                            data: slopes,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderWidth: 1,
                        }]
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
                    }
                });
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
