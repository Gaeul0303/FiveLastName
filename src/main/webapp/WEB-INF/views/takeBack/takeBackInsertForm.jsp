<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"	
prefix="c"%> <%@ page session="true"%>
<html lang="ko">
  <head>
    <%@include file="/WEB-INF/views/include/head.jsp"%>
  </head>
  <body>
    <div class="wrapper">
      <%@include file="/WEB-INF/views/include/sideBar.jsp"%>

      <div class="main-panel">
        <%@include file="/WEB-INF/views/include/header.jsp"%>

        <div class="container">
          <div class="page-inner">
            <div class="page-header">
              <h3 class="fw-bold mb-3">입고 검수</h3>
              <ul class="breadcrumbs mb-3">
                <li class="nav-home">
                  <a href="#"> <i class="icon-home"></i> </a>
                </li>
                <li class="separator"><i class="icon-arrow-right"></i></li>
                <li class="nav-item"><a href="#">입고 검수</a></li>
                <li class="separator"><i class="icon-arrow-right"></i></li>
                <li class="nav-item"><a href="#">입고 검수 작성</a></li>
              </ul>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">입고 검수 작성</div>
                  </div>
                  <div class="card-body">
                    <form role="form" action = "/incomingDeadline/insert" method="post" id="insertform" enctype="multipart/form-data" onsubmit="return validateForm()">
                    	
                      <input type="hidden" name="ri_id" value="${insertForm.ri_id}"/>                  
                       
        			   <input type="hidden" id="randomInput" name="id_code" readonly> 
                        
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="nameinput">담당자</label>
                            <input
                              type="text"
                              class="form-control"
                              id="nameinput"
                              name="pr_name"
                              placeholder="담당자"
                              value = "${insertForm.st_name }"
                              readonly/>
                          </div>  
                        
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="nameinput">품목명</label>
                            <input
                              type="text"
                              class="form-control"
                              id="prodectinput"
                              name="pr_name"
                              placeholder="품목명"
                              value="${insertForm.pr_name}"
                              readonly/>
                          </div>
                          
                          <div class="form-group">
                            <label for="makeTime">입고 수량</label>
                            <input
                              type="number"
                              class="form-control"
                              id="pi_inspectedQuantity"
                              name="pi_inspectedQuantity"
                              placeholder="입고 수량"
                              required="required"
                              value="${insertForm.pi_inspectedQuantity }"
                              readonly/>
                          </div>
                          
                          <div class="form-group">
                            <label for="makeTime">정품 수량</label>
                            <input
                              type="number"
                              class="form-control"
                              id="id_genuineNum"
                              name="id_genuineNum"
                              placeholder="정품 수량"
                              required="required"/>
                          </div>
                          
                          <div class="form-group">
                            <label for="makeTime">단가</label>
                            <input
                              type="number"
                              class="form-control"
                              id="formatInput"
                              name="co_supplyPrice"
                              value="${insertForm.co_supplyPrice }">
                              
                     <!-- </div>
                          <fmt:formatNumber value="${id.ri_totalPrice }" pattern="#,###" />
                          <div class="form-group">
                            <label for="makeTime">합계</label>
                            <input
                              type="number"
                              class="form-control"
                              id="formatInput"
                              name="ri_totalPrice"
                              placeholder="합계"
                              value = "${ri_totalPrice }"
                              />
                          </div>-->   
                          
                     <!--<div class="form-group">
                            <label for="spendAmount">불량 수량</label>
                            <input
                              type="number"
                              class="form-control"
                              id=""
                              name=""
                              placeholder="불량 수량"
                              required="required"/>
                          </div> -->
                          
                         <!-- <input type = hidden id="ri_availability" name = "ri_availability" value="입고완료"> --> 
                          
                          <!-- <div class="form-group">
                            <label for="deliveryDate">입고 검수일</label>
                            <input
                              type="date"
                              class="form-control"
                              id="pp_deliveryDate"
                              name="pp_deliveryDate"                           
                              placeholder="입고 검수일"
                              required="required"
                            />
                          </div> -->
                          
                          
                      <div class="card-action">
                        <button class="btn btn-success" id="updateBtn">
                          확인
                        </button>
                        <button class="btn btn-danger" onclick="history.back()">취소</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%@include file="/WEB-INF/views/include/footer.jsp"%>
    </div>

    <%@include file="/WEB-INF/views/include/script.jsp"%>

    <script type="text/javascript">
      $(document).ready(function () {
    	  let category = `${insertForm.ri_id}`;
          let status = `${insertForm.ri_availability}`;

        $("#cateinput").val(category).prop("selected", "true");
        $("#statusinput").val(status).prop("selected", "true");
      });
    </script>
    
    <script>
        // 랜덤 문자열 생성 함수
        function generateRandomString(length) {
            const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            let result = '';
            for (let i = 0; i < length; i++) {
                result += characters.charAt(Math.floor(Math.random() * characters.length));
            }
            return result;
        }

        // 문서가 로드되면 랜덤 문자열을 input 필드에 설정
        function setRandomStringToInput() {
            const randomString = generateRandomString(16);
            document.getElementById('randomInput').value = randomString;
        }

        // 페이지 로드 시 실행
        window.onload = setRandomStringToInput;
    </script>
    
    
    <script>
    	//function validateForm(){
    		 // 폼에서 필요한 값을 가져오기
            //const inspectedQuantity = parseFloat(document.getElementById('pi_inspectedQuantity').value); // 입고 수량
           // const goodQuantity = parseFloat(document.getElementById('id_genuineNum').value); // 정품 수량
            //const badQuantity = parseFloat(document.getElementById('pp_spendAmount').value); // 불량 수량

            // 정품 수량 + 불량 수량 = 입고 수량 확인
          //  if (goodQuantity + badQuantity !== inspectedQuantity) {
               // alert('정품 수량과 불량 수량의 합계가 입고 수량과 일치하지 않습니다.');
               // return false; // 제출 중단
         //   }

          //  return true; // 제출 허용
    	//}
    </script>
    
	
    <script
      type="text/javascript"
      src="/resources/assets/js/upload.js"
    ></script>

  </body>
</html>
