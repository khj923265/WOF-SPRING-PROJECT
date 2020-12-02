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
					
					<button id="allCheck" class="btn btn-default mb-3">전체선택</button>
					<button id="chkBtn" class="btn btn-default mb-3">선택한 파트너스 삭제</button>
				
					<form id="checkForm" action="applyDelete" method="post">
					<input type="hidden" name="proj_id" value="${Project.proj_id }">
					<c:forEach var="Member" items="${Member }">
						<div class="row shadow p-1 mb-3 bg-white rounded ">
						<div class="col-sm-1 my-auto">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" name="member_no" value="${Member.member_no }" style="width: 25px; height: 25px;">
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
												${Member.userid } 
												<i class="ni ni-air-baloon ml-1"></i>
																								
												<i class="ni ni-map-big ml-1"></i> ${Member.real_name }
											</span>
										</p>
										<p class="mt-3 mb-0 text-sm">
											<span class="text-nowrap"> <i class="ni ni-badge ml-1"></i>
												${Member.userPhone }
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

							<div class="col-sm-4 my-auto">
								
								<a href="${pageContext.request.contextPath }/contract/read?source_no=${Project.member_no }
								&target_no=${Member.member_no }&proj_id=${Project.proj_id }">
								<button type="button" class="btn btn-outline-default">계약서작성</button>
								</a>
								<%-- <input type="hidden" name="source_no" value="${Project.member_no }"/>
								<input type="hidden" name="target_no" value="${Member.member_no }" />
								<input type="hidden" name="proj_id" value="${Project.proj_id }" /> --%>
								
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
					
					<form id='actionForm' action="/partners/appliedpartners" method="get">
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
				
				//체크박스 클릭시 alert message
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
							  title: '파트너스가 삭제되었습니다!',
							  text: "확인버튼을 누르시면 삭제가 완료됩니다.",
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