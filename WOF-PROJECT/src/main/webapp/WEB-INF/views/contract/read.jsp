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
	<%@ include file="../partners/menu.jsp"%>

		<!--제목 및 내용 -->
		<div class="container">
			<!-- 제목 -->
			<div class="row mt-3">
				<h3>계약서 작성</h3>
			</div>

			<!-- 프로젝트내용 및 지원 파트너스 리스트 -->
			<div class="row">
			<div class="col-sm-12 shadow p-3 mb-5 bg-white border">
				계약프로젝트
				
				계약자
				사업주
				프리랜서(근로자)
			
			
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