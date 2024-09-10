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
                        name="pr_id"
                        value="${procurmentDTO.pr_id}"
                      />
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="pr_name">품목명</label><select                            
							class="form-select" id="pr_name" name= "pr_name" required="required">
							<c:forEach items="${list}" var="product">
							<option><td>${product.pr_name }</td>
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
                              value="${procurmentPlanDTO.pp_makeTime }"
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
                              value="${procurmentPlanDTO.pp_spendAmount }"
                            />
                          </div>
                          <div class="form-group">
                            <label for="deliveryDate">조달납기</label>
                            <input
                              type="date"
                              class="form-control"
                              id="pp_deliveryDate"
                              name="pp_deliveryDate"                           
                              placeholder="조달납기"
                              required="required"
                            ${procurmentPlanDTO.pp_deliveryDate }/>
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
                            >${procurmentPlanDTO.pp_materialRequiredProcessStage }</textarea>
                          
                          </div>                         
                        </div>
                      </div>
                      <div class="card-action">
                        <button class="btn btn-success" id="updateBtn">
                          수정하기
                        </button>
                        <button class="btn btn-danger">취소</button>
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
        let category = `${procurmentPlanDTO.pp_id}`;
        let status = `${productDTO.pr_status}`;

        $("#cateinput").val(category).prop("selected", "true");
        $("#statusinput").val(status).prop("selected", "true");
      });
    </script>

    <script
      type="text/javascript"
      src="/resources/assets/js/upload.js"
    ></script>

  </body>
</html>
