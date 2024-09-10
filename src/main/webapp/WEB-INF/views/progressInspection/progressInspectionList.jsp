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
                              <th>검수하기</th>
                              <th>검수상태</th>
                              <th>검수진행도</th>	
                              <th>거래회사이름</th>	
                              <th>담당자이름</th>
                              <th>검수예정날짜</th>
                              <th>검수완료날짜</th>
                              <th>보완내용</th>
                              <th>출하수량</th>
                              <th>미검수수량</th>
                              <th>검수완료수량</th>	
                              <th>검수기록</th>	
                            </tr>
                          </thead>
                          
                          <tfoot>
                            <tr>
                              <th>검수하기</th>	
                              <th>검수상태</th>	
                              <th>검수진행도</th>	
                              <th>거래회사이름</th>	
                              <th>담당자이름</th>	
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
                          	<c:forEach var = "pi" items="${pi}">
                          		<tr>	
                          			<td>
                          			    <c:choose>   
											<c:when test="${pi.pi_status == '검수완료'}">
												검수완료
											</c:when>
											<c:otherwise>
												<button 
											        class="btn btn-success" 
											        data-pi-id="${pi.pi_id}" 
											        data-pi-uninspectedQuantity="${pi.pi_uninspectedQuantity}"
											        data-pi-inspectedQuantity="${pi.pi_inspectedQuantity}"	
											        data-pi-order="${pi.pi_order}"
											        data-ss-quantity="${pi.ss_quantity}"
											        onclick="updatePage(this)">
											        검수하기
											    </button>
											</c:otherwise>
										</c:choose>
									</td>
                          			<td>${pi.pi_status}</td>
                          			<td>${(pi.pi_inspectedQuantity/pi.ss_quantity)*100}%</td>
                          			<td>${pi.pa_name}</td>
                          			<td>${pi.st_name}</td>
									<th>${pi.pi_date}</th>
									<th>${pi.pi_inspectedDate}</th>
                          			<td>${pi.pi_content}</td>
                          			<td>${pi.ss_quantity}</td>
                          			<td>${pi.pi_uninspectedQuantity}</td>
                          			<td>${pi.pi_inspectedQuantity}</td>
                          			<td><a href="/progressInspection/record?ss_id=${pi.ss_id}">조회하기</a></td>

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
      
      
		<!-- Modal -->
		<div class="modal fade" id="progressInspectionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">검수계획 수정</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <!-- 모달 콘텐츠 -->
		        <form id="progressInspectionForm" action="/progressInspection/update" method="post">
		          <div class="form-group">
		            <label for="pi_date">다음 검수계획날짜</label>
		            <input type="date" class="form-control" id="pi_date" name="pi_date">
		          </div>
		          
		          <div class="form-group">
		            <label for="pi_order">검수계획차수</label>
		            <select class="form-select" id="pi_order" name="pi_order">
		              <option value="1">1</option>
		              <option value="2">2</option>
		              <option value="3">3</option>
		              <option value="4">4</option>
		              <option value="5">5</option>
		            </select>
		          </div>  
		          
		          <div class="form-group">
		            <label for="pi_status">검수 상태</label>
		            <select class="form-select" id="pi_status" name="pi_status">
		              <option value="보완필요">보완필요</option>
		              <option value="검수완료">검수완료</option>
		            </select>
		          </div>  
		          
		          <div class="form-group">
		            <label for="pi_inspectedQuantity">검수 완료 수량</label>
		            <input type="number" class="form-control" id="pi_inspectedQuantity" name="pi_inspectedQuantity" min="0" onchange="check()">
		          </div>
		          
		          <div class="form-group">
		            <label for="comment">보완내용</label>
		            <textarea class="form-control" id="comment" rows="5" name="pi_content"></textarea>
		          </div>
		          
		          <input type="hidden" id="pi_order" name="pi_order">
		          <input type="hidden" id="pi_id" name="pi_id">
		          <input type="hidden" id="ss_quantity" name="ss_quantity">
		          
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cancle()">Close</button>
		        <button type="button" class="btn btn-primary" onclick="submitForm()">저장</button>
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
	            alert('성공했습니다!!');
	        } else if (msg === 'fail') {
	            alert('실패!');
	        }
	    </script>
	</c:if>

    <script>
	  function cancle() {
		  $('#progressInspectionModal').modal('hide');
		  alert("취소하셨습니다.");
	    };
	    
	  function updatePage(button) {
		    var pi_id = button.getAttribute("data-pi-id");
		    var pi_uninspectedQuantity = button.getAttribute("data-pi-uninspectedQuantity");
		    var pi_inspectedQuantity = button.getAttribute("data-pi-inspectedQuantity");
		    var pi_order = button.getAttribute("data-pi-order");
		    var ss_quantity = button.getAttribute("data-ss-quantity");
		    
		    
		    document.getElementById('pi_inspectedQuantity').max = pi_uninspectedQuantity || '';
		    document.getElementById('pi_order').value = pi_order || '';
		    document.getElementById('pi_id').value = pi_id || '';
		    document.getElementById('ss_quantity').value = ss_quantity || '';

	        $('#progressInspectionModal').modal('show');
	    }

	   function submitForm() {
	        document.getElementById('progressInspectionForm').submit();
	    }
    
	  function check() {
	        // 입력 필드와 최대값을 가져옵니다.
	        var inputField = document.getElementById('pi_inspectedQuantity');
	        console.log("inputField = " + inputField);
	        var maxQuantity = parseInt(inputField.max, 10);
	        var minQuantity = parseInt(inputField.min, 10);
	        var currentValue = parseInt(inputField.value, 10);

	        // 현재 값이 유효한지 확인합니다.
	        if (currentValue < minQuantity) {
	            alert('수량은 ' + minQuantity + ' 이상이어야 합니다.');
	            inputField.value = minQuantity;
	        } else if (currentValue > maxQuantity) {
	            alert('수량은 ' + maxQuantity + ' 이하이어야 합니다.');
	            inputField.value = maxQuantity;
	        }
	    };
    
	    $(document).ready(function () {
	        var table = $("#basic-datatables").DataTable({
	            pageLength: 5,
	            aaSorting: []
	        });
	
	        // 필터를 적용할 열 인덱스 배열
	        var categoryColumns = [0,1,2,3,4];
	
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
