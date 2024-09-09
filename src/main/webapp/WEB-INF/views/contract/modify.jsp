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
						<h3 class="fw-bold mb-3">계약서등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">계약</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">계약등록</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">Form Elements</div>
								</div>
								<div class="card-body">
									<form id="registerForm" method="POST">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="nameinput">계약등록</label>
													<div class="table-responsive scrollTable">
														<table id="basic-datatables"
															class="display table table-striped table-hover">
															<thead>
																<tr>
																	<th>선택</th>
																	<th>협력회사</th>
																	<th>조달계획</th>
																	<th>발행일</th>
																	<th>공급가</th>
																	<th>소요일</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${es}" var="estimate">
																	<tr>
																		<td><input type="radio" id="sel${estimate.es_id}"
																			name="es_id" value="${estimate.es_id}"
																			required="required"></td>

																		<c:forEach items="${pa }" var="partner">
																			<c:if test="${estimate.pa_id == partner.pa_id }">
																				<td><label for="sel${estimate.es_id}">${partner.pa_name }</label></td>
																			</c:if>
																		</c:forEach>

																		<td>${estimate.pp_id }</td>
																		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																				value="${estimate.es_publicationDate }" /></td>
																		<td>${estimate.es_supplyPrice }</td>
																		<td>${estimate.es_requiredDays }일</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
												<div class="col-md-6">

													<div class="form-group">
														<label for="Dateinput">계약일</label><input
															type="datetime-local" class="form-control" id="Dateinput"
															name="display" placeholder="계약일" required="required"
															value="${contractDTO.co_contractDate }" /> <input
															type="hidden" id="formattedDateInput"
															name="co_contractDate" />
													</div>
													<div class="form-group">
														<label for="Termsinput">거래조건</label>
														<textarea class="form-control" id="Termsinput"
															placeholder="거래조건" name="co_tradeTerms"
															required="required">${contractDTO.co_tradeTerms }</textarea>
													</div>
													<div class="form-group">
														<label for="statusinput">거래여부</label> <select
															class="form-select" id="statusinput"
															name="co_contractStatus">
															<option value="미계약">미계약</option>
															<option value="새품목">계약완료</option>

														</select>
													</div>
													<div class="form-group">
														<label for="priceinput">공급가</label><input type="number"
															class="form-control" id="priceinput"
															name="co_supplyPrice" placeholder="공급가"
															required="required" value="${contractDTO.co_supplyPrice }" />
													</div>
												</div>
											</div>
										</div>
										<div class="card-action">
											<button class="btn btn-success" id="registerBtn">수정하기</button>
											<button type="submit" class="btn btn-danger" id="cancel">취소</button>

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
			let chVal = ${contractDTO.es_id};
			let status = `${contractDTO.co_contractStatus }`;
	    	$("input[value='"+ chVal +"']").prop("checked",true);			
			$("#statusinput").val(status).prop("selected", "true");
			
			$("#cancel").on("click",function(){
				location.href="/contract/list";
			})
		});
	</script>
	<script>
		$(document).ready(
				function() {

					const form = $("#registerForm");

					$("#registerBtn").on("click", function(e) {
						e.preventDefault();
						let dateInput = $('#Dateinput').val();

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
						return year + '-' + month + '-' + day + ' ' + hours
								+ ':' + minutes + ':' + seconds;
					}

				})
	</script>
</body>



</html>