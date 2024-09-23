<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                <h3 class="fw-bold mb-3">조달 계획 등록</h3>
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
                    <a href="#">계획</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">조달 계획</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">조달 계획 등록 리스트</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover"
                        >
                         <tfoot>
                            <tr>
                              <th>조달계획등록ID</th>        
                              <th></th>
                              <th></th>
                              <th></th>
                              <th></th>
                              <th></th>                                                                                                                                                                                                
                            </tr>
                          </tfoot>
                          <thead>
                            <tr>
                              <th>조달계획등록ID</th>
                              <th>거래계약ID</th>                              
                              <th>납기일</th>
                              <th>수량</th>
                              <th>발주서발행여부</th>
                              <th></th>                                                                                  
                            </tr>
                          </thead>
                         
                          <tbody>
                          	<c:forEach items="${list}" var="ppr">                           
	                            <tr>
	                              <td>${ppr.ppr_id}</td>
	                              <td>${ppr.co_id }</td>                              
	                              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ppr.ppr_dueDate }" /></td>
	                              <td>${ppr.ppr_quantity }</td>
	                              <td>${ppr.ppr_status}</td>                                                        
	                              <td><a href="/procurementPlanRegistration/detail?ppr_id=${ppr.ppr_id}">자세히보기</a></td>                              
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
        
          $("table#basic-datatables").DataTable({
            pageLength: 5,
            aaSorting : [],
            initComplete: function () {
              var table = this.api();
              var categoryColumnIndex = 0;
            
              //카테고리 열 인덱스  
              
                //카테고리 필터용 selelct박스
                var select = $('<select class="form-select"><option value=""></option></select>')
                   	.appendTo($(table.column(categoryColumnIndex).footer()).empty())
                    .on('change', function () {
                      var val = $.fn.dataTable.util.escapeRegex($(this).val());
						table  
                      	.column(categoryColumIndex)
                        .search(val ? "^" + val + "$" : "", true, false)
                        .draw();
                    });
  
                table.column(categoryColumnIndex).data().unique().each(function (d, j){
                	select.append('<option value="' + d + '">' + d + '</option>');
                });
            }
          });
          
          
        });       
      </script>
      <script type="text/javascript">
		let result = '${msg}';
		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>
  </body>
</html>
