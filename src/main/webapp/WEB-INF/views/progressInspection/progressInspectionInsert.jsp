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
                    <a href="#">검수계획</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">검수계획 등록하기</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <div class="card-title">검수계획 등록하기</div>
                    </div>
                    <div class="card-body">
                          <div class="form-group form-inline">
                            <div class="col-md-9 p-0">
								<button class = "btn" onclick = "viewPO(this)" value = ${ss.po_id}>검수계획 수정하기(팝업창)</button>
                            </div>
                          </div>
                          
                     <form id = "progressInspection" action="/progressInspection/insert" method = "post">
                      <div class="row">
                        <div class="col-md-6 col-lg-4">
                        
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >검수차수</label
                            >
                            <div class="col-md-9 p-0">
								<input type="text" value="1" id = "pi_order" name ="pi_order" readonly>
                            </div>
                          </div>
                          
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >검수담당자</label
                            >
                            <div class="col-md-9 p-0">
								<input type="text" value="${st_id}" id = "st_id" name ="st_id" readonly>
                            </div>
                          </div>
                          
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >검수계획날짜</label
                            >
                            <div class="col-md-9 p-0">
								<input type="date" id = "pi_date" name ="pi_date">
                            </div>
                          </div>
                          
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >검수 상태</label
                            >
                            <div class="col-md-9 p-0">
								<input type="text" value="미검수" id = "pi_status" name ="pi_status" readonly>
                            </div>
                      	</div>
                          
                          <div class="form-group">
                            <label for="comment">보완내용</label>
                            <textarea class="form-control" id="comment" rows="5" id = "pi_content" name ="pi_content">
                            </textarea>
                          </div>
                          
                         <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >검수 완료 수량</label
                            >
                            <div class="col-md-9 p-0">
								<input type="number" id = "pi_inspectedQuantity" name ="pi_inspectedQuantity" value = 0 readonly>
                            </div>
                          </div>
                          
                         <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >미검수 수량</label
                            >
                            <div class="col-md-9 p-0">
								<input type="number" id = "pi_uninspectedQuantity" name ="pi_uninspectedQuantity"  value = ${ss.ss_quantity} readonly>
                            </div>
                          </div>
                        
                        <!-- po_id 외래키 hidden으로 보내기. -->
                          <div class="form-group form-inline">
                            <div class="col-md-9 p-0">
								<input type="hidden" id = "ss_id" name ="ss_id" value = ${ss.ss_id }>
                            </div>
                          </div>
                          <div class="form-group form-inline">
                            <div class="col-md-9 p-0">
								<input type="hidden" id = "ss_quantity" name ="ss_quantity" value = ${ss.ss_quantity }>
                            </div>
                          </div>
                        
                    </div>
                    <div class="card-action">
                      <button class="btn btn-success" type = "button" onclick = "submit()">등록하기</button>
                      <button class="btn btn-danger"  type = "button" onclick = "cancel()">취소하기</button>
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
		  alert("검수생성을 취소하셨습니다");
		  window.location.href = "/shippingStatus/list";
	    };
	    
	  function submit() {
		  
		   if(!date.value){
			      alert("날짜를 선택해주세요.")
			      return false;
			   }else{
				   document.getElementById('progressInspection').submit();
					  alert("출하현황이 생성되었습니다.");
			   }
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
