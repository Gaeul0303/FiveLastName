<!-- 기본틀 index page -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<style type="text/css">
.imgBox img {
	display: block;
	height: 70px;
	margin: 0 auto
}
</style>
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
						<h3 class="fw-bold mb-3">${procurementPlanRegistrationDTO.ppr_id }</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">조달계획정보리스트</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">상세정보</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">조달계획정보</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<form role='form'>
											<input type="hidden" name="ppr_id" value="${ppr.ppr_id }">											
											<table id="basic-datatables"
												class="display table table-striped table-hover">
												<colgroup>
													<col width="10%">
												</colgroup>

												<thead>
													<tr>
														<th>조달계획등록ID</th>
                              							<th>거래계약ID</th>                              
                              							<th>납기일</th>
                              							<th>수량</th>
                              							<th>발주서발행여부</th>                              							                            							
													</tr>
												</thead>

												<tbody>

													<tr>
														<td>${ppr.ppr_id}</td>
                              							<td>${ppr.co_id }</td>                              
                              							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ppr.ppr_dueDate }" /></td>
                              							<td>${ppr.ppr_quantity }</td>
                              							<td>${ppr.ppr_status }</td>                              							                             							     
													</tr>

												</tbody>
											</table>
											<div class="card-action">
												<button type="submit" class="btn btn-success" id="modifyBtn">수정하기</button>
												<a href="/procurementPlanRegistration/list" class="btn btn-danger">목록으로</a>
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

	 <%@include file="/WEB-INF/views/include/script.jsp"%>
	<script type="text/javascript" src="/resources/assets/js/upload.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			let formObj = $("form[role='form']");

			$("#modifyBtn").on("click", function() {
				formObj.attr("action", "/procurementPlanRegistration/update");
				formObj.attr("method", "get");
				formObj.submit();
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
