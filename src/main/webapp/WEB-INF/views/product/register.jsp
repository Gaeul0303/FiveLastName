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
						<h3 class="fw-bold mb-3">Forms</h3>
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
									<div class="card-title">Form Elements</div>
								</div>
								<div class="card-body">
									<form id="registerForm" enctype="multipart/form-data"
										method="POST">

										<div class="row">
											<div class="col-md-6">

												<div class="form-group">
													<label for="nameinput">품목명</label> <input type="text"
														class="form-control" id="nameinput" name="pr_name"
														placeholder="품목명" required="required" />
												</div>
												<div class="form-group">
													<label for="sizeinput">규격</label> <input type="text"
														class="form-control" id="sizeinput" name="pr_size"
														placeholder="규격" required="required" />
												</div>
												<div class="form-group">
													<label for="typeinput">재질</label> <input type="text"
														class="form-control" id="typeinput" name="pr_type"
														placeholder="재질" required="required" />
												</div>

												<div class="form-group">
													<label for="typeinput">제작사양</label>
													<textarea class="form-control" id="typeinput" rows="5"
														placeholder="제작사양" name="pr_quality" required="required"></textarea>
												</div>

												<div class="form-group">
													<label for="imginput">제품이미지</label>
													<input type="file" class="form-control-file"
														name="file" id="imginput" required="required" />
												</div>

												<div class="form-group">
													<label for="cateinput">카테고리</label>
													<select class="form-select" id="cateinput"
														name="pr_category">
														<option value="컴퓨터">컴퓨터</option>
														<option value="CPU">CPU</option>
														<option value="메인보드">메인보드</option>
														<option value="메모리">메모리</option>
														<option value="그래픽카드">그래픽카드</option>
														<option value="케이스">케이스</option>
														<option value="파워">파워</option>
														<option value="SSD">SSD</option>
														<option value="HDD">HDD</option>
														<option value="CPU쿨러">CPU쿨러</option>
														<option value="주변기기">주변기기</option>

													</select>
												</div>
												<div class="form-group">
													<label for="statusinput">재고상태</label>
													<select class="form-select" id="statusinput" name="pr_status">
														<option value="재고">재고</option>
														<option value="새품목">새품목</option>

													</select>
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
    	$(document).ready(function(){
    		$("#cancel").on("click",function(){
    			location.href="/product/list"
    		})
    	})
    </script>
    
    
     
</body>
</html>
