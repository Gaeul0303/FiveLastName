<!-- 기본틀 index page -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html lang="ko">
<head>

<%@include file="/WEB-INF/views/include/head.jsp"%>

<style type="text/css">
.modal { 
	--bs-modal-width: 100%;
	width: 100%;
	max-width: 900px;
	left: 50%;
	transform: translateX(-50%);
}

.modal-dialog {
	width: 100%
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

												<tr>
													<td>${contractDTO.co_id }</td>
													<td>${contractDTO.es_id }</td>
													<td>${contractDTO.co_contractDate }</td>
													<td>${contractDTO.co_tradeTerms }</td>
													<td>${contractDTO.co_contractStatus }</td>
													<td><fmt:formatNumber
															value="${contractDTO.co_supplyPrice }" pattern="#,###" /></td>

												</tr>
											</tbody>
										</table>

										<div class="card-action">
											<c:if test="${contractDTO.co_contractStatus eq '계약완료'}">
												<button class="btn btn-success" id="printBtn"
													data-bs-toggle="modal" data-bs-target="#exampleModal">인쇄하기</button>

											</c:if>
											<c:if test="${contractDTO.co_contractStatus ne '계약완료'}">
												<button class="btn btn-success">
													<a href="/contract/modify?co_id=${ contractDTO.co_id}" style="color:#fff">수정하기</a>
												</button>

											</c:if>

											<a href="/contract/list" class="btn btn-danger">목록으로</a>
										</div>
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
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">계약서 인쇄</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="printForm">
					<%@include file="/WEB-INF/views/contract/print.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="print">인쇄하기</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<script type="text/javascript" src="/resources/assets/js/upload.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			let formObj = $("form[role='form']");

			$("#modifyBtn").on("click", function() {
				formObj.attr("action", "/product/modify");
				formObj.attr("method", "get");
				formObj.submit();
			})

			$("#printBtn").on("click", function(e) {
				e.preventDefault();

			})
			$("#print").on("click", function(e) {
				window.print();
			})

		})
	</script>


	<script type="text/javascript">
		let result = '${msg}';
		if (result == 'success') {
			alert("수정이 완료되었습니다.");
		}
	</script>



</body>
</html>
