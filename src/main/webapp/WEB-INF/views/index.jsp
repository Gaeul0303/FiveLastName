<!-- 기본틀 index page -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
 <%@ page session="true" %>
<html lang="ko">
  <head>
    
    <%@include file="include/head.jsp" %>
  </head>
  <body>
    <div class="wrapper">
      <%@include file="include/sideBar.jsp" %>
      
      <div class="main-panel">
          <%@include file="include/header.jsp" %>

        
          <!--
          
          <div class="container">
            <div class="page-inner">
              <h3 class="fw-bold mb-3">제목</h3>
              
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
                      
                        데이터의 추가는 이 부분에 작성해주세요
                        데이터의 추가는 이 부분에 작성해주세요
                        데이터의 추가는 이 부분에 작성해주세요

                        
                    </div>
                  </div>
                </div>


              </div>
            </div>
          </div> 
          
          -->

       
        </div>

      <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/script.jsp" %>
  </body>
</html>
