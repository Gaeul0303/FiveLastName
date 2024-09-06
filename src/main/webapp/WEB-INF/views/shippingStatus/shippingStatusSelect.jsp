<!-- 기본틀 index page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html lang="ko">
<head>

<%@include file="../include/head.jsp"%>

<style type="text/css">
.col-md-6{
min-width : 1400; 
}
</style>

</head>
<body>
	<div class="wrapper">
		<%@include file="../include/sideBar.jsp"%>

		<div class="main-panel">
			<%@include file="../include/header.jsp"%>


			<div class="container">
				<div class="page-inner">
					<h3 class="fw-bold mb-3">출하현황</h3>
			
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">출하현황 상세조회
										<div class = "print" align="right"><button id = "ss_id" value = ${ss.ss_id} onclick="printPage(this)">인쇄</button></div>
									</div>
								</div>
								<div class="card-body">
									
									
									<table width="900" border="0" cellspacing="0" cellpadding="0" bordercolor="#ffffff"
										style="border-collapse: collapse; table-layout: fixed" align="center" class="f10">
										<tr>
											<td height="5" align="right"></td>
										</tr>
									</table>
									<table width="900" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000"
										style="border-collapse: collapse; table-layout:" align="center" class="f10">
										<tr>
											<td width="180" height="25" align="center"
												style="font-weight: bold">공급업체명</td>
											<td width="180" align="center" style="font-weight: bold">업체 대표명</td>
											<td width="180" align="center" style="font-weight: bold">Phone</td>
											<td width="180" align="center" style="font-weight: bold">E-mail</td>
										</tr>
										<tr>
											<td height="25" align="center"><div tms_edit id="cn1">${ss.pa_name}</div></td>
											<td align="center"><div tms_edit id="cn2">${ss.pa_manager}</div></td>
											<td align="center"><div tms_edit id="cn3">${ss.pa_tel}</div></td>
											<td align="center"><div tms_edit id="cn4">${ss.pa_email}</div></td>
										</tr>
									</table>
									<table width="900" border="0" cellspacing="0" cellpadding="0" bordercolor="#ffffff"
										style="border-collapse: collapse; table-layout: fixed" align="center" class="f10">
										<tr>
											<td height="5" align="right"></td>
										</tr>
									</table>
									<table width="900" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000"
										style="border-collapse: collapse; table-layout: fixed" align="center" class="f9">
										<tr>
											<td width="30" height="40" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">NO</td>
											<td width="120" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">품목명</td>
											<td width="120" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">납기일정준수여부</td>
											<td width="90" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">자재제작상태</td>
											<td width="80" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">출하상태</td>
											<td width="80" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">출하수량</td>
											<td width="100" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">출하일</td>
											<td width="80" align="center" bgcolor="#D2F7FF"
												style="font-weight: bold">검수계획</td>
										</tr>			                          	
										<tr>
											<td align="center"><div tms_edit id="aa1" style="padding: 3px;">1</div></td>
											<td align="center"><div tms_edit id="bb1" style="padding: 3px;">${ss.pr_name}</div></td>
											<td align="center"><div tms_edit id="ee1" style="padding: 3px;">${ss.ss_deliverySchedule}</div></td>
											<td align="center"><div tms_edit id="cc1" style="padding: 3px;">${ss.ss_status}</div></td>
											<td align="center"><div tms_edit id="dd1" style="padding: 3px;">${ss.ss_shippingStatus}</div></td>
											<td align="center"><div tms_edit id="gg1" style="padding: 3px;"></div>${ss.ss_quantity}</td>
											<td align="center"><div id="ff1" style="padding: 3px;">${ss.ss_shippingDate}</div></td>
											<td align="center"><div id="fg1" style="padding: 3px;">
												<c:choose>   
                                                	<c:when test="${ss.ss_piStatus == '발행완료'}"><a href = "/progressInspection/search?ss_id=${ss.ss_id}">조회하기</a></c:when>
                                                	<c:otherwise><a href = "/progressInspection/insert">발행하기</a></c:otherwise>
                                                </c:choose>
											</div></td>
										</tr>

									</table>
									<table width="900" border="0" cellspacing="0" cellpadding="0"
										bordercolor="#ffffff"
										style="border-collapse: collapse; table-layout: fixed"
										align="center" class="f10">
										<tr>
											<td height="25" align="right">&nbsp;</td>
										</tr>
									</table>
									<p>&nbsp;</p>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>



		</div>

		<%@include file="../include/footer.jsp"%>
	</div>

	<%@include file="../include/script.jsp"%>
	<script>
	
		function printPage(button) {
			
			var po_id = button.getAttribute("value");
			
			console.log("po_id = " + po_id);
			
			  var popupURL = "purchaseOrderPrint?po_id="+po_id;
			  // 팝업 창 매핑.
			  var popupProperties = "width=800,height=1200,popup=yes,scrollbars=yes";
			  // 팝업 열때 속성.
			  
			  // 새 폼 요소 생성
			  var form = document.createElement('form');
			  form.method = 'GET';
			  form.action = popupURL;
			  form.target = '구매발주서인쇄하기'; // 새 창의 이름
			    
			  // 숨겨진 input 요소 생성
			  var input = document.createElement('input');
			  input.type = 'hidden';
			  input.name = 'po_id';
			  input.value = po_id;

			  // 폼에 input 추가
			  form.appendChild(input);
			    
			  // 새 창 열기
			  var popup = window.open(popupURL, '구매발주', popupProperties);

			  // 폼을 문서에 추가하고 제출
			  document.body.appendChild(form);
			  form.submit();

			  
			  
			  
		}
	
	</script>
</body>
</html>
