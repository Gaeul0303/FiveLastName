<!-- 기본틀 index page -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html lang="ko">
<head>

<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/include/sideBar.jsp"%>

		<div class="main-panel">
			<%@include file="/WEB-INF/views/include/header.jsp"%>


			<div class="container">
				<div class="page-inner">
					<div class="page-header">
						<h3 class="fw-bold mb-3">계약</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">계약</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">계약리스트</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">계약</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="basic-datatables"
											class="display table table-striped table-hover">
											<colgroup>
												<col width="10%">
											</colgroup>
											<tfoot>
												<tr>
													<th></th>
													<th></th>
													<th></th>
													<th></th>
													<th></th>
													<th></th>
													
												</tr>
											</tfoot>
											<thead>
												<tr>
													<th>계약ID</th>
													<th>견적ID</th>
													<th>계약일</th>
													<th>거래조건</th>
													<th>계약여부</th>
													<th>공급가</th>
													
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${list }" var="list" varStatus="status">
													<tr>
														<td>${list.co_id }</td>
														<td>${list.es_id }</td>
														<td>${list.co_contractDate }</td>
														<td>${list.co_tradeTerms }</td>
														<td>${list.co_contractStatus }</td>
														<td>${list.co_supplyPrice }</td>
														<td><a href="/contract/read?co_id=${ list.co_id}">자세히보기</a></td>
													</tr>
												</c:forEach>
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


		<%@include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<script type="text/javascript" src="/resources/assets/js/upload.js"></script>
	<script>
		$(document)
				.ready(
						function() {

							$("#basic-datatables")
									.DataTable(
											{
												pageLength : 5,
												aaSorting : [],
												initComplete : function() {
													var table = this.api();
													console
															.log(table
																	.column(
																			categoryColumnIndex)
																	.footer())
													// 카테고리 열 인덱스
													var categoryColumnIndex = 0;

													// 카테고리 필터용 select 박스 생성
													var select = $(
															'<select class="form-select"><option value="">번호</option></select>')
															.appendTo(
																	$(
																			table
																					.column(
																							categoryColumnIndex)
																					.footer())
																			.empty())
															.on(
																	'change',
																	function() {
																		var val = $.fn.dataTable.util
																				.escapeRegex($(
																						this)
																						.val());
																		table
																				.column(
																						categoryColumnIndex)
																				.search(
																						val ? "^"
																								+ val
																								+ "$"
																								: "",
																						true,
																						false)
																				.draw();
																	});

													// 카테고리 열 데이터로 select 박스 옵션 추가
													table
															.column(
																	categoryColumnIndex)
															.data()
															.unique()
															.each(
																	function(d,
																			j) {
																		select
																				.append('<option value="' + d + '">'
																						+ d
																						+ '</option>');
																	});
												}
											});

						});
	</script>



	<script type="text/javascript">
		let result = '${msg}';
		if (result == 'success') {
			alert("처리가 완료되었습니다.");
		}
	</script>


</body>
</html>
