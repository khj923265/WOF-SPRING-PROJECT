<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

 <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>WOF's 메인 페이지</title>
	
	<!--main bootstrap  -->
	<link rel="icon" href="/resources/template/assets/img/brand/favicon.png" type="image/png">
	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="/resources/template/assets/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="/resources/template/assets/css/animate.css">
	<link rel="stylesheet" href="/resources/template/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/template/assets/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/resources/template/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="/resources/template/assets/css/aos.css">
	<link rel="stylesheet" href="/resources/template/assets/css/ionicons.min.css">
	<link rel="stylesheet" href="/resources/template/assets/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/resources/template/assets/css/jquery.timepicker.css">
	<link rel="stylesheet" href="/resources/template/assets/css/flaticon.css">
	<link rel="stylesheet" href="/resources/template/assets/css/icomoon.css">
	<link rel="stylesheet" href="/resources/template/assets/css/style.css">
</head>
 
 
<body>
		<!-- Top navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/main">WOF</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" 
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span>Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${pageContext.request.contextPath }/project/create"	
						class="nav-link">프로젝트 등록</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/project/list" 
						class="nav-link">프로젝트 찾기</a></li>
					<li class="nav-item"><a	href="/kosta202-project/project/project_map_manage.jsp"
						class="nav-link">프로젝트 맵</a></li>
					<li class="nav-item"><a href="Client/partnersListAction.do"
						class="nav-link">파트너스 찾기</a></li>
					<li class="nav-item"><a href="Client/partnersListAction.do"
						class="nav-link">프로젝트 맵</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">공지사항</a></li>
					
					<li class="nav-item">
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.member" var="member"/>
							<a class="dropdown-item"
							   href="/customlogout"><i class="ni ni-user-run"></i> <span>로그아웃</span> </a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a class="dropdown-item"
							   href="/member/customlogin"><i class="ni ni-user-run"></i> <span>로그인</span> </a>
						</sec:authorize>
					</li>
					
					
					<li class="nav-item d-xl-none">
						<!-- Sidenav toggler -->
						<div class="pr-3 sidenav-toggler sidenav-toggler-dark"
							data-action="sidenav-pin" data-target="#sidenav-main">
							<div class="sidenav-toggler-inner">
								<i class="sidenav-toggler-line"></i> <i
									class="sidenav-toggler-line"></i> <i
									class="sidenav-toggler-line"></i>
							</div>
						</div>
					</li>
					<li class="nav-item d-sm-none"><a class="nav-link" href="#"
						data-action="search-show" data-target="#navbar-search-main"> <i
							class="ni ni-zoom-split-in"></i></a></li>
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="ni ni-bell-55" style="color: black;"></i></a>
						<div
							class="dropdown-menu dropdown-menu-xl  dropdown-menu-right  py-0 overflow-hidden">
							<!-- Dropdown header -->
							<div class="px-3 py-3">
								<h6 class="text-sm text-muted m-0">
									You have <strong class="text-primary">13</strong>
									notifications.
								</h6>
							</div>
							<!-- List group -->
							<div class="list-group list-group-flush">
								<a href="#!" class="list-group-item list-group-item-action">
									<div class="row align-items-center">
										<div class="col-auto">
											<!-- Avatar -->
											<img alt="Image placeholder"
												src="/resources/template/assets/img/theme/team-1.jpg" style="height: 40px; width: 40px;"
												class="avatar rounded-circle">
										</div>
										<div class="col ml--2">
											<div
												class="d-flex justify-content-between align-items-center">
												<div>
													<h4 class="mb-0 text-sm">John Snow</h4>
												</div>
												<div class="text-right text-muted">
													<small>2 hrs ago</small>
												</div>
											</div>
											<p class="text-sm mb-0">Let's meet at Starbucks at 11:30.
												Wdyt?</p>
										</div>
									</div>
								</a> <a href="#!" class="list-group-item list-group-item-action">
									<div class="row align-items-center">
										<div class="col-auto">
											<!-- Avatar -->
											<img alt="Image placeholder"
												src="/resources/template/assets/img/theme/team-2.jpg" style="height: 40px; width: 40px;"
												class="avatar rounded-circle">
										</div>
										<div class="col ml--2">
											<div
												class="d-flex justify-content-between align-items-center">
												<div>
													<h4 class="mb-0 text-sm">John Snow</h4>
												</div>
												<div class="text-right text-muted">
													<small>3 hrs ago</small>
												</div>
											</div>
											<p class="text-sm mb-0">A new issue has been reported for
												Argon.</p>
										</div>
									</div>
								</a> <a href="#!" class="list-group-item list-group-item-action">
									<div class="row align-items-center">
										<div class="col-auto">
											<!-- Avatar -->
											<img alt="Image placeholder"
												src="/resources/template/assets/img/theme/team-3.jpg" style="height: 40px; width: 40px;"
												class="avatar rounded-circle">
										</div>
										<div class="col ml--2">
											<div
												class="d-flex justify-content-between align-items-center">
												<div>
													<h4 class="mb-0 text-sm">John Snow</h4>
												</div>
												<div class="text-right text-muted">
													<small>5 hrs ago</small>
												</div>
											</div>
											<p class="text-sm mb-0">Your posts have been liked a lot.</p>
										</div>
									</div>
								</a> <a href="#!" class="list-group-item list-group-item-action">
									<div class="row align-items-center">
										<div class="col-auto">
											<!-- Avatar -->
											<img alt="Image placeholder"
												src="/resources/template/assets/img/theme/team-4.jpg" style="height: 40px; width: 40px;"
												class="avatar rounded-circle">
										</div>
										<div class="col ml--2">
											<div
												class="d-flex justify-content-between align-items-center">
												<div>
													<h4 class="mb-0 text-sm">John Snow</h4>
												</div>
												<div class="text-right text-muted">
													<small>2 hrs ago</small>
												</div>
											</div>
											<p class="text-sm mb-0">Let's meet at Starbucks at 11:30.
												Wdyt?</p>
										</div>
									</div>
								</a> <a href="#!" class="list-group-item list-group-item-action">
									<div class="row align-items-center">
										<div class="col-auto">
											<!-- Avatar -->
											<img alt="Image placeholder"
												src="/resources/template/assets/img/theme/team-5.jpg" style="height: 40px; width: 40px;"
												class="avatar rounded-circle">
										</div>
										<div class="col ml--2">
											<div
												class="d-flex justify-content-between align-items-center">
												<div>
													<h4 class="mb-0 text-sm">John Snow</h4>
												</div>
												<div class="text-right text-muted">
													<small>3 hrs ago</small>
												</div>
											</div>
											<p class="text-sm mb-0">A new issue has been reported for
												Argon.</p>
										</div>
									</div>
								</a>
							</div>
							<!-- View all -->
							<a href="#!"
								class="dropdown-item text-center text-primary font-weight-bold py-3">View
								all</a>
						</div></li>
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="ni ni-ungroup" style="color: black;"></i>
					</a>
						<div
							class="dropdown-menu dropdown-menu-lg dropdown-menu-dark bg-default  dropdown-menu-right">
							<div class="row shortcuts px-4">
								<a href="#!" class="col-4 shortcut-item"> <span
									class="shortcut-media avatar rounded-circle bg-gradient-red">
										<i class="ni ni-calendar-grid-58"></i>
								</span><small>Calendar</small>
								</a> <a href="#!" class="col-4 shortcut-item"> <span
									class="shortcut-media avatar rounded-circle bg-gradient-orange">
										<i class="ni ni-email-83"></i>
								</span><small>Email</small>
								</a> <a href="#!" class="col-4 shortcut-item"> <span
									class="shortcut-media avatar rounded-circle bg-gradient-info">
										<i class="ni ni-credit-card"></i>
								</span><small>Payments</small>
								</a> <a href="#!" class="col-4 shortcut-item"> <span
									class="shortcut-media avatar rounded-circle bg-gradient-green">
										<i class="ni ni-books"></i>
								</span><small>Reports</small>
								</a> <a href="#!" class="col-4 shortcut-item"> <span
									class="shortcut-media avatar rounded-circle bg-gradient-purple">
										<i class="ni ni-pin-3"></i>
								</span><small>Maps</small>
								</a> <a href="#!" class="col-4 shortcut-item"> <span
									class="shortcut-media avatar rounded-circle bg-gradient-yellow">
										<i class="ni ni-basket"></i>
								</span><small>Shop</small>
								</a>
							</div>
						</div></li>
				</ul>
				<ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
					<li class="nav-item dropdown"><a class="nav-link pr-0"
						href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
							<div class="media align-items-center">
								<span class="avatar avatar-sm rounded-circle"> <img
									alt="Image placeholder"
									src="/resources/template/assets/img/theme/team-4.jpg" style="height: 40px; width: 40px;">
								</span>
								<div class="media-body  ml-2  d-none d-lg-block">
									<span class="mb-0 text-sm  font-weight-bold">${member.real_name }</span>
								</div>
							</div>
					</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="dropdown-header noti-title">
								<h6 class="text-overflow m-0">Welcome!</h6>
							</div>
							<c:if test="${member.auth == 'ROLE_CLIENT' }">
								<a
									href="${pageContext.request.contextPath }/client/dashboard_client.jsp"
									class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My
										dashboard</span>
								</a>
							</c:if>
							<c:if test="${member.auth == 'ROLE_PARTNERS' }">
								<a
									href="${pageContext.request.contextPath }/partners/dashboard_partners.jsp"
									class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My
										dashboard</span>
								</a>
							</c:if>
							<a href="#!" class="dropdown-item"> <i
								class="ni ni-settings-gear-65"></i> <span>Settings</span>
							</a> <a href="#!" class="dropdown-item"> <i
								class="ni ni-calendar-grid-58"></i> <span>Activity</span>
							</a> <a href="#!" class="dropdown-item"> <i
								class="ni ni-support-16"></i> <span>Support</span>
							</a>
							<div class="dropdown-divider"></div>
							<sec:authorize access="isAuthenticated()">
								<a class="dropdown-item"
								   href="/customlogout"><i class="ni ni-user-run"></i> <span>로그아웃</span> </a>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<a class="dropdown-item"
								   href="/member/customlogin"><i class="ni ni-user-run"></i> <span>로그인</span> </a>
							</sec:authorize>
						</div>
						<!-- .dropdown-menu dropdown-menu-right --></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap js-fullheight">
		<div class="overlay"></div>
		<div class="container-fluid px-0">
			<div
				class="row d-md-flex no-gutters slider-text align-items-end js-fullheight justify-content-end">
				<img class="one-third align-self-end order-md-last img-fluid"
					src="/resources/template/assets/img/undraw_work_time_lhoj.svg"
					alt="">
				<div
					class="one-forth d-flex align-items-center ftco-animate js-fullheight">
					<div class="text mt-5">
						<p class="mb-4 mt-5 pt-5">
							We have <span class="number" data-number="200000">0</span> great
							job offers you deserve!
						</p>
						<h2>아직도 직장가서 일하세요?</h2>
						<h1>전 집에서 WOF해요!</h1>

						<div class="ftco-search">
							<div class="row">
								<div class="col-md-12 nav-link-wrap">
									<div class="nav nav-pills text-center" id="v-pills-tab"
										role="tablist" aria-orientation="vertical">
										<a class="nav-link active mr-md-1" id="v-pills-1-tab"
											data-toggle="pill" href="#v-pills-1" role="tab"
											aria-controls="v-pills-1" aria-selected="true">Find a Job</a>

										<a class="nav-link" id="v-pills-2-tab" data-toggle="pill"
											href="#v-pills-2" role="tab" aria-controls="v-pills-2"
											aria-selected="false">Find a Candidate</a>

									</div>
								</div>
								<div class="col-md-12 tab-wrap">

									<div class="tab-content p-4" id="v-pills-tabContent">

										<div class="tab-pane fade show active" id="v-pills-1"
											role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
											<form action="#" class="search-job">
												<div class="row no-gutters">
													<div class="col-md mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-briefcase"></span>
																</div>
																<input type="text" class="form-control"
																	placeholder="eg. Garphic. Web Developer">
															</div>
														</div>
													</div>
													<div class="col-md mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="select-wrap">
																	<div class="icon">
																		<span class="ion-ios-arrow-down"></span>
																	</div>
																	<select name="" id="" class="form-control">
																		<option value="">Category</option>
																		<option value="">Full Time</option>
																		<option value="">Part Time</option>
																		<option value="">Freelance</option>
																		<option value="">Internship</option>
																		<option value="">Temporary</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" class="form-control"
																	placeholder="Location">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-secondary">Search</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>

										<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
											aria-labelledby="v-pills-performance-tab">
											<form action="#" class="search-job">
												<div class="row">
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-user"></span>
																</div>
																<input type="text" class="form-control"
																	placeholder="eg. Adam Scott">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<div class="select-wrap">
																	<div class="icon">
																		<span class="ion-ios-arrow-down"></span>
																	</div>
																	<select name="" id="" class="form-control">
																		<option value="">Category</option>
																		<option value="">Full Time</option>
																		<option value="">Part Time</option>
																		<option value="">Freelance</option>
																		<option value="">Internship</option>
																		<option value="">Temporary</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" class="form-control"
																	placeholder="Location">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-secondary">Search</button>
															</div>
														</div>
													</div>
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
		</div>
	</div>

	<section class="ftco-section services-section bg-primary">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-resume"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Search Millions of Jobs</h3>
							<p>A small river named Duden flows by their place and
								supplies.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-collaboration"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Easy To Manage Jobs</h3>
							<p>A small river named Duden flows by their place and
								supplies.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-promotions"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Top Careers</h3>
							<p>A small river named Duden flows by their place and
								supplies.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-employee"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Search Expert Candidates</h3>
							<p>A small river named Duden flows by their place and
								supplies.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">Job Categories</span>
					<h2 class="mb-4">Top Categories</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 ftco-animate">
					<ul class="category">
						<li><a href="#">Web Development <br> <span
								class="number">354</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Graphic Designer <br> <span
								class="number">143</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Multimedia <br> <span class="number">100</span>
								<span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Advertising <br> <span
								class="number">90</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
				<div class="col-md-3 ftco-animate">
					<ul class="category">
						<li><a href="#">Education &amp; Training <br> <span
								class="number">100</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">English <br> <span class="number">200</span>
								<span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Social Media <br> <span
								class="number">300</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Writing <br> <span class="number">150</span>
								<span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
				<div class="col-md-3 ftco-animate">
					<ul class="category">
						<li><a href="#">PHP Programming <br> <span
								class="number">400</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Project Management <br> <span
								class="number">100</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Finance Management <br> <span
								class="number">222</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Office &amp; Admin <br> <span
								class="number">123</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
				<div class="col-md-3 ftco-animate">
					<ul class="category">
						<li><a href="#">Web Designer <br> <span
								class="number">324</span> <span>Open position</span></span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Customer Service <br> <span
								class="number">564</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Marketing &amp; Sales <br> <span
								class="number">234</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Software Development <br> <span
								class="number">425</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section img"
		style="background-image: url(/resources/template/assets/img/theme/bg_1.jpg); background-position: top center;">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="browse-job p-5">
						<span class="icon-search2 icon"></span> <span class="subheading">Search
							Job</span>
						<h2>Browse Job by Specialism</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in Bookmarksgrove right at the coast of the
							Semantics, a large language ocean.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 pr-lg-5">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ftco-animate">
							<span class="subheading">Recently Added Jobs</span>
							<h2 class="mb-4">Hot Jobs</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Frontend Development</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-primary text-white badge py-2 px-3">Partime</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">Facebook,
												Inc.</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Full Stack Developer</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-warning text-white badge py-2 px-3">Fulltime</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">Google,
												Inc.</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Open Source Interactive Developer</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-info text-white badge py-2 px-3">Freelance</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">New York
												Times</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Frontend Development</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-secondary text-white badge py-2 px-3">Internship</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">Facebook,
												Inc.</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Open Source Interactive Developer</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-danger text-white badge py-2 px-3">Temporary</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">New York
												Times</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Full Stack Developer</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-warning text-white badge py-2 px-3">Fulltime</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">Google,
												Inc.</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Open Source Interactive Developer</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-info text-white badge py-2 px-3">Freelance</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">New York
												Times</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Frontend Development</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-secondary text-white badge py-2 px-3">Internship</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">Facebook,
												Inc.</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->

						<div class="col-md-12 ftco-animate">
							<div
								class="job-post-item py-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header d-flex align-items-center">
										<h2 class="mr-3 text-black">
											<a href="#">Open Source Interactive Developer</a>
										</h2>
										<div class="badge-wrap">
											<span class="bg-danger text-white badge py-2 px-3">Temporary</span>
										</div>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a href="#">New York
												Times</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>Western
												City, UK</span>
										</div>
									</div>
								</div>

								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									<div>
										<a href="#"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a href="job-single.html" class="btn btn-primary py-2">Apply
										Job</a>
								</div>
							</div>
						</div>
						<!-- end -->
					</div>
				</div>
				<div class="col-lg-3 sidebar">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ftco-animate">
							<span class="subheading">Recruitment agencies</span>
							<h2 class="mb-4">Top Recruitments</h2>
						</div>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="border">
							<a href="#" class="company-wrap"><img
								src="/resources/template/assets/img/company-1.jpg"
								class="img-fluid" alt="Colorlib Free Template"></a>
							<div class="text p-3">
								<h3>
									<a href="#">Google Company</a>
								</h3>
								<p>
									<span class="number">500</span> <span>Open position</span>
								</p>
							</div>
						</div>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="border">
							<a href="#" class="company-wrap"><img
								src="/resources/template/assets/img/company-2.jpg"
								class="img-fluid" alt="Colorlib Free Template"></a>
							<div class="text p-3">
								<h3>
									<a href="#">Facebook Company</a>
								</h3>
								<p>
									<span class="number">700</span> <span>Open position</span>
								</p>
							</div>
						</div>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="border">
							<a href="#" class="company-wrap"><img
								src="/resources/template/assets/img/company-3.jpg"
								class="img-fluid" alt="Colorlib Free Template"></a>
							<div class="text p-3">
								<h3>
									<a href="#">IT Programming INC</a>
								</h3>
								<p>
									<span class="number">700</span> <span>Open position</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-counter img" id="section-counter"
		style="background-image: url(/resources/template/assets/img/bg_1.jpg);"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="row">
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<div class="icon">
										<span class="flaticon-employee"></span>
									</div>
									<strong class="number" data-number="435000">0</strong> <span>Jobs</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<div class="icon">
										<span class="flaticon-collaboration"></span>
									</div>
									<strong class="number" data-number="40000">0</strong> <span>Members</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<div class="icon">
										<span class="flaticon-resume"></span>
									</div>
									<strong class="number" data-number="30000">0</strong> <span>Resume</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<div class="icon">
										<span class="flaticon-promotions"></span>
									</div>
									<strong class="number" data-number="10500">0</strong> <span>Company</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section testimony-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">Testimonial</span>
					<h2 class="mb-4">Happy Clients</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(/resources/template/assets/img/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Marketing Manager</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(/resources/template/assets/img/person_2.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Interface Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(/resources/template/assets/img/person_3.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">UI Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(/resources/template/assets/img/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Web Developer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(/resources/template/assets/img/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">System Analyst</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-candidates bg-primary">
		<div class="container">
			<div class="row justify-content-center pb-3">
				<div
					class="col-md-10 heading-section heading-section-white text-center ftco-animate">
					<span class="subheading">Candidates</span>
					<h2 class="mb-4">Latest Candidates</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="carousel-candidates owl-carousel">
						<div class="item">
							<a href="#" class="team text-center">
								<div class="img"
									style="background-image: url(/resources/template/assets/img/person_1.jpg);"></div>
								<h2>Danica Lewis</h2> <span class="position">Western
									City, UK</span>
							</a>
						</div>
						<div class="item">
							<a href="#" class="team text-center">
								<div class="img"
									style="background-image: url(/resources/template/assets/img/person_2.jpg);"></div>
								<h2>Nicole Simon</h2> <span class="position">Western
									City, UK</span>
							</a>
						</div>
						<div class="item">
							<a href="#" class="team text-center">
								<div class="img"
									style="background-image: url(/resources/template/assets/img/person_3.jpg);"></div>
								<h2>Cloe Meyer</h2> <span class="position">Western City,
									UK</span>
							</a>
						</div>
						<div class="item">
							<a href="#" class="team text-center">
								<div class="img"
									style="background-image: url(/resources/template/assets/img/person_4.jpg);"></div>
								<h2>Rachel Clinton</h2> <span class="position">Western
									City, UK</span>
							</a>
						</div>
						<div class="item">
							<a href="#" class="team text-center">
								<div class="img"
									style="background-image: url(/resources/template/assets/img/person_5.jpg);"></div>
								<h2>Dave Buff</h2> <span class="position">Western City,
									UK</span>
							</a>
						</div>
						<div class="item">
							<a href="#" class="team text-center">
								<div class="img"
									style="background-image: url(/resources/template/assets/img/person_6.jpg);"></div>
								<h2>Dave Buff</h2> <span class="position">Western City,
									UK</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">Our Blog</span>
					<h2>
						<span>Recent</span> Blog
					</h2>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('/resources/template/assets/img/image_1.jpg');">
						</a>
						<div class="text mt-3">
							<div class="meta mb-2">
								<div>
									<a href="#">May 3, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('/resources/template/assets/img/image_2.jpg');">
						</a>
						<div class="text mt-3">
							<div class="meta mb-2">
								<div>
									<a href="#">May 3, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('/resources/template/assets/img/image_3.jpg');">
						</a>
						<div class="text mt-3">
							<div class="meta mb-2">
								<div>
									<a href="#">May 3, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('/resources/template/assets/img/image_4.jpg');">
						</a>
						<div class="text mt-3">
							<div class="meta mb-2">
								<div>
									<a href="#">May 3, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section-parallax">
		<div class="parallax-img d-flex align-items-center">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div
						class="col-md-7 text-center heading-section heading-section-white ftco-animate">
						<h2>Subcribe to our Newsletter</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in</p>
						<div class="row d-flex justify-content-center mt-4 mb-4">
							<div class="col-md-12">
								<form action="#" class="subscribe-form">
									<div class="form-group d-flex">
										<input type="text" class="form-control"
											placeholder="Enter email address"> <input
											type="submit" value="Subscribe" class="submit px-3">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">About</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Employers</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Register</a></li>
							<li><a href="#" class="py-2 d-block">Post a Job</a></li>
							<li><a href="#" class="py-2 d-block">Advance Skill
									Search</a></li>
							<li><a href="#" class="py-2 d-block">Recruiting Service</a></li>
							<li><a href="#" class="py-2 d-block">Blog</a></li>
							<li><a href="#" class="py-2 d-block">Faq</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Workers</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Register</a></li>
							<li><a href="#" class="py-2 d-block">Post Your Skills</a></li>
							<li><a href="#" class="py-2 d-block">Job Search</a></li>
							<li><a href="#" class="py-2 d-block">Emploer Search</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="icon-heart text-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script
		src="/resources/template/assets/js/jquery.min.js"></script>
	<script
		src="/resources/template/assets/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="/resources/template/assets/js/popper.min.js"></script>
	<script
		src="/resources/template/assets/js/bootstrap.min.js"></script>
	<script
		src="/resources/template/assets/js/jquery.easing.1.3.js"></script>
	<script
		src="/resources/template/assets/js/jquery.waypoints.min.js"></script>
	<script
		src="/resources/template/assets/js/jquery.stellar.min.js"></script>
	<script
		src="/resources/template/assets/js/owl.carousel.min.js"></script>
	<script
		src="/resources/template/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/template/assets/js/aos.js"></script>
	<script
		src="/resources/template/assets/js/jquery.animateNumber.min.js"></script>
	<script
		src="/resources/template/assets/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="/resources/template/assets/js/google-map.js"></script>
	<script src="/resources/template/assets/js/main.js"></script>

</body>
</html>