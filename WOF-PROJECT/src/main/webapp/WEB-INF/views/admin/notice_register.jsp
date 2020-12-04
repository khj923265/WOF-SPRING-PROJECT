<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/header.jsp"%>



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
						<h3 class="mb-0">공지사항 글 작성</h3>
					</div>


					<div class="row">
						<div class="col-lg-10">
							<div class="card-body">
								<div class="panel panel-default">

									<div class="panel-body">
										<form role="form"
											action="/admin/notice_register" method="post">
											<div class="form-group">
												<label>제목</label><input class="form-control" name="title">
											</div>

											<div class="form-group">
												<label>작성자</label><input class="form-control" name="nwriter"
												value='<sec:authentication property="principal.username"/>' readonly="readonly">
											</div>

											<div class="form-group">
												<label>내용</label>
												<textarea class="form-control" rows="3" name="ncontent"></textarea>
											</div>

											<button type="submit" class="btn btn-default">등록하기</button>

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
<script>
	$(document).ready(function(e) {

		  var formObj = $("form[role='form']");
		  var str = "";
		  
		  $("button[type='submit']").on("click", function(e){
		    
		    e.preventDefault();
		    
		    console.log("submit clicked");
		    
		    
		    
		    formObj.append(str).submit();
		    
		  });
	
	  
	  
	  
	});
		  
</script>

<%@ include file="../includes/footer.jsp"%>