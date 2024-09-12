<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <%@ include file="../include/head.jsp" %>
    <!-- 외부 JS 파일들 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.11/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.11/vfs_fonts.js"></script>
</head>
<body>
    <div class="wrapper">
        <div class="main-panel">
            <div class="container">
                <div class="page-inner">
                    <div class="page-header">
                        <h3 class="fw-bold mb-3">자재</h3>
                        <ul class="breadcrumbs mb-3">
                            <li class="nav-home"><a href="#"><i class="icon-home"></i></a></li>
                            <li class="separator"><i class="icon-arrow-right"></i></li>
                            <li class="nav-item"><a href="#">Tables</a></li>
                            <li class="separator"><i class="icon-arrow-right"></i></li>
                            <li class="nav-item"><a href="#">재고정보</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">재고정보</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="basic-datatables" class="display table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>품목 코드</th>
                                                    <th>품목명</th>
                                                    <th>공급가</th>
                                                    <th>출고수량</th>
                                                    <th>가용재고량</th>
                                                    <th>총액</th>
                                                    <th>출고일</th>
                                                    <th>상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="idm" items="${selectIdm}">
                                                    <tr>
                                                        <td>${idm.in_id}</td>
                                                        <td>${idm.pr_name}</td>
                                                        <td><fmt:formatNumber value="${idm.co_supplyPrice}" type = "number" /></td>
                                                        <td>${idm.idm_quantity}</td>
                                                        <td>${idm.in_availableInventory}</td>
                                                        <td><fmt:formatNumber value="${idm.co_supplyPrice* idm.idm_quantity }" type = "number" /></td>
                                                        <td>${idm.idm_date}</td>
                                                        <td>${idm.idm_status}</td>
                                                    </tr>
                                                </c:forEach>
                                                 <tfoot>
          										  <tr>
             									  <th colspan="5">총액</th>
             									  <th id="total-amount">0</th>
             									  <th colspan="2"></th>
                                                  </tr>
                                                 </tfoot>
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

    <%@ include file="../include/script.jsp" %>

    <!-- PDF 생성 스크립트 -->
    <script>
        
        function formatNumber(number) {
            // 숫자를 3자리마다 콤마를 찍어서 포맷
            return number.toLocaleString('en-US');
        }
        
        $(document).ready(function() {
            var total = 0;

            $('#basic-datatables tbody tr').each(function() {
                var row = $(this);
                var amountCell = row.find('td').eq(5); // '총액' 열의 인덱스 (6번째 열)
                var amount = parseFloat(amountCell.text().replace(/,/g, '')); // 숫자로 변환

                if (!isNaN(amount)) {
                    total += amount;
                }
            });

         // 포맷된 총액을 설정
            $('#total-amount').text(formatNumber(total));
        });
    </script>
</body>
</html>