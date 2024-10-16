<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true"%>
<html lang="ko">
<head>
	<%@include file="../include/head.jsp"%>
	<link rel="stylesheet" href="${path}/resources/assets/js/plugin/fullcalendar/main.min.css">
	<link rel="stylesheet" href="${path}/resources/assets/css/fullcalendar.css">
	<style type="text/css">
		.fc-event-time { display: none !important; }
		.fc-event-title { color: #000 !important; }
		.chart-container { margin: 20px 0; display: flex; justify-content: space-around; }
		.canvas-wrapper canvas { width: 100% !important; height: 400px; }
	</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="../include/sideBar.jsp"%>

		<div class="main-panel">
			<%@include file="../include/header.jsp"%>

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
								<div class="card-title">직선회귀모형</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<div class="canvas-wrapper">
										<canvas id="week_demand_relationship"></canvas>
										<canvas id="DNR_Inflation_demand_relationship"></canvas>
										<canvas id="BIM_Unemployment_demand_relationship"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../include/footer.jsp"%>
	</div>

	<%@include file="../include/script.jsp"%>
	<script src="${path}/resources/assets/js/plugin/jquery-ui/jquery-ui.min.js"></script>
	<script src="${path}/resources/assets/js/plugin/moment/moment.min.js"></script>
	<script src="${path}/resources/assets/js/plugin/fullcalendar/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
	$(document).ready(function() {
	    const dayMapping = {
	        1: '월요일',
	        2: '화요일',
	        3: '수요일',
	        4: '목요일',
	        5: '금요일',
	        6: '토요일',
	        7: '일요일',
	    };

	    // JSON 파일 불러오기
	    $.ajax({
	        url: '/resources/assets/output.json',
	        method: 'GET',
	        dataType: 'json',
	        success: function(data) {
	            const x1 = data.x1; // 요일
	            const y1 = data.y1; // 요일에 따른 수요
	            const x2 = data.x2; // 월
	            const y2 = data.y2; // 월에 따른 수요
	            const x3 = data.x3; // 분기
	            const y3 = data.y3; // 분기에 따른 수요

	            // 요일과 수요 관계 차트
	            const scatterData1 = x1.map((day, index) => ({
	                x: Number(day),
	                y: y1[index]
	            }));

	            const ctx1 = document.getElementById('week_demand_relationship').getContext('2d');
	            new Chart(ctx1, {
	                type: 'scatter',
	                data: {
	                    datasets: [{
	                        label: '요일과 수요 관계',
	                        data: scatterData1,
	                        backgroundColor: 'rgba(75, 192, 192, 0.6)',
	                        borderColor: 'rgba(75, 192, 192, 1)',
	                        borderWidth: 1
	                    }]
	                },
	                options: {
	                    scales: {
	                        x: {
	                            title: { display: true, text: '요일' },
	                            ticks: {
	                                callback: function(value) {
	                                    return dayMapping[value];
	                                }
	                            }
	                        },
	                        y: {
	                            title: { display: true, text: '수요' },
	                            beginAtZero: true
	                        }
	                    }
	                }
	            });

	            // 월별 수요 관계 차트
	            const scatterData2 = [];
	            for (let month = 1; month <= 12; month++) {
	                const monthData = y2.filter((_, index) => x2[index] == month);
	                monthData.forEach(y => {
	                    scatterData2.push({ x: month, y });
	                });
	            }

	            const ctx2 = document.getElementById('DNR_Inflation_demand_relationship').getContext('2d');
	            new Chart(ctx2, {
	                type: 'scatter',
	                data: {
	                    datasets: [{
	                        label: '월별 수요',
	                        data: scatterData2,
	                        backgroundColor: 'rgba(153, 102, 255, 0.6)',
	                        borderColor: 'rgba(153, 102, 255, 1)',
	                        borderWidth: 1
	                    }]
	                },
	                options: {
	                    scales: {
	                        x: {
	                            title: { display: true, text: '월' },
	                            ticks: {
	                                stepSize: 1 // 월별 1단위로 표시
	                            }
	                        },
	                        y: {
	                            title: { display: true, text: '수요' },
	                            beginAtZero: true
	                        }
	                    }
	                }
	            });

	            // 분기별 수요 관계 차트
	            const scatterData3 = x3.map((quarter, index) => ({
	                x: Number(quarter),
	                y: y3[index]
	            }));

	            const ctx3 = document.getElementById('BIM_Unemployment_demand_relationship').getContext('2d');
	            new Chart(ctx3, {
	                type: 'scatter',
	                data: {
	                    datasets: [{
	                        label: '분기별 수요',
	                        data: scatterData3,
	                        backgroundColor: 'rgba(255, 159, 64, 0.6)',
	                        borderColor: 'rgba(255, 159, 64, 1)',
	                        borderWidth: 1
	                    }]
	                },
	                options: {
	                    scales: {
	                        x: {
	                            title: { display: true, text: '분기' },
	                            ticks: {
	                                stepSize: 1 // 분기별 1단위로 표시
	                            }
	                        },
	                        y: {
	                            title: { display: true, text: '수요' },
	                            beginAtZero: true,
	                            ticks: {
	                                stepSize: 1 // y축 1단위로 표시
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
