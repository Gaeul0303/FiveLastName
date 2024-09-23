<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Sidebar -->
<div class="sidebar" data-background-color="custom">
	<div class="sidebar-logo">
		<!-- Logo Header -->
		<div class="logo-header" data-background-color="custom">
			<a href="/" class="logo"> <img
				src="${path }/resources/assets/img/kaiadmin/logo.png"
				alt="navbar brand" class="navbar-brand" height="20" /> <span
				class="logoText"> MMS </span>
			</a>
			<div class="nav-toggle">
				<button class="btn btn-toggle toggle-sidebar">
					<i class="gg-menu-right"></i>
				</button>
				<button class="btn btn-toggle sidenav-toggler">
					<i class="gg-menu-left"></i>
				</button>
			</div>
			<button class="topbar-toggler more">
				<i class="gg-more-vertical-alt"></i>
			</button>
		</div>
		<!-- End Logo Header -->
	</div>
	<div class="sidebar-wrapper scrollbar scrollbar-inner">
		<div class="sidebar-content">
		<ul class="nav nav-secondary">
				<li class="nav-item active"><a data-bs-toggle="collapse"
					href="#dashboard" class="collapsed" aria-expanded="false"> <i
						class="fas fa-home"></i>
						<p>MAIN</p>

				</a></li>
				<li class="nav-section"><span class="sidebar-mini-icon">
						<i class="fas fa-ellipsis-h"></i>
				</span>
					<h4 class="text-section">메뉴</h4></li>
		
				<c:choose>
				<c:when test="${st_department eq '발주계획'}">
					<li class="nav-item"><a data-bs-toggle="collapse" href="#forms">
							<i class="fas fa-pen-square"></i>
							<p>품목</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="forms">
							<ul class="nav nav-collapse">
								<li><a href="/product/list"> <span class="sub-item">품목조회</span>
								</a></li>
								<li><a href="/product/register"> <span class="sub-item">품목등록</span>
								</a></li>
							</ul>
						</div></li>			
					<li class="nav-item"><a data-bs-toggle="collapse" href="#plan">
							<i class="fas fa-list-alt"></i>
							<p>조달계획</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="plan">
							<ul class="nav nav-collapse">
								<li><a href="/procurmentPlan/list"> <span
										class="sub-item">계획조회</span>
								</a></li>
								<li><a href="/procurmentPlan/insertForm"> <span
										class="sub-item">계획등록</span>
								</a></li>
	
							</ul>
						</div></li>				
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#Regist"> <i class="fas fa-registered"></i>
							<p>조달계획등록</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="Regist">
							<ul class="nav nav-collapse">
								<li><a href="/procurementPlanRegistration/list"> <span
										class="sub-item">계획조회</span>
								</a></li>
								<li><a href="/procurementPlanRegistration/insertForm"> <span
										class="sub-item">계획등록</span>
								</a></li>
	
							</ul>
						</div></li>
	
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#tables"> <i class="fas fa-calculator"></i>
							<p>견적</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="tables">
							<ul class="nav nav-collapse">
	
								<li><a href="/estimate/list"> <span class="sub-item">견적조회</span>
								</a></li>
								<li><a href="/estimate/register"> <span class="sub-item">견적등록</span>
								</a></li>
							</ul>
						</div></li>
	
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#charts"> <i class="fas fa-file-contract"></i>
							<p>계약</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="charts">
							<ul class="nav nav-collapse">
								<li><a href="/contract/list"> <span class="sub-item">계약조회</span>
								</a></li>
								<li><a href="/contract/register"> <span class="sub-item">계약등록</span>
								</a></li>
	
							</ul>
						</div></li>
				</c:when>
				<c:when test="${st_department eq '구매발주' }">
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#calendar"> <i class="fas fa-money-bill-wave-alt"></i>
							<p>구매발주서</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="Calendar">
							<ul class="nav nav-collapse">
								<li><a href="/purchaseOrder/list"> <span
										class="sub-item">발주서 조회</span>
								</a></li>
								<li><a href="/purchaseOrder/insert"> <span
										class="sub-item">발주서 등록</span>
								</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#progress"> <i class="fas fa-calendar-alt"></i>
							<p>진척검수계획</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="progress">
							<ul class="nav nav-collapse">
								<li><a href="/progressInspection/list"> <span
										class="sub-item">검수조회</span>
								</a></li>
								<li><a href="/progressInspection/insert"> <span
										class="sub-item">검수등록</span>
								</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#shipping"> <i class="fas fa-shipping-fast"></i>
							<p>출하현황</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="shipping">
							<ul class="nav nav-collapse">
								<li><a href="/shippingStatus/list"> <span
										class="sub-item">현황조회</span>
								</a></li>
	
							</ul>
						</div></li>
				</c:when>
				
				<c:when test="${st_department eq '자재입고' }">
					<li class="nav-item"><a data-bs-toggle="collapse" href="#receivingInspection">
							<i class="fas fa-calendar-alt"></i>
							<p>입고</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="receivingInspection">
							<ul class="nav nav-collapse">
								<li><a href="/receivingInspection/list"> <span
										class="sub-item">입고대기</span>
								</a></li>
								<li><a href="/incomingDeadline/list"> <span
										class="sub-item">입고마감</span>
								</a></li>
							</ul>
						</div></li>
				</c:when>
				
				<c:when test="${st_department eq '자재출고'}">
					<li class="nav-item"><a data-bs-toggle="collapse" href="#idm">
							<i class="fas fa-truck-loading"></i>
							<p>출하</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="idm">
							<ul class="nav nav-collapse">
								<li><a href="/inventoryList"> <span class="sub-item">자재리스트</span>
								</a></li>
								<li><a href="/idmReportList"> <span class="sub-item">출고관리리스트</span>
								</a></li>
	
	
							</ul>
	
						</div></li>
				</c:when>
				
				<c:when test="${st_department eq '자재입고' }">
					<li class="nav-item"><a data-bs-toggle="collapse" href="#takeBack">
							<i class="fas fa-calendar-alt"></i>
							<p>반품</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="takeBack">
							<ul class="nav nav-collapse">
								<li><a href="/takeBack/list"> <span
										class="sub-item">반품 현황</span>
								</a></li>
							</ul>
						</div></li>
				</c:when>
								
				<c:otherwise>

					<li class="nav-item"><a data-bs-toggle="collapse" href="#forms">
							<i class="fas fa-pen-square"></i>
							<p>품목</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="forms">
							<ul class="nav nav-collapse">
								<li><a href="/product/list"> <span class="sub-item">품목조회</span>
								</a></li>
								<li><a href="/product/register"> <span class="sub-item">품목등록</span>
								</a></li>
							</ul>
						</div></li>			
					<li class="nav-item"><a data-bs-toggle="collapse" href="#plan">
							<i class="fas fa-list-alt"></i>
							<p>조달계획</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="plan">
							<ul class="nav nav-collapse">
								<li><a href="/procurmentPlan/list"> <span
										class="sub-item">계획조회</span>
								</a></li>
								<li><a href="/procurmentPlan/insertForm"> <span
										class="sub-item">계획등록</span>
								</a></li>
	
							</ul>
						</div></li>				
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#Regist"> <i class="fas fa-registered"></i>
							<p>조달계획등록</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="Regist">
							<ul class="nav nav-collapse">
								<li><a href="/procurementPlanRegistration/list"> <span
										class="sub-item">계획조회</span>
								</a></li>
								<li><a href="/procurementPlanRegistration/insertForm"> <span
										class="sub-item">계획등록</span>
								</a></li>
	
							</ul>
						</div></li>
	
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#tables"> <i class="fas fa-calculator"></i>
							<p>견적</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="tables">
							<ul class="nav nav-collapse">
	
								<li><a href="/estimate/list"> <span class="sub-item">견적조회</span>
								</a></li>
								<li><a href="/estimate/register"> <span class="sub-item">견적등록</span>
								</a></li>
							</ul>
						</div></li>
	
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#charts"> <i class="fas fa-file-contract"></i>
							<p>계약</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="charts">
							<ul class="nav nav-collapse">
								<li><a href="/contract/list"> <span class="sub-item">계약조회</span>
								</a></li>
								<li><a href="/contract/register"> <span class="sub-item">계약등록</span>
								</a></li>
	
							</ul>
						</div></li>

					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#calendar"> <i class="fas fa-money-bill-wave-alt"></i>
							<p>구매발주서</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="Calendar">
							<ul class="nav nav-collapse">
								<li><a href="/purchaseOrder/list"> <span
										class="sub-item">발주서 조회</span>
								</a></li>
								<li><a href="/purchaseOrder/insert"> <span
										class="sub-item">발주서 등록</span>
								</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#progress"> <i class="fas fa-calendar-alt"></i>
							<p>진척검수계획</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="progress">
							<ul class="nav nav-collapse">
								<li><a href="/progressInspection/list"> <span
										class="sub-item">검수조회</span>
								</a></li>
							
							</ul>
						</div></li>
					<li class="nav-item"><a data-bs-toggle="collapse"
						href="#shipping"> <i class="fas fa-shipping-fast"></i>
							<p>출하현황</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="shipping">
							<ul class="nav nav-collapse">
								<li><a href="/shippingStatus/list"> <span
										class="sub-item">현황조회</span>
								</a></li>
	
							</ul>
						</div></li>
						
					<li class="nav-item"><a data-bs-toggle="collapse" href="#receivingInspection">
							<i class="fas fa-calendar-alt"></i>
							<p>입고</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="receivingInspection">
							<ul class="nav nav-collapse">
								<li><a href="/receivingInspection/list"> <span
										class="sub-item">입고대기</span>
								</a></li>
								<li><a href="/incomingDeadline/list"> <span
										class="sub-item">입고마감</span>
								</a></li>
							</ul>
						</div></li>	

					<li class="nav-item"><a data-bs-toggle="collapse" href="#idm">
							<i class="fas fa-truck-loading"></i>
							<p>출하</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="idm">
							<ul class="nav nav-collapse">
								<li><a href="/inventoryList"> <span class="sub-item">자재리스트</span>
								</a></li>
								<li><a href="/idmReportList"> <span class="sub-item">출고관리리스트</span>
								</a></li>
								<li><a href="/idmReport"> <span class="sub-item">현황관리리스트</span>
								</a></li>
							</ul>
						</div></li>
						
						<li class="nav-item"><a data-bs-toggle="collapse" href="#takeBack">
								<i class="fas fa-calendar-alt"></i>
								<p>반품</p> <span class="caret"></span>
						</a>
							<div class="collapse" id="takeBack">
								<ul class="nav nav-collapse">
									<li><a href="/takeBack/list"> <span
											class="sub-item">반품 현황</span>
									</a></li>
								</ul>
							</div></li>
				
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
<!-- End Sidebar -->