<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>


<!-- Main Content -->

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
						<h3 class="mb-0">커뮤니티 게시글</h3>
					</div>


					<div class="row">
						<div class="col-lg-10">
							<div class="card-body">
								<div class="panel panel-default">


									<div class="panel-body">
										<div class="form-group">
											<label>글 번호</label><input class="form-control" name="nno"
												value='<c:out value="${noticeVO.nno }"/>' readonly="readonly">
										</div>
										<div class="form-group">
											<label>제목</label><input class="form-control" name="title"
												value='<c:out value="${noticeVO.title }"/>'
												readonly="readonly">
										</div>

										<div class="form-group">
											<label>작성자</label><input class="form-control" name="nwriter"
												value='<c:out value="${noticeVO.nwriter }"/>'
												readonly="readonly">
										</div>

										<div class="form-group">
											<label>내용</label>
											<textarea class="form-control" rows="3" name="ncontent"
												readonly="readonly"><c:out
													value="${noticeVO.ncontent }" /></textarea>
										</div>
										<sec:authentication property="principal" var="pinfo"/>
										<sec:authorize access="isAuthenticated()">
										<c:if test="${pinfo.username eq noticeVO.nwriter }">
											<button data-oper="modify" class="btn btn-default">글
											수정</button>
										</c:if>	
										</sec:authorize>

										<button data-oper="list" class="btn btn-info">글 목록</button>

										<form id='operForm'
											action="/admin/notice_modify" method="get">
											<input type='hidden' id='nno' name='nno'
												value='<c:out value="${noticeVO.nno }"/>'> <input
												type='hidden' name='pageNum'
												value='<c:out value="${standard.pageNum }"/>'> <input
												type='hidden' name='amount'
												value='<c:out value="${standard.amount }"/>'>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {

				var operForm = $("#operForm");

				$("button[data-oper='modify']").on(
						"click",
						function(e) {

							operForm.attr("action",
									"/admin/notice_modify")
									.submit();
						});

				$("button[data-oper='list']").on(
						"click",
						function(e) {

							operForm.find("#nno").remove();
							operForm.attr("action",
									"/admin/admin_notice")
							operForm.submit();
						});
			});

</script>
<%@ include file="../includes/footer.jsp"%>