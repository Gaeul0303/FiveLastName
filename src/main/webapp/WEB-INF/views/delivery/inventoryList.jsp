<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="../include/head.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.13.1/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/vfs_fonts.js"></script>
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
                    <a href="#">불출자재</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">불출자재</h4>
                      <div class="date-filter">
                                        <label for="start-date">시작 날짜:</label>
                                        <input type="date" id="start-date" name="start-date">
                                        <label for="end-date">끝 날짜:</label>
                                        <input type="date" id="end-date" name="end-date">
                                        <button id="filter-btn">조회</button>
                      </div>
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
                              <th>카테고리</th>
                              <th>실물재고량</th>
                              <th>이미지</th>
                              <th>입고일</th>
                              <th>총 금액</th>
                            </tr>
                          </thead>
                          <tfoot>
                            <tr>
                              <th>품목 코드</th>
                              <th>품목명</th>
                              <th>카테고리</th>
                              <th>실물재고량</th>
                              <th>이미지</th>
                              <th>입고일</th>
                              <th>총 금액</th>
                            </tr>
                          </tfoot>
                          <tbody>
                           <c:forEach var="inv" items="${inventoryList}"> 
                            <tr>
                              <td><button onclick="openPopup('${inv.in_id}')">${inv.in_id }</button></td>
                              <td>${inv.pr_name }</td>
                              <td>${inv.pr_category }</td>
                              <td>${inv.in_physicalInventory}</td>
                              <td>${inv.pr_image }</td>
                              <td>${inv.ri_date }</td>
                              <td>${inv.co_supplyPrice*inv.in_physicalInventory}</td>
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
    
 // 팝업 창 열기
    function openPopup(in_id) {
        var popupURL = "/selectInventory?in_id=" + in_id;
        var popupProperties = "width=850,height=530,scrollbars=yes";
        window.open(popupURL, "Popup", popupProperties);
    }
 
 
    $(document).ready(function () {
        // DataTable 인스턴스를 변수에 저장
        var table = $("#basic-datatables").DataTable({
            pageLength: 5,
            initComplete: function () {
                this.api().columns().every(function () {
                    var column = this;
                    var select = $('<select class="form-select"><option value=""></option></select>')
                        .appendTo($(column.footer()).empty())
                        .on("change", function () {
                            var val = $.fn.dataTable.util.escapeRegex($(this).val());
                            column.search(val ? "^" + val + "$" : "", true, false).draw();
                        });

                    column.data().unique().sort().each(function (d, j) {
                        select.append('<option value="' + d + '">' + d + "</option>");
                    });
                });
            }
        });
        // 필터링 버튼 클릭 핸들러
        $("#filter-btn").click(function() {
            var startDate = $('#start-date').val();
            var endDate = $('#end-date').val();

            if (startDate && endDate) {
                var start = new Date(startDate);
                var end = new Date(endDate);

                // 기존의 필터 함수 제거
                $.fn.dataTable.ext.search = []; // 필터 함수 배열을 초기화

                // 날짜 범위 필터링을 DataTables의 검색에 적용
                $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
                    var dateStr = data[5]; // 출고일 열의 데이터
                    var rowDate = new Date(dateStr);

                    // 날짜만 비교
                    start.setHours(0, 0, 0, 0);
                    end.setHours(23, 59, 59, 999);

                    return rowDate >= start && rowDate <= end;
                });

                table.draw(); // 필터를 적용한 후 테이블 업데이트
            } else {
                alert("시작 날짜와 끝 날짜를 선택해 주세요.");
            }
        });
    });
      </script>
  </body>
</html>
