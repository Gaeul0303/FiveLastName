<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                  		<form action="selectInventory" method="post" onsubmit="return confirmAndSubmit(this);">
                  			<input type="hidden" id="in_id" name="in_id" value="${in_id}" /> 
		    				<input id="idm_quantity" name="idm_quantity" type="number" placeholder="출고 수량을 입력하세요." min="1"/>
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
                              <th>단가</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>${inv.pr_name }</td>
                              <td>${inv.in_safetyStock }</td>
                              <td>${inv.in_availableInventory}</td>
                              <td>${inv.in_physicalInventory}</td>
                              <td><fmt:formatNumber value="${inv.co_supplyPrice }" type="number"/></td>
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
    
    <script>
    function confirmAndSubmit(form) {
        var isConfirmed = confirm("정말로 제출하시겠습니까?");
        
        if (isConfirmed) {
            // Form 데이터를 FormData 객체로 변환
            var formData = new FormData(form);

            // AJAX 요청
            var xhr = new XMLHttpRequest();
            xhr.open('POST', form.action, true);
            xhr.onload = function() {
                if (xhr.status >= 200 && xhr.status < 300) {
                    setTimeout(function() {
                        if (window.opener) {
                            window.opener.location.reload();
                        }
                        if (window.self !== window.top) {
                            window.close();
                        }	
                        alert("출고 처리 되었습니다.")
                        self.close();
                    });
                } else {
                    alert("폼 제출에 실패했습니다.");
                }
            };
            xhr.send(formData);

            // 폼 제출 후에는 false를 반환하여 기본 제출 동작을 방지
            return false;
        } else {
            return false; // 제출하지 않으면 false를 반환하여 폼 제출을 방지
        }
    }
    </script>

  </body>
</html>
