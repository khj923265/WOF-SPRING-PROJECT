<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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


	<!-- Main Content -->
	<!-- top start-->
	<div class="main-content" id="panel">
	
	<!-- Sub menu -->
	<%@ include file="menu.jsp"%>

	<!--제목 및 내용 -->
		<div class="container">
			<!-- 제목 -->
			<div class="row mt-3">
				<h3>파트너스 찾기</h3>
			</div>
			<div class="row mb-3">
				<div class="col-lg-3 col-3"></div>
				<div class="col-lg-6 col-7">
					<form class="navbar-search navbar-search-light form-inline mr-sm-3"
						id="navbar-search-main">
						<div class="form-group mb-0">
							<div
								class="input-group input-group-alternative input-group-merge mr-2">
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

			<!-- 체크박스 및 파트너스 리스트 -->
			<div class="row">
				<!-- 체크박스 -->
				<div class="col-sm-3">
					<div class="row mr-2 bg-white">
						<div class="col-sm-12">
							<h3 class="mt-3 p-1">전문분야</h3>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1"> <label class="custom-control-label"
									for="customCheck1">프론트 엔드</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck2"> <label class="custom-control-label"
									for="customCheck2">백 엔드</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck3">PL</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck4"> <label class="custom-control-label"
									for="customCheck4">PM</label>
							</div>
							<h3 class="mt-3 p-1">경력</h3>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck5"> <label class="custom-control-label"
									for="customCheck5">1~3년차</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck6"> <label class="custom-control-label"
									for="customCheck6">4~6년차</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck7"> <label class="custom-control-label"
									for="customCheck7">6년차 이상</label>
							</div>
							`
						</div>
					</div>
				</div>

				<!-- 파트너스리스트 -->
				<div class="col-sm-9">
				
				<input type="hidden" value="${member.member_no }" id="source_member">
				
					<c:forEach var="partnersList" items="${partnersList }">
						<div class="row shadow-sm p-1 bg-white rounded mb-3">
							<div class="col-sm-7">
								<div class="row align-items-center">

									<span
										class="avatar avatar-lg rounded-circle justify-content-start m-3">
										<img alt="Image placeholder"
										src="/resources/template/assets/img/theme/team-4.jpg">
									</span> <span class="justify-content-center">
										<p class="mt-3 mb-0 text-sm">
											<span class="text-nowrap"> <i class="ni ni-circle-08"></i>
												${partnersList.real_name } 
												<i class="ni ni-air-baloon ml-1"></i>
																								
												<c:if test="${partnersList.birthday != null }">
												${partnersList.birthday }년생 
												</c:if>												
												
												<i class="ni ni-map-big ml-1"></i> ${partnersList.prefered_area }
											</span>
										</p>
										<p class="mt-3 mb-0 text-sm">
											<span class="text-nowrap"> <i class="ni ni-badge ml-1"></i>
												${partnersList.career } <i
												class="ni ni-chart-pie-35 ml-1"></i>
												${partnersList.skill }
											</span>
										</p>
										<p class="mt-3 mb-3 text-sm">
											<span class="text-nowrap"> <i class="ni ni-tag ml-1"></i>
												<span class="badge badge-primary">${partnersList.hashtag }</span>
											</span>
										</p>
									</span>
								</div>
							</div>

							<div class="col-sm-1 text-center">
								<span class="justify-content-center">
								<c:choose>
								<c:when test="${partnersList.target_member == null }">								 
								  <i class="ni ni-favourite-28 mt-2">
								 </c:when>
								 <c:when test="${partnersList.target_member != null }">
								  <i class="ni ni-favourite-28 mt-2 color">
								 </c:when>								
								</c:choose>								   
								    <input type="hidden" value="${partnersList.member_no }">
								  </i>
								<!-- fa fa-heart-o -->
								</span>
							</div>

							<div class="col-sm-4">
								<div class="progress-wrapper mt-4">
									<div class="progress-info">
										<div class="progress-label">
											<span>현재 프로젝트 진행도</span>
										</div>
										<div class="progress-percentage">
											<span>60%</span>
										</div>
									</div>
									<div class="progress">
										<div class="progress-bar bg-info" role="progressbar"
											aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
											style="width: 60%;"></div>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>
					
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
					
					<form id='actionForm' action="/partners/list" method="get">
						<input type="hidden" name='member_no' value='${member.member_no}'>
						<input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}'>
						<input type="hidden" name='amount' value = '${pageMaker.standard.amount}'>
					</form>

				</div>
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
					var clickThis = $(this);//하트 색 토글을 위해 클릭된 i 테그를 변수에 담음.
					
					//로그인 아이디 널 또는 공백체크					
					if(source_member != null && source_member != ""){					
					//var state = false;//완료상태 확인
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
							
							//stats = true;//직전 작업 완료여부 확인
							//if(state){//직전 작업 완료여부 확인
								
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
							
							//state = false;
						/* }else{
							toastr.error("관심파트너스에 대한 중복체크가 완료되지 않았습니다.");
							state = false;
						}//end if state */
						
						}//end success
						,
						error : function(error) {
							toastr.error("관심 파트너스의 중복체크중 오류가 발생하였습니다.");
						}
					})//end check ajax
				
				}else{
					toastr.info("관심파트너스를 추가하시려면 로그인 해주세요.");
				}
		
				})//end click				
			})
		</script>
</body>
</html>