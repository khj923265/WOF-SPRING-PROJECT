<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!-- Header & Menu -->
	<%@include file="../includes/header.jsp"%>
	<!-- Main content -->
	<div class="main-content" id="panel">
		<!-- Page content -->
		<div class="container-fluid mt-10">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="row align-items-center">
								<div class="col-8">
									<h1 class="mb-0">프로젝트 관리</h1>
								</div>
								<div class="col-4 text-right">
								</div>
							</div>
						</div>
						<div class="card-body">
							
							<div class="col-md-12 form-inline">
								<div class="card card-profile col-md-6">

									<div class="row justify-content-center">
										<div class="col-lg-3 order-lg-2">
											<div class="card-profile-image">
											</div>
										</div>
									</div>
									<div
										class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
									</div>
									<div class="card-body pt-0">
										<div class="row">
											<div class="col">
												<div
													class="card-profile-stats d-flex justify-content-center">
													<div>
														<span class="heading">${member.real_name}</span> 
														<span class="description">회원 </span>
													</div>
													<div>
														<span class="heading">${partners.skill}</span>
														 <span class="description">주요기술</span>
													</div>
													<div>
														<span class="heading">${partners.career}</span> 
														<span class="description">지역</span>
													</div>
												</div>
											</div>
										</div>
										
									<div class="row mt-3">
											<div class="col">
												<div
													class="card-profile-stats d-flex justify-content-center">
													<div>
														<input type="hidden" id="meet_req_mem" value="${member.member_no}">
														<span class="heading">${member.real_name}</span> 
														<span class="description">회원 </span>
													</div>
													<div>
														<span class="heading">${partners.skill}</span>
														 <span class="description">주요기술</span>
													</div>
													<div>
														<span class="heading">${partners.career}</span> 
														<span class="description">지역</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									

									<div id='calendar'></div>

									
								</div>
							</div>
							<hr class="my-4" />
							<!-- Address -->
							<h6 class="heading-small text-muted mb-4">일정</h6>
							<div>
								<ul
									class="nav nav-pills nav-fill flex-column flex-sm-row col-12"
									id="tabs-text" role="tablist">
									<li class="nav-item col-3"><a
										class="nav-link mb-sm-3 mb-md-0 active" id="tabs-text-1-tab"
										data-toggle="tab" href="#tabs-text-1" role="tab"
										aria-controls="tabs-text-1" aria-selected="true">프로젝트 일정</a></li>
								</ul>
							</div>

							<!-- start list -->
							<div class="table-responsive mt-4">
								<table class="table align-items-center">
									<thead class="thead-light">
										<tr>
											<th scope="col" class="sort" data-sort="name">프로젝트/회사명</th>
											<th scope="col" class="sort" data-sort="skil">일정 카테고리</th>
											<th scope="col" class="sort" data-sort="tesk">일정내용</th>
											<th scope="col" class="sort" data-sort="completion">날짜</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody class="list">
										<c:forEach var="meet" items="${meets}">
										<tr class="contents">
											<th scope="row">
												<div class="media align-items-center">
													<div class="media-body">
														<span class="name mb-0 text-sm" id="type">${meet.meet_type}</span>
													</div>
												</div>
											</th>
										
											<td><span class="badge badge-dot mr-4"> <i
													class="bg-warning"></i> <span class="field">웹솔루션</span>
											</span></td>
											<td>
												<div>
													<span class="tesk" id="contetns">${meet.meet_contents}</span>
												</div>
											</td>
											<td>
												<div class="d-flex align-items-center">
													<span id="datetime">${meet.meet_datetime}</span>
												</div>
											</td>
											<td class="text-right">
												<div>
													<button type="button" class="btn btn-success">수정하기</button>
													<button onclick="deleteClick();" class="btn btn-danger" id="deleteMeetingBtn" value="${meet.meet_id}">삭제하기</button>
												</div>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- end list -->
							<!-- Description -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
	<!-- footer -->
<script type="text/javascript">	
 	$(function() {
 		$("#deleteMeetingBtn").on('click', function() {			
 				var meet_id = $(this).val();
 				var $contents = $(this).parents('tr');
 				alert("delete click"+ $contents);
 			$.ajax({
 	    	        contentType:'application/json',
 	    	        dataType:'json',
 	    	        url:'/schedule/'+meet_id,
 	    	        type:'DELETE',
 	    	        success:function(resp){
 	    	           alert('삭제 완료되었습니다.');
 	    	          $contents.remove();
 	    	           	
 	    	        },
 	    	        error:function(){
 	    	            alert('what is error?');
 	    	        }
 	    	    })
			})	
}); 
</script>
	<%@ include file="../includes/footer.jsp"%>
