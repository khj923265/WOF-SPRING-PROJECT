<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- toastr css 라이브러리 -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp"%>

	<!-- Main Content -->
	<!-- top start-->
	<div class="main-content" id="panel">

	<!-- Sub menu -->
	<%@ include file="menu.jsp"%>

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
			<div class="col-sm-12 shadow-lg p-4 pl-5 mb-5 bg-white rounded ">
			<div class="row mb-4">
			  <div class="col-12">			  	
				<h2><i class="ni ni-folder-17 mr-3 text-yellow"></i>${Project.proj_title }</h2>
			  </div>
			</div>
				<input type="hidden" value="${Project.member_no }">
				
			<div class="row mb-4">
			<div class="col-3">			
				<h3><i class="ni ni-calendar-grid-58 mr-3 text-info"></i>프로젝트 등록일</h3>
				<h3 class="ml-4 pl-2"><fmt:parseDate var="dt"	value="${Project.proj_reg_date }" pattern="yyyy-MM-dd HH:mm:ss" /> 
				<fmt:formatDate	value="${dt }" pattern="yyyy/MM/dd" />
				</h3>
			</div>
			<div class="col-3">	
				<h3><i class="ni ni-calendar-grid-58 mr-3 text-info"></i>지원 마감일</h3>
				<h3 class="ml-4 pl-2">
				<fmt:parseDate var="dt"	value="${Project.proj_apply_deadline }" pattern="yyyy-MM-dd HH:mm:ss" /> 
				<fmt:formatDate	value="${dt }" pattern="yyyy/MM/dd" />				
				</h3>
				<h3>
				<fmt:parseDate value="2020-12-04" var="strPlanDate" pattern="yyyy-MM-dd"/>
                <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                <fmt:parseDate value="${project.getProj_apply_deadline()}" var="endPlanDate" pattern="yyyy-MM-dd"/>
                <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
				<span class="text-red">마감  ${endDate - strDate}일 전</span>
				</h3>
			</div>
			<div class="col-3">
				<h3><i class="ni ni-calendar-grid-58 mr-3 text-info"></i>프로젝트 시작일</h3>
				<h3 class="ml-4 pl-2">
				<fmt:parseDate var="dt"	value="${Project.proj_start_date }" pattern="yyyy-MM-dd HH:mm:ss" /> 
				<fmt:formatDate	value="${dt }" pattern="yyyy/MM/dd" />
				</h3>
			</div>
			<div class="col-3">
				<h3><i class="ni ni-calendar-grid-58 mr-3 text-info"></i>프로젝트 종료일</h3>
				<h3 class="ml-4 pl-2">
				<fmt:parseDate var="dt"	value="${Project.proj_end_date }" pattern="yyyy-MM-dd HH:mm:ss" /> 
				<fmt:formatDate	value="${dt }" pattern="yyyy/MM/dd" />
				</h3>
			</div>
			</div>
			
			<div class="row mb-4">
			  <div class="col-3">
			    <h3><i class="ni ni-money-coins mr-3 text-success"></i>프로젝트 예산</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_estimate }원</h3>
			  </div>
			  <div class="col-3">
			    <h3><i class="ni ni-single-02 mr-3 text-success"></i>필요인원</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_reqr_person }</h3>
			  </div>
			  <div class="col-3">
			    <h3><i class="ni ni-settings-gear-65 mr-3 text-success"></i>필요기술</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_reqr_skill }</h3>
			  </div>
			  <div class="col-3">
			    <h3><i class="ni ni-notification-70 mr-3 text-success"></i>모집요건</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_career }</h3>
			  </div>			  
			</div>
			
			<div class="row">
			  <div class="col-3">
			    <h3><i class="ni ni-briefcase-24 mr-3 text-primary"></i>근무형태</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_work_type }</h3>
			  </div>
			  <div class="col-3">
			    <h3><i class="ni ni-square-pin mr-3 text-primary"></i>근무장소</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_work_place }</h3>
			  </div>
			  <div class="col-3">
			    <h3><i class="ni ni-watch-time mr-3 text-primary"></i>근무시간</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_work_time }</h3>
			  </div>
			  <div class="col-3">
			    <h3><i class="ni ni-laptop mr-3 text-primary"></i>장비제공</h3>
			    <h3 class="ml-4 pl-2">${Project.proj_work_equip }</h3>
			  </div>			
			</div>
			
			</div>
			</div>
			

				<!-- 파트너스리스트 -->
				<div class="row">
				<div class="col-sm-12">
				
					<button id="allCheck" class="btn btn-default mb-3">전체선택</button>
					<button id="chkBtn" class="btn btn-default mb-3">선택한 파트너스 등록</button>
					
					<form id="checkForm" action="applyRegister" method="post">
					<input type="hidden" name='proj_id' value='${Project.proj_id}'>
					<input type="hidden" name="source_no" value="${member.member_no }">
					<c:forEach var="Partners" items="${Partners }">
						<div class="row shadow p-1 mb-3 bg-white rounded ">
						
						<div class="col-1 my-auto">
						<div class="custom-control custom-checkbox">
						<c:choose>
						<c:when test="${Partners.applied_member == null }">
							<input type="checkbox" name="member_no" value="${Partners.member_no }" 
							style="width: 25px; height: 25px;">
						</c:when>
						<c:when test="${Partners.applied_member != null }">
							<input type="checkbox" name="member_no" value="${Partners.member_no }"   disabled="disabled"
							style="width: 25px; height: 25px;">
						</c:when>
						</c:choose>
						</div>
						</div>
						
						
							<div class="col-1 my-auto">
									<span
										class="avatar avatar-lg rounded-circle justify-content-start m-3">
										<img alt="Image placeholder"
										src="/resources/template/assets/img/theme/team-4.jpg">
									</span>
								</div>
								
								
								<div class="col-5 ml-3">
															
								  <div class="row mt-3 mb-0 text-sm text-nowrap">								  
								    <div class="col-4">
										<c:if test="${Partners.birthday != null }">
										<i class="ni ni-air-baloon ml-1 mr-1"></i>${Partners.birthday }년생 
										</c:if>
									</div>
									<div class="col-8">
									    <c:if test="${Partners.prefered_area != null }">
										<i class="ni ni-map-big ml-1 mr-1"></i> ${Partners.prefered_area }
										</c:if>
									</div>
								  </div>
									
									<div class="row mt-3 mb-0 text-sm text-nowrap">
									  <div class="col-4">
										<c:if test="${Partners.career != null }">
										<i class="ni ni-badge ml-1 mr-1"></i>${Partners.career }
										</c:if>
									  </div>
									  <div class="col-8">
										<c:if test="${Partners.skill != null }">
										<i class="ni ni-chart-pie-35 ml-1 mr-1"></i>${Partners.skill }
										</c:if>
									  </div>
									</div>
									
									<div class="row">
									<div class="col-12">
									
										<p class="mt-3 mb-3 text-sm">
											<span class="text-nowrap"> 
											<c:if test="${Partners.hashtag != null }">
											<i class="ni ni-tag ml-1 mr-1"></i>
												<span class="badge badge-primary">${Partners.hashtag }</span>
											</c:if>
											</span>
										</p>
									</div>	
									</div>
									
									</div>
									
									<div class="col-4 my-auto">
									<c:if test="${Partners.applied_member != null }">
										<h3><i class="ni ni-check-bold"></i>
											<span class="badge badge-pill badge-info">이미 선택한 파트너스 입니다.</span>
										</h3>
									</c:if>
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
		
		<!-- SweetAlert2 library -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
			
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
				
				//전체선택 버튼 - 기존에 선택된 버튼이 있으면 해제되고 한번 더 누르면 전체선택됨 - 수정해야함.
				$("#allCheck").click(function(){
					if($("input[name='member_no']").is(':checked')){
						$("input[name='member_no']").prop("checked", false);
					}else{
						$("input[name='member_no']").prop("checked", true);
					}
				})
				
				//체크박스 클릭시 alert message - 전체선택후 해제시 선택메시지만 뜸. 수정해야함
				$("input[name='member_no']").click(function(){
					if($("input[name='member_no']").is(":checked") == true){
						toastr.success("파트너스가 선택되었습니다.");						
					}else{
						toastr.info("파트너스 선택이 해제되었습니다.");
					}					
				})

				//submit 버튼
				$("#chkBtn").click(function() {
					if($("input[name='member_no']").is(":checked") == true){
						$("input[name='member_no']:checked").each(function() {
						
							checkArray.push($(this).val());
							
						});
						Swal.fire({
							  title: '파트너스가 등록되었습니다!',
							  text: "확인버튼을 누르시면 등록이 완료됩니다.",
							  icon: 'success',
							  showCancelButton: true,
							  confirmButtonColor: '#11cdef',
							  cancelButtonColor: '#172b4d',
							  confirmButtonText: '확인',
							  cancelButtonText: '취소'
							}).then((result) => {
							  if (result.isConfirmed) {
								  checkForm.submit();
							  }
							})
					}else{
						toastr.error("선택된 파트너스가 없습니다. 파트너스를 선택해주세요!");
						return false;
					}
				});
				
			});
		</script>
</body>
</html>