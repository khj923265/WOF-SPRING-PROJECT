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
							href="/partners/project_apply_detail?member_no=${member.member_no}">지원한
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
						<h3 class="mb-0">제안 및 지원현황</h3>
						${member.member_no} 
						${partners.member_no }
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
										<td class="text-right"><a class="" href="/project/read?proj_id=${ProjectVO.proj_id }">자세히보기</a></td>
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
					<!-- 페이징 -->
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					  <c:if test="${pageMaker.prev }">
					    <li class="page-item disabled">
					      <a class="page-link" href="${pageMaker.startPage-1}">
					        <i class="fa fa-angle-left"></i>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
					  </c:if>
					  
					  <c:forEach var="num" begin="${pageMaker.startPage}"
					  end="${pageMaker.endPage}">
					    <li class="page-item ${pageMaker.standard.pageNum == num ? "active":""}" >
					    <a class="page-link" href="${num}">${num}</a></li>
					  </c:forEach>
					  
					  <c:if test="${pageMaker.next}">
					    <li class="page-item">
					      <a class="page-link" href="${pageMaker.endPage +1}">
					        <i class="fa fa-angle-right"></i>
					        <span class="sr-only">Next</span>
					      </a>
					    </li>
					   </c:if>
					  </ul>
					</nav>
					<form id='actionForm' action="/partners/project_apply_detail" method="get">
						<input type="hidden" name='member_no' value='${member.member_no}'>
						<input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}'>
						<input type="hidden" name='amount' value = '${pageMaker.standard.amount}'>
					</form>
				</div>
			</div>
		</div>
	</div>


<script>
var actionForm = $("#actionForm");

$(".page-item a").on(
		"click",
		function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
		});
</script>

	<!-- Footer -->
	<%@ include file="../includes/footer.jsp" %>