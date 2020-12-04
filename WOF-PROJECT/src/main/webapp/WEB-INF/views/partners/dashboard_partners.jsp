<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>


<!-- Sidenav -->
<nav
	class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white"
	id="sidenav-main">
	<div class="scrollbar-inner">
		<!-- Brand -->
		<div class="sidenav-header  align-items-center">
			<a href="${pageContext.request.contextPath }/main"><img
				alt=""
				src="${pageContext.request.contextPath }/resources/template/assets/img/brand/logo_transparent.png"
				style="height: 50px; width: 100px; margin-left: 10px;"> </a>
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
						src="/resources/template/assets/img/theme/team-4.jpg">
					</span>
				</div>
				<h4>이름</h4>
				<br> <br>
				<ul class="navbar-nav">

					<li class="nav-item"><a class="nav-link"
						href="project_apply_detail.jsp"> <i
							class="ni ni-badge text-orange"></i> <span class="nav-link-text">제안
								및 지원</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="project_apply_detail.jsp"> <i
							class="ni ni-bullet-list-67 text-default"></i> <span
							class="nav-link-text">공지사항</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/partners/profile_info.jsp">
							<i class="ni ni-settings-gear-65"></i> <span
							class="nav-link-text">프로필 관리</span>
					</a></li>
				</ul>
				<!-- Divider -->
				<hr class="my-3">
				<!-- Navigation -->
				<ul class="navbar-nav mb-md-3">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/qna/question-register">
							<i class="ni ni-archive-2"></i> <span class="nav-link-text">1:1문의</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/point/admin">
							<i class="ni ni-money-coins"></i> <span class="nav-link-text">포인트
								관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/Penalty/listPenaltyPartners.do">
							<i class="ni ni-palette"></i> <span class="nav-link-text">페널티
								관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/community/partners_community_list">
							<i class="ni ni-palette"></i> <span class="nav-link-text">커뮤니티 게시판
								</span>
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
								<b>찜한 프로젝트</b>
								<div class="card bg-light text-dark">
									<c:choose>
										<c:when test="${empty dashboardFollowProject }">
										<div class="card-body">
										<center>
										<br>
										<h5 data-toggle="tooltip" data-placement="top" title="찜한 프로젝트가 없습니다.">조회 결과가 없습니다.</h5>
										</center>
										</div>
										</c:when>
									<c:when test="${!empty dashboardFollowProject }">
									<div class="card-body">
										<table class="table align-items-center table-flush">
											<thead class="thead-light">
												<tr>
													<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
														#프로젝트명</th>
													<th scope="col"><i class="ni ni-square-pin"></i> 경력</th>
													<th scope="col"><i class="ni ni-badge ml-1"></i> 지원마감</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="dashboardFollowProject"
													items="${dashboardFollowProject }">
													<tr>
														<td>${dashboardFollowProject.proj_title }</td>
														<td>${dashboardFollowProject.proj_career }</td>
														<td><fmt:parseDate var="dt"
																value="${dashboardFollowProject.proj_apply_deadline }"
																pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																value="${dt }" pattern="yyyy/MM/dd" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									</c:when>
									</c:choose>
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
										<c:choose>
										<c:when test="${empty dashboardpartnersApplyProject }">
										<div class="card-body">
										<center>
										<br>
										<h5 data-toggle="tooltip" data-placement="top" title="추가정보 등록 후 이용할 수 있습니다.">조회 결과가 없습니다.</h5>
										</center>
										</div>
										</c:when>
									<c:when test="${!empty dashboardpartnersApplyProject }">
									<div class="card-body">
										<table class="table align-items-center table-flush">
											<thead class="thead-light">
												<tr>
													<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
														#프로젝트명</th>
													<th scope="col"><i class="ni ni-square-pin"></i> 지역</th>
													<th scope="col"><i class="ni ni-badge ml-1"></i> 요구기술</th>
													<th scope="col"><i class="ni ni-single-02"></i> 시작날짜</th>
													<th scope="col">프로젝트 보기</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="ProjectVO"
													items="${dashboardpartnersApplyProject }">
													<tr>
														<td>${ProjectVO.proj_title }</td>
														<td>${ProjectVO.proj_work_place }</td>
														<td>${ProjectVO.proj_reqr_skill }</td>
														<td><fmt:parseDate var="dt"
																value="${ProjectVO.proj_start_date }"
																pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																value="${dt }" pattern="yyyy/MM/dd" /></td>
														<td class="text-right"><a class="" href="/project/read?proj_id=${ProjectVO.proj_id }">자세히보기</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									</c:when>
									</c:choose>
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
<%@ include file="../includes/footer.jsp"%>
</body>

</html>