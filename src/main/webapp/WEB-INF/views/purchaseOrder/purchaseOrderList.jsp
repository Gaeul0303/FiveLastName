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
                        <table id="basic-datatables" class="display table table-striped table-hover">
                          <thead>
                            <tr>
                              <th>품목명</th>
                              <th>거래회사이름</th>	
                              <th>공급가</th>
                              <th>소요일</th>
                              <th>거래조건</th>
                              <th>계약일</th>
                              <th>납기예정일</th>
                              <th>발행일</th>
                              <th>구매발주서</th>
                              <th>출하현황</th>
                            </tr>
                          </thead>
                          
                          <tfoot>
                            <tr>
                              <th>품목명</th>
                              <th>거래회사이름</th>
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
                          	<c:forEach var = "po" items="${poList}">
                          		<tr>
                          			<td>${po.pr_name}</td>
                          			<td>${po.pa_name}</td>
                          			<td>${po.co_supplyPrice}</td>
                          			<td>${po.es_requiredDays}</td>
                          			<td>${po.co_tradeTerms}</td>
                          			<td>${po.co_contractDate}</td>
                          			<td>${po.ppr_dueDate}</td>
                          			<td>${po.po_regDate}</td>
                          			<td><button id = "po_id" value = "${po.po_id}" onclick="printPage(this)" class = "btn">조회하기</button></td>
                          			<c:choose>   
									   <c:when test="${po.po_status == '발행완료'}">
									      <td><a href="/shippingStatus/search?po_id=${po.po_id}">조회하기</a></td>
									   </c:when>
									   <c:otherwise>
									      <td><a href= "/shippingStatus/insert?po_id=${po.po_id}">발행하기</a></td>
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
    <c:if test="${not empty msg}">
	    <script type="text/javascript">
	        var msg = '${msg}'; // 모델에서 전달된 메시지를 JavaScript 변수로 받기
			
	        console.log(msg);
	        
	        if (msg === 'success') {
	            alert('성공!');
	        } else if (msg === 'fail') {
	            alert('실패!');
	        } else if(msg == 'insertFail'){
	        	alert('구매발주서 발급이 안된 조달계획이 없습니다!');
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
	        var categoryColumns = [0,1];
	
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
		
		function printPage(button) {
			
			var po_id = button.getAttribute("value");
			
			console.log("po_id = " + po_id);
			
			  var popupURL = "/purchaseOrder/print?po_id="+po_id;
			  // 팝업 창 매핑.
			  var popupProperties = "width=800,height=1200,popup=yes,scrollbars=yes";
			  // 팝업 열때 속성.
			  
			  // 새 폼 요소 생성
			  var form = document.createElement('form');
			  form.method = 'GET';
			  form.action = popupURL;
			  form.target = '구매발주서인쇄하기'; // 새 창의 이름
			    
			  // 숨겨진 input 요소 생성
			  var input = document.createElement('input');
			  input.type = 'hidden';
			  input.name = 'po_id';
			  input.value = po_id;

			  // 폼에 input 추가
			  form.appendChild(input);
			    
			  // 새 창 열기
			  var popup = window.open(popupURL, '구매발주', popupProperties);

			  // 폼을 문서에 추가하고 제출
			  document.body.appendChild(form);
			  form.submit();
			  
		}

      </script>
  </body>
</html>
