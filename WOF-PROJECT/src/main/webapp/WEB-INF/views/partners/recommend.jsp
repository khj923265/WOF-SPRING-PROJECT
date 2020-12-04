<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp"%>


	<!-- Main Content -->
	<div class="main-content" id="panel">
	
	<!-- Sub menu -->
	<%@ include file="menu.jsp"%>

	<div class="container mt-3">
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
									<th scope="col">생년월일</th>
									<th scope="col">선호지역</th>
									<th scope="col">경력</th>
									<th scope="col">보유기술</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="recommendList"
									items="${recommendList }">
									<tr>
										<c:choose>
										  <c:when test="${recommendList.birthday == null }">
											<td></td>
										  </c:when>										  
										  <c:when test="${recommendList.birthday != null }">
											<td>${recommendList.birthday }년생</td>
										  </c:when>
										</c:choose>
										<td>${recommendList.prefered_area }</td>
										<td>${recommendList.career }</td>
										<td>${recommendList.skill }</td>
								</c:forEach>

							</tbody>
						</table>
					</div>
					</c:when>
					</c:choose>
					<div class="card-footer py-4">
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
					
					<form id='actionForm' action="/partners/recommend" method="get">
						<input type="hidden" name='member_no' value='${member.member_no}'>
						<input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}'>
						<input type="hidden" name='amount' value = '${pageMaker.standard.amount}'>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	
	<!-- Footer -->
	<%@ include file="../includes/footer.jsp"%>
	
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