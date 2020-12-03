<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../includes/header.jsp" %>


	<%@ include file="menu.jsp"%>
	<!-- Main Content -->

	<div class="container mt-3">
		<!-- Table -->
		<div class="row">
			<div class="col">
				<div class="card shadow">
					<div class="card-header border-0">
						<h3 class="mb-0">지원한 프로젝트 목록</h3>
					</div>

					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col">프로젝트 제목</th>
									<th scope="col">프로젝트 지원마감일</th>
									<th scope="col">프로젝트 시작일</th>
									<th scope="col">지역</th>
									<th scope="col">경력</th>
									<th scope="col">필요기술</th>
									<th scope="col">프로젝트 금액</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="follow" items="${follows}">
									<tr>
										<td><a href="#">${follow.proj_title}</a></td>
										<td>${follow.proj_apply_deadline}</td>
										<td>${follow.proj_start_date}</td>
										<td>${follow.proj_work_place}</td>
										<td>${follow.proj_work_place}</td>
										<td>${follow.proj_career}</td>
										<td>${follow.skill}</td>
										<td>${follow.proj_estimate}</td>
										<td><a class="btn btn-danger" ref="${pageContext.request.contextPath}/project/recommend?member_no=${member.member_no}">지원한 프로젝트</a>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
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
					
					<form id='actionForm' action="/partners/followlist" method="get">
						<input type="hidden" name='member_no' value='${member.member_no}'>
						<input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}'>
						<input type="hidden" name='amount' value = '${pageMaker.standard.amount}'>
					</form>
			</div>
		</div>
	</div>
</div>
  
   
<%@ include file="../includes/footer.jsp" %>

	<style type="text/css">
	 .color {
	 	color : #5e72e4;
	 }
	</style>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">	
	
</script>