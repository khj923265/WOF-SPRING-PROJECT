<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp" %>


	<!-- Main Content -->
	<div class="main-content" id="panel">
	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row">
					<div class="col">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/Project/RecommendProjectListAction.do">추천된
							프로젝트</a>
						<a class="btn btn-secondary"
							href="/kosta202-project/Partners/listApplyProjectAction.do">지원한
							프로젝트</a> 
						<a class="btn btn-secondary"
							href="/kosta202-project/Partners/">진행중 프로젝트</a> <a
							class="btn btn-secondary" href="/kosta202-project/Partners/">중단된
							프로젝트</a>
						<a class="btn btn-secondary"
							href="#">완료된 프로젝트</a>
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
									<th scope="col"><i class="ni ni-money-coins"></i> 가격</th>
									<th scope="col"><i class="ni ni-square-pin"></i> 지역</th>
									<th scope="col"><i class="ni ni-badge ml-1"></i> 요구기술</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i> 시작일</th>
									<th scope="col"><i class="ni ni-single-02"></i> 모집인원</th>
									<th scope="col">프로젝트보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ProjectVO" items="${project_apply_detail }">
									<tr>
										<th scope="row">${ProjectVO.proj_title }</th>
										<td>${ProjectVO.proj_estimate }</td>
										<td>${ProjectVO.proj_work_place }</td>
										<td>${ProjectVO.proj_reqr_skill }</td>
										<td><fmt:parseDate var="dt"
												value="${ProjectVO.proj_start_date }"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${dt }" pattern="yyyy/MM/dd" /></td>
										<td>${ProjectVO.proj_reqr_person }명</td>
										<td class="text-right"><a class="" href="#">자세히보기</a></td>
									</tr>
								</c:forEach>
								<%--                     <c:forEach var="ProjectVO" items="${list }">
                  <tr>
                    <th scope="row">${ProjectVO.proj_title }</th>
                    <td>${ProjectVO.proj_estimate }</td>
                    <td>${ProjectVO.proj_work_place }</td>
                    <td>${ProjectVO.proj_reqr_skill }</td>
                    <td>${ProjectVO.proj_start_date }</td>
                    <td>${ProjectVO.proj_end_date }</td>
                    <td class="text-right">
                    	<a class="" href="#">자세히보기</a>
                    </td>
                  </tr>
              </c:forEach>  --%>
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


	<!-- Footer -->
	<%@ include file="../includes/footer.jsp" %>
</body>
</html>