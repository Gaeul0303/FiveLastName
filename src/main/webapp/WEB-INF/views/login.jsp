<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/include/head.jsp"%>

<link rel="stylesheet"
	href="${path }/resources/assets/js/plugin/adminlte.min.css">
<style type="text/css">
.card {
	width: 100%;
	max-width: 500px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%)
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form action="/login" method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="id" name="st_id"
							required="required">

					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Password" name="st_pw">

					</div>
					<div class="row">

						<!-- /.col -->
						<div class="col-12">
							<button type="submit" class="btn btn-primary btn-block"
								style="width: 100%">Sign In</button>
						</div>
						<!-- /.col -->
					</div>
				</form>


			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	</div>

	<%@include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>
