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
                <h3 class="fw-bold mb-3">검수계획</h3>
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
                    <a href="#">검수계획 전체조회</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">검수계획 전체조회</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover"
                        >
                          <thead>
                            <tr>
                              <th>검수현황코드</th>			
                              <th>검수계획차수</th>	
                              <th>거래회사이름</th>
                              <th>검수상태</th>
                              <th>담당자이름</th>
                              <th>출하수량</th>
                              <c:choose>   
								<c:when test="${pi.pi_status == '미검수'}">
									<th>검수예정날짜</th>
								</c:when>
								<c:otherwise>
									<th>검수완료날짜</th>
								</c:otherwise>
							  </c:choose>
                              <th>보완내용</th>
                              <th>미검수수량</th>
                              <th>검수완료수량</th>		
                            </tr>
                          </thead>
                          
                          <tfoot>
                            <tr>
                              <th></th>
                              <th>검수계획차수</th>	
                              <th>거래회사이름</th>	
                              <th>검수상태</th>
                              <th>담당자이름</th>
                              <th></th>
							  <th></th>
                              <th></th>		
                              <th></th>			
                              <th></th>		
                            </tr>
                          </tfoot>
                          
                          <tbody>
                            		<tr>
                          			<td><a href="/progressInspection/select?pi_id=${pi.pi_id}">${pi.pi_id}</a></td>
                          			<td>${pi.pi_order}</td>
                          			<td>${pi.pa_name}</td>
                          			<td>${pi.pi_status}</td>
                          			<td>${pi.st_name}</td>
                          			<td>${pi.ss_quantity}</td>
                          			<c:choose>   
										<c:when test="${pi.pi_status == '미검수'}">
											<th>${pi.pi_date}</th>
										</c:when>
										<c:otherwise>
											<th>${pi.pi_inspectedDate}</th>
										</c:otherwise>
								 	</c:choose>
                          			<td>${pi.pi_content}</td>
                          			<td>${pi.pi_uninspectedQuantity}</td>
                          			<td>${pi.pi_inspectedQuantity}</td>
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
	        var categoryColumns = [1,2, 3, 4];
	
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
