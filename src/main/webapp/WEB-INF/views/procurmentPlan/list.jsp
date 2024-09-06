<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="/WEB-INF/views/include/head.jsp" %>
  </head>
  <body>
    <div class="wrapper">
      <%@include file="/WEB-INF/views/include/sideBar.jsp" %>
      
      <div class="main-panel">
          <%@include file="/WEB-INF/views/include/header.jsp" %>

          <div class="container">
            <div class="page-inner">
              <div class="page-header">
                <h3 class="fw-bold mb-3">DataTables.Net</h3>
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
                    <a href="#">Tables</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">Datatables</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">Basic</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover"
                        >
                          <thead>
                            <tr>
                              <th>조달계획ID</th>
                              <th>품목ID</th>                              
                              <th>자재소요공정</th>
                              <th>소요일</th>
                              <th>소요량</th>
                              <th>등록일</th>
                              <th>조달납기</th> 
                              <th>자세히보기</th>                            
                            </tr>
                          </thead>
                          <tfoot>
                            <tr>
                              <th>Name</th>
                              <th>Position</th>
                              <th>Office</th>
                              <th>Age</th>
                              <th>Start date</th>       
                            </tr>
                          </tfoot>
                          <tbody>
                          	<c:forEach items="${list}" var="procurmentPlan">                           
                            <tr>
                              <td>${procurmentPlan.pp_id}</td>
                              <td>${procurmentPlan.pr_id }</td>                              
                              <td>${procurmentPlan.pp_materialRequiredProcessStage }</td>
                              <td>${procurmentPlan.pp_makeTime }</td>
                              <td>${procurmentPlan.pp_spendAmount }</td>
                              <td>${procurmentPlan.pp_regDate}</td>
                              <td>${procurmentPlan.pp_deliveryDate }</td>
                              <td><a href="/procurmentPlan/information?pp_id=${procurmentPlan.pp_id}">자세히보기</a></td>                              
                            </tr>
                         	</c:forEach>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
  
             
              </div>
            </div>
          </div>
      </div>

      <%@include file="/WEB-INF/views/include/footer.jsp" %>
    </div>

    <%@include file="/WEB-INF/views/include/script.jsp" %>

    <script>
        $(document).ready(function () {
        
          $("#basic-datatables").DataTable({
            pageLength: 5,
            initComplete: function () {
              this.api()
                .columns()
                .every(function () {
                  var column = this;
                  var select = $(
                    '<select class="form-select"><option value=""></option></select>'
                  )
                    .appendTo($(column.footer()).empty())
                    .on("change", function () {
                      var val = $.fn.dataTable.util.escapeRegex($(this).val());
  
                      column
                        .search(val ? "^" + val + "$" : "", true, false)
                        .draw();
                    });
  
                  column
                    .data()
                    .unique()
                    .sort()
                    .each(function (d, j) {
                      select.append(
                        '<option value="' + d + '">' + d + "</option>"
                      );
                    });
                });
            },
          });
  
          
        });
      </script>
  </body>
</html>
