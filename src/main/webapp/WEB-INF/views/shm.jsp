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
								<div class="card-title">건전성 모니터링 시스템</div>
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
	        url: '/resources/assets/structure.json', // 수정된 컨트롤러 URL
	        method: 'GET',
	        dataType: 'json',
	       
	        success: function(data) {
	            
	            const date = data.map(item => item.DATE);
	           
	            // 64개의 채널 이름 생성
	            const channels = [];
	            for (let i = 1; i <= 16; i++) { // CH1부터 CH8까지
	                for (let j = 0; j < 4; j++) { // A부터 D까지 (0~25)
	                    const channelName = 'CH' + i + '_' + String.fromCharCode(65 + j); // 65는 'A'
	                    channels.push(channelName);
	                }
	            }

	         // RGB 색상 배열 생성
	            const colors = [];
	            for (let index = 0; index < channels.length; index++) {
	                const r = (index * 40) % 256; // R값
	                const g = (index * 80) % 256; // G값
	                const b = (index * 120) % 256; // B값


	                colors.push("rgb("+r+", "+g+", "+b+")"); // RGB 색상
	            }
	               
	            // 데이터셋 생성
	            const datasets = channels.map((channel, index) => ({
	                label:channel, // 레이블
	                data: data.map(item => item[channel] || 0), // 데이터가 없는 경우 0으로 처리
	                backgroundColor: `rgba(0, 0, 0, 0)`, // 배경색 (투명)
	                borderColor: colors[index], 
	                borderWidth: 1,
	                hidden: true 
	            }));

	            // 차트 그리기
	            const ctx = document.getElementById('barChart').getContext('2d');
	            new Chart(ctx, {
	                type: 'line',
	                data: {
	                    labels: date, // X축 레이블
	                    datasets: datasets
	                },
	                options: {
	                    responsive: true,
	                    maintainAspectRatio: false,
	                    scales: {
	                    	 x: {
	                    		 ticks: {
	                                 autoSkip: false, // 라벨 자동 생략 비활성화
	                                 maxRotation: 45, // 최대 회전 각도
	                                 minRotation: 45  // 최소 회전 각도
	                             },
	                             grid: {
	                                 display: true, // 그리드 표시 여부
	                                 color: "rgba(0, 0, 0, 0.1)" // 그리드 색상
	                             },
	                             min: 0, // 최소 값 (필요에 따라 조정)
	                             max: date.length - 1, // 최대 값 (데이터 수에 따라 조정)
	                             stepSize: 0.1, // 간격을 조정할 수 있음 (필요에 따라 주석 처리 해제)
                                 padding: 2, // 레이블 간의 패딩 조정
	                         },
	                         y: {
	                             beginAtZero: true,
	                             ticks: {
	                                 // 레이블 세로 표시
	                                 callback: function(value) {
	                                     return value; // 각 레이블을 그대로 표시
	                                 },
	                                 autoSkip: true, // 모든 레이블 표시
	                                 maxRotation: 50, // 최대 회전 각도 (90도로 세로 표시)
	                                 minRotation: 50 // 최소 회전 각도 (90도로 세로 표시)
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
