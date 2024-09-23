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
                  
                    >
                      
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="pr_name">품목명</label><select                            
							class="form-select" id="pr_name" name= "pr_id" required="required">
							<c:forEach items="${list}" var="product">
							<option value ="${product.pr_id}">${product.pr_name }
							</option>
							</c:forEach>
							</select>                            
                          </div>
                          <div class="form-group">
                            <label for="makeTime">소요일정</label>
                            <input
                              type="number"
                              class="form-control"
                              id="pp_makeTime"
                              name="pp_makeTime"
                              placeholder="소요일정"
                              required="required"
                              value="${procurmentPlan.pp_makeTime }"
                            />
                          </div>
                          <div class="form-group">
                            <label for="spendAmount">소요량</label>
                            <input
                              type="number"
                              class="form-control"
                              id="pp_spendAmount"
                              name="pp_spendAmount"
                              placeholder="소요량"
                              required="required"
                              value="${procurmentPlan.pp_spendAmount }"
                            />
                          </div>
                          <div class="form-group">
                            <label for="deliveryDate">조달납기</label>
                            <input
                              type="datetime-local"
                              class="form-control"
                              id="pp_deliveryDate"                                                         
                              placeholder="조달납기"
                              required="required"
                              value="${procurmentPlan.pp_deliveryDate }"/>
                            <input
                              type="hidden"
                              id="formattedDateInput"
                              name="pp_deliveryDate"/>
                          </div>
                          <div class="form-group imgUpload">
                            <label for="comment">자재 소요 공정</label>
							 <textarea
                              class="form-control"
                              id="comment"
                              name="pp_materialRequiredProcessStage"
                              rows="5"
                              placeholder="자재 소요 공정"
                              required="required"
                            >${procurmentPlan.pp_materialRequiredProcessStage }</textarea>
                          
                          </div>                         
                        </div>
                      </div>
                      <div class="card-action">
                        <button class="btn btn-success" id="updateBtn">
                          수정하기
                        </button>
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
    <script>
    $(document).ready(function() {
		$("#cancel").on("click",function(e){
			e.preventDefault();
			location.href="/procurmentPlan/list";
		})
	});
    </script>

    <script type="text/javascript">
      $(document).ready(function () {
        let name = `${procurmentPlan.pr_id}`;
     
        $("#pr_name").val(name).prop("selected", "true");
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
						let dateInput = $('#pp_deliveryDate').val();

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
	<script type="text/javascript">
		let result = '${msg}';
		if (result == 'success') {
			alert("수정이 완료되었습니다.");
		}
	</script>
  </body>
</html>
