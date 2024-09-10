<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                    <button id="pdfmake">PDF 파일 만들기</button>
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
                                                <tr>
                                                	<th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="idm" items="${selectIdm}">
                                                    <tr>
                                                        <td>${idm.in_id}</td>
                                                        <td>${idm.pr_name}</td>
                                                        <td>${idm.co_supplyPrice}</td>
                                                        <td>${idm.idm_quantity}</td>
                                                        <td>${idm.in_availableInventory}</td>
                                                        <td>${idm.co_supplyPrice * idm.idm_quantity}</td>
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
        // Base64로 인코딩된 폰트 파일을 여기에 추가합니다.
        var _fonts = "폰트 파일"; // Base64로 인코딩된 폰트 파일 내용을 여기에 넣습니다.

        // pdfMake에 폰트 추가하기
        pdfMake.vfs['NotoSansKR-Regular.ttf'] = _fonts;

        pdfMake.fonts = {
            NotoSansKR: {
                normal: 'NotoSansKR-Regular.ttf',
                bold: 'NotoSansKR-Regular.ttf',
                italics: 'NotoSansKR-Regular.ttf',
                bolditalics: 'NotoSansKR-Regular.ttf'
            }
        };

        $(document).ready(function() {
            if (typeof pdfMake === 'undefined') {
                console.error('pdfMake is not loaded.');
            } else {
                console.log('pdfMake is loaded successfully.');
            }
            
            $("#pdfmake").click(function() {
                if (typeof pdfMake === 'undefined') {
                    console.error('pdfMake is not loaded.');
                    return;
                }
                
                var tableData = extractTableData();
                var tableDefinition = formatTableDataForPdfMake(tableData);
                
                var documentDefinition = {
                    content: [
                        { text: '재고 정보', style: 'header' },
                        tableDefinition, // 테이블 추가
                        {
                            text: '기타 정보',
                            style: 'footer'
                        }
                    ],
                    styles: {
                        header: {
                            fontSize: 22,
                            bold: true,
                            margin: [0, 0, 0, 20],
                            alignment: 'center'
                        },
                        footer: {
                            fontSize: 10,
                            margin: [0, 20, 0, 0],
                            alignment: 'center'
                        },
                        tableExample: {
                            margin: [0, 5, 0, 15]
                        }
                    },
                    defaultStyle: {
                        font: 'NotoSansKR'
                    },
                    pageSize: 'A4',
                    pageOrientation: 'portrait'
                };

                var pdf_name = 'pdf파일_만들기.pdf';
                pdfMake.createPdf(documentDefinition).download(pdf_name);
            });
            
            function extractTableData() {
                var table = document.getElementById('basic-datatables');
                var rows = table.getElementsByTagName('tr');
                var data = [];
                
                var headers = [];
                var headerCells = rows[0].getElementsByTagName('th');
                for (var i = 0; i < headerCells.length; i++) {
                    headers.push(headerCells[i].innerText);
                }
                data.push(headers);
                
                for (var i = 1; i < rows.length; i++) {
                    var cells = rows[i].getElementsByTagName('td');
                    var row = [];
                    for (var j = 0; j < cells.length; j++) {
                        row.push(cells[j].innerText);
                    }
                    data.push(row);
                }
                
                return data;
            }
            
            function formatTableDataForPdfMake(data) {
                var body = [];
                body.push(data[0]);
                for (var i = 1; i < data.length; i++) {
                    body.push(data[i]);
                }
                
                return {
                    style: 'tableExample',
                    table: {
                        headerRows: 1,
                        body: body
                    }
                };
            }
        });
        
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

            // 정수로 변환하여 소수점 이하 제거
            $('#total-amount').text(Math.floor(total)); // 또는 parseInt(total, 10)
        });
    </script>
</body>
</html>