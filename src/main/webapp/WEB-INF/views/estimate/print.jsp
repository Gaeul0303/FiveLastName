<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="width: 810px; margin: 0 auto; padding: 23px 0;">
	
	<div
		style="display: table; table-layout: fixed; width: 100%; margin-bottom: 15px;">
		<div
			style="width:90%;display: table-cell; vertical-align: middle; text-align: left; font-size: 24px; color: #343434;">견적서</div>
		<div
			style="width:10%;display: table-cell; vertical-align: middle; text-align: center; font-size: 24px; color: #343434;"><span style="vertical-align: middle; text-align: right;"><img
			src="/resources/assets/img/kaiadmin/logo.png"
			style="vertical-align: middle; max-height: 50px;" /></div>

	</div>
	<div>
		<div style="margin-bottom: 18px;">
			<div style="float: left; width: 350px; padding: 0 2px;">
				<table
					style="width: 100%; border-collapse: collapse; border-spacing: 0; text-align: left; border: 1px solid #edeeef; border-top: 2px solid #474747;">
					<colgroup>
						<col width="75px" />
						<col width="" />
					</colgroup>
					<tr>
						<th colspan="2"
							style="padding: 8px 5px; font-size: 15px; font-weight: 500; color: #000; border-bottom: 1px solid #edeeef; text-align: left;">TO</th>
					</tr>
					<tr>
						<td class="dt"
							style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">견적일</td>
						<td
							style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;">2024-09-03</td>
					</tr>
					<tr id="EnameRow">
						<td class="dt"
							style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">이름</td>
						<td
							style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;"
							id="Ename"></td>
					</tr>


					<tr class="basic_price">
						<td class="dt"
							style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">견적금액</td>
						<td
							style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;"><span
							class="price total_price"
							style="color: #222; font-size: 18px; font-weight: 700; letter-spacing: -1px;">0</span>원<span
							class="tex" style="color: #e71f19;">(부가세 포함)</span></td>
					</tr>
				</table>
			</div>
			<div style="float: right; width: 450px; padding: 0 2px;">
				<table
					style="width: 100%; border-collapse: collapse; border-spacing: 0; text-align: left; border: 1px solid #edeeef; border-top: 2px solid #474747;">
					<colgroup>
						<col width="80px" />
						<col width="130px" />
						<col width="50px" />
						<col width="140px" />
					</colgroup>
					<c:forEach items="${pa }" var="partner" varStatus="status">
						<c:if test="${estimateDTO.pa_id == partner.pa_id }">
							<tr>
								<th colspan='4'
									style="padding: 8px 5px; font-size: 15px; font-weight: 500; color: #000; border-bottom: 1px solid #edeeef; text-align: left;">공급자</th>
							</tr>
							<tr>
								<td class='dt'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">공급사이름</td>
								<td colspan='3' class='company'
									style="position: relative; padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;">${partner.pa_name }</td>
							</tr>
							<tr>
								<td class='dt'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">담당자</td>



								<td colspan='3'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;">${partner.pa_manager }</td>

							</tr>
							<tr>
								<td class='dt'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">주소</td>
								<td colspan='3'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;">${partner.pa_address }</td>
							</tr>

							<tr>
								<td class='dt'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">대표전화</td>
								<td colspan='3'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;">${partner.pa_tel }</td>

							</tr>
							<tr>
								<td class='dt'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef; background: url('http://bb2b.co.kr/skin/shop/basic/images/icon/bar.png') no-repeat center right;">이메일</td>
								<td colspan='3'
									style="padding: 5px 10px; color: #737373; font-size: 13px; text-align: left; border-bottom: 1px solid #edeeef;">${partner.pa_email }</td>
							</tr>

						</c:if>
					</c:forEach>
				</table>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div style="clear: both;">
			<div style="width: 100%">
				<table
					style="width: 100%; border-collapse: collapse; border-spacing: 0; text-align: left; border-top: 2px solid #474747;">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="55%" />
						<col width="10%" />
						<col width="5%" />
						<col width="5%" />
					</colgroup>
					<tr>
						<th
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">번호</th>
						<th
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">분류</th>
						<th
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">제품명</th>
						<th
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;"
							id="priceType">판매가</th>
						<th
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">수량</th>
						<th
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">합계</th>
					</tr>
					<tr>
						<td
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">번호</td>
						<td
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">분류</td>
						<td
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">제품명</td>
						<td
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;"
							id="priceType">판매가</td>
						<td
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">수량</td>
						<td
							style="color: #6b6b6b; text-align: center; font-size: 14px; font-weight: 500; padding: 15px 0; border-bottom: 1px solid #bebebe;">합계</td>
					</tr>


					<tr id="settingRow" style="display: none;">
						<td class='center'
							style="padding: 12px 10px; font-size: 13px; border-bottom: 1px solid #edeeef; text-align: center;">1</td>
						<td class='center'
							style="padding: 12px 10px; font-size: 13px; border-bottom: 1px solid #edeeef; text-align: center;">운송비</td>
						<td colspan='4'
							style="padding: 12px 10px; font-size: 13px; border-bottom: 1px solid #edeeef; text-align: left;">택배(무료)
							0원</td>
					</tr>
				</table>
				<div style="text-align: left; margin: 18px 0; color: #222;">
					<span class="basic_price"> <span class="txt"
						style="margin-right: 34px; font-size: 14px; font-weight: 500;">총
							주문 금액</span> <span
						style="font-size: 22px; font-weight: 700; letter-spacing: -1px;"><span
							class="total_price">0</span>원</span>
					</span>

				</div>

				<ul style="padding: 0; margin: 0; list-style: none;">
					<li>* 상기 견적서는 부가가치세 포함이며, 운송료 <span id="delivery_msg">별도</span>입니다.
					</li>
					<li>* 가격정보가 수시로 변하므로, 제품구매시에는 최종 단가를 확인하시기 바랍니다.</li>
					<li>* 페이지 설정에서 크기에 맞게 축소 사용을 체크하시기 바랍니다.</li>
					<li id="EmemoRow" style="color: #ff0000; display: none;">* <span
						id="Ememo"></span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
