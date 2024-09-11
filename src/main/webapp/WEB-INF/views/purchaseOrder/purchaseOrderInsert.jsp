<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
.scrollTable {
	height: 300px;
	overflow: scroll;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/include/sideBar.jsp"%>
		<div class="main-panel">
			<%@include file="/WEB-INF/views/include/header.jsp"%>
			<div class="container">
				<div class="page-inner">
					<div class="page-header">
						<h3 class="fw-bold mb-3">발주서등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i></a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">구매발주서</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">발주서 등록</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">구매발주서 등록</div>
								</div>
								<div class="card-body">
									<form id="registerForm" method="POST" action="/purchaseOrder/insert">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="nameinput">구매발주서등록</label>
													<div class="table-responsive scrollTable">
														<table id="basic-datatables"
															class="display table table-striped table-hover">
															<thead>
																<tr>
																	<th>선택</th>
																	<th>협력회사</th>
																	<th>조달계획등록</th>
																	<th>납기일</th>
																	<th>수량</th>
																	<th>공급가</th>
																	<th>거래조건</th>
																</tr>
															</thead>
															<tbody>
																<!-- count가 1이 아닌 경우에만 반복문 실행 -->
																<c:choose>
																	<c:when test="${count != 1}">
																		<c:forEach items="${ppr}" var="ppr">
																			<tr>
																				<td><input type="radio" id="sel${ppr.ppr_id}"
																					name="ppr_id" value="${ppr.ppr_id}"
																					required="required"></td>

																				<c:forEach items="${po}" var="po">
																					<c:if test="${ppr.ppr_id == po.ppr_id}">
																						<td><label for="sel${ppr.ppr_id}">${po.pa_name}</label></td>
																					</c:if>
																				</c:forEach>

																				<td>${ppr.ppr_id}</td>
																				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																						value="${ppr.ppr_dueDate}" /></td>
																				<td>${ppr.ppr_quantity}</td>
																				<c:forEach items="${po}" var="po">
																					<c:if test="${ppr.ppr_id == po.ppr_id}">
																						<td><label for="sel${ppr.ppr_id}">${po.co_supplyPrice}</label></td>
																						<td>${po.co_tradeTerms}</td>
																					</c:if>
																				</c:forEach>
																			</tr>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<!-- count가 1인 경우 처리 (예: 아무 것도 출력하지 않거나 기본 메시지 출력) -->
																					<tr>
																						<td><input type="radio" id="sel${ppr.ppr_id}"
																							name="ppr_id" value="${ppr.ppr_id}"
																							required="required"></td>
																						<td><label for="sel${ppr.ppr_id}">${po.pa_name}</label></td>
																						<td>${ppr.ppr_id}</td>
																						<td><fmt:formatDate
																								pattern="yyyy-MM-dd HH:mm"
																								value="${ppr.ppr_dueDate}" /></td>
																						<td>${ppr.ppr_quantity}</td>
																						<td><label for="sel${ppr.ppr_id}">${po.co_supplyPrice}</label></td>
																						<td>${po.co_tradeTerms}일</td>
																					</tr>
																	</c:otherwise>
																</c:choose>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<div class="card-action">
											<button class="btn btn-success" id="registerBtn">등록하기</button>
											<button class="btn btn-danger" id="cancel">취소</button>
										</div>
									</form>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#cancel").on("click", function() {
				location.href = "/purchaseOrder/list";
			});
		});
	</script>
	<script>
		$(document).ready(
				function() {
					const form = $("#registerForm");

					$("#registerBtn").on("click", function(e) {
						let dateInput = $('#Dateinput').val();

						if (dateInput) {
							// dateTime 형식을 yyyy-MM-dd hh:mm:ss로 변환
							let formattedDate = formatDateTime(dateInput);
							console.log("Formatted Date: ", formattedDate);

							// 변환된 값을 숨겨진 필드에 설정
							$('#formattedDateInput').val(formattedDate);

							form.submit();
						}
					});

					function formatDateTime(dateTimeString) {
						let date = new Date(dateTimeString);

						let year = date.getFullYear();
						let month = ('0' + (date.getMonth() + 1)).slice(-2); // 월 2자리로 변환
						let day = ('0' + date.getDate()).slice(-2); // 일 2자리로 변환
						let hours = ('0' + date.getHours()).slice(-2); // 시간 2자리로 변환
						let minutes = ('0' + date.getMinutes()).slice(-2); // 분 2자리로 변환
						let seconds = ('0' + date.getSeconds()).slice(-2); // 초 2자리로 변환

						// 최종 포맷: yyyy-MM-dd hh:mm:ss
						return year + '-' + month + '-' + day + ' ' + hours
								+ ':' + minutes + ':' + seconds;
					}
				});
	</script>
</body>
</html>