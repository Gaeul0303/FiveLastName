<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<html lang="ko">
<head>
    <%@include file="../include/head.jsp"%>
    <link rel="stylesheet" href="${path}/resources/assets/js/plugin/fullcalendar/main.min.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/fullcalendar.css">
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style type="text/css">
        .fc-event-time {
            display: none !important;
        }
        .fc-event-title {
            color: #000 !important;
        }
        .chart-container {
            margin: 20px 0;
            display: flex;
            justify-content: space-around;
        }
        .canvas-wrapper {
            width: 100%; /* 폭을 100%로 설정 */
            height: 800px; /* 높이 설정 */
        }
        canvas {
            width: 100% !important; /* 차트의 폭을 100%로 설정 */
            height: 800px !important; /* 차트의 높이 설정 */
        }
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
                                <div class="card-title">다중선형회귀모형</div>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <div class="canvas-wrapper">
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                                    <div class="results">
                                        <p>
                                            평균 제곱 오차 (MSE):
                                            <c:out value="${mse}" />
                                        </p>
                                        <p>
                                            제곱근 평균 제곱 오차 (RMSE):
                                            <c:out value="${rmse}" />
                                        </p>
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

    <script>
        // y_test와 y_pred를 JSON 형식으로 가져오기
        const y_test = JSON.parse('${fn:escapeXml(y_test)}'); // y_test 데이터를 JSP에서 가져옴
        const y_pred = JSON.parse('${fn:escapeXml(y_pred)}'); // y_pred 데이터를 JSP에서 가져옴

        // 차트가 로드되기 전에 데이터가 유효한지 확인
        console.log('y_test:', y_test);
        console.log('y_pred:', y_pred);

        // ctx 변수를 여기서 한 번만 선언
        const chartCanvas = document.getElementById('myChart').getContext('2d');
        const myChart = new Chart(chartCanvas, {
            type: 'scatter',
            data: {
                datasets: [{
                    label: 'MULTIPLE_LINEAR_REGRESSION',
                    data: y_test.map((value, index) => ({ x: value, y: y_pred[index] })),
                    backgroundColor: 'rgba(255, 99, 132, 0.6)', // 빨간색, 투명도 60%
                    pointRadius: 5,
                    pointHoverRadius: 7
                }]
            },
            options: {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Actual Values (y_test)'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Predicted Values (y_pred)'
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
