<!-- 기본틀 index page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html lang="ko">
<head>

<%@include file="../include/head.jsp"%>
</head>
<body>
	<div class="wrapper">
		<%@include file="../include/sideBar.jsp"%>

		<div class="main-panel">
			<%@include file="../include/header.jsp"%>


			<div class="container">
				<div class="page-inner">
					<h3 class="fw-bold mb-3">구매발주서 상세조회</h3>
			
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">구매발주서 상세조회
										<div class = "print"><button onclick="printPage(this)">인쇄</button></div>
									</div>
								</div>
								<div class="card-body">
									
									<table width="650" border="0" cellspacing="0" cellpadding="0"
										bordercolor="#ffffff"
										style="border-collapse: collapse; table-layout:"
										align="center">
										<tr>
											<td width="99%" height="100" align="center" class="f18b">
												<div id="ti1" style="padding: 3px;">발주서</div></td>
											<td width="1%" align="right" id="tms_auto_sign">&nbsp;</td>
										</tr>
									</table>
									
									<table width="650" border="1" cellspacing="0" cellpadding="0"
										bordercolor="#000000" style="border-collapse: collapse; table-layout:" align="center">
										<tr>
											<td height="30" align="center">
												<table width="650" border="0" cellspacing="0"
													cellpadding="0" bordercolor="#ffffff"
													style="border-collapse: collapse; table-layout:"
													align="center" class="f10">
													<tr>
														<td width="10%" height="25" align="center"
															bgcolor="#E2EFDA" style="font-weight: bold">회사명</td>
														<td width="2%" align="center" bgcolor="#E2EFDA"
															style="font-weight: bold">:</td>
														<td width="38%" bgcolor="#E2EFDA"
															style="font-weight: bold"><div id="is1"
																style="padding: 3px;">(주)오성</div></td>
														<td width="10%" align="center" bgcolor="#E2EFDA">관리번호</td>
														<td width="2%" align="center" bgcolor="#E2EFDA">:</td>
														<td width="38%" bgcolor="#E2EFDA"><div tms_edit
																id="po_id" value="${po.po_id}" style="padding: 3px;">${po.po_id}</div></td>
													</tr>
													<tr>
														<td height="25" align="center" bgcolor="#E2EFDA">Phone</td>
														<td align="center" bgcolor="#E2EFDA">:</td>
														<td bgcolor="#E2EFDA"><div id="is2"
																style="padding: 3px;">031-253-5225</div></td>
														<td align="center" bgcolor="#E2EFDA">담 당 자</td>
														<td align="center" bgcolor="#E2EFDA">:</td>
														<td bgcolor="#E2EFDA"><div id="user_info" style="padding: 3px;">세션 아이디값 받아오는곳~</div></td>
													</tr>
													<tr>
														<td height="25" align="center" bgcolor="#E2EFDA">E-mail</td>
														<td align="center" bgcolor="#E2EFDA">:</td>
														<td bgcolor="#E2EFDA"><div id="is3"
																style="padding: 3px;">yungaeul@naver.com</div></td>
														<td align="center" bgcolor="#E2EFDA">작성일자</td>
														<td align="center" bgcolor="#E2EFDA">:</td>
														<td bgcolor="#E2EFDA"><div class="inputBox" id="w_date6" style="padding: 2px;">${po.po_regDate}</div></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<table width="650" border="0" cellspacing="0" cellpadding="0" bordercolor="#ffffff"
										style="border-collapse: collapse; table-layout: fixed" align="center" class="f10">
										<tr>
											<td height="5" align="right"></td>
										</tr>
									</table>
									<table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000"
										style="border-collapse: collapse; table-layout:" align="center" class="f10">
										<tr>
											<td width="162" height="25" align="center"
												style="font-weight: bold">공급업체명</td>
											<td width="162" align="center" style="font-weight: bold">담당자</td>
											<td width="163" align="center" style="font-weight: bold">Phone</td>
											<td width="163" align="center" style="font-weight: bold">E-mail</td>
										</tr>
										<tr>
											<td height="25" align="center"><div tms_edit id="cn1">공급업체쓰는곳</div></td>
											<td align="center"><div tms_edit id="cn2">담당자쓰는곳</div></td>
											<td align="center"><div tms_edit id="cn3">담당자연락처쓰는곳</div></td>
											<td align="center"><div tms_edit id="cn4">E-mail쓰는곳</div></td>
										</tr>
									</table>
									<table width="650" border="0" cellspacing="0" cellpadding="0" bordercolor="#ffffff"
										style="border-collapse: collapse; table-layout: fixed" align="center" class="f10">
										<tr>
											<td height="5" align="right"></td>
										</tr>
									</table>
									<table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000"
										style="border-collapse: collapse; table-layout: fixed" align="center" class="f9">
										<tr>
											<td width="32" height="40" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">NO</td>
											<td width="124" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">품 명</td>
											<td width="104" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">규격 및 사양</td>
											<td width="43" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">수량</td>
											<td width="41" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">단위</td>
											<td width="61" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">단 가</td>
											<td width="107" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">금액(VAT별도)</td>
											<td width="56" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">납기</td>
											<td width="62" align="center" bgcolor="#E2EFDA"
												style="font-weight: bold">비고</td>
										</tr>
										<tr>
											<td height="30" align="center">1</td>
											<td align="center"><div tms_edit id="aa1" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb1" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee1" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc1" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd1" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff1" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg1" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg16" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">2</td>
											<td align="center"><div tms_edit id="aa2" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb2" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee2" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc2" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd2" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff2" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg2" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg17"style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">3</td>
											<td align="center"><div tms_edit id="aa3" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb3" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee3" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc3" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd3" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff3" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg3" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg18" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">4</td>
											<td align="center"><div tms_edit id="aa4" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb4" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee4" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc4" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd4" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff4" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg4" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg19" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">5</td>
											<td align="center"><div tms_edit id="aa5" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb5" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee5" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc5" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd5" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff5"style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg5" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg20" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">6</td>
											<td align="center"><div tms_edit id="aa6" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb6" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee6" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc6" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd6" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff6" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg6" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg21" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">7</td>
											<td align="center"><div tms_edit id="aa7" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb7" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee7" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc7" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd7" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff7" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg7" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg22" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">8</td>
											<td align="center"><div tms_edit id="aa8" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb8" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee8" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc8" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd8" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff8" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg8" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg23" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">9</td>
											<td align="center"><div tms_edit id="aa9" style="padding: 3px;""></div></td>
											<td align="center"><div tms_edit id="bb9" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee9" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc9" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd9" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff9" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg9" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg24" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">10</td>
											<td align="center"><div tms_edit id="aa10" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb10" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee10" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc10" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd10" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff10" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg10" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg25" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">11</td>
											<td align="center"><div tms_edit id="aa11" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb11" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee11" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc11" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd11" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff11" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg11" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg26" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">12</td>
											<td align="center"><div tms_edit id="aa12" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb12" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee12" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc12" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd12" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff12" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg12" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg27" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">13</td>
											<td align="center"><div tms_edit id="aa13" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb13" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee13" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc13" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd13" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff13" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg13" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg28" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">14</td>
											<td align="center"><div tms_edit id="aa14" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb14" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee14" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc14" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd14" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff14" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg14" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg29" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" align="center">15</td>
											<td align="center"><div tms_edit id="aa15" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="bb15" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="ee15" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="cc15" style="padding: 3px;"></div></td>
											<td align="right"><div tms_edit id="dd15" style="padding: 3px;"></div></td>
											<td align="right" bgcolor="#F8F8F8"><div id="ff15" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg15" style="padding: 3px;"></div></td>
											<td align="center"><div tms_edit id="gg30" style="padding: 3px;"></div></td>
										</tr>
										<tr>
											<td height="30" colspan="6" align="center" bgcolor="#E2EFDA" style="font-weight: bold">합 계</td>
											<td align="right" bgcolor="#F8F8F8" style="font-weight: bold"><div id="sum_ff" style="padding: 3px;">합계 금액 쓰는 곳</div></td>
											<td align="right" style="font-weight: bold">&nbsp;</td>
											<td align="right" style="font-weight: bold">&nbsp;</td>
										</tr>
										<tr>
											<td height="30" colspan="9" align="left" style="font-weight: bold">
												<div tms_edit id="gg31" style="padding: 3px; line-height: 25px">
													1. 납품주소 : 인천 미추홀구 경인로 229 인천IT타워<br>
													2. 납 기 일 : <br>
													3. 요청사항 : <br>
												</div></td>
										</tr>

									</table>
									<table width="650" border="0" cellspacing="0" cellpadding="0"
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
	
		function printPage() {
			
			var po_id = button.getAttribute('po_id');
			
			console.log(po_id);
			
			 var popupURL = "purchaseOrderPrint";
			  // 팝업 창 매핑.
			  var popupProperties = "width=400,height=800,popup=yes,scrollbars=yes";
			  // 팝업 열때 속성.
			  window.open(popupURL, "인쇄창", popupProperties);
			  
			  
			  
		}
	
	</script>
</body>
</html>
