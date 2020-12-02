<%@ include file="../includes/header.jsp" %>
	<div class="header pb-6 container">
      <div class="container-fluid">
        <div class="header-body text-right ">
          <div class="row py-4">
            <div class="col-lg-6 col-7">
	          <form action="/project/recommend_list" class="navbar-search navbar-search-light form-inline mr-sm-3" id="searchForm">
            <div class="form-group mb-0">
				<div class='row'>
							<select name='type'>
								<option value=""></option>
							</select> 
							<button class='btn btn-secondary'>Search</button>
							</div>
							</div>
						</form>
					</div>
					</div>
					</div>
				</div>
				</div>

    <div class="container">
    <div class="row justify-content-center">
    <div class="col-4">
    
        <div class="container-fluid mt--6">
      <div class="row">
          <div class="card card-profile">
		 <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
              <div class="d-flex justify-content-between">
              </div>
            </div>
            <div class="card-body pt-0">
            <div class="container">
              <div class="row col justify-content-center">
	              <div class="col-lg-3 order-lg-2">
              </div>
            </div>	           
              <div class="row">
                <div class="col">
                </div>
              </div>
              <div class="text-center">
                <h5 class="h3">
               	 ${member.real_name} 
                </h5>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-24 mr-2"></i> ${member.userid} 
                </div>
                <div>
                  <i class="ni education_hat mr-2"></i>${member.userphone}
                </div>             
              </div>
              </div>    
            </div>           
          </div>      
        </div>
              
        </div>        
        </div>      
    
	<!-- list -->
    <div class="col-8 container-fluid mt--6">
      <div class="row">
        <div class="col">
          <div class="card">
            <!-- Card header -->
            <div class="card-header border-0">
              <h3 class="mb-0">Recommend project List</h3>
            </div>
            <!-- card body -->
					
						<!-- pagination -->
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-end">
										<c:if test="${pageDto.prev }">
											<li class="page-item">
												<a class="page-link" href="${pageDto.startPage - 1 }" tabindex="-1">
												<i class="fa fa-angle-left"></i>
												<span class="sr-only">Prev</span>
												</a>
											</li>
										</c:if>
	
										<c:forEach var="num" begin="${pageDto.startPage}" end="${pageDto.endPage }">
											<li class="page-item ${pageDto.standard.pageNum == num ? 'active':'' }">
												<a class="page-link" href="${num}">
												<c:out value="${num }" />
												</a>
											</li>
										</c:forEach>
										
										<c:if test="${pageDto.next }">
											<li class="page-item">
												<a class="page-link" href="/project/project_recommend_list/${pageDto.endPage + 1 }">
												<i class="fa fa-angle-right"></i>
												<span class="sr-only">Next</span>
												</a>
											</li>
										</c:if>
									</ul>
								</nav>
								
								<form id="pagingActionForm" action="/project/project_recommend_list" method="get">
									<input type="hidden" name="pageNum" value="${pageDto.standard.pageNum}">
									<input type="hidden" name="amount" value="${pageDto.standard.amount}">
								</form>
								<!-- pagination -->
            
            
            <div class="card card-stats">
	
	
	<c:forEach var="project" items="${projects}">
	
	
    <div class="ml-3 mt-3 mb-3 card-body">		
	<div class="row">
    <div class="col-12 row text-center ">
    
        <h2 class="card-title text-uppercase text-muted mb-0 mr-2"><a href="#">${project.proj_title}</a></h2>

		<span class="justify-content-center">           
        <i class="ni ni-favourite-28 mt-2 " >    
        <input type="hidden" id ="projectId" value="${project.proj_id}" >
        <input type="hidden" id="memberId" value="${member.member_no}" >     
        </i>   
        </span>
		       
    </div>
    </div>
    <p class="mt-3 mb-0 text-sm">
    <i class="ni ni-check-bold mr-3"></i><span class="text-success mr-2">${project.proj_career}</span>
   <i class="ni ni-key-25 mr-3"></i><span class="text-success mr-2">${project.proj_estimate}won</span>
	</p>
	
	<p class="mt-3 mb-0 text-sm">
    <i class="ni ni-single-02 mr-3"></i><span class="text-success mr-2">${project.proj_reqr_person}</span>
   <i class="ni ni-time-alarm mr-3"></i><span class="text-success mr-2">${project.proj_work_time}</span>
   <i class="ni ni-compass-04 mr-3"></i><span class="text-success mr-2">${project.proj_work_place}</span>
	</p>

    <div class="mt-3 mr-3 text-sm d-flex">
<c:set var="TextValue" value="${project.getProj_detail()}" />
${fn:substring(TextValue,0,60)}<br>${fn:substring(TextValue,61,120)}
<br>${fn:substring(TextValue,121,180)}<br>${fn:substring(TextValue,181,240)}
<br>${fn:substring(TextValue,241,300)} <br>${fn:substring(TextValue,301,360)}...

</div>
	
	<p class="mt-3 mb-0 text-sm">
   <i class="ni ni-chart-bar-32 mr-3"></i><span class="text-success mr-2">${project.apply_mem} people </span>
	</p>
</div>

</c:forEach>
	
  
  </div>

  </div>
</div>
   </div>

</div>
  </div>
  </div>
  
   
<%@ include file="../includes/footer.jsp" %>

	<style type="text/css">
	 .color {
	 	color : #5e72e4;
	 }
	</style>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">	
 	$(function() {
 		
 	//프로젝트 목록	
	$(document).ready(function() {
			var pagingActionForm = $("#pagingActionForm");
			
			$(".page-item a").on("click", function(e) {
				e.preventDefault();
				
				pagingActionForm.find("input[name='pageNum']").val($(this).attr("href"));
				pagingActionForm.submit();
			});

		});	
 		//관심 프로젝트 ajax 
 		$(".ni-favourite-28").click(function() {
			$(this).toggleClass("color");
			var related_project = $(this).find('#projectId').val();
			var related_member = $(this).find('#memberId').val();
			
			if ($(this).hasClass("color")) {
				$.ajax({
					url : "/followYes/"+related_project,
					type : "POST",
					data :{
						'related_member' : related_member
					},
					dataType : "json",
					success : function(result) {
						swal(
		                        "Add favorite Project!",
		                        "success"
		                    );
						
					},
					error : function(error) {
						alert(error);
					}
				})
			}else {
				$.ajax({
					url : "/followNo/"+related_project,
					type : "delete",
					data :{
						'related_member' : related_member
					},
					success : function(result) {
						swal(
		                        "Delete favorite project!",
		                        "success"
		                    );
					},
					error : function(error) {
						alert(error);
					}
					})
				}
		});		
}); 
</script>
		
