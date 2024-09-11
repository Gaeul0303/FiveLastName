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
              <h3 class="fw-bold mb-3">
              <c:if test="${st_id !=null }">
                 asdfasdfasdf
              </c:if>
              </h3>
              
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
  
        var myBarChart = new Chart(barChart, {
          type: "bar",
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
                label: "Sales",
                backgroundColor: "rgb(23, 125, 255)",
                borderColor: "rgb(23, 125, 255)",
                data: [3, 2, 9, 5, 4, 6, 4, 6, 7, 8, 7, 4],
              },
            ],
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
              yAxes: [
                {
                  ticks: {
                    beginAtZero: true,
                  },
                },
              ],
            },
          },
        });

        // Chart with HTML Legends
  
      </script>
  </body>
</html>
