<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h3 class="fw-bold mb-3">조달 계획안</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">Forms</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">Basic Form</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">조달 계획 수립</div>
								</div>
								<div class="card-body">
									<form id="insertForm" enctype="procurmentPlan/insertForm"
										method="post">

										<div class="row">
											<div class="col-md-6 col-lg-4">
												<div class="form-group">
													<label for="co_id">거래계약ID</label> <select
														class="form-select" id="co_id" name="co_id">
														<option>거래선택</option>
														<c:forEach items="${list}" var="contract">
															<option value="${contract.co_id }">
																${contract.co_id }</option>
														</c:forEach>
													</select>
													<div class="form-group">
														<div class="form-group">
															<label for="co_status">계약 상태</label> <input type="text"
																class="form-control" id="co_status"
																name="co_contractStatus" placeholder="계약 상태" readonly />
														</div>
														<div class="form-group">
															<label for="ppr_quantity">수량</label> <input type="number"
																class="form-control" id="ppr_quantity"
																name="ppr_quantity" required="required" placeholder="Enter Amount" />
														</div>
														<div class="form-group">
															<label for="ppr_dueDate">납기일</label> <input type="date"
																class="form-control" id="ppr_dueDate" name="ppr_dueDate" required="required"
																placeholder="납기일" />
																<input type="hidden" id="formattedDateInput"
															name="ppr_dueDate" />
														</div>
														<div class="form-group">
															<label for="ppr_status">발주서 발행 여부</label> <input type="text"
																class="form-control" id="ppr_status" name="ppr_status" required="required"
																placeholder="미발행" />
														</div>													
													</div>
												</div>
												<div class="card-action">
													<button class="btn btn-success" id="insertBtn">등록</button>
													<button class="btn btn-danger">취소</button>
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

	<script>
		$(document)
				.ready(
						function() {

							const form = $("#insertForm");

							$("#co_id")
									.on(
											"change",
											function(e) {
												e.preventDefault();
												let co_id = $(
														"select[name='co_id']")
														.val();
												console.log(co_id);

												$
														.ajax({
															url : 'data/'
																	+ co_id,
															type : 'GET',
															contentType : 'application/x-www-form-urlencoded; charset=utf-8',
															dataType : 'json',

															success : function(
																	data) {
																console
																		.log(data.co_contractStatus);
																$(
																		"input[name='co_contractStatus']")
																		.val(
																				data.co_contractStatus);

															},

														})

											})

						})
	</script>
	
	<script>
		$(document).ready(
				function() {

					const form = $("#insertForm");

					$("#insertBtn").on("click", function(e) {
						e.preventDefault();
						let dateInput = $('#ppr_dueDate').val();

						if (dateInput) {
							// dateTime 형식을 yyyy-MM-dd hh:mm:ss로 변환
							let formattedDate = formatDateTime(dateInput);
							console.log("Formatted Date: ", formattedDate);

							// 변환된 값을 숨겨진 필드에 설정
							$('#formattedDateInput').val(formattedDate);

							form.submit();
						}

					})

					function formatDateTime(dateTimeString) {
						let date = new Date(dateTimeString);

						let year = date.getFullYear();
						let month = ('0' + (date.getMonth() + 1)).slice(-2); // 월 2자리로 변환
						let day = ('0' + date.getDate()).slice(-2); // 일 2자리로 변환
						let hours = ('0' + date.getHours()).slice(-2); // 시간 2자리로 변환
						let minutes = ('0' + date.getMinutes()).slice(-2); // 분 2자리로 변환
						let seconds = ('0' + date.getSeconds()).slice(-2); // 초 2자리로 변환 

						// 최종 포맷: yyyy-MM-dd hh:mm:ss
						return year + '-' + month + '-' + day + ' '  + hours
								+ ':' + minutes + ':' + seconds;
					}

				})
	</script>
</body>
</html>
