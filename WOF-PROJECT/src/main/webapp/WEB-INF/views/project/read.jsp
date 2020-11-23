<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>project_detail.jsp</title>
	
	<!-- Favicon -->
	<link rel="icon" href="${pageContext.request.contextPath}/template/assets/img/brand/favicon.png"
		type="image/png">
	<!-- Fonts -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
	<!-- Icons -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/nucleo/css/nucleo.css" type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
		type="text/css">
	<!-- Argon CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/assets/css/argon.css?v=1.2.0"
		type="text/css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/template/assets/css/argon.css"
		media="all" />
	
	<script type="text/javascript">
		/* $(function(){
			 $("#myButtons1").click(function(){
			    $('div.modal').modal({
			    	remote : 'project.delete.jsp'
			    });
			
			  })
		}) */
	
		/* function clickDel(formName) {
			formName.action = "/board/contentDelAsk";
			formName.method = "post";
			formName.submit();
		} */
	
		//$('#myModal').modal('show');
	</script>
</head>

<body>
	<!-- Header & Menu -->
	<jsp:include page="../includes/header.jsp"></jsp:include>


	<!-- Main Content -->
	<div class="main-content" id="panel">
	<div class="row">
		<div class="col-xl-8 col-lg-6">
			<!-- project card -->
			<div class="card d-block">
				<div class="card-body">
					<div class="dropdown float-right">
						<a href="#" class="dropdown-toggle arrow-none card-drop"
							data-toggle="dropdown" aria-expanded="false"> <i
							class="dripicons-dots-3"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<!-- item-->
							<a href="updateProjectForm.do?proj_id=${project.getProj_id()}"
								class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
							<!-- item-->
							<a class="dropdown-item" data-toggle="modal" href="#myModal"><i
								class="mdi mdi-delete mr-1"></i>Delete</a>

							<!-- <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="background: white; color: black; border:0; outline:0;">Delete</button> -->

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item"><i
								class="mdi mdi-email-outline mr-1"></i>Invite</a>
							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item"><i
								class="mdi mdi-exit-to-app mr-1"></i>Leave</a>
						</div>
					</div>
					<!-- project title-->

					<%-- <input type="hidden" name="proj_id" value="${project.getProj_id}"> --%>

					<%-- ${project.getProj_id()} --%>
					<h3 class="mt-0">${project.getProj_title()}</h3>
					<div class="badge badge-secondary mb-3">Ongoing</div>
					<div class="badge badge-secondary mb-3">마감임박</div>

					<h5>Project Overview:</h5>

					<p class="text-muted mb-2">${project.getProj_reqr_skill()}</p>
					<p class="text-muted mb-2">${project.getProj_type()}</p>
					<p class="text-muted mb-2">${project.getProj_career()}</p>
					<p class="text-muted mb-2">${project.getProj_pm()}</p>
					<p class="text-muted mb-2">${project.getProj_work_type()}</p>
					<p class="text-muted mb-2">${project.getProj_work_place()}</p>
					<p class="text-muted mb-2">${project.getProj_work_time()}</p>
					<p class="text-muted mb-2">${project.getProj_work_equip()}</p>
					<p class="text-muted mb-2">${project.getProj_walfare()}</p>

					<p class="text-muted mb-4">${project.getProj_detail()}</p>

					<div class="row">
						<div class="col-md-4">
							<div class="mb-4">
								<h5>Start Date</h5>
								<p>${project.getProj_start_date()}</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="mb-4">
								<h5>End Date</h5>
								<p>${project.getProj_end_date()}</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="mb-4">
								<h5>Budget</h5>
								<p>${project.getProj_estimate()}</p>
							</div>
						</div>
					</div>

					<div>
						<h5>Team Members:</h5>
						${project.getProj_reqr_person()}
					</div>

				</div>
				<!-- end card-body-->

			</div>
			<!-- end card-->

			<div class="card">
				<div class="card-body">
					<h4 class="mt-0 mb-3">Comments (258)</h4>

					<textarea class="form-control form-control-light mb-2"
						placeholder="Write message" id="example-textarea" rows="3"></textarea>
					<div class="text-right">
						<div class="btn-group mb-2">
							<button type="button"
								class="btn btn-link btn-sm text-muted font-18">
								<i class="dripicons-paperclip"></i>
							</button>
						</div>
						<div class="btn-group mb-2 ml-2">
							<button type="button" class="btn btn-primary btn-sm">Submit</button>
						</div>
					</div>

					<div class="media mt-2">
						<div class="media-body">
							<h5 class="mt-0">Jeremy Tomlinson</h5>
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
							scelerisque ante sollicitudin. Cras purus odio, vestibulum in
							vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
							nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

							<div class="media mt-3">
								<div class="media-body">
									<h5 class="mt-0">Kathleen Thomas</h5>
									Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
									scelerisque ante sollicitudin. Cras purus odio, vestibulum in
									vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
									nisi vulputate fringilla. Donec lacinia congue felis in
									faucibus.
								</div>
							</div>
						</div>
					</div>

					<div class="text-center mt-2">
						<a href="javascript:void(0);" class="text-danger">Load more </a>
					</div>
				</div>
				<!-- end card-body-->
			</div>
			<!-- end card-->
		</div>
		<!-- end col -->

		<div class="col-lg-6 col-xl-4">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title mb-3">Profile</h5>
					<div class="mt-3 chartjs-chart" style="height: 320px;">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class="">
									<div class="row">
										<div class="col">
											<div class="text-left">
												<h5 class="h3">임재은</h5>
												<div class="h5 mt-4">
													<i class="ni business_briefcase-24 mr-2"></i>jaeeunxo1@naver.com
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>University of Computer
													Science
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>★★★☆☆
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>등록한 프로젝트
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>진행 중인 프로젝트
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>완료한 프로젝트
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
									<canvas id="line-chart-example" width="324"
										style="display: block; height: 190px; width: 288px;"
										class="chartjs-render-monitor" height="360"></canvas>
								</div>
							</div>
						</div>
						<!-- end card-->

						<div class="card">
							<div class="card-body">
								<h5 class="card-title mb-3">Files</h5>
								<!-- 산출물 -->
								<div class="card mb-1 shadow-none border">
									<form action="insertFileAction.do" method="post"
										enctype="multipart/form-data">
										파일번호 : <input type="text" name="file_id"><br>
										프로젝트번호 : <input type="text" name="apply_id"><br>
										회원번호 : <input type="text" name="mem_id"><br>
										파일선택하기<br> <input type="file" name="fname"> <input
											type="submit" value="파일업로드">
									</form>
								</div>

								<div class="card mb-1 shadow-none border"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
	<!-- Footer -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
	</div>

</body>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">경고창</h4>
			</div>
			<div class="modal-body">
				<p>정말로 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<a href="deleteProject.do?proj_id=${project.getProj_id()}"><button
						type="button" class="btn btn-primary">삭제</button></a>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</html>