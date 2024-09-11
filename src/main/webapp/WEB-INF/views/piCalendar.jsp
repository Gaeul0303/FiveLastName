<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
  <head>
    <%@include file="include/head.jsp" %>
    <link rel="stylesheet" href="${path }/resources/assets/js/plugin/fullcalendar/main.min.css">
    <link rel="stylesheet" href="${path }/resources/assets/css/fullcalendar.css"> 
    <style type="text/css">
    
    .fc-event-time{
    display:none !important}
    .fc-event-title{
    color
    :#000 !important}
    </style>
  </head>
  <body>
    <div class="wrapper">
      <%@include file="include/sideBar.jsp" %>

      <div class="main-panel">
        <%@include file="include/header.jsp" %>

        <div class="container">
            <div class="page-inner">
                <div class="page-header">
                    <h3 class="fw-bold mb-3">Calendar</h3>
                    <ul class="breadcrumbs mb-3">
                      <li class="nav-home">
                        <a href="#">
                          <i class="icon-home"></i>
                        </a>
                      </li>
                      <li class="separator">
                        <i class="icon-arrow-right"></i>
                      </li>
                      <li class="nav-item">
                        <a href="#">Home</a>
                      </li>
                      <li class="separator">
                        <i class="icon-arrow-right"></i>
                      </li>
                      <li class="nav-item">
                        <a href="#">Calendar</a>
                      </li>
                    </ul>
                  </div>
            </div>
            

          <div class="row">
            <div class="col-md-9">
              <div class="card">
                <div class="card-body p-0">
                  <!-- THE CALENDAR -->
                  <div id="calendar"></div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        <!-- /.content-wrapper -->
        </div>
      </div>
      <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/script.jsp" %>
    <script src="${path }/resources/assets/js/plugin/jquery-ui/jquery-ui.min.js"></script>
    <script src="${path }/resources/assets/js/plugin/moment/moment.min.js"></script>
    <script src="${path }/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>
    <script src="${path }/resources/assets/js/plugin/fullcalendar/main.js"></script>
    <script>
      $(function () {
        var eventsData = [
          <c:forEach var="pi" items="${pi}">
            {
              title: '${pi.pa_name} ${pi.pi_order}차검수일 ',
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
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          themeSystem: 'bootstrap',
          events: eventsData,
          editable: true,
          droppable: true,
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
  </body>
</html>