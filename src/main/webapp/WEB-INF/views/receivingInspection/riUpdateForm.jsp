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
                    <form
                      role="form"
                      method="post"
                      id="updateForm"
                      enctype="multipart/form-data">
                    
                      <input
                        type="hidden"
                        name="ri_id"
                        value="${ReceivingInspectionDTO.ri_id}"/>
                        
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="nameinput">품목명</label>
                            <input
                              type="text"
                              class="form-control"
                              id="nameinput"
                              name="pr_name"
                              placeholder="품목명"
                              value="${ReceivingInspectionDTO.pr_name }"/>
                          </div>
                          
                          <div class="form-group">
                            <label for="makeTime">정품 수량</label>
                            <input
                              type="number"
                              class="form-control"
                              id="pp_makeTime"
                              name="pp_makeTime"
                              placeholder="정품 수량"
                              required="required"
                              value="${procurmentPlanDTO.pp_makeTime }"/>
                          </div>
                          
                          <div class="form-group">
                            <label for="spendAmount">불량 수량</label>
                            <input
                              type="number"
                              class="form-control"
                              id="pp_spendAmount"
                              name="pp_spendAmount"
                              placeholder="불량 수량"
                              required="required"
                              value="${procurmentPlanDTO.pp_spendAmount }"/>
                          </div>
                          
                          <div class="form-group">
                            <label for="exampleFormControlSelect1">입고 검수 상태</label>
                            <select
                              class="form-select"
                              id="exampleFormControlSelect1"
                              name = "ri_availability"
                              value = "${ss.ss_status}">
                              <option value = '입고완료'>입고완료</option>
                            </select>
                          </div>      
                          
                          <div class="form-group">
                            <label for="deliveryDate">입고 검수</label>
                            <input
                              type="date"
                              class="form-control"
                              id="pp_deliveryDate"
                              name="pp_deliveryDate"                           
                              placeholder="입고 검수"
                              required="required"
                            ${procurmentPlanDTO.pp_deliveryDate }/>
                          </div>
                                                   
                        </div>
                      </div>
                      <div class="card-action">
                        <button class="btn btn-success" id="updateBtn">
                          수정하기
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
    	  let category = `${ReceivingInspectionDTO.ri_id}`;
          let status = `${ReceivingInspectionDTO.ri_availability}`;

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
