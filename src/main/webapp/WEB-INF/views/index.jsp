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
				<div class="page-inner" style="padding-bottom:0">
					<div class="">
						<h3 class="fw-bold mb-3">MMS</h3>
						
					</div>
				</div>


				<div class="row page-inner">
					<div class="col-md-6">
						<div class="card">
							<div class="card-body p-0">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>

					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-title">출고수량</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<canvas id="barChart"></canvas>
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
	<script
		src="${path }/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>
	<script src="${path }/resources/assets/js/plugin/fullcalendar/main.js"></script>
	<script>
      $(function () {
        var eventsData = [
          <c:forEach var="pi" items="${pi}">
            {
              title: '${pi.pa_name} ${pi.pi_order}차 검수일 ',
              start: '${pi.pi_date}',
              color: '#000',
              url: '/progressInspection/select?pi_id=${pi.pi_id}'
            }
            <c:if test="${not empty pi && !status.last}">,</c:if>
          </c:forEach>
        ];

        // Initialize the calendar
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: '',
            right: 'title'
          },
          themeSystem: 'bootstrap',
          events: eventsData,
          editable: false,
          disableDragging: false,
          droppable: false,
          eventClick: function (info) {
            if (info.event.url) {
              window.location.href = info.event.url;
            }
            info.jsEvent.preventDefault();
          }
        });
        calendar.render();
      //  var currColor = '#3c8dbc' //Red by default
            // Color chooser button
            $('#color-chooser > li > a').click(function (e) {
              e.preventDefault()
              // Save color
              currColor = $(this).css('color')
              // Add color effect to button
              $('#add-new-event').css({
                'background-color': currColor,
                'border-color'    : currColor
              })
            })
            $('#add-new-event').click(function (e) {
              e.preventDefault()
              // Get value and make sure it is not null
              var val = $('#new-event').val()
              if (val.length == 0) {
                return
              }
        
              // Create events
              var event = $('<div />')
              event.css({
                'background-color': currColor,
                'border-color'    : currColor,
                'color'           : '#000'
              }).addClass('external-event')
              event.text(val)
              $('#external-events').prepend(event)
        
              // Add draggable funtionality
              ini_events(event)
        
              // Remove event from text input
              $('#new-event').val('')
            })
          
      });
    </script>
    
    <script>
        var barChart = document.getElementById("barChart").getContext("2d");
 
        $(document).ready(function() {
            $.ajax({
                url: '/barChart', // 수정된 컨트롤러 URL
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    // 데이터 준비
                    console.log(data);
                    const items = data.map(item => item.item); // 품목 이름
               		var dataItem = [];
               		const customData = [];
                    
                	for (var i = 0; i < data.length; i++) {
                		customData.push(data[i].item);
                	}
                	for (var i = 0; i < data.length; i++) {
						
                		if(data[i].item.length > 5){
                			dataItem.push(data[i].item.substr(0,5) + "...")
                		}else{
                			dataItem.push(data[i].item)
                		}
					}
                	console.log(customData)
                	

                    
                    const quantities = data.map(item => item.total_quantity); // 총 출고 수량

                    // 차트 그리기
                    var ctx = document.getElementById('barChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: dataItem, // X축 레이블
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
                            },
                          tooltips: {
                        	  callbacks: {
                        		  title: function(tooltipItems) {
                                     
                                      return customData[tooltipItems[0].index]; 
                                  },
                                  label: function(tooltipItem) {
                                 		console.log(tooltipItem.yLabel)
                                      return "출고 수량 : " + tooltipItem.yLabel; // Y 값 유지
                                  }
                              }
                            },
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
