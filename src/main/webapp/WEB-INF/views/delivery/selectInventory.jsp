<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="../include/head.jsp" %>
  </head>
  <body>
    <div class="wrapper">
      
      <div class="main-panel">

          <div class="container">
            <div class="page-inner">
              <div class="page-header">
                <h3 class="fw-bold mb-3">자재</h3>
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
                    <a href="#">재고정보</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">재고정보</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover"
                        >
                          <thead>
                            <tr>
                              <th>품목 코드</th>
                              <th>안전재고량</th>
                              <th>가용재고량</th>
                              <th>실물재고량</th>
                            </tr>
                          </thead>
                          <tfoot>
                            <tr>
                              <th>품목 코드</th>
                              <th>안전재고량</th>
                              <th>가용재고량</th>
                              <th>실물재고량</th>
                            </tr>
                          </tfoot>
                          <tbody>
                            <tr>
                              <td>${inv.pr_name }</td>
                              <td>${inv.in_safetyStock }</td>
                              <td>${inv.in_availableInventory}</td>
                              <td>${inv.in_physicalInventory}</td>
                            </tr>
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
        
        function openPopup(in_id) {
        	  // 팝업을 띄울 페이지 URL
        	  var popupURL = "/selectList?in_id="+in_id;
        	  // 팝업 창의 속성
        	  var popupProperties = "width=600,height=400,scrollbars=yes";
        	  // 팝업 열기
        	  window.open(popupURL, "Popup", popupProperties);
        	}
      </script>
  </body>
</html>
