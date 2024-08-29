<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
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
                <h3 class="fw-bold mb-3">조달 계획안</h3>
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
                    <a href="#">Forms</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">Basic Form</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <div class="card-title">조달 계획 수립</div>
                    </div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-6 col-lg-4">
                          <div class="form-group">
                            <label for="makeTime">소요 일정</label>
                            <input
                              type="number"
                              class="form-control"
                              id="makeTiem"
                              placeholder="Enter Time"
                            />
                           
                          </div>
                          <div class="form-group">
                            <label for="spendAmount">소요량</label>
                            <input
                              type="number"
                              class="form-control"
                              id="spendAmount"
                              placeholder="Enter Amount"
                            />
                          </div>
                           <div class="form-group">
                            <label for="deliveryDate">조달납기</label>
                            <input
                              type="number"
                              class="form-control"
                              id="delivaerDate"
                              placeholder="Enter Date"
                            />
                          </div>
                          <div class="form-group">
                            <label for="exampleFormControlSelect1"
                              >소요일정</label
                            >
                            <select
                              class="form-select"
                              id="exampleFormControlSelect1"
                            >
                              <option>3일미만</option>
                              <option>3~7일</option>
                              <option>10일이내</option>
                              <option>2주이내</option>
                              <option>1달이내</option>
                              <option>1달이상</option>
                            </select>
                          </div>
                          <div class="form-group">
                            <label for="comment">자재 소요 공정</label>
                            <textarea class="form-control" id="comment" rows="5">
                            </textarea>
                          </div>
                          <div class="form-check">
                            <input
                              class="form-check-input"
                              type="checkbox"
                              value=""
                              id="flexCheckDefault"
                            />
                            <label
                              class="form-check-label"
                              for="flexCheckDefault"
                            >
                              Agree with terms and conditions
                            </label>
                          </div>
                        </div>
                        
                          
                      
                      </div>
                    </div>
                    <div class="card-action">
                      <button class="btn btn-success">Submit</button>
                      <button class="btn btn-danger">Cancel</button>
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
  </body>
</html>
