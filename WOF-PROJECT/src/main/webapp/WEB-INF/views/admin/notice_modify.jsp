<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>


<!-- Main content -->

<div class="main-content" id="panel">

	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body"></div>
		</div>
	</div>

	<!-- Main content -->
	<div class="container mt--7">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header border-0">
						<h3 class="mb-0">공지사항 수정</h3>
					</div>


					<div class="row">
						<div class="col-lg-10">
							<div class="card-body">
								<div class="panel panel-default">


									<div class="panel-body">
										<form role="form"
											action="/admin/notice_modify" method="post">
											
											<input type='hidden' name='pageNum' value='<c:out value="${standard.pageNum }"/>'>
											<input type='hidden' name='amount' value='<c:out value="${standard.amount }"/>'>
											<div class="form-group">
												<label>글 번호</label><input class="form-control" name="nno"
													value='<c:out value="${noticeVO.nno }"/>' readonly="readonly">
											</div>

											<div class="form-group">
												<label>제목</label><input class="form-control" name="title"
													value='<c:out value="${noticeVO.title }"/>'>
											</div>

											<div class="form-group">
												<label>작성자</label><input class="form-control" name="nwriter"
													value='<c:out value="${noticeVO.nwriter }"/>'
													readonly="readonly">
											</div>

											<div class="form-group">
												<label>내용</label>
												<textarea class="form-control" rows="3" name="ncontent"><c:out
														value="${noticeVO.ncontent }" /></textarea>
											</div>

											<div class="form-group">
												<label>작성일</label> <input class="form-control"
													name="nrdate"
													value='${noticeVO.nrdate }'
													<%-- value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${noticeVO.nrdate}"/>' --%>
													readonly="readonly">
											</div>
											
											<div class="form-group">
												<label>수정일</label> <input class="form-control"
													name='updatedate'
													value="${noticeVO.updatedate }"
													<%-- value='<fmt:formatDate pattern="yyyy/MM/dd"  value="${pboard.updateDate}" />'  --%>readonly="readonly">
											</div>

											<sec:authentication property="principal" var="pinfo"/>
											<sec:authorize access="isAuthenticated()">
											<c:if test="${pinfo.username eq noticeVO.nwriter }">
											<button type="submit" data-oper='modify'
												class="btn btn-default">글 수정</button>
											<button type="submit" data-oper='remove'
												class="btn btn-danger">글 삭제</button>
											</c:if>

											</sec:authorize>

											<button type="submit" data-oper='list' class="btn btn-info">뒤로가기</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>
</div>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/admin/notice_remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/admin/admin_notice").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      
	    }else if(operation === 'modify'){
	        
	        console.log("submit clicked");
	        
	        
        }
    
	    formObj.submit();
	  });

});
</script>
<%@ include file="../includes/footer.jsp"%>
