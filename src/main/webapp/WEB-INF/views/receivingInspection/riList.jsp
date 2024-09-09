receiveingInspectionList<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
<style type="text/css">
    
    .centerTD{
    	text-align : center;
    }
    
    </style>
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
                    <a href="#">입고 현황</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">입고현황 전체보기</a>
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
                              <th>품목명</th>
                              <th>수량</th>
                              <th>입고여부</th>
                              <th>입고일</th>
                              <th>상세</th>
                            </tr>
                          </thead>
                          <tfoot>
                            <tr>
                              <th></th>	
                              <th></th>	
                              <th></th>
                              <th></th>
                              <th></th>
                              <th></th>
                              <th></th>
                            </tr>
                          </tfoot>
                          <tbody>
                            <c:forEach var="ri" items="${ri_list }">
                            	<tr>
	                              <td class = "centerTD"><a href="/receivingInspection/insert?ri_id=${ri.ri_id }">${ri.ri_id }</a></td>
	                              <td>${ri.pr_name }</td>
	                              <td>${ri.pi_inspectedQuantity }</td>
	                              <td>${ri.ri_date }</td>
	                              <td>${ri.ri_availability }</td>
	                              <td><a href=/receivingInspection/select?ri_id=${ri.ri_id }>상세</a></td>
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
        var table = $("#basic-datatables").DataTable({
            pageLength: 5,
            aaSorting: []
        });

        // 필터를 적용할 열 인덱스 배열
        var categoryColumns = [1, 4];

        // 필터를 적용할 열에 대해서만 처리
        categoryColumns.forEach(function (index) {
            var column = table.column(index);
            
            var select = $('<select class="form-select"><option value="">카테고리선택</option></select>')
                .appendTo($(column.footer()).empty())
                .on('change', function () {
                    var val = $.fn.dataTable.util.escapeRegex($(this).val());
                    column
                        .search(val ? "^" + val + "$" : "", true, false)
                        .draw();
                });

            // 해당 열의 데이터로 select 박스 옵션 추가
            column.data().unique().sort().each(function (d, j) {
                select.append('<option value="' + d + '">' + d + '</option>');
            });
        });
    });
      </script>
  </body>
</html>
