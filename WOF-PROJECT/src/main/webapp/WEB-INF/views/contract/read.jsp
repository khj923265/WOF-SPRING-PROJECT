<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- toastr css 라이브러리 -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp"%>
	
	<!-- hakgeun style-->
	<style type="text/css">
		.page {
            width: 21cm;
            min-height: 29.7cm;
            padding: 2cm;
            
        }
	</style>

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
			<div class="col-sm-12 shadow p-3 mb-5 bg-white border border-dark page text-dark ">
			<h1 class="font-weight-bold text-center">SW종사자(기간제, 단시간) 표준근로계약서</h1>
			<p class="text-center">&lt; 전문 &gt;</p>
			<p class="text-center">-&nbsp;표준 근로계약서 마련 및 보급 취지&nbsp;-</p>
			<p class="p-3 border border-dark">
			소프트웨어 표준계약서는 소프트웨어산업진흥법 제2조 제4호 따른 소프트웨어사업자와 
			제5호에 따른 소프트웨어기술자가 동등한 지위에서 근로조건에 관한 세부사항을 정하고, 
			성실히 이행할 것을 목적으로 합니다.</br>
  			해당 표준 근로계약서는 SW산업에서 프로젝트 단위로 사업을 수행하는 
  			기간제근로자(「기간제 및 단시간근로자 보호 등에 관한 법률」 제2조제1호), 
  			단시간근로자(「기간제 및 단시간근로자 보호 등에 관한 법률」 제2조제2호) 
  			등과 같은 업계 종사자들의 사용을 권장하기 위해 마련되었습니다.</br>
  			소프트웨어 종사자 표준 근로계약에 있어 표준이 될 계약의 기본적이고 원칙적인 사항만을 제시하였는바, 
  			실제 근로계약을 체결하려는 계약 당사자는 이 계약서의 기본 틀과 내용을 유지하는 범위에서 
  			이 표준 근로계약서보다 더 상세하고 개별적인 사항을 계약서에 규정할 수 있습니다.</br>
  			또한 이 표준 근로계약서의 일부 내용은 현행 민법, 
  			근로기준법 및 그 시행령을 기준으로 한 것이므로 계약 당사자는 이들 법령이 개정되는 
  			경우에는 개정내용에 부합되도록 표준 근로계약서의 내용을 수정 또는 변경하여 사용할 수 있습니다.
			</p>
			<p class="text-center">-&nbsp;계약 개요&nbsp;-</p>
			
			<div class="border border-dark p-3 text-dark">
			<h3>프로젝트 명 : ${source.proj_title }</h3>
			<h3>총 프로젝트 기간</h3>
			<h4>프로젝트 시작일 : 
			<fmt:parseDate var="dt"	value="${source.proj_start_date }" pattern="yyyy-MM-dd HH:mm:ss" /> 
			<fmt:formatDate	value="${dt }" pattern="yyyy/MM/dd" />
			</h4>
			
			<h4>프로젝트 종료일 : 
			<fmt:parseDate var="dt"	value="${source.proj_end_date }" pattern="yyyy-MM-dd HH:mm:ss" /> 
			<fmt:formatDate	value="${dt }" pattern="yyyy/MM/dd" />
			</h4>
			</div>
			<p class="text-center">&lt; 본문 &gt;</p>
			<h4>제1조(목적)</h4>
			<p>본 계약은 사용자와 근로자가 동등한 지위에서 근로조건에 관한 세부사항을 정하고, 성실히 이행할 것을 목적으로 한다.</p>
			<h4>제2조(용어의 정의)</h4>
			<p>① 본 계약의 "사용자"란 사업주 또는 사업 경영 담당자, 그 밖에 근로자에 관한 사항에 대하여 사업주를 위하여 행위하는 자를 말한다.</br>
			   ② 본 계약의 "근로자"란 직업의 종류와 관계없이 임금을 목적으로 사업이나 사업장에 근로를 제공하는 자를 말한다.</p>
			<h4>제3조 (근무장소 등)</h4> 
			<p>
			① 근로자의 근무장소는 사용자의 사업장 또는 사용자가 지정하는 장소로 한다.</br>
			② 근로자는 사용자의 사업장 외의 장소에서 근무하는 경우에도 사업장에서 근무하는 것과 동일하게 사용자의 지휘, 감독에 따라 성실하게 근무하여야 한다.</br>
			③ 제2항의 경우 근로자의 근무장소가 하도급거래 공정화에 관한 법률 제2조 제2항의 원사업자의 사업장인 경우, 사용자는 원사업자가 업무수행에 필요한</br>
			    협의 외에는 근로자에게 직접 업무지시 또는 근태 등의 인사관리를 하지 않도록 적절한 조치를 취하여야 한다.
			</p>
			<h4>제4조(성실의무)</h4> 
			<p>사업주와 근로자는 각자가 근로계약, 취업규칙, 단체협약을 지키고 성실하게 이행한다.</p>
			<h4>제5조 (비밀준수 등)</h4>
			<p>근로자는 본 계약기간 중은 물론 본 계약의 종료나 해지 이후    년간 본 계약의 업무수행과정에서 알거나 취득하게 된 사용자의 영업비밀을 사용자의 동의 없이 제3자에게 제공하거나 본인 또는 제3자의 이익을 위하여 사용할 수 없다.</p>
			
			<h4>제6조 (지식재산권의 귀속)</h4>
			<p>
			① 근로자가 본 계약 제3조의 담당업무를 수행하며 만들어낸 시작품(試作品) 등 유형적 성과물 일체와 지식재산에 관한 권리는 사용자의 소유로 한다.  다만, 저작권법, 특허법 등 지식재산 관계 법령에 근로자의 권리를 인정하는 특별한 규정이 있는 경우에는 그에 따른다.</br>
			② 근로자는 사용자의 동의를 얻어 제1항의 유형적 성과물 일체와 지식재산을 사용할 수 있다.
			</p>
			
			<h4>제7조 (계약의 해지)</h4>
			<p>
			① 근로자가 근로계약을 해지하고자 하는 경우에는 근로기준법, 취업규칙 등이 정하는 절차에 따라 사용자에게 사직하고자 하는 날 30일 전 사직서를 제출하고 본계약을 종료할 수 있다.</br>
			② 사업의 종료(폐업), 당사자의 사망, 정년, 기간의 만료 등의 사유가 발생한 경우 별도의 절차 없이 본 계약은 사유 발생일로 종료한다.
			</p>
			
			<h4>제8조 (근로계약의 작성 및 교부)</h4>
			<p>
			① 사용자는 본 계약을 체결한 때, 정본 또는 사본을 근로자에게 교부하여야 한다.</br>
			② 사용자는 본 계약 체결 후 계약의 내용이 변경된 경우에도 전항의 경우와 같이 작성된 근로계약서를 교부하여야 한다. 
			</p>
			<h4>제9조 (준용)</h4>
			<p>
			본 계약에 정하지 않은 사항에 대해서는 근로기준법 등 노동관계법령이나 사용자의 취업규칙, 기타 내규에 정한 바에 따른다.  
			</p>
			<div class="text-center">
			<h1><span class="yyyy"></span>년&nbsp;<span class="MM"></span>월&nbsp;<span class="dd"></span>일</h1>
			</div>
			<div class="row">
			<div class="col-12 p-2 pl-5">
			<div class="row">
			<div class="col-3 text-right">
			<h3>(사업주)업체명 : </h3>
			<h3>사업자번호 : </h3>
			<h3>주소 : </h3>			
			<h3>담당자 : </h3>
			<h3>담당자 연락처 : </h3>
			<h3>담당자 이메일 : </h3>
			</div>
			<div class="col-5">
			<h3>${source.name } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연락처 : ${source.tel }</h3>
			<h3>${source.business_register_no }</h3>
			<h3>${source.address1 } ${source.address2 }</h3>			
			<h3>${source.real_name }</h3>
			<h3>${source.userPhone }</h3>
			<h3>${source.userid }</h3>
			</div>
			<div class="col-4 my-auto">
			<sec:authorize access="hasRole('ROLE_CLIENT')">
			<form id="sourceForm" action="/contract/sourceregister" method="post">
			<input type="hidden" name="contract_write_source" value="${source.member_no }" />
			<input type="hidden" name="related_proj" value="${source.proj_id }" />
			<input type="hidden" name="contract_write_target" value="${target.member_no }" />
			<input type="hidden" name="auth" value="${member.auth }">
			<input type="text" name="source_signature"></br>
				<button type="button" class="btn btn-outline-default">서명</button>
			</form>    
			</sec:authorize>
			
			</div>
			</div>
			<hr>
			<div class="row">
			<div class="col-3 text-right">
			<h3>(근로자) 프리랜서 성명 :</h3>
			<h3>연락처 : </h3>
			<h3>생년월일 : </h3>			
			<h3>이메일 : </h3>
			</div>
			<div class="col-5">
			<h3>${target.real_name }</h3>
			<h3>${target.userPhone }</h3>
			<h3>${target.birthday }</h3>			
			<h3>${target.userid }</h3>
			</div>
			<div class="col-4 my-auto">
			<sec:authorize access="hasRole('ROLE_PARTNERS')">
				<form id="targetForm" action="/contract/targetsignature" method="post">
				<input type="hidden" name="contract_write_source" value="${source.member_no }" />
				<input type="hidden" name="related_proj" value="${source.proj_id }" />
				<input type="hidden" name="contract_write_target" value="${target.member_no }" />
				<input type="hidden" name="auth" value="${member.auth }">
				<input type="text" name="target_signature"></br>
				<button type="button" class="btn btn-outline-default">서명</button>
			</form>
			</sec:authorize>
			</div>
			</div>
			
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
				
				var today = new Date();
				var yyyy = today.getFullYear();
				var MM = today.getMonth()+1;
				var dd = today.getDate();
				$(".yyyy").text(yyyy);
				$(".MM").text(MM);
				$(".dd").text(dd);
				
				var sourceForm = $("#sourceForm")
				
				$("#sourceForm button").on("click", function(e){
					if(!sourceForm.find("input[name='source_signature']").val()){
						toastr.info("서명이 입력되지 않았습니다!");
						return false;
					}
					Swal.fire({
						  title: '계약서에 서명하셨습니다!',
						  text: "확인버튼을 누르시면 계약이 진행됩니다.",
						  icon: 'success',
						  showCancelButton: true,
						  confirmButtonColor: '#11cdef',
						  cancelButtonColor: '#172b4d',
						  confirmButtonText: '확인',
						  cancelButtonText: '취소'
						}).then((result) => {
						  if (result.isConfirmed) {
							  sourceForm.submit();
						  }
						})
					
				})
				
				var targetForm = $("#targetForm")
				
				$("#targetForm button").on("click", function(e){
					if(!sourceForm.find("input[name='target_signature']").val()){
						toastr.info("서명이 입력되지 않았습니다!");
						return false;
					}
					Swal.fire({
						  title: '계약서에 서명하셨습니다!',
						  text: "확인버튼을 누르시면 계약이 진행됩니다.",
						  icon: 'success',
						  showCancelButton: true,
						  confirmButtonColor: '#11cdef',
						  cancelButtonColor: '#172b4d',
						  confirmButtonText: '확인',
						  cancelButtonText: '취소'
						}).then((result) => {
						  if (result.isConfirmed) {
							  targetForm.submit();
						  }
						})
					
				})
				
				
			});
		</script>
</body>
</html>