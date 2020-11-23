<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<!-- hakgeun style-->
	<style type="text/css">
		.color {
			color: red;
		}
	</style>
	
	<!-- toastr css 라이브러리 -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />

	<!-- Header & Menu -->
	<jsp:include page="../includes/header.jsp" />


	<!-- Main content -->
	<div class="main-content" id="panel">
	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row">
					<div class="col">
						<a class="btn btn-secondary"
							href="/kosta202-project/Client/PartnersRecommendListAction.do">추천된
							파트너스</a>
						<a class="btn btn-secondary"
							href="/kosta202-project/Client/followPartnerListAction.do">관심
							파트너스</a>
						<a class="btn btn-secondary"
							href="/kosta202-project/Client/registerProjectListAction.do">지원한
							파트너스</a> 
						<a class="btn btn-secondary"
							href="/kosta202-project/Partners/selectpartnerslistAction.do">파트너스
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
						<h3 class="mb-0">관심 파트너스 목록</h3>
					</div>

					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col">관심파트너 아이디</th>
									<th scope="col">생년월일</th>
									<th scope="col">지역</th>
									<th scope="col">경력</th>
									<th scope="col">보유기술</th>
									<th scope="col">해시태그</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<input type="hidden" value="member7" id="source_member"><!-- 테스트 후 변수로 변경 -->
							<tbody>
								<c:forEach var="followList" items="${followList }">
									<tr>
										<th scope="row">${followList.member_no }</th>
										<td>${followList.birthday }</td>
										<td>${followList.prefered_area }</td>
										<td>${followList.career }</td>
										<td>${followList.skill }</td>
										<td>${followList.hashtag }</td>
										<!-- 자세히보기  -->
										<td class="text-right"><a class=""
											href="partners_select.jsp">자세히보기</a></td>
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
					
					<form id='actionForm' action="/partners/list" method="get">
						<input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}'>
						<input type="hidden" name='amount' value = '${pageMaker.standard.amount}'>
					</form>
			</div>
		</div>
	</div>
</div>
	
	<!-- Footer -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>

		<!-- toastr js 라이브러리 -->
		<script type="text/javascript"
			src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
			
		<!-- Hakgeun js -->
		<script type="text/javascript">
			$(function() {
				
				var actionForm = $("#actionForm");
				
				$(".page-item a").on("click", function(e) {
					e.preventDefault();
					
					console.log('click');
					
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
				
				$(".ni-favourite-28").click(function() {
					var target_member = $(this).find("input").val();
					var source_member = $("#source_member").val();
					var clickThis = $(this);
					
					// 아이디 중복체크
					$.ajax({
						url : "/partners/followCheck",
						type : "post",
						data : JSON.stringify({
							target_member : target_member,
							source_member : source_member
						}),
						contentType : "application/json; charset=utf-8",						
						success : function(data){
							
							parseInt(data);//integer 로 들어온 data String으로 캐스팅(파싱)
							console.log(data);
							
							if(data == 0){//클릭한 아이디가 DB에 없으면(관심파트너스에 추가되어 있지 않으면)
								
								$(clickThis).toggleClass("color");//하트 빨간색 추가
							
								//관심파트너스 추가
								$.ajax({
									url : "/partners/followYes",
									type : "post",
									data : JSON.stringify({
										target_member : target_member,
										source_member : source_member
									}),
									contentType : "application/json; charset=utf-8",
									success : function(result) {
										toastr.success("관심파트너스가 추가되었습니다.");
									},
									error : function(error) {
										toastr.error("관심 파트너스가 추가되지 않았습니다.");
									}
								})// end ajax
								
							}else{//관심파트너스에 추가되어 있으면
								
								$(clickThis).toggleClass("color");//하트에 빨간색 제거
								
								//삭제
								$.ajax({
									url : "/partners/followNo",
									type : "post",
									data : JSON.stringify({
										target_member : target_member,
										source_member : source_member
									}),
									contentType : "application/json; charset=utf-8",
									success : function(result) {
										toastr.warning("관심 파트너스에서 삭제되었습니다.");
									},
									error : function(error) {
										toastr.error("관심 파트너스가 삭제되지 않았습니다.");
									}
								})//end ajax
								
							}//end else
								
						}//end success
						
					})//end check ajax
		
				})//end click

			})
		</script>
</body>
</html>