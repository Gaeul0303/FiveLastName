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
	.modal{
		--bs-modal-width:100%;
		width: 100%;
		max-width: 900px;
		left:50%;
		transform: translateX(-50%);
	}
	.modal-dialog{
		width:100%
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
						<h3 class="fw-bold mb-3">${productDTO.pr_name }</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">품목정보리스트</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">상세정보</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">품목정보</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<form action="" method="get" role='form'>
											<input type="hidden" name="pr_id"
												value="${productDTO.pr_id }">
											<table id="basic-datatables"
												class="display table table-striped table-hover">
												<colgroup>
													<col width="10%">
												</colgroup>


												<thead>
													<tr>
														<th>견적ID</th>
														<th>협력회사</th>
														<th>품목</th>
														<th>발행일</th>
														<th>공급가</th>
														<th>소요일</th>
													</tr>
												</thead>

												<tbody>

													<tr>
														<td>${estimateDTO.es_id }</td>
														<c:forEach items="${pa }" var="partner" varStatus="status">
															<c:if test="${estimateDTO.pa_id == partner.pa_id }">
																<td>${partner.pa_name }</td>
															</c:if>
														</c:forEach>

														<c:forEach items="${pr }" var="product" varStatus="status">
															<c:if test="${estimateDTO.pr_id == product.pr_id }">
																<td>${product.pr_name }</td>
															</c:if>

														</c:forEach>
														<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																value="${estimateDTO.es_publicationDate }" /></td>
														<td>${estimateDTO.es_supplyPrice }</td>
														<td>${estimateDTO.es_requiredDays }일</td>
													</tr>

												</tbody>
											</table>
											<div class="card-action">
											
												
												<button class="btn btn-success" id="printBtn"
													data-bs-toggle="modal" data-bs-target="#exampleModal">인쇄하기</button>
												<button type="submit" class="btn btn-success" id="modifyBtn">수정하기</button>
												<a href="/estimate/list" class="btn btn-danger">목록으로</a>
											</div>
										</form>
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
						<h1 class="modal-title fs-5" id="exampleModalLabel">견적서 인쇄</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="printForm">
						<%@include file="/WEB-INF/views/estimate/print.jsp"%>
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
			
			
			$("#printBtn").on("click",function(e){
				e.preventDefault();
				
			})
			$("#print").on("click",function(e){
				window.print();
			})

		})
	</script>
	<script type="text/javascript">
		$('.img').each(function() {
			var img = $(this).attr('src');

			let fileInfo = getFileInfo(img);
			$(this).attr('src', fileInfo);
		});
	</script>

	<script type="text/javascript">
		let result = '${msg}';
		if (result == 'success') {
			alert("수정이 완료되었습니다.");
		}
	</script>



</body>
</html>
