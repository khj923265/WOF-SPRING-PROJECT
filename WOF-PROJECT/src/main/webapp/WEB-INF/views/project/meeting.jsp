<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
									<button type="button" id="emailBtn" class="btn btn-success" data-toggle="modal" data-target="#emailBtn">문의하기</button>
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
											<th scope="col" class="sort" data-sort="tesk">날짜</th>
											<th scope="col" class="sort" data-sort="completion">일정내용</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody class="list">
										<c:forEach var="meet" items="${meets}">
										<tr class="contents">
											<td>
												<div class="d-flex align-items-center">
													<c:choose>
													<c:when test="${meet.meet_type eq 0}">
													<span >온라인 미팅</span>
													</c:when>
													<c:when test="${meet.meet_type ne 1}">
													<span >오프라인 미팅</span>
													</c:when>
													</c:choose>
												</div>
											</td>
											<td>
												<div class="d-flex align-items-center">
													<span id="datetime">${meet.meet_datetime}</span>
												</div>
											</td>
											<td>
												<div>
													<span class="tesk" id="contents">${meet.meet_contents}</span>
												</div>
											</td>

											<td class="text-right">
												<div>
													<button type="button" id="updateMeetingBtn"  class="btn btn-success" data-toggle="modal" data-target="#calendarEditBtn" value="${meet.meet_id}">수정하기</button>
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
<div class="modal fade" id="calendarEditBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정 변경하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
    <div class="form-group">
        <label for="example-text-input" class="form-control-label">일정내용</label>
        <input class="form-control" type="text" value="${meet.meet_contents}" id="meet_contents">
    </div>
    <div class="form-group">
        <label for="example-date-input" class="form-control-label">날짜</label>
        <input class="form-control" type="date" value="${meet.meet_datetime}" id="meet_datetime">
    </div>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="meetingUpdateBtn">수정하기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="emailBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정 변경하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<form>
  <div class="form-group">
    <label for="exampleFormControlInput1">Email address</label>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Example textarea</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="meetingUpdateBtn">수정하기</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="/resources/js/partners/meeting.js"></script>
<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
 	$(function() {
 		$("#deleteMeetingBtn").on('click', function() {			
 				var meet_id = $(this).val();
 				var $contents = $(this).parents('tr');
 			$.ajax({
 	    	        contentType:'application/json',
 	    	        dataType:'json',
 	    	        url:'/schedule/'+meet_id,
 	    	        type:'DELETE',
 	    	        success:function(resp){
					swal(
		               "일정을 삭제하셨습니다."
		             );
 	    	          $contents.remove();
 	    	           	
 	    	        },
 	    	        error:function(){
 	    	            alert('what is error?');
 	    	        }
 	    	    })
			})	
}); 
</script>
<script type="text/javascript">
    
    $('#meetingUpdateBtn').on('click', function(event) {          
        var meet = {
                meet_id : $(),
                meet_req_mem : 'member101',     
        		meet_datetime : $('#meet_datetime').val(),
				meet_contents : $('#meet_contents').val()
           };
        alert(meet_req_mem + meet_id);
        meetingService.update(meet, function(result){
            alert(result);
        	$('.modal').modal('hide');

        })
        	
    });
</script>
	<%@ include file="../includes/footer.jsp"%>
