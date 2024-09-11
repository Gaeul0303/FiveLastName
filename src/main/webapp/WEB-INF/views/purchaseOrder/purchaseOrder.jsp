<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	 <%@include file="../include/head.jsp" %>
<style type="text/css">
@media print {
    html, body { -webkit-print-color-adjust:exact; width: 210mm; height: 297mm; }
    table { page-break-inside:auto; }
    tr    { page-break-inside:avoid; page-break-after:auto; }
    thead { display:table-header-group; }
    tfoot { display:table-footer-group; }
},
    @media print {
        html, body { -webkit-print-color-adjust:exact; width: 210mm; height: 297mm; }
  		table { page-break-inside:auto; }
    	tr    { page-break-inside:avoid; page-break-after:auto; }
    	thead { display:table-header-group; }
    	tfoot { display:table-footer-group; }
        @page {
            size: portrait; /* 세로 인쇄 모드 설정 */
            margin: 1cm; /* 페이지 여백 설정 */
        }
    }
</style>
</HEAD>
<BODY>

	<div id="reportPrint">
	
	<table width="650" border="0" cellspacing="0" cellpadding="0"
		bordercolor="#ffffff" style="border-collapse: collapse; table-layout:"
		align="center">
		<tr>
			<td width="99%" height="100" align="center" class="f18b">
				<div id="ti1" style="padding: 3px;">발주서</div>
			</td>
			<td width="1%" align="right" id="tms_auto_sign">&nbsp;</td>
		</tr>
	</table>

	<table width="650" border="1" cellspacing="0" cellpadding="0"
		bordercolor="#000000" style="border-collapse: collapse; table-layout:"
		align="center">
		<tr>
			<td height="30" align="center">
				<table width="650" border="0" cellspacing="0" cellpadding="0"
					bordercolor="#ffffff"
					style="border-collapse: collapse; table-layout:" align="center"
					class="f10">
					<tr>
						<td width="10%" height="25" align="center" bgcolor="#E2EFDA"
							style="font-weight: bold">회사명</td>
						<td width="2%" align="center" bgcolor="#E2EFDA"
							style="font-weight: bold">:</td>
						<td width="38%" bgcolor="#E2EFDA" style="font-weight: bold"><div
								id="is1" style="padding: 3px;">(주)오성</div></td>
						<td width="10%" align="center" bgcolor="#E2EFDA">관리번호</td>
						<td width="2%" align="center" bgcolor="#E2EFDA">:</td>
						<td width="38%" bgcolor="#E2EFDA"><div tms_edit id="docno"
								style="padding: 3px;">${po.po_id}</div></td>
					</tr>
					<tr>
						<td height="25" align="center" bgcolor="#E2EFDA">Phone</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div id="is2" style="padding: 3px;">031-253-5225</div></td>
						<td align="center" bgcolor="#E2EFDA">담 당 자</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div id="user_info"
								style="padding: 3px;">세션 아이디값 받아오는곳~</div></td>
					</tr>
					<tr>
						<td height="25" align="center" bgcolor="#E2EFDA">E-mail</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div id="is3" style="padding: 3px;">yungaeul@naver.com</div></td>
						<td align="center" bgcolor="#E2EFDA">작성일자</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div class="inputBox" id="w_date6"
								style="padding: 2px;">${po.po_regDate}</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="650" border="0" cellspacing="0" cellpadding="0"
		bordercolor="#ffffff"
		style="border-collapse: collapse; table-layout: fixed" align="center"
		class="f10">
		<tr>
			<td height="5" align="right"></td>
		</tr>
	</table>
	<table width="650" border="1" cellspacing="0" cellpadding="0"
		bordercolor="#000000" style="border-collapse: collapse; table-layout:"
		align="center" class="f10">
		<tr>
			<td width="162" height="25" align="center" style="font-weight: bold">공급업체명</td>
			<td width="162" align="center" style="font-weight: bold">업체 대표명</td>
			<td width="163" align="center" style="font-weight: bold">Phone</td>
			<td width="163" align="center" style="font-weight: bold">E-mail</td>
		</tr>
		<tr>
			<td height="25" align="center"><div tms_edit id="cn1">${po.pa_name}</div></td>
			<td align="center"><div tms_edit id="cn2">${po.pa_manager}</div></td>
			<td align="center"><div tms_edit id="cn3">${po.pa_tel}</div></td>
			<td align="center"><div tms_edit id="cn4">${po.pa_email}</div></td>
		</tr>
	</table>
	<table width="650" border="0" cellspacing="0" cellpadding="0"
		bordercolor="#ffffff"
		style="border-collapse: collapse; table-layout: fixed" align="center"
		class="f10">
		<tr>
			<td height="5" align="right"></td>
		</tr>
	</table>
	<table width="650" border="1" cellspacing="0" cellpadding="0"
		bordercolor="#000000"
		style="border-collapse: collapse; table-layout: fixed" align="center"
		class="f9">
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
			<td align="center"><div tms_edit id="aa1" style="padding: 3px;">${status.index+1}</div></td>
			<td align="center"><div tms_edit id="bb1" style="padding: 3px;">${po.pr_name}</div></td>
			<td align="right"><div tms_edit id="ee1" style="padding: 3px;">${po.pr_size}</div></td>
			<td align="center"><div tms_edit id="cc1" style="padding: 3px;">${po.ppr_quantity}</div></td>
			<td align="center"><div tms_edit id="dd1" style="padding: 3px;"></div>개</td>
			<td align="center"><div tms_edit id="gg1" style="padding: 3px;"></div>${po.co_supplyPrice}</td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff1" style="padding: 3px;">${po.co_supplyPrice*po.ppr_quantity}원</div></td>
			<td align="center"><div tms_edit id="gg16" style="padding: 3px;"></div>${po.ppr_dueDate}까지</td>
			<td align="center"><div tms_edit id="gg16" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">2</td>
			<td align="center"><div tms_edit id="aa2" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="bb2" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee2" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc2" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd2" style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff2"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg2" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg17" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">3</td>
			<td align="center"><div tms_edit id="aa3" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="bb3" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee3" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc3" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd3" style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff3"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff4"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff5"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff6"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff7"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff8"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff9"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff10"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff11"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff12"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff13"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff14"
					style="padding: 3px;"></div></td>
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
			<td align="right" bgcolor="#F8F8F8"><div id="ff15"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg15" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg30" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" colspan="6" align="center" bgcolor="#E2EFDA"
				style="font-weight: bold">합 계</td>
			<td align="right" bgcolor="#F8F8F8" style="font-weight: bold"><div
					id="sum_ff" style="padding: 3px;">${po.co_supplyPrice*po.ppr_quantity}원</div></td>
			<td align="right" style="font-weight: bold">&nbsp;</td>
			<td align="right" style="font-weight: bold">&nbsp;</td>
		</tr>
		<tr>
			<td height="30" colspan="9" align="left" style="font-weight: bold">
				<div tms_edit id="gg31" style="padding: 3px; line-height: 25px">
					1. 납품주소 : 인천 미추홀구 경인로 229 인천IT타워<br>
					2. 납 기 일 : ${po.ppr_dueDate}<br>
					3. 요청사항 : ${po.co_tradeTerms}<br>
				</div>
			</td>
		</tr>

	</table>
	<table width="650" border="0" cellspacing="0" cellpadding="0"
		bordercolor="#ffffff"
		style="border-collapse: collapse; table-layout: fixed" align="center"
		class="f10">
		<tr>
			<td height="25" align="right">&nbsp;</td>
		</tr>
	</table>
	<p>&nbsp;</p>
	</div>
	
	<button onclick="printWindow()">인쇄하기</button>
	<button onClick="self.close();">새창 닫기</button>
	   
		<script>
		function printWindow() {
			   var initBody = document.body.innerHTML;
			   window.onbeforeprint = function(){
			       document.body.innerHTML = document.getElementById("reportPrint").innerHTML;
			   }
			   window.onafterprint = function(){
			       document.body.innerHTML = initBody;
			   }
			   window.print();
			   self.close();
			   }
		</script>
</BODY>
</HTML>
