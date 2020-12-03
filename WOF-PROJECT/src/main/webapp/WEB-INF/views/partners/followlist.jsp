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
	<%@ include file="menu.jsp"%>

	<div class="container">
		
		<div class="row">
		  <div class="col">
		  
		    <div class="row  mt-3 mb-3">
		      <div class="col">
			   <h3>관심 파트너스 관리</h3>
			  </div>
		     </div>
		     
		     <input type="hidden" value="${member.member_no}" id="source_member">
		     
		     <div class="row p-3">
			  <div class="col">			  
		     <c:forEach var="followList" items="${followList }">

			  <div class="row shadow-sm p-1 bg-white rounded mb-3 align-items-center">
			    <div class="col-1">
					<span
					class="avatar avatar-lg rounded-circle justify-content-start m-3">
					<img alt="Image placeholder"
					src="/resources/template/assets/img/theme/team-4.jpg">
				</span>				
				</div>
				<div class="col-1 text-center">				
					<c:choose>
					<c:when test="${followList.member_no == null }">								 
					  <i class="ni ni-favourite-28">
					 </c:when>
					 <c:when test="${followList.member_no != null }">
					  <i class="ni ni-favourite-28 color">
					 </c:when>								
					</c:choose>								   
					    <input type="hidden" value="${followList.member_no }">
					  </i>
					<!-- fa fa-heart-o -->
				</div>
			  <div class="col-2">
			    <c:if test="${followList.career != null }">
			    <h3><i class="ni ni-badge mr-3"></i>${followList.career }</h3>
			    </c:if>
			  </div>
			  <div class="col-3">
			    <c:if test="${followList.skill != null }">
			    <h3><i class="ni ni-chart-pie-35 mr-3"></i>${followList.skill }</h3>
			    </c:if>
			  </div>
			  <div class="col-3">
			    <c:if test="${followList.prefered_area != null }">
			    <h3><i class="ni ni-map-big mr-3"></i>${followList.prefered_area }</h3>
			    </c:if>
			  </div>
			  
			  <div class="col-2">
			    <c:choose>
				  <c:when test="${followList.birthday == null }">
					
				  </c:when>
				  
				  <c:when test="${followList.birthday != null }">
					<h3><i class="ni ni-air-baloon mr-3"></i>${followList.birthday }년생</h3>
				  </c:when>
				</c:choose>
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
					
					<form id='actionForm' action="/partners/followlist" method="get">
						<input type="hidden" name='member_no' value='${member.member_no}'>
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