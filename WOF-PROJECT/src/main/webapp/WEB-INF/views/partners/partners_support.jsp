<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>

<!-- Main content -->
<div class="main-content" id="panel">

	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row">
					<div class="col">
						<a class="btn btn-secondary"
							href="${pageContext.request.contextPath}/Client/PartnersRecommendListAction.do">추천된
							파트너스</a> <a class="btn btn-secondary"
							href="${pageContext.request.contextPath}/Client/followPartnerListAction.do">관심
							파트너스</a> <a class="btn btn-secondary"
							href="${pageContext.request.contextPath}/Client/registerProjectListAction.do">지원한
							파트너스</a> <a class="btn btn-secondary"
							href="${pageContext.request.contextPath}/Partners/selectpartnerslistAction.do">파트너스
							선택</a>
						<button type="button" class="btn btn-secondary">계약현황</button>
						<button type="button" class="btn btn-secondary">계약완료</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt--7">
		<!-- Table -->
		<div class="row">
			<div class="col">
				<div class="card shadow">
					<div class="card-header border-0">
						<h3 class="mb-0">제안 및 지원자현황</h3>
					</div>
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
										#프로젝트명</th>
									<th scope="col"><i class="ni ni-map-big ml-1"></i> 필요기술</th>
									<th scope="col"><i class="ni ni-circle-08"></i> 경력</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i> 투입일</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i>
										마감일</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i> 지원인원</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ProjectVO" items="${partnersSupport }">
									<tr>
										<th scope="row">${ProjectVO.proj_title }</th>
										<td>${ProjectVO.proj_reqr_skill }</td>
										<td>${ProjectVO.proj_career }</td>
										<td><fmt:parseDate var="dt"
												value="${ProjectVO.proj_start_date }"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${dt }" pattern="yyyy/MM/dd" /></td>
										<td><fmt:parseDate var="dt"
												value="${ProjectVO.proj_end_date }"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${dt }" pattern="yyyy/MM/dd" /></td>
										<td>${ProjectVO.proj_reqr_person }명</td>

										<!-- 자세히보기  -->
										<td class="text-right"><a class=""
											href="partners_select.jsp">자세히보기</a></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="card-footer py-4">
						<nav aria-label="...">
							<ul class="pagination justify-content-end mb-0">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1"> <i class="fas fa-angle-left"></i> <span
										class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">2 <span
										class="sr-only">(current)</span></a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"> <i
										class="fas fa-angle-right"></i> <span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
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