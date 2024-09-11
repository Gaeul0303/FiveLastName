<!-- 헤더  -->

<div class="main-header">
	<div class="main-header-logo">
		<!-- Logo Header -->
		<div class="logo-header" data-background-color="dark">
			<a href="index.html" class="logo"> <img
				src="${path }/resources/assets/img/kaiadmin/logo_light.svg"
				alt="navbar brand" class="navbar-brand" height="20" />
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
	<!-- Navbar Header -->
	<nav
		class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
		<div class="container-fluid">
			<!-- 			<nav -->
			<!-- 				class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"> -->
			<!-- 				          <div class="input-group"> -->
			<!-- 				            <div class="input-group-prepend"> -->
			<!-- 				              <button type="submit" class="btn btn-search pe-1"> -->
			<!-- 				                <i class="fa fa-search search-icon"></i> -->
			<!-- 				              </button> -->
			<!-- 				            </div> -->
			<!-- 				            <input -->
			<!-- 				              type="text" -->
			<!-- 				              placeholder="Search ..." -->
			<!-- 				              class="form-control" -->
			<!-- 				            /> -->
			<!-- 				          </div> -->
			<!-- 			</nav> -->

			<ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
				<!-- 				<li -->
				<!-- 					class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"> -->
				<!-- 					<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" -->
				<!-- 					href="#" role="button" aria-expanded="false" aria-haspopup="true"> -->
				<!-- 						<i class="fa fa-search"></i> -->
				<!-- 				</a> -->
				<!-- 					<ul class="dropdown-menu dropdown-search animated fadeIn"> -->
				<!-- 						<form class="navbar-left navbar-form nav-search"> -->
				<!-- 							<div class="input-group"> -->
				<!-- 								<input type="text" placeholder="Search ..." class="form-control" /> -->
				<!-- 							</div> -->
				<!-- 						</form> -->
				<!-- 					</ul> -->
				<!-- 				</li> -->
				<li class="nav-item topbar-icon dropdown hidden-caret">
				<a
					class="nav-link dropdown-toggle" href="#" id="messageDropdown"
					role="button" data-bs-toggle="dropdown" aria-haspopup="true"a
					aria-expanded="false"> <i class="fa fa-envelope"></i>
				</a>
					<ul class="dropdown-menu messages-notif-box animated fadeIn"
						aria-labelledby="messageDropdown">
						<li>
							<div
								class="dropdown-title d-flex justify-content-between align-items-center">
								Messages <a href="#" class="small">Mark all as read</a>
							</div>
						</li>
						<li>
							<div class="message-notif-scroll scrollbar-outer">
								<div class="notif-center">
									<a href="#">
										<div class="notif-img">
											<img src="${path }/resources/assets/img/jm_denis.jpg"
												alt="Img Profile" />
										</div>
										<div class="notif-content">
											<span class="subject">Jimmy Denis</span> <span class="block">
												How are you ? </span> <span class="time">5 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-img">
											<img src="${path }/resources/assets/img/chadengle.jpg"
												alt="Img Profile" />
										</div>
										<div class="notif-content">
											<span class="subject">Chad</span> <span class="block">
												Ok, Thanks ! </span> <span class="time">12 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-img">
											<img src="${path }/resources/assets/img/mlane.jpg"
												alt="Img Profile" />
										</div>
										<div class="notif-content">
											<span class="subject">Jhon Doe</span> <span class="block">
												Ready for the meeting today... </span> <span class="time">12
												minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-img">
											<img src="${path }/resources/assets/img/talha.jpg"
												alt="Img Profile" />
										</div>
										<div class="notif-content">
											<span class="subject">Talha</span> <span class="block">
												Hi, Apa Kabar ? </span> <span class="time">17 minutes ago</span>
										</div>
									</a>
								</div>
							</div>
						</li>
						<li><a class="see-all" href="javascript:void(0);">See all
								messages<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>


				<li class="nav-item topbar-user dropdown hidden-caret">
						<c:if test="${st_id != null }">
							<div
					class="dropdown-toggle profile-pic" data-bs-toggle="dropdown"
					href="#" aria-expanded="false" style="cursor: pointer;">
							<div class="avatar-sm">
								<img src="${path }/resources/assets/img/profile.png" alt="..."
									class="avatar-img rounded-circle" />
							</div>
							<span class="profile-username"> <span class="op-7">Hi,</span>
								<span class="fw-bold">${st_id }</span>
							</span>
						</div>
						</c:if>
						<c:if test="${st_id == null }">
							<span class="profile-username"> <span class="op-7">Please,</span>
								<span class="fw-bold"><a href="/login">login</a></span>
							</span>

						
						</c:if>

				
					<ul class="dropdown-menu dropdown-user animated fadeIn">
						<li>
							<div class="dropdown-user-scroll scrollbar-outer">

								<a class="dropdown-item" href="/logout">Logout</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- End Navbar -->
</div>