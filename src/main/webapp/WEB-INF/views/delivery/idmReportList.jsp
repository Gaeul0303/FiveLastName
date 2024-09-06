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
                    <a href="#">현황관리 리포트</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">현황관리 리포트</h4>
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
                              <th>품목명</th>
                              <th>공급가</th>
                              <th>출고수량</th>
                              <th>가용재고량</th>
                              <th>총액</th>
                              <th>출고일</th>
                              <th>상태</th>
                            </tr>
                          </thead>
                          <tfoot>
                            <tr>
                              <th>품목 코드</th>
                              <th>품목명</th>
                              <th>공급가</th>
                              <th>출고수량</th>
                              <th>가용재고량</th>
                              <th>총액</th>
                              <th>출고일</th>
                              <th>상태</th>
                            </tr>
                          </tfoot>
                          <tbody>
                           <c:forEach var="idm" items="${idmReportList}"> 
                            <tr>
                              <td>${idm.in_id }</td>
                              <td><button onclick="openPopup('${idm.in_id}')"></button>${idm.pr_name}</td>
                              <td>${idm.co_supplyPrice}</td>
                              <td>${idm.idm_quantity }</td>
                              <td>${idm.in_availableInventory }</td>
                              <td>${idm.co_supplyPrice* idm.idm_quantity }</td>
                              <td>${idm.idm_date }</td>
                              <td>${idm.idm_status }</td>
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
            order: [[6, 'desc']],
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
          function openPopup(in_id) {
        	  // 팝업을 띄울 페이지 URL
        	  var popupURL = "/selectIdm?in_id="+in_id;
        	  // 팝업 창의 속성
        	  var popupProperties = "width=850,height=530,scrollbars=yes";
        	  // 팝업 열기
        	  window.open(popupURL, "Popup", popupProperties);
        }
          
        });
      </script>
  </body>
</html>
