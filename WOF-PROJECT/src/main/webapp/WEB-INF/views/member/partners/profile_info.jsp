<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>파트너스 프로필 정보</title>
	
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
	<jsp:include page="../../includes/header.jsp" />
	<%--로그인 유저 정보 객체--%>
	<sec:authentication property="principal.member" var="member"/>
	<!-- Main content -->
	<div class="main-content" id="panel">
		<!-- Page content -->
		<div class="container-fluid mt-10">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="row align-items-center">
								<div class="col-8">
									<h1 class="mb-0">프로필 관리</h1>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-success">수정하기</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<h6 class="heading-small text-muted mb-4">추가정보</h6>
							<div class="col-md-12 form-inline">
								<div class="card card-profile col-md-4">
									<img src="../template/assets/img/theme/img-1-1000x600.jpg"
										alt="Image placeholder" class="card-img-top">
									<div class="row justify-content-center">
										<div class="col-lg-3 order-lg-2">
											<div class="card-profile-image">
												<a href="#"> <img
													src="../template/assets/img/theme/team-4.jpg"
													class="rounded-circle">
												</a>
											</div>
										</div>
									</div>
									<div
										class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
									</div>
									<div class="card-body pt-0">
										<div class="row">
											<div class="col">
												<div
													class="card-profile-stats d-flex justify-content-center">
													<div>
														<span class="heading">4년차</span> <span class="description">경력</span>
													</div>
													<div>
														<span class="heading">JAVA</span> <span
															class="description">주요기술</span>
													</div>
													<div>
														<span class="heading">서울</span> <span class="description">희망지역</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-8">
									<div class="row">
										<div class="col-12">
											<h1>${member.real_name }</h1>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<c:if test="${partneruser.partner_sex ==1}">
												<span>남,</span>
											</c:if>
											<c:if test="${partneruser.partner_sex ==2}">
												<span>여,</span>
											</c:if>
											<span>29세</span>
										</div>
									</div>
									<div class="row my-3 pt-6">
										<div class="col-6 col-md-2 pr-0 text-right">이메일 :</div>
										<div class="col-6 col-md-4 text-left">${member.userid}</div>
										<div class="col-6 col-md-2 pr-0 text-right">경력 :</div>
										<div class="col-6 col-md-4 text-left">4년차</div>
									</div>
									<div class="row my-3 pt-5">
										<div class="col-6 col-md-2 pr-0 text-right">전화번호 :</div>
										<div class="col-6 col-md-4 text-left">${member.userphone}</div>
										<div class="col-6 col-md-2 pr-0 text-right">보유기술 :</div>
										<div class="col-6 col-md-4 text-left">${partners.skill}</div>
									</div>
									<div class="row my-3 pt-5">
										<div class="col-6 col-md-2 pr-0 text-right">선호지역 :</div>
										<div class="col-6 col-md-4 text-left">${partneruser.partner_loca }</div>
										<div class="col-6 col-md-2 pr-0 text-right">해시태그 :</div>
										<div class="col-6 col-md-4 text-left">${partneruser.partner_hashtag }</div>
									</div>
								</div>
							</div>
							<hr class="my-4" />
							<!-- Address -->
							<h6 class="heading-small text-muted mb-4">이력서 관리</h6>
							<div>
								<ul
									class="nav nav-pills nav-fill flex-column flex-sm-row col-12"
									id="tabs-text" role="tablist">
									<li class="nav-item col-3"><a
										class="nav-link mb-sm-3 mb-md-0 active" id="tabs-text-1-tab"
										data-toggle="tab" href="#tabs-text-1" role="tab"
										aria-controls="tabs-text-1" aria-selected="true">프로젝트/경력
											사항</a></li>
									<li class="nav-item col-3"><a
										class="nav-link mb-sm-3 mb-md-0" id="tabs-text-2-tab"
										data-toggle="tab" href="#tabs-text-2" role="tab"
										aria-controls="tabs-text-2" aria-selected="false">자기소개/MBTI</a>
									</li>
								</ul>
							</div>
							<div class="col-12 mt-3">
								<button type="button" class="btn btn-primary col-12">
									<i class="ni ni-fat-add text-warning" style="font-size: 20px"></i>추가등록
								</button>
							</div>

							<!-- start list -->
							<div class="table-responsive mt-4">
								<table class="table align-items-center">
									<thead class="thead-light">
										<tr>
											<th scope="col" class="sort" data-sort="name">프로젝트/회사명</th>
											<th scope="col" class="sort" data-sort="skil">기술/역할</th>
											<th scope="col" class="sort" data-sort="field">분야</th>
											<th scope="col" class="sort" data-sort="tesk">담당업무</th>
											<th scope="col" class="sort" data-sort="completion">날짜</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody class="list">

										<tr>
											<th scope="row">
												<div class="media align-items-center">
													<div class="media-body">
														<span class="name mb-0 text-sm">kosta202 프로젝트</span>
													</div>
												</div>
											</th>
											<td class="skil">JAVA,개발</td>
											<td><span class="badge badge-dot mr-4"> <i
													class="bg-warning"></i> <span class="field">웹솔루션</span>
											</span></td>
											<td>
												<div>
													<span class="tesk">영화정보 및 체크인 정보 관리 시스템 설계</span>
												</div>
											</td>
											<td>
												<div class="d-flex align-items-center">
													<span>2020.10.19</span>
												</div>
											</td>
											<td class="text-right">
												<div>
													<button type="button" class="btn btn-success">수정하기</button>
													<button type="button" class="btn btn-danger">삭제하기</button>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="media align-items-center">
													<div class="media-body">
														<span class="name mb-0 text-sm">kosta202 프로젝트</span>
													</div>
												</div>
											</th>
											<td class="skil">JAVA,개발</td>
											<td><span class="badge badge-dot mr-4"> <i
													class="bg-warning"></i> <span class="field">웹솔루션</span>
											</span></td>
											<td>
												<div>
													<span class="tesk">영화정보 및 체크인 정보 관리 시스템 설계</span>
												</div>
											</td>
											<td>
												<div class="d-flex align-items-center">
													<span>2020.10.19</span>
												</div>
											</td>
											<td class="text-right">
												<div>
													<button type="button" class="btn btn-success">수정하기</button>
													<button type="button" class="btn btn-danger">삭제하기</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- end list -->
							<!-- Description -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- footer -->
	<jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>

</html>