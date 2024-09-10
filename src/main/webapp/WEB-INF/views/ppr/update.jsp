<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
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
              <h3 class="fw-bold mb-3">Forms</h3>
              <ul class="breadcrumbs mb-3">
                <li class="nav-home">
                  <a href="#"> <i class="icon-home"></i> </a>
                </li>
                <li class="separator"><i class="icon-arrow-right"></i></li>
                <li class="nav-item"><a href="#">Forms</a></li>
                <li class="separator"><i class="icon-arrow-right"></i></li>
                <li class="nav-item"><a href="#">Basic Form</a></li>
              </ul>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">Form Elements</div>
                  </div>
                  <div class="card-body">
                    <form
                      role="form"
                      method="post"
                      id="updateForm"
                      enctype="multipart/form-data"
                    >
                      <input
                        type="hidden"
                        name="ppr_id"
                        value="${ppr.ppr_id}"
                      />
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="co_id">거래계약ID</label>
                            <input
                              type="number"
                              class="form-control"
                              id="co_id"
                              name="co_id"
                              placeholder="거래계약ID"
                              value="${ppr.co_id }"
                            />
                          </div>
                          <div class="form-group">
                            <label for="dueDate">납기일</label>
                            <input
                              type="datetime-local"
                              class="form-control"
                              id="ppr_dueDate"                              
                              value="${ppr.ppr_dueDate }"
                              placeholder="납기일"
                              required="required"/>
                              <input
                              type="hidden"
                              id="formattedDateInput"
                              name="ppr_dueDate"/>
                            
                          </div>
                          <div class="form-group">
                            <label for="ppr_quantity">수량</label>
                            <input
                              type="number"
                              class="form-control"
                              id="ppr_quantity"
                              name="ppr_quantity"
                              placeholder="수량"
                              required="required"
                              value="${ppr.ppr_quantity }"
                            />
                          </div>
                          <div class="form-group">
                            <label for="deliveryDate">발주서발행여부</label>
                            <input
                              type="text"
                              class="form-control"
                              id="ppr_status"
                              name="ppr_status"                           
                              placeholder="발주서발행여부"
                              required="required"
                              value="${ppr.ppr_status }"
                              />
                          </div>                                            
                        </div>
                      </div>
                      <div class="card-action">
                        <button class="btn btn-success" id="updateBtn" type="submit">수정하기</button>
                        <button class="btn btn-danger" id="cancel">취소</button>
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
    	  let form  =$("#updateForm");
    	  
        let category = `${ppr.ppr_id}`;
        let status = `${ppr.ppr_status}`;

        $("#cateinput").val(category).prop("selected", "true");
        $("#statusinput").val(status).prop("selected", "true");
        
        $("#cancel").on("click",function(e){
        	e.preventDefault();
        	form.attr('action','get');
        	
			location.href="/procurementPlanRegistration/list";
		})
		$("#updateBtn").on("click",function(e){
        	e.preventDefault();
        	form.submit()
		})
      });
    </script>

    <script
      type="text/javascript"
      src="/resources/assets/js/upload.js"
    ></script>
    
    <script>
		$(document).ready(
				function() {

					const form = $("#updateForm");

					$("#updateBtn").on("click", function(e) {
						e.preventDefault();
						let dateInput = $('#ppr_dueDate').val();

						if (dateInput) {
							// dateTime 형식을 yyyy-MM-dd hh:mm:ss로 변환
							let formattedDate = formatDateTime(dateInput);
							console.log("Formatted Date: ", formattedDate);

							// 변환된 값을 숨겨진 필드에 설정
							$('#formattedDateInput').val(formattedDate);

							form.submit();
						}

					})

					function formatDateTime(dateTimeString) {
						let date = new Date(dateTimeString);

						let year = date.getFullYear();
						let month = ('0' + (date.getMonth() + 1)).slice(-2); // 월 2자리로 변환
						let day = ('0' + date.getDate()).slice(-2); // 일 2자리로 변환
						let hours = ('0' + date.getHours()).slice(-2); // 시간 2자리로 변환
						let minutes = ('0' + date.getMinutes()).slice(-2); // 분 2자리로 변환
						let seconds = ('0' + date.getSeconds()).slice(-2); // 초 2자리로 변환 */

						// 최종 포맷: yyyy-MM-dd hh:mm:ss
						return year + '-' + month + '-' + day + ' ' + hours
								+ ':' + minutes + ':' + seconds;
					}

				})
	</script>

  </body>
</html>
