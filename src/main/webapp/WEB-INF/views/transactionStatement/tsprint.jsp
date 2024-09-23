<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>거래명세서</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Dotum', Verdana, Geneva, sans-serif;
            font-size: 12px;
            color: #333;
            background-color: #f4f4f4;
        }
        .popup_order_list {
            width: 650px;
            margin: 20px auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .popup_title {
            background: #007BFF;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .popup_middle {
            padding: 20px;
        }
        .popup_print_tbl2,
        .popup_print_tbl3 {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .popup_print_tbl2 th,
        .popup_print_tbl2 td,
        .popup_print_tbl3 th,
        .popup_print_tbl3 td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .popup_print_tbl2 th {
            background: #f2f2f2;
        }
        .total-table td {
            font-weight: bold;
        }
        .center {
            text-align: center;
            position: relative;
        }
        .button {
            background: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 12px; 
        }
        .button:hover {
            background: #0056b3;
        }
        .close-button {
            position: absolute; /* 추가: 절대 위치로 설정 */
            right: 10px; /* 오른쪽 위치 조정 */
            top: 10px; /* 위쪽 위치 조정 */
            padding: 5px 10px; /* 크기 조정 */
            font-size: 10px; /* 글자 크기 조정 */
        }
        
        @media print {
            body {
                margin: 0;
                padding: 0;
                font-size: 12px; /* 인쇄할 때 글자 크기 조정 */
            }
            .popup_order_list {
                width: auto; /* 인쇄 시 가로 크기 조정 */
                box-shadow: none; /* 그림자 제거 */
                overflow: visible; /* 오버플로우 설정 */
            }
            .popup_title {
                background: #007BFF; /* 배경색 유지 */
                color: white; /* 글자색 유지 */
                font-size: 18px; /* 인쇄 시 타이틀 크기 조정 */
                padding: 15px; /* 여백 조정 */
            }
            .button {
                display: none; /* 인쇄 시 버튼 숨김 */
            }
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script>
    window.onload = function() {
        const { jsPDF } = window.jspdf;

        // 현재 날짜를 YYYY.MM.DD 형식으로 설정
        const today = new Date();
        const dateString = today.getFullYear() + '.' + 
                           String(today.getMonth() + 1).padStart(2, '0') + '.' + 
                           String(today.getDate()).padStart(2, '0');
        document.getElementById('current-date').innerText = dateString;

        document.getElementById('download-pdf').addEventListener('click', function() {
            const doc = new jsPDF();
            doc.html(document.querySelector('.popup_order_list'), {
                callback: function (doc) {
                    doc.save('거래명세서.pdf');
                },
                x: 10,
                y: 10
            });
        });

    
    }
    </script>
    <script>
	window.onload = function() {
	    document.getElementById('print-btn').addEventListener('click', function() {
	        window.print(); // 버튼 클릭 시 인쇄 대화 상자 열기
	    });
	}
</script>
</head>
<body>

<div class="popup_order_list">
    <div class="popup_title">
        <h1>거래명세서</h1>
    </div>
    <div class="popup_middle">
        <table cellpadding="0" cellspacing="0" class="popup_print_tbl2">
            <tbody>
                <tr>
                    <td colspan="10">
                        <div style="margin: 7px 10px;">
                            <span style="font-size: 18px; font-weight: bold;">거래명세서</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            발행일: <span id="current-date"></span>&nbsp;&nbsp; 
                            <span style="font-size: 13px; color: #FF0000; font-weight: bold;">(공급받는자 보관용)</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th rowspan="4">공급자</th>
                    <td>등록번호</td>
                    <td colspan="3"><strong>214-86-56681</strong></td>
                    <th rowspan="4">공급받는자</th>
                    <td>등록번호</td>
                    <td colspan="3"><strong>1101100013</strong></td>
                </tr>
                <tr>
                    <td>상호</td>
                    <td colspan="3"><strong>오성</strong></td>
                    <td>상호</td>
                    <td colspan="3"><strong>${pa_name }</strong></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td colspan="3">서울특별시 서초구 바우뫼로37길 37 6층</td>
                    <td>주소</td>
                    <td colspan="3">${pa_address }</td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td colspan="3">02-526-1800</td>
                    <td>전화번호</td>
                    <td colspan="3">${pa_tel }</td>
                </tr>
            </tbody>
        </table>

        <table class="popup_print_tbl2">
            <thead>
                <tr>
                    <th>품명</th>
                    <th>규격</th>
                    <th>수량</th>
                    <th>공급가</th>
                    <th>금액</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="print" items="${ts_list}">
                    <tr>
                        <td>${print.pr_name}</td>
                        <td>${print.pr_size}</td>
                        <td>${print.id_genuineNum}</td>
                        <td align="right">
                            <fmt:formatNumber value="${print.co_supplyPrice}" pattern="#,###"/>
                        </td>
                        <td align="right">
                            <fmt:formatNumber value="${print.id_totalPrice}" pattern="#,###"/>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <table class="popup_print_tbl3 total-table">
            <tbody>
                <tr>
                    
                    <td>담당자</td>
                    <td style="text-align:center; vertical-align: middle;">${st_name }</td>
                </tr>
            </tbody>
        </table>

        <div class="center">
            <!-- <button type="button" id="download-pdf" class="button">PDF 다운로드</button>  --> 
            <button type="button" id="print-btn" class="button">인쇄</button>
            <button type="button" class="button close-button popup_btn_close" onclick="history.back()">닫기</button>
        </div>
    </div>
</div>

</body>
</html>
