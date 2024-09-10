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
                <h3 class="fw-bold mb-3">출하현황</h3>
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
                    <a href="#">출하현황</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">출하현황 생성하기</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <div class="card-title">출하현황 생성하기</div>
                    </div>
                    <div class="card-body">
                          <div class="form-group form-inline">
                            <div class="col-md-9 p-0">
								<button class = "btn" onclick = "viewPO(this)" value = ${po.po_id}>구매발주서 확인하기.</button>
                            </div>
                          </div>
                     <form id = "shippingStatusForm" action="/shippingStatus/insert" method = "post">
                      <div class="row">
                        <div class="col-md-6 col-lg-4">
                        

                          
                          
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >자재 제작상태</label
                            >
                            <div class="col-md-9 p-0">
								<input type="text" id = "ss_status" name ="ss_status" value="제작중" readonly>
                            </div>
                          </div>
                          
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >납기일정 준수여부</label
                            >
                            <div class="col-md-9 p-0">
								<input type="text" value="일정준수" id = "ss_deliverySchedule" name ="ss_deliverySchedule" readonly>
                            </div>
                          </div>
                          
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >출하 상태</label
                            >
                            <div class="col-md-9 p-0">
								<input type="text" value="미출하" id = "ss_shippingStatus" name ="ss_shippingStatus" readonly>
                            </div>
                     	 </div>
                            
                          
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >출하 수량</label
                            >
                            <div class="col-md-9 p-0">
								<input type="number" id = "ss_quantity" name ="ss_quantity" min="0" max="${po.ppr_quantity}" onchange="check()" value = ${po.ppr_quantity }>
                            </div>
                          </div>
                        
                        <!-- po_id 외래키 hidden으로 보내기. -->
                          <div class="form-group form-inline">
                            <div class="col-md-9 p-0">
								<input type="hidden" id = "po_id" name ="po_id" value = ${po.po_id }>
                            </div>
                          </div>
                        
                    </div>
                    <div class="card-action">
                      <button class="btn btn-success" type = "button" onclick = "submit()">Submit</button>
                      <button class="btn btn-danger"  type = "button" onclick = "cancel()">Cancel</button>
                    </div>
                  </div>
                 </form>
                </div>
              </div>
            </div>
          </div>
      </div>

      <%@include file="../include/footer.jsp" %>
    </div>
    
	
	<script type="text/javascript">
	
	  function cancel() {
		  alert("출하현황 생성을 취소하셨습니다.");
		  window.location.href = "/shippingStatus/list";
	    };
	    
	  function submit() {
		  
		  document.getElementById('shippingStatusForm').submit();
		  alert("출하현황이 생성되었습니다.");
		  
	  };
	
	  function check() {
	        // 입력 필드와 최대값을 가져옵니다.
	        var inputField = document.getElementById('ss_quantity');
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
	
	
		function viewPO(button) {
			
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
	
    <%@include file="../include/script.jsp" %>
  </body>
</html>
