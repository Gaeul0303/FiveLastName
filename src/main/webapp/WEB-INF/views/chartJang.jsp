<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="include/head.jsp" %>
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
                <div class="col-md-6">
                  <div class="card">
                    <div class="card-header">
                      <div class="card-title">Line Chart</div>
                    </div>
                    <div class="card-body">
                      <div class="chart-container">
                        <canvas id="lineChart"></canvas>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
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
        var lineChart = document.getElementById("lineChart").getContext("2d"),
          barChart = document.getElementById("barChart").getContext("2d");
         
        var myLineChart = new Chart(lineChart, {
          type: "line",
          data: {
            labels: [
              "Jan",
              "Feb",
              "Mar",
              "Apr",
              "May",
              "Jun",
              "Jul",
              "Aug",
              "Sep",
              "Oct",
              "Nov",
              "Dec",
            ],
            datasets: [
              {
                label: "Active Users",
                borderColor: "#1d7af3",
                pointBorderColor: "#FFF",
                pointBackgroundColor: "#1d7af3",
                pointBorderWidth: 2,
                pointHoverRadius: 4,
                pointHoverBorderWidth: 1,
                pointRadius: 4,
                backgroundColor: "transparent",
                fill: true,
                borderWidth: 2,
                data: [
                  542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 900,
                ],
              },
            ],
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            legend: {
              position: "bottom",
              labels: {
                padding: 10,
                fontColor: "#1d7af3",
              },
            },
            tooltips: {
              bodySpacing: 4,
              mode: "nearest",
              intersect: 0,
              position: "nearest",
              xPadding: 10,
              yPadding: 10,
              caretPadding: 10,
            },
            layout: {
              padding: { left: 15, right: 15, top: 15, bottom: 15 },
            },
          },
        });
  
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
                            labels: items, // X축 레이블
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
                            scales: {
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

        // Chart with HTML Legends
  
      </script>
  </body>
</html>
