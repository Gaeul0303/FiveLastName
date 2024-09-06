<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="../include/head.jsp" %>
  </head>
  <body>
    <div class="wrapper">
      <%@include file="../include/sideBar.jsp" %>
      
      <div class="main-panel">
          <%@include file="../include/header.jsp" %>

          <div class="container">
            <div class="page-inner">
              <div class="page-header">
                <h3 class="fw-bold mb-3">입고</h3>
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
                      <h4 class="card-title">입고 현황</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover"
                        >
                          <thead>
                            <tr>
                              <th>입고검수ID</th>	
                              <th>거래회사명</th>	
                              <th>품목명</th>
                              <th>수량</th>
                              <th>입고여부</th>
                              <th>입고일</th>
                              <th>상세</th>
                            </tr>
                          </thead>
                          <tfoot>
                            <tr>
                              <th>Name</th>
                              <th>Position</th>
                              <th>Office</th>
                              <th>Age</th>
                              <th>Start date</th>
                              <th>Salary</th>
                            </tr>
                          </tfoot>
                          <tbody>
                            <c:forEach var="ri" items="${ri_list }">
                            	<tr>
	                              <td><a href="/receivingInspection/select?ri_id=${ri.ri_id }">${ri.ri_id }</a></td>
	                              <td>${ri.pa_name }</td>
	                              <td>${ri.pr_name }</td>
	                              <td>${ri.pi_inspectedQuantity }</td>
	                              <td>${ri.ri_date }</td>
	                              <td>${ri.ri_availability }</td>
	                              <c:choose>
	                              	<c:when test="${ri.ri_availability eq '입고대기' }">
	                            		<td>${ri.ri_date }</td>
	                              	</c:when>
	                              	<c:otherwise>
	                              		<td></td>
	                              	</c:otherwise>
	                              </c:choose>
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

      <%@include file="../include/footer.jsp" %>
    </div>

    <%@include file="../include/script.jsp" %>

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
