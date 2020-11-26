<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- toastr css 라이브러리 -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp"%>

	<!-- Main Content -->
	<!-- top start-->
	<div class="main-content" id="panel">

	<div class="header pb-4 pt-5 md-8">
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

		<!--제목 및 내용 -->
		<div class="container">
			<!-- 제목 -->
			<div class="row mt-3">
				<h3>파트너스 선택</h3>
			</div>

			<!-- 프로젝트내용 및 지원 파트너스 리스트 -->
			<div class="row">
			<div class="col-sm-12">
			
			<!-- 프로젝트 내용 -->
			<div class="row">
			<div class="col-sm-12 shadow p-3 mb-5 bg-white rounded ">
				<h3>프로젝트명 : ${Project.proj_title }</h3>
				
				<span>${Project.member_no }</span></br>
				<span>
				${Project.proj_reg_date }
				${Project.proj_apply_deadline }
				${Project.proj_start_date }
				${Project.proj_end_date }
				</span></br>
				
				<span>
				${Project.proj_estimate }
				${Project.proj_reqr_person }
				</span></br>
				
				<span>
				${Project.proj_reqr_skill }
				${Project.proj_career }
				</span></br>
				
				<span>
				${Project.proj_work_type }
				${Project.proj_work_place }
				${Project.proj_work_time }
				${Project.proj_work_equip }
				</span></br>
			
			</div>
			</div>
			

				<!-- 파트너스리스트 -->
				<div class="row">
				<div class="col-sm-12">
				
					<form id="checkForm" action="applyRegister" method="post">
					<input type="submit" id="chkBtn">
					<input type="hidden" name='proj_id' value='${Project.proj_id}'>
					<c:forEach var="Partners" items="${Partners }">
						<div class="row shadow p-1 mb-3 bg-white rounded ">
						<div class="col-sm-1 text-center">
						<div class="custom-control custom-checkbox">
						<c:choose>
						<c:when test="${Partners.applied_member == null }">
							<input type="checkbox" name="member_no" value="${Partners.member_no }" style="width: 25px; height: 25px;">
						</c:when>
						<c:when test="${Partners.applied_member != null }">
							<input type="checkbox" name="member_no" value="${Partners.member_no }"   disabled="disabled"
							style="width: 25px; height: 25px;">
						</c:when>
						</c:choose>
						</div>
						</div>
							<div class="col-sm-7">
								<div class="row align-items-center">

									<span
										class="avatar avatar-lg rounded-circle justify-content-start m-3">
										<img alt="Image placeholder"
										src="/resources/template/assets/img/theme/team-4.jpg">
									</span> <span class="justify-content-center">
										<p class="mt-3 mb-0 text-sm">
											<span class="text-nowrap"> <i class="ni ni-circle-08"></i>
												${Partners.userid } 
												<i class="ni ni-air-baloon ml-1"></i>
																								
												<c:if test="${Partners.birthday != null }">
												${Partners.birthday }년생 
												</c:if>												
												
												<i class="ni ni-map-big ml-1"></i> ${Partners.prefered_area }
											</span>
										</p>
										<p class="mt-3 mb-0 text-sm">
											<span class="text-nowrap"> <i class="ni ni-badge ml-1"></i>
												${Partners.career } <i
												class="ni ni-chart-pie-35 ml-1"></i>
												${Partners.skill }
											</span>
										</p>
										<p class="mt-3 mb-3 text-sm">
											<span class="text-nowrap"> <i class="ni ni-tag ml-1"></i>
												<span class="badge badge-primary">${Partners.hashtag }</span>
											</span>
										</p>
									</span>
								</div>
							</div>

<%-- 							<div class="col-sm-1 text-center">
								<span class="justify-content-center">
								<c:choose>
								<c:when test="${Partners.target_member == null }">								 
								  <i class="ni ni-favourite-28 mt-2">
								 </c:when>
								 <c:when test="${Partners.target_member != null }">
								  <i class="ni ni-favourite-28 mt-2 color">
								 </c:when>								
								</c:choose>								   
								    <input type="hidden" value="${Partners.member_no }">
								  </i>
								<!-- fa fa-heart-o -->
								</span>
							</div> --%>

							<div class="col-sm-4">
								<div class="progress-wrapper mt-4">
									<div class="progress-info">
										<div class="progress-label">
											<span>현재 프로젝트 진행도</span>
										</div>
										<div class="progress-percentage">
											<span>60%</span>
										</div>
									</div>
									<div class="progress">
										<div class="progress-bar bg-info" role="progressbar"
											aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
											style="width: 60%;"></div>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>
					
					</form>
					
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
					
					<form id='actionForm' action="/partners/applydetail" method="get">
						<input type="hidden" name='proj_id' value='${Project.proj_id}'>
						<input type="hidden" name='member_no' value='${Project.member_no}'>
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
				
				var checkForm = $("#checkForm");
				var checkArray = [];					
				var checkthis = function test() {
					$(this).attr('checked', false);
				}
				$("input[name='member_no']").change(function(){
					var member_no = $(this).val();
					var proj_id = $("input[name='proj_id']").val();
					

					
					$.ajax({
						url:"/partners/applyCheck",
						type:"post",
						data:JSON.stringify({
							member_no : member_no,
							proj_id : proj_id
						}),
						contentType : "application/json; charset=utf-8",						
						success : function(data){
							parseInt(data);
							console.log(data);
							if(data == 0){
								toastr.info("파트너스가 선택되었습니다.");
							}else{
								$(this).attr('checked', false);//중복값이면 체크해제
								toastr.warning("이미 선택된 파트너스 입니다.");
							}
							
						},
						error : function(error) {
							toastr.error("선택한 파트너스의 기존 선택 여부가 확인되지 않았습니다.");
						}
						
					})
					
					
				})

				$("input[name='member_no']:checked").each(function() {
				
					checkArray.push($(this).val());
					
					$("#chkBtn").click(function() {
						alert("파트너스 선택이 완료되었습니다.");
						checkForm.submit();
						
						
					});
					
				});
				


			});
		</script>
</body>
</html>