<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0, minimum-scale=0.5, user-scalable=yes">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<TITLE>발주서신청용</TITLE>
<link href="./common.css" rel="stylesheet" type="text/css">
<script language="javascript" src="./common.js"></script>

<style type="text/css">
p {
	margin: 0px;
}

.f8 {
	font-family: "굴림";
	font-size: 8pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
}

.f8b {
	font-family: "굴림";
	font-size: 8pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f9 {
	font-family: "굴림";
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
}

.f9b {
	font-family: "굴림";
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f10 {
	font-family: "굴림";
	font-size: 10pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
}

.f10b {
	font-family: "굴림";
	font-size: 10pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f11 {
	font-family: "굴림";
	font-size: 11pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
}

.f11b {
	font-family: "굴림";
	font-size: 11pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f13 {
	font-family: "굴림";
	font-size: 13pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
}

.f13b {
	font-family: "굴림";
	font-size: 13pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f14b {
	font-family: "굴림";
	font-size: 14pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f14 {
	font-family: "굴림";
	font-size: 14pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
}

.f16b {
	font-family: "굴림";
	font-size: 16pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f18b {
	font-family: "굴림";
	font-size: 18pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.f20b {
	font-family: "굴림";
	font-size: 20pt;
	color: #000000;
	text-decoration: none;
	letter-spacing: 0px;
	font-weight: bold;
}

.fieldside_bottom {
	font-family: "굴림", "돋움", seoul;
	font-size: 12px;
	color: #ffffff;
	text-decoration: none;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #ffffff;
	border-right-color: #ffffff;
	border-bottom-color: #000000;
	border-left-color: #ffffff;
}
</style>

<script>


// 품목코드 검색

function pum_code(obj) {
	
	var id_p = (obj.id).substring(0, 2);//앞자리 2자리
	var id_e = (obj.id).substring(2, 4);//뒷자리 1자리
	
   fun('popuplist','품목코드','품명=aa;규격=bb;기본단위=cc;매입단가=dd;' , '',id_e) 
   //품명 변경시 금액 자동계산
  // cSum2(obj); 
  
 
}

function del_focus(obj)
{
	
	var range = document.body.createTextRange();
	
	obj.innerText = deComma(obj.innerText);
	
	
  range.moveToElementText(obj);
  range.select();
}

function common_calc_plus(paramValue1, paramValue2)
{
	return Number(paramValue1) + Number(paramValue2);
}

function common_comma(paramObj)
{
	
	paramObj.innerText = vComma(paramObj.innerText);
}

function common_value(paramPrefix, paramIndex, paramValue)
{
	
	
	eval(paramPrefix+paramIndex).innerText = vComma(String(paramValue));	
	if(paramValue == '0') eval(paramPrefix+paramIndex).innerText = "";
}
function common_calc_mult(paramValue1, paramValue2)
{
	return paramValue1 * paramValue2;
}
function common_number(paramPrefix, paramIndex)
{
	return Number(deComma(document.getElementById(paramPrefix+paramIndex).innerText));
}

function vComma(obj) {
	var str = "" + obj.replace(/,/gi,''); // 콤마 제거
	var regx = new RegExp(/(-?\d+)(\d{3})/);
	var bExists = str.indexOf(".",0);
	var strArr = str.split('.');
	while(regx.test(strArr[0])){
		strArr[0] = strArr[0].replace(regx,"$1,$2");
	}
	if (bExists > -1)
		obj = strArr[0] + "." + strArr[1];
	else
		obj = strArr[0];
		
	return obj;
}


function calc_all_sum(paramPrefix)
{
	var result = 0;
	var elements = document.getElementsByTagName('*'); //엘리먼트 전체 
	//for(var i=0; i<elements.length; i++)
	
	for(var i=0; i<elements.length; i++)
	{
		if (elements[i].id.substring(0, 2) == paramPrefix )
		{
			result += Number(deComma(elements[i].innerText));
		}		
	}
	
	//result = result.toFixed(2);
	return result;
}



function calc_value1(obj1, obj2, obj3)

{   

	var id_p = (obj1.id).substring(0, 2);//앞자리 2자리
	var id_e = (obj1.id).substring(2, 4);//뒷자리 1자리
	
	var aa = common_number(id_p, id_e);	
	var bb = common_number(obj2, id_e);		
    var cc = common_calc_mult(aa, bb);	
		
	common_value(obj3+id_e, "", cc);
	common_value("sum_"+obj3, "", calc_all_sum(obj3));
	common_comma(obj1);
	calc_jg1(obj1);
    
}
function calc_jg1(obj1)

{   

	var id_p = (obj1.id).substring(0, 2);//앞자리 2자리
	var id_e = (obj1.id).substring(2, 4);//뒷자리 1자리
	
	var aa = common_number("ee", id_e);	
	var bb = common_number("gg", id_e);		
	var cc = common_number("ii", id_e);	
	
	var tot1 = (aa+bb)-cc;
		
	common_value("kk"+id_e, "", tot1);
	
	
	var taa = common_number("kk", id_e);	
	var tbb = common_number("dd", id_e);	
	var tcc = common_calc_mult(taa , tbb);	
	common_value("ll"+id_e, "", tcc);
	common_value("sum_ll", "", calc_all_sum("ll"));
	




}


function pycode(objSn) {
   fun('popuplist','지정목록','구  분  명=ti;' , '지출구분|구  분  명;A|견적의뢰서;B|발 주 서;',objSn)                          
}


function enterkey_process() 
{   

	if (event.keyCode == 13) 
	{        
				
		cs_search();
		event.cancelBubble = true;
		event.returnValue = false; //구버전에서 작동
		event.preventDefault(); // 신버전에서작동 IE 11
			
  }
}

function cs_search() {
    var cname =   document.getElementById("cn1").innerText;
   fun('popuplist','SEARCH_CUSTOMER','회사명=cn1;담당자명=cn2;전화번호1=cn3;팩스번호=cn4;' ,cname); 
   
  
  
   
   
}
 	

</script>





<script id="nopspro">
  <rootnode>
    <setvalue>
	  <사원명_직위>user1</사원명_직위> 
	  <직위>jic1</직위>
	  <부서명>busu1</부서명>
	  <부서명_사원명_직위>user_info</부서명_사원명_직위>
	  <년월일2>w_date6</년월일2>
	  <문서제목>ti1;cn1;</문서제목>
	  <문서번호형식>Y;1;Y;발주-{YYYY}{MM}-;3;</문서번호형식>
	  <문서번호>docno</문서번호>
    </setvalue>  
	<command>
	<양식명제외></양식명제외>
      <voice_rec>n</voice_rec>
      <gps_on>y</gps_on>
  	  <display_on_edit>hidetable</display_on_edit>
  	  <hide_on_print>hidetable</hide_on_print>
  	</command>
  </rootnode>
</script>
</HEAD>
<BODY>

	<table width="650" border="0" cellspacing="0" cellpadding="0"
		bordercolor="#ffffff" style="border-collapse: collapse; table-layout:"
		align="center">
		<tr>
			<td width="99%" height="100" align="center" class="f18b"><div
					id="ti1" style="padding: 3px;" onClick="pycode(1)">발 주 서</div></td>
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
								id="is1" style="padding: 3px;">(주)굿앱</div></td>
						<td width="10%" align="center" bgcolor="#E2EFDA">관리번호</td>
						<td width="2%" align="center" bgcolor="#E2EFDA">:</td>
						<td width="38%" bgcolor="#E2EFDA"><div tms_edit id="docno"
								style="padding: 3px;"></div></td>
					</tr>
					<tr>
						<td height="25" align="center" bgcolor="#E2EFDA">Phone</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div id="is2" style="padding: 3px;">1544-9813</div></td>
						<td align="center" bgcolor="#E2EFDA">담 당 자</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div id="user_info"
								style="padding: 3px;"></div></td>
					</tr>
					<tr>
						<td height="25" align="center" bgcolor="#E2EFDA">F A X</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div id="is3" style="padding: 3px;">070-4567-0000</div></td>
						<td align="center" bgcolor="#E2EFDA">작성일자</td>
						<td align="center" bgcolor="#E2EFDA">:</td>
						<td bgcolor="#E2EFDA"><div class="inputBox" id="w_date6"
								style="padding: 2px; cursor: hand;"
								onClick="javascript:fun('calender','w_date6','YYYY년 MM월 DD일');">&nbsp;</div></td>
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
			<td width="162" align="center" style="font-weight: bold">담당자</td>
			<td width="163" align="center" style="font-weight: bold">Phone</td>
			<td width="163" align="center" style="font-weight: bold">FAX</td>
		</tr>
		<tr>
			<td height="25" align="center"><div tms_edit id="cn1"
					onKeyDown="javascript:enterkey_process();"></div></td>
			<td align="center"><div tms_edit id="cn2"></div></td>
			<td align="center"><div tms_edit id="cn3"></div></td>
			<td align="center"><div tms_edit id="cn4"></div></td>
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
			<td height="30" align="center">1</td>
			<td align="center"><div tms_edit id="aa1" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb1" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee1"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc1" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd1"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff1"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg1" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg16" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">2</td>
			<td align="center"><div tms_edit id="aa2" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb2" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee2"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc2" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd2"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff2"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg2" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg17" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">3</td>
			<td align="center"><div tms_edit id="aa3" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb3" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee3"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc3" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd3"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff3"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg3" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg18" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">4</td>
			<td align="center"><div tms_edit id="aa4" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb4" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee4"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc4" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd4"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff4"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg4" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg19" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">5</td>
			<td align="center"><div tms_edit id="aa5" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb5" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee5"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc5" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd5"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff5"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg5" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg20" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">6</td>
			<td align="center"><div tms_edit id="aa6" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb6" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee6"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc6" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd6"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff6"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg6" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg21" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">7</td>
			<td align="center"><div tms_edit id="aa7" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb7" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee7"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc7" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd7"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff7"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg7" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg22" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">8</td>
			<td align="center"><div tms_edit id="aa8" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb8" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee8"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc8" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd8"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff8"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg8" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg23" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">9</td>
			<td align="center"><div tms_edit id="aa9" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb9" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee9"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc9" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd9"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff9"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg9" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg24" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">10</td>
			<td align="center"><div tms_edit id="aa10" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb10" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee10"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc10" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd10"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff10"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg10" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg25" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">11</td>
			<td align="center"><div tms_edit id="aa11" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb11" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee11"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc11" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd11"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff11"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg11" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg26" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">12</td>
			<td align="center"><div tms_edit id="aa12" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb12" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee12"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc12" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd12"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff12"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg12" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg27" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">13</td>
			<td align="center"><div tms_edit id="aa13" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb13" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee13"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc13" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd13"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff13"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg13" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg28" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">14</td>
			<td align="center"><div tms_edit id="aa14" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb14" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee14"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc14" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd14"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff14"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg14" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg29" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" align="center">15</td>
			<td align="center"><div tms_edit id="aa15" style="padding: 3px;"
					onDblClick="javascript:pum_code(this);"></div></td>
			<td align="center"><div tms_edit id="bb15" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="ee15"
					onBlur="calc_value1(this, 'dd', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="cc15" style="padding: 3px;"></div></td>
			<td align="right"><div tms_edit id="dd15"
					onBlur="calc_value1(this, 'ee', 'ff')" onFocus="del_focus(this)"
					style="padding: 3px;"></div></td>
			<td align="right" bgcolor="#F8F8F8"><div id="ff15"
					style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg15" style="padding: 3px;"></div></td>
			<td align="center"><div tms_edit id="gg30" style="padding: 3px;"></div></td>
		</tr>
		<tr>
			<td height="30" colspan="6" align="center" bgcolor="#E2EFDA"
				style="font-weight: bold">합 계</td>
			<td align="right" bgcolor="#F8F8F8" style="font-weight: bold"><div
					id="sum_ff" style="padding: 3px;"></div></td>
			<td align="right" style="font-weight: bold">&nbsp;</td>
			<td align="right" style="font-weight: bold">&nbsp;</td>
		</tr>
		<tr>
			<td height="30" colspan="9" align="left" style="font-weight: bold"><div
					tms_edit id="gg31" style="padding: 3px; line-height: 25px">
					1. 납품주소 : 인천 미추홀구 경인로 229 인천IT타워<br> 2. 납 기 일 : <br> 3.
					요청사항: <br> <span style="color: #0033FF">전자세금계산서 발행용
						메일주소 goodjob@goodapp.co.kr</span>
				</div></td>
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
</BODY>
</HTML>
