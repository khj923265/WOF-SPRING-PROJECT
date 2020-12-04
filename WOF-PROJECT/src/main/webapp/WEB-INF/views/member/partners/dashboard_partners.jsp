<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>dashboard_partners.jsp</title>
	
	<!-- Favicon -->
	<link rel="icon" href="${pageContext.request.contextPath}/template/assets/img/brand/favicon.png"
		type="image/png">
	<!-- Fonts -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
	<!-- Icons -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/nucleo/css/nucleo.css" type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
		type="text/css">
	<!-- Argon CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/assets/css/argon.css?v=1.2.0"
		type="text/css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/template/assets/css/argon.css"
		media="all" />
</head>

<body>
	<!-- Header & Menu -->
	<jsp:include page="../../includes/header.jsp"></jsp:include>


	<!-- Sidenav -->
	<nav
		class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white"
		id="sidenav-main">
		<div class="scrollbar-inner">
			<!-- Brand -->
			<div class="sidenav-header  align-items-center">
				<a href="${pageContext.request.contextPath }/Project/movemain.do"><img alt=""
					src="${pageContext.request.contextPath }/template/assets/img/brand/logo_transparent.png"
					style="height: 50px; width: 100px; margin-left: 10px;">
				</a>
			</div>
			<div class="navbar-inner">
				<!-- Collapse -->
				<div class="collapse navbar-collapse" id="sidenav-collapse-main">
					<!-- Nav items -->
					<br> <br>

					<h3 class="nav-item">
						<a class="nav-" href="dashboard_partners.jsp"> <i
							class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">마이페이지</span>
						</a>
					</h3>
					<br>
					<div class="col-12">
						<span class="avatar avatar-sm rounded-circle"> <img
							alt="Image placeholder"
							src="../template/assets/img/theme/team-4.jpg">
						</span>
					</div>
					<h4>이름</h4>
					<br> <br>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/partners/profile_info.jsp">
								<i class="ni ni-planet text-orange"></i> <span
								class="nav-link-text">프로필 관리</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="project_apply_detail.jsp"> <i
								class="ni ni-bullet-list-67 text-default"></i> <span
								class="nav-link-text">제안 및 지원</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="project_apply_detail.jsp"> <i
								class="ni ni-bullet-list-67 text-default"></i> <span
								class="nav-link-text">공지사항</span>
						</a></li>
						
						<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/community/partners_commmunity_list">
							<i class="ni ni-archive-2"></i> <span class="nav-link-text">파트너스 커뮤니티 게시판</span>
					</a></li>
					</ul>
					<!-- Divider -->
					<hr class="my-3">
					<!-- Navigation -->
					<ul class="navbar-nav mb-md-3">
						<li class="nav-item"><a class="nav-link"
							href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html"
							> <i class="ni ni-spaceship"></i> <span
								class="nav-link-text">문의하기</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html"
							> <i class="ni ni-palette"></i> <span
								class="nav-link-text">포인트 관리</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Penalty/listPenaltyPartners.do"
							> <i class="ni ni-palette"></i> <span
								class="nav-link-text">페널티 관리</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- End side nav -->
	
	<!-- Main content -->
	<div class="main-content" id="panel">
		<div class="header pb-8 pt-5 pt-md-8">
			<div class="container-fluid">
				<div class="header-body">
					<!-- Page content -->
					<div class="row">
						<div class="col"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-header border-0">
							<!--타임라인 -->
							<div>
								<h4>파트너스</h4>
								<h2>내 프로젝트 현황</h2>
								<span class="nav-link-text">누적완료 포인트 : 000원</span>
							</div>
							<a class="btn btn-primary"
								href="/partners/project_apply_detail">지원 프로젝트</a>
							<a class="btn btn-primary" href="/partners/appliedpartners?member_no=${member.member_no }">계약현황</a>
							<button type="button" class="btn btn-secondary">진행중인
								프로젝트</button>
							<button type="button" class="btn btn-secondary">완료 프로젝트</button>
							<br> <br>
							<h2>나의 타임라인</h2>
							<h5>투입 가능일 : 2021.01.12</h5>
							<div class="row">
								<div class="col-md-6 column ui-sortable">
									<b>프로필 자리</b>
									<div class="card bg-light text-dark">
										<div class="card-body">아아아아아</div>
									</div>
								</div>
								<div class="col-md-6 column ui-sortable">
									<b>일정 캘린더</b>
									<div class="card bg-light text-dark">
										<div class="card-body">아아아아아</div>
									</div>
								</div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-12 column ui-sortable">
									<b>최근 본 프로젝트</b>
									<div class="card bg-light text-dark">
										<div class="card-body">아아아아아</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 column ui-sortable">
									<b>제안 및 지원현황</b>
									<div class="card bg-light text-dark">
										<div class="card-body">
											<table class="table align-items-center table-flush">
												<thead class="thead-light">
													<tr>
														<th scope="col"><i class="ni ni-chart-bar-32 mr-3"></i>
															프로젝트명</th>
														<th scope="col"><i class="ni ni-map-big ml-1"></i> 지역</th>
														<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
															요구기술</th>
														<th scope="col"><i class="ni ni-air-baloon ml-1"></i>
															시작날짜</th>
														<th scope="col">프로젝트 보기</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="Applied_ProjectVO"
														items="${dashboardpartnerApplyProject }">
														<tr>
															<td>${Applied_ProjectVO.proj_title }</td>
															<td>${Applied_ProjectVO.proj_work_place }</td>
															<td>${Applied_ProjectVO.proj_reqr_skill }</td>
															<td><fmt:parseDate var="dt"
																	value="${Applied_ProjectVO.proj_start_date }"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${dt }" pattern="yyyy/MM/dd" /></td>
															<td class="text-right"><a class="" href="#">자세히보기</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<!-- 리스트  -->
								</div>
							</div>

							<br> <br>
							<div class="row">
								<div class="col-md-5 column ui-sortable">
									<b>계약요청</b>
									<div class="card bg-light text-dark">
										<div class="card-body">아아아아아</div>
									</div>
								</div>
								<div class="col-md-1 column ui-sortable"></div>
								<div class="col-md-5 column ui-sortable">
									<b>진행중인 프로젝트</b>
									<div class="card bg-light text-dark">
										<div class="card-body">아아아아아</div>
									</div>
								</div>
								<div class="col-md-1 column ui-sortable"></div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
		

	<!-- Footer -->
	<jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>

</html>