<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp"%>


	<!-- Main Content -->
	<div class="main-content" id="panel">
	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row">
					<div class="col">
						<a class="btn btn-secondary"
							href="${pageContext.request.contextPath }/partners/followlist?member_no=${member.member_no }">관심 파트너스 관리</a> 
							<a class="btn btn-secondary"
							href="${pageContext.request.contextPath }/partners/recommend?member_no=${member.member_no }">추천 파트너스</a>
							 <a class="btn btn-secondary"
							href="${pageContext.request.contextPath}/partners/applystate?member_no=${member.member_no }">파트너스 지원현황</a>
							<a class="btn btn-secondary"
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
						<h3 class="mb-0">추천 파트너스 목록</h3>
					</div>
					<c:choose>
					<c:when test="${empty recommendList }">
						<h1>추가정보를 입력하시면 파트너스를 추천받으실 수 있습니다.</h1>
					</c:when>
					<c:when test="${!empty recommendList }">
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col">관심파트너 아이디</th>
									<th scope="col">생년월일</th>
									<th scope="col">선호지역</th>
									<th scope="col">경력</th>
									<th scope="col">보유기술</th>
									<th scope="col">해시태그</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="recommendList"
									items="${recommendList }">
									<tr>
										<th scope="row">${recommendList.member_no }</th>
										<td>${recommendList.birthday }</td>
										<td>${recommendList.prefered_area }</td>
										<td>${recommendList.career }</td>
										<td>${recommendList.skill }</td>
										<td>${recommendList.hashtag }</td>
										<!-- 자세히보기  -->
										<td class="text-right"><a class=""
											href="${pageContext.request.contextPath}/partners/applydetail?member_no=${member.member_no}">자세히보기</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					</c:when>
					</c:choose>
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