<%@ include file="../includes/header.jsp" %>
    
	<div class="header pb-6 container">
      <div class="container-fluid">
        <div class="header-body text-right ">
          <div class="row py-4">
            <div class="col-lg-6 col-7">
	          <form class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
            <div class="form-group mb-0">
              <div class="input-group input-group-alternative input-group-merge mr-2">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-search"></i></span>
                </div>
                <input class="form-control" placeholder="Search" type="text">
              </div>
               <button type="button" class="btn btn-secondary">Search</button>
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
    <!-- Card body -->
    <div class="ml-3 mt-3 mb-3 card-body">
        
<div class="row">
    <div class="col-12 row text-center ">
        <h2 class="card-title text-uppercase text-muted mb-0 mr-2"><a href="#">Android App Mobile Service</a></h2>
        <form>
     	<input type="hidden" value="project1" name="related_proj" id="related_proj" >
     	<!-- value="${project.getProj_id()}" -->
     	<button id="followButton" type="button" onclick="followProject()">like</button>
        </form>
        
    </div>
    </div>
   	   
    <p class="mt-3 mb-0 text-sm"> 
    <i class="ni ni-check-bold mr-3"></i><span class="text-success mr-2">developer</span>
   <i class="ni ni-key-25 mr-3"></i><span class="text-success mr-2">3,000,000 won</span>
	</p>
	
	<p class="mt-3 mb-0 text-sm">
    <i class="ni ni-single-02 mr-3"></i><span class="text-success mr-2">3 people</span>
   <i class="ni ni-time-alarm mr-3"></i><span class="text-success mr-2">5MONTHS</span>
   <i class="ni ni-compass-04 mr-3"></i><span class="text-success mr-2">NEWYORK</span>
	</p>

    <div class="mt-3 mr-3 text-sm">
    <span class="text-nowrap">Argon perfectly combines reusable HTML and modular <br>
    CSS with a modern styling and beautiful markup<br>
     throughout each HTML template in the pack. Argon perfectly combines reusable HTML<br>
     and modular CSS with a modern styling and beautiful markup throughout <br>
    each HTML template in the pack.</span>
	</div>
	<p class="mt-3 mb-0 text-sm">
   <i class="ni ni-chart-bar-32 mr-3"></i><span class="text-success mr-2">3ëªì§ì</span>
	</p>
</div>
	
    <!-- Card body -->
	<c:forEach var="project" items="${projects}">
    <div class="ml-3 mt-3 mb-3 card-body">		
	<div class="row">
    <div class="col-12 row text-center ">
        <h2 class="card-title text-uppercase text-muted mb-0 mr-2"><a href="#">${project.proj_title}</a></h2>
        <span class="justify-content-center"> 
        <i class="ni ni-favourite-28 mt-2"> 
        <input type="hidden" value="${project.proj_id}">
        </i>
        </span>
    </div>
    
    <!-- 								 -->
    </div>
    <p class="mt-3 mb-0 text-sm">
    <i class="ni ni-check-bold mr-3"></i><span class="text-success mr-2">${project.proj_career}</span>
   <i class="ni ni-key-25 mr-3"></i><span class="text-success mr-2">${project.proj_walfare} ì</span>
	</p>
	
	<p class="mt-3 mb-0 text-sm">
    <i class="ni ni-single-02 mr-3"></i><span class="text-success mr-2">${project.proj_reqr_person}ëª</span>
   <i class="ni ni-time-alarm mr-3"></i><span class="text-success mr-2">${project.proj_work_time}</span>
   <i class="ni ni-compass-04 mr-3"></i><span class="text-success mr-2">${project.proj_work_place}</span>
	</p>

    <div class="mt-3 mr-3 text-sm">
    <span class="text-nowrap">${project.proj_detail}</span>
	</div>
	
	<p class="mt-3 mb-0 text-sm">
   <i class="ni ni-chart-bar-32 mr-3"></i><span class="text-success mr-2">0 apply </span>
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
	 .red {
	 	color : red;
	 }
	</style>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script type="text/javascript">
	
 	$(function() {
 		
		$(".ni-favourite-28").click(function() {
			$(this).toggleClass("red");
			var related_project = $(this).find("input").val();
			if ($(this).hasClass("red")) { 
				alert("add"+related_project );
				$.ajax({
					url : "follwProject/"+related_project,
					type : "POST",
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
					url : "follwProject/"+related_project,
					type : "DELETE",
					success : function(result) {
						alert(result);
					},
					error : function(error) {
						alert(error);
					}
					})
				}
			
		})
}); 
</script>