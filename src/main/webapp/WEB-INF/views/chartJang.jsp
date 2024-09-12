<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="include/head.jsp" %>
    <style>
        .chart-container {
            position: relative;
            width: 100%;
            height: 500px;
        }
        canvas {
            display: block;
            width: 100% !important;
            height: 100% !important;
        }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <%@include file="include/sideBar.jsp" %>
      
      <div class="main-panel">
          <%@include file="include/header.jsp" %>
          
          <div class="container">
            <div class="page-inner">
              <h3 class="fw-bold mb-3">Chart.js</h3>
              
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <div class="card-title">Bar Chart</div>
                    </div>
                    <div class="card-body">
                      <div class="chart-container">
                        <canvas id="barChart"></canvas>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    
      <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/script.jsp" %>
    <script>
    $(document).ready(function() {
        $.ajax({
            url: '/barChart', // 수정된 컨트롤러 URL
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                // 데이터 준비
                console.log(data);
                const items = data.map(item => item.item); // 품목 이름
                const quantities = data.map(item => item.total_quantity); // 총 출고 수량

                // 차트 그리기
                var ctx = document.getElementById('barChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: items.map(item => {
                            // 레이블을 간략화
                            return item.length > 10 ? item.substring(0, 10) + '...' : item;
                        }), // X축 레이블
                        datasets: [{
                            label: '출고 수량',
                            data: quantities, // Y축 데이터
                            backgroundColor: 'rgba(23, 125, 255, 0.2)',
                            borderColor: 'rgba(23, 125, 255, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    title: function(tooltipItems) {
                                        // 전체 품목 이름을 툴팁 제목으로 표시
                                        const index = tooltipItems[0].dataIndex;
                                        return items[index];
                                    },
                                    label: function(tooltipItem) {
                                        // 출고 수량을 툴팁에 표시
                                        return '수량: ' + tooltipItem.raw;
                                    }
                                },
                                // 추가 스타일 옵션
                                bodyFont: {
                                    size: 14
                                },
                                titleFont: {
                                    size: 16,
                                    weight: 'bold'
                                }
                            }
                        },
                        scales: {
                            x: {
                                ticks: {
                                    // 레이블 줄이기
                                    callback: function(value, index, values) {
                                        const maxLabelLength = 10; // 최대 레이블 길이 설정
                                        if (this.getLabelForValue(value).length > maxLabelLength) {
                                            return this.getLabelForValue(value).substring(0, maxLabelLength) + '...';
                                        }
                                        return this.getLabelForValue(value);
                                    },
                                    maxRotation: 45, // 레이블 회전
                                    minRotation: 45
                                },
                                title: {
                                    display: true,
                                    text: '품목 이름'
                                }
                            },
                            y: {
                                beginAtZero: true
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
