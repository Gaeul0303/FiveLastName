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
                <h3 class="fw-bold mb-3">구매발주서 전체조회</h3>
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
                    <a href="#">구매발주서전체조회</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">구매발주서 전체조회</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover"
                        >
                          <thead>
                            <tr>
                              <th>구매발주서 번호</th>	<!-- po_id -->
                              <th>품목명</th>			<!-- po.ppr_id.co_id.es_id.pr_id.pr_name 발주서의 조달계획등록의 거래계약의 품목의 이름.-->
                              <th>공급가</th>			<!-- po.ppr_id.co_id.co_supplyPrice -->
                              <th>소요일</th>			<!-- po.ppr_id.co_id.es_id.es_requiredDays -->
                              <th>거래조건</th>		<!-- po.ppr_id.co_id.co_tradeTerms -->
                              <th>계약일</th>			<!-- po.ppr_id.co_id.co_contractDate -->
                              <th>거래회사이름</th>		<!-- po.ppr_id.co_id.es_id.pa_id.pa_name -->
                              <th>납기예정일</th>		<!-- po.ppr_id.ppr_dueDate -->
                              <th>발행일</th>			<!-- po.po_regDate -->
                            </tr>
                          </thead>
                          
                          <tfoot>
                            <tr>
                              <th>구매발주서 번호</th>	<!-- po_id -->
                              <th>품목명</th>			<!-- po.ppr_id.co_id.es_id.pr_id.pr_name 발주서의 조달계획등록의 거래계약의 품목의 이름.-->
                              <th>공급가</th>			<!-- po.ppr_id.co_id.co_supplyPrice -->
                              <th>소요일</th>			<!-- po.ppr_id.co_id.es_id.es_requiredDays -->
                              <th>거래조건</th>		<!-- po.ppr_id.co_id.co_tradeTerms -->
                              <th>계약일</th>			<!-- po.ppr_id.co_id.co_contractStatus -->
                              <th>거래회사이름</th>		<!-- po.ppr_id.co_id.es_id.pa_id.pa_name -->
                              <th>납기예정일</th>		<!-- po.ppr_id.ppr_dueDate -->
                              <th>발행일</th>			<!-- po.po_regDate -->
                            </tr>
                          </tfoot>
                          
                          <tbody>
                          	<c:forEach var = "po" items="${poList}">
                          		<tr>
                          			<td><a href="purchaseOrderSelect?po_id=${po.po_id}">${po.po_id}</a></td>
                          			<td>${po.pr_name}</td>
                          			<td>${po.co_supplyPrice}</td>
                          			<td>${po.es_requiredDays}</td>
                          			<td>${po.co_tradeTerms}</td>
                          			<td>${po.co_contractDate}</td>
                          			<td>${po.pa_name}</td>
                          			<td>${po.ppr_dueDate}</td>
                          			<td>${po.po_regDate}</td>
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
