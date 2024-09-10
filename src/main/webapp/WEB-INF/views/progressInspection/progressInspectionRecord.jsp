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
                <h3 class="fw-bold mb-3">검수기록</h3>
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
                    <a href="#">검수기록 조회</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">검수기록 조회</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover"
                        >
                          <thead>
                            <tr>
                              <th>검수계획차수</th>	
                              <th>거래회사이름</th>	
                              <th>검수상태</th>
                              <th>출하수량</th>
                              <th>담당자이름</th>
                              <th>검수계획날짜</th>
                              <th>검수완료날짜</th>
                              <th>보완내용</th>
                              <th>미검수수량</th>
                              <th>검수완료수량</th>	
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
                              <th></th>
                              <th></th>
                              <th></th>
                            </tr>
                          </tfoot>
                          
                          <tbody>
                          	<c:forEach var = "pir" items="${pir}">
                          		<tr>
                          			<td>${pir.pir_order}</td>
                          			<td>${pir.pa_name}</td>
                          			<td>${pir.pir_status}</td>
                          			<td>${pir.ss_quantity}</td>
                          			<td>${pir.st_name}</td>
									<th>${pir.pir_date}</th>
									<th>${pir.pir_inspectedDate}</th>
                          			<td>${pir.pir_content}</td>
                          			<td>${pir.pir_uninspectedQuantity}</td>
                          			<td>${pir.pir_inspectedQuantity}</td>
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
    <c:if test="${not empty msg}">
	    <script type="text/javascript">
	        var msg = '${msg}'; // 모델에서 전달된 메시지를 JavaScript 변수로 받기
	
	        if (msg === 'success') {
	            alert('성공!');
	        } else if (msg === 'fail') {
	            alert('실패!');
	        }
	    </script>
	</c:if>

    <script>
	    $(document).ready(function () {
	        var table = $("#basic-datatables").DataTable({
	            pageLength: 5,
	            aaSorting: []
	        });
	
	        // 필터를 적용할 열 인덱스 배열
	        var categoryColumns = [];
	
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
