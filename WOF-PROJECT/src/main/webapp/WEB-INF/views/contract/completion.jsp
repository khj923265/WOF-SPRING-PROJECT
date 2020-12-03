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
	<%@ include file="../includes/header.jsp"%>


	<!-- Main content -->
	<div class="main-content" id="panel">
	
	<!-- Sub menu -->
	<%@ include file="../partners/menu.jsp"%>

	<div class="container">
		
		<div class="row">
		  <div class="col">
		  
		    <div class="row  mt-3 mb-3">
		      <div class="col">
			   <h3>계약완료 목록</h3>
			  </div>
		     </div>
		     
		     <input type="hidden" value="${member.member_no}" id="source_member">
		     
		     <div class="row p-3">
			  <div class="col">			  
		     <c:forEach var="completion" items="${completion }">

			  <div class="row shadow-sm p-3 bg-white rounded mb-3">
			    <div class="col-4">
					<h3><i class="ni ni-folder-17 mr-3"></i>프로젝트 명</h3>
					<h3>${completion.proj_title }</h3>
				</div>
				<div class="col-2">				
					<h3><i class="ni ni-calendar-grid-58 mr-3"></i>계약 체결일</h3>
					<h3><fmt:parseDate var="dt"	value="${completion.contract_reg_date }" pattern="yyyy-MM-dd HH:mm:ss" /> 
					<fmt:formatDate	value="${dt }" pattern="yyyy/MM/dd" />
					</h3>
				</div>
			  <div class="col-2">
			    <h3><i class="ni ni-single-02 mr-3"></i>계약자</h3>
			    <h3>${completion.sourceName }</h3>
			    <h3>${completion.targetName }</h3>
			  </div>
			  <div class="col-2">
			    <h3><i class="ni ni-caps-small mr-3"></i>연락처</h3>
			    <h3>${completion.sourcePhone }</h3>
			    <h3>${completion.targetPhone }</h3>
			  </div>
			  <div class="col-2">
			    <h3><i class="ni ni-active-40 mr-3"></i>서명</h3>
			    <h3>${completion.source_signature }</h3>
			    <h3>${completion.target_signature }</h3>
			  </div>
			  
			  </div> 
			</c:forEach>
			  </div>
			 </div>
			 
			 
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
					
					<form id='actionForm' action="/contract/completion" method="get">
						<input type="hidden" name='member_no' value='${member.member_no}'>
						<input type="hidden" name="auth" value="${member.auth }">
						<input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}'>
						<input type="hidden" name='amount' value = '${pageMaker.standard.amount}'>
					</form>
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

			})
		</script>
</body>
</html>