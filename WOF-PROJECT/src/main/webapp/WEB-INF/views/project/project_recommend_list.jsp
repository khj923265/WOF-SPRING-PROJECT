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
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'S'?'selected':''}"/>>서울</option>
								<option value="L"
									<c:out value="${pageMaker.cri.type eq 'K'?'selected':''}"/>>경기</option>
								<option value="S"
									<c:out value="${pageMaker.cri.type eq 'B'?'selected':''}"/>>부산</option>
							</select> 
							<input class="form-control is-valid" type='text' name='keyword' placeholder="Search"
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-secondary'>Search</button>
							</div>
							</div>
						</form>
					</div>
					</div>
					</div>
				</div>
				</div>
	
    <!-- ì¶ì² íë¡ì í¸ -->
    
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
               	 JAEEUN 
                </h5>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-24 mr-2"></i>jaeeunxo1@naver.com
                </div>
                <div>
                  <i class="ni education_hat mr-2"></i>University of Computer Science
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
              <h3 class="mb-0">Recommend Project List</h3>
            </div>
            <!-- card body -->
            <div class="card card-stats">

	<c:forEach var="project" items="${projects}">
    <div class="ml-3 mt-3 mb-3 card-body">		
	<div class="row">
    <div class="col-12 row text-center ">
        <h2 class="card-title text-uppercase text-muted mb-0 mr-2"><a href="#">${project.proj_title}</a></h2>
        <form>
        <span class="justify-content-center"> 
        <i class="ni ni-favourite-28 mt-2">      
        <input type="hidden" value="${project.proj_id}">
        <input tpye="hideen" value="${partner.userId}" id="related_member">      
        </i>
        </span>
         </form>
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
    <span class="text-nowrap">${project.proj_detail}</span>
	</div>
	
	<p class="mt-3 mb-0 text-sm">
   <i class="ni ni-chart-bar-32 mr-3"></i><span class="text-success mr-2">0 apply </span>
	</p>
</div>
 </c:forEach>

  </div>

  </div>
       				<div class='pull-right'>
					<ul class="pagination">
   					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="/project/recommend_list?pageNum=${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="/project/recommend_list?pageNum=${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="/project/recommend_list?pageNum=${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!--  end Pagination -->
				<form id='actionForm' action="/project/recommend_list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type}"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword}"/>'>
				</form>
</div>
   </div>

</div>
  </div>
  </div>
<%@ include file="../includes/footer.jsp" %>

	<style type="text/css">
	 .red {
	 	color : red;
	 }
	</style>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script type="text/javascript">	
 	$(function() {
 		//관심 프로젝트 ajax 
 		$(".ni-favourite-28").click(function() {
			$(this).toggleClass("red");
			var vo = {
					related_project = $(this).find("input").val();
					
			}
			var related_project = $(this).find("input").val();
			if ($(this).hasClass("red")) { 
				alert("add"+related_project );
				$.ajax({
					url : "/follwProject/"+related_project,
					type : "POST",
					data : 
					success : function(result) {
						alert(result);
					},
					error : function(error) {
						alert(error);
					}
				})
			}
			else {
				alert("delete"+ related_project);
				$.ajax({
					url : "/follwProject/"+related_project,
					type : "DELETE",
					success : function(result) {
						alert(result);
					},
					error : function(error) {
						alert(error);
					}
					})
				}
			
		});
 		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
					e.preventDefault();
					console.log('click');
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
		
		
}); 
</script>