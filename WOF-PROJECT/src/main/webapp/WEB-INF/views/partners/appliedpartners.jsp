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
				<h3>계약현황</h3>
			</div>

			<!-- 프로젝트별 계약현황 -->
			<div class="row">
			<div class="col-sm-12">
			

				<!-- 파트너스리스트 -->
				<div class="row">
				<div class="col-sm-12">
					
					<button id="allCheck" class="btn btn-default mb-3">전체선택</button>
					<button id="chkBtn" class="btn btn-default mb-3">선택한 파트너스 삭제</button>
				
					<form id="checkForm" action="applyDelete" method="post">
					<input type="hidden" name="source_no" value="${member.member_no }">
					<c:forEach var="appliedpartners" items="${appliedpartners }">
					<c:if test="${appliedpartners.member_no != null }">
						<div class="row shadow p-1 mb-3 bg-white rounded ">
						<div class="col-sm-1 my-auto">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" name="member_no" value="${appliedpartners.member_no }" style="width: 25px; height: 25px;">
							<input type="hidden" name="proj_idArr" value="${appliedpartners.proj_id }">
							<input type="hidden" name="proj_id" id="proj_id">
						</div>
						</div>
							<div class="col-sm-1">
								<div class="row align-items-center">
								
									<span
										class="avatar avatar-lg rounded-circle justify-content-start m-3">
										<img alt="Image placeholder"
										src="/resources/template/assets/img/theme/team-4.jpg">
									</span> 
								</div>	 
							</div>
							<div class="col-6">
								<div class="row">
								<div class="col-12 align-items-center mt-3">
							     <i class="ni ni-email-83 mr-2 text-info"></i></span>${appliedpartners.userid }											
								 <i class="ni ni-single-02 ml-3 mr-2 text-pink"></i> ${appliedpartners.real_name }
								 <i class="ni ni-caps-small ml-3 mr-2 text-muted"></i>${appliedpartners.userPhone }
								 </div>
								</div>
								<div class="row">
								<div class="col-12">
								 <i class="ni ni-folder-17 mt-3 mr-2 text-yellow"></i>${appliedpartners.proj_title }
							  </div>
								</div>
							</div>

							<div class="col-sm-4 my-auto">
								<c:choose>
								  <c:when test="${appliedpartners.contract_write_target == null }">
									<a href="${pageContext.request.contextPath }/contract/read?source_no=${member.member_no }
									&target_no=${appliedpartners.member_no }&proj_id=${appliedpartners.proj_id }">
									<button type="button" class="btn btn-outline-default">계약서작성</button>
									</a>
								  </c:when>
										  
								  <c:when test="${appliedpartners.contract_write_source != null }">
									<p class="mt-3 mb-3 text-sm">
											<h1><span class="text-nowrap"> <i class="ni ni-single-copy-04 mr-2 text-primary"></i>
												<span class="badge badge-pill badge-primary">계약이 진행중 입니다.</span>
											</span></h1>
										</p>
								  </c:when>
								</c:choose>
								
								<%-- <input type="hidden" name="source_no" value="${Project.member_no }"/>
								<input type="hidden" name="target_no" value="${Member.member_no }" />
								<input type="hidden" name="proj_id" value="${Project.proj_id }" /> --%>
								
							</div>

						</div>
					</c:if>
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
					
						$("input[name='member_no']:checked").each(function(index) { 
						
							checkArray.push($(this).next().val());
						
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
								  $("#proj_id").val(checkArray);
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