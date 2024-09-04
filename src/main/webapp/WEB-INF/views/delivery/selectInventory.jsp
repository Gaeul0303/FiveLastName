<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="../include/head.jsp" %>
  </head>
  <body>
    <div class="wrapper">
      
      <div class="main-panel">

          <div class="container">
            <div class="page-inner">
              <div class="page-header">
                <h3 class="fw-bold mb-3">자재</h3>
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
                    <a href="#">Tables</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">재고정보</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">재고정보</h4>
                    </div>
                    <div class="card-body">
                  		<form action="selectInventory" method="post">
                  			<input type="hidden" name="in_id" value="2" /> <!-- 여기 in_id 값 받아와야 됨 -->
		    				<input id="idm_quantity" name="idm_quantity" type="number" placeholder="출고 수량을 입력하세요."/>
		   				    <input type="submit" value="확인">
				   		</form>
                      <div class="table-responsive">
                        <table
                          id="basic-datatables"
                          class="display table table-striped table-hover">
                          <thead>
                            <tr>
                              <th>품목명</th>
                              <th>안전재고량</th>
                              <th>가용재고량</th>
                              <th>실물재고량</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>${inv.pr_name }</td>
                              <td>${inv.in_safetyStock }</td>
                              <td>${inv.in_availableInventory}</td>
                              <td>${inv.in_physicalInventory}</td>
                            </tr>
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

    </div>

    <%@include file="../include/script.jsp" %>

  </body>
</html>
