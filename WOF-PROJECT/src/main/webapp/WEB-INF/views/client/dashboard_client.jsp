<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<!-- Header & Menu -->
<%@ include file="../includes/header.jsp" %>


	<!-- Side nav -->
	<nav
		class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white"
		id="sidenav-main">

		<div class="scrollbar-inner">
			<!-- Brand -->
			<div class="sidenav-header  align-items-center">
				<a href="${pageContext.request.contextPath }/Project/movemain.do"><img
					alt=""
					src="${pageContext.request.contextPath }/resources/template/assets/img/brand/logo_transparent.png"
					style="height: 50px; width: 100px; margin-left: 10px;"> </a>
			</div>
			<div class="navbar-inner">
				<!-- Collapse -->
				<div class="collapse navbar-collapse" id="sidenav-collapse-main">
					<!-- Nav items -->
					<h3 class="nav-item">
						<a class="nav-" href="dashboard_client.jsp"> <i
							class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">마이페이지</span>
						</a>
					</h3>
					<br>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="icons.html">
								<i class="ni ni-badge text-orange"></i> <span
								class="nav-link-text">제안 지원</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="#"> <i
								class="ni ni-bullet-list-67 text-default"></i> <span
								class="nav-link-text">공지사항</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="#"> <i
								class="ni ni-archive-2 text-default"></i> <span
								class="nav-link-text">문의하기</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../member/client/client_info_update"> <i
								class="ni ni-settings-gear-65 text-default"></i> <span
								class="nav-link-text">기본 정보 변경</span>
						</a></li>
					</ul>
					<!-- Divider -->
					<hr class="my-3">
					<!-- Navigation -->
					<ul class="navbar-nav mb-md-3">
						<li class="nav-item"><a class="nav-link"
							href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
								<i class="ni ni-spaceship"></i> <span class="nav-link-text">파트너스
									관리</span>
						</a></li>
						
						<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/qna/question-register">
							<i class="ni ni-archive-2"></i> <span class="nav-link-text">1:1문의</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/point/admin">
							<i class="ni ni-money-coins"></i> <span class="nav-link-text">포인트 관리</span>
						</a></li>	
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Penalty/listPenaltyClient.do">
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
								<h4>클라이언트</h4>
								<h2>프로젝트 관리</h2>
								<span class="nav-link-text">보유 포인트 : 000원</span>
							</div>
							<button type="button" class="btn btn-secondary">제안한 요청</button>
							<button type="button"
								onclick="location.href='../Client/registerProjectListAction.do'"
								class="btn btn-secondary">등록 프로젝트</button>
							<button type="button" class="btn btn-secondary">관심 파트너스</button>
							<button type="button" class="btn btn-secondary">계약된 파트너스</button>
							<br> <br>
							<div class="row">
								<div class="col-md-11 column ui-sortable">
									<b>등록된 프로젝트</b>
									<div class="card bg-light text-dark">
									<c:choose>
										<c:when test="${empty dashboardRegisterProject }">
										<div class="card-body">
										<center>
										<br>
										<h5 data-toggle="tooltip" data-placement="top" title="추가정보 등록 후 이용할 수 있습니다.">조회 결과가 없습니다.</h5>
										</center>
										</div>
										</c:when>
									<c:when test="${!empty dashboardRegisterProject }">
										<div class="card-body">
										<table class="table align-items-center table-flush">
												<thead class="thead-light">
													<tr>
														<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
															#프로젝트명</th>
														<th scope="col"><i class="ni ni-money-coins"></i>예상금액</th>
														<th scope="col"><i class="ni ni-single-02"></i> 모집인원</th>
														<th scope="col"><i class="ni ni-square-pin"></i>필수경력</th>
														<th scope="col"><i class="ni ni-badge ml-1"></i>
															프로젝트 시작일</th>
														<th scope="col"><i class="ni ni-air-baloon ml-1"></i>
															모집 마감일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="ProjectVO"
														items="${dashboardRegisterProject }">
														<tr>
															<th scope="row">${ProjectVO.proj_title }</th>
															<td>${ProjectVO.proj_estimate }</td>
															<td>${ProjectVO.proj_reqr_person }</td>
															<td>${ProjectVO.proj_career }</td>
															<td><fmt:parseDate var="dt"
																	value="${ProjectVO.proj_start_date }"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${dt }" pattern="yyyy/MM/dd" /></td>
															<td><fmt:parseDate var="dt"
																	value="${ProjectVO.proj_apply_deadline }"
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
								<div class="col-md-1 column ui-sortable"></div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-11 column ui-sortable">
									<b>제안 및 지원자현황</b>${member.member_no } ${client.member_no }
									<div class="card bg-light text-dark">
									<c:choose>
										<c:when test="${empty dashboardclientProject }">
										<div class="card-body">
										<center>
										<br>
										<h5 data-toggle="tooltip" data-placement="top" title="추가정보 등록 후 이용할 수 있습니다.">조회 결과가 없습니다.</h5>
										</center>
										</div>
										</c:when>
									<c:when test="${!empty dashboardclientProject }">
										<div class="card-body">
											<table class="table align-items-center table-flush">
												<thead class="thead-light">
													<tr>
														<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
															#프로젝트명</th>
														<th scope="col"><i class="ni ni-money-coins"></i> 가격</th>
														<th scope="col"><i class="ni ni-single-02"></i> 지원인원</th>
														<th scope="col"><i class="ni ni-square-pin"></i> 지역</th>
														<th scope="col"><i class="ni ni-badge ml-1"></i>
															요구기술</th>
														<th scope="col"><i class="ni ni-air-baloon ml-1"></i>
															투입일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="ProjectVO"
														items="${dashboardclientProject }">
														<tr>
															<th scope="row">${ProjectVO.proj_title }</th>
															<td>${ProjectVO.proj_estimate }</td>
															<td>${ProjectVO.proj_reqr_person }</td>
															<td>${ProjectVO.proj_work_place }</td>
															<td>${ProjectVO.proj_reqr_skill }</td>
															<td><fmt:parseDate var="dt"
																	value="${ProjectVO.proj_start_date }"
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
								<div class="col-md-1 column ui-sortable"></div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-5 column ui-sortable">
									<b>추천 파트너스</b>
									<div class="card bg-light text-dark">
									<c:choose>
										<c:when test="${empty recommendList }">
										<div class="card-body">
										<center>
										<br>
										<h5 data-toggle="tooltip" data-placement="top" title="추가정보 등록 후 이용할 수 있습니다.">조회 결과가 없습니다.</h5>
										</center>
										</div>
										</c:when>
									<c:when test="${!empty recommendList }">
										<div class="card-body">
											<table class="table align-items-center table-flush">
												<thead class="thead-light">
													<tr>
														<th scope="col"><i class="ni ni-chart-bar-32 mr-3"></i>
															이름</th>
														<th scope="col"><i class="ni ni-map-big ml-1"></i>
															경력</th>
														<th scope="col"><i class="ni ni-map-big ml-1"></i>
															보유기술</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="recommendList" items="${recommendList}">
														<tr>
															<td>${recommendList.member_no }</td>
															<td>${recommendList.career }</td>
															<td>${recommendList.skill }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										</c:when>
										</c:choose>
									</div>
								</div>
								
								<div class="col-md-1 column ui-sortable"></div>
								<div class="col-md-5 column ui-sortable">
									<b>관심 파트너스</b>${member.member_no} 
									${client.member_no }
									<div class="card bg-light text-dark">
										<c:choose>
										<c:when test="${empty dashboardFallowPartners }">
										<div class="card-body">
										<center>
										<br>
										<h5 data-toggle="tooltip" data-placement="top" title="추가정보 등록 후 이용할 수 있습니다.">조회 결과가 없습니다.</h5>
										</center>
										</div>
										</c:when>
									<c:when test="${!empty dashboardFallowPartners }">
										<div class="card-body">
											<table class="table align-items-center table-flush">
												<thead class="thead-light">
													<tr>
														<th scope="col">
														<i class="ni ni-chart-bar-32 mr-3"></i> 아이디
														</th>
														<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
															경력</th>
														<th scope="col"><i class="ni ni-badge ml-1"></i>
															보유기술</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="dashboardFallowPartners" items="${dashboardFallowPartners}">
														<tr>
															<td>${dashboardFallowPartners.member_no }</td>
															<td>${dashboardFallowPartners.career }</td>
															<td>${dashboardFallowPartners.skill }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										</c:when>
										</c:choose>
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
<%@ include file="../includes/footer.jsp" %>
</body>

</html>