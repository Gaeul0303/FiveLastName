<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h3 class="fw-bold mb-3">견적등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">견적</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">견적등록</a></li>
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
									<input type="hidden" name="es_id" value="${estimateDTO.es_id }">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="nameinput">조달계획</label>
													<div class="table-responsive scrollTable">
														<table id="basic-datatables"
															class="display table table-striped table-hover">
															<thead>
																<tr>
																	<th>선택</th>
																	<th>품목ID</th>
																	<th>자재소요공정</th>
																	<th>소요일</th>
																	<th>소요량</th>
																	<th>등록일</th>
																	<th>조달납기</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${pp}" var="plan">
																	<tr>
																		<td><input type="radio" id="sel${plan.pp_id}"
																			name="pp_id" value="${plan.pp_id}" required="required"></td>
																		<td class="pr">${plan.pr_id}</td>
																		<td><label for="sel${plan.pp_id}">${plan.pp_materialRequiredProcessStage}
																		</label></td>
																		<td>${plan.pp_makeTime}</td>
																		<td>${plan.pp_spendAmount}</td>
																		<td>${plan.pp_regDate}</td>
																		<td>${plan.pp_deliveryDate}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
												<div class="col-md-6">
													
													<div class="form-group">
														<label for="priceinput">공급가</label><input type="number"
															class="form-control" id="priceinput"
															name="es_supplyPrice" placeholder="공급가"
															required="required" value="${estimateDTO.es_supplyPrice }" />
													</div>
													<div class="form-group">
														<label for="requireinput">소요일</label><input
															class="form-control" id="requireinput" placeholder="소요일"
															name="es_requiredDays" required="required" value="${estimateDTO.es_requiredDays} " />
													</div>
												</div>
											</div>
										</div>
										<div class="card-action">
											<button class="btn btn-success" id="registerBtn">수정하기</button>
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
</body>

<script>
    $(document).ready(function () {
    	
    	$("#cancel").on("click",function(e){
    		e.preventDefault();
			location.href="/contract/list";
		})
		
    	let chVal = ${estimateDTO.pp_id};
    	$("input[value='"+ chVal +"']").prop("checked",true);
        const form = $("#registerForm");

        $("#registerBtn").on("click", function (e) {
        	e.preventDefault();
        	let pr_id = $("input[name='pp_id']:checked")
                .parent()
                .siblings('td.pr')
                .text();

        	$.ajax({
                url: 'data/'+pr_id,
                type : 'GET',
                contentType : 'application/x-www-form-urlencoded; charset=utf-8',
                dataType: 'json',
          
                success : function(data){
					console.log(data.pa_id);
					form.append("<input type='hidden' name='pa_id' value='"+ data.pr_partner +"'>");
					form.submit();
                },
             


            })
            
        
          
        })

    })
</script>

</html>