<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>project_add.jsp</title>
	
	<!-- Favicon -->
	<link rel="icon"
		href="${pageContext.request.contextPath}/template/assets/img/brand/favicon.png"
		type="image/png">
	<!-- Fonts -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
	<!-- Icons -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/nucleo/css/nucleo.css"
		type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
		type="text/css">
	<!-- Argon CSS -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/css/argon.css?v=1.2.0"
		type="text/css">
</head>

<body>
	 
	<!-- Header -->
	<jsp:include page="../includes/header.jsp"></jsp:include>


	<!-- Main content -->
	<div class="main-content" id="panel">
	<form action="insertProject.do" method="post">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-xl-5" style="margin-left: 130px;">

								<div class="form-group">
									<label for="projectname">프로젝트명 <span class="required">*</span></label>
									<input type="text" name="proj_title" class="form-control"
										placeholder="Enter project name" required>
								</div>

								<div class="form-group">
									<label>프로젝트 모집기간 <span class="required">*</span></label>
									<div class="row">
										<div class="col">
											<span><input type="date" name="proj_apply_start"
												class="form-control" required></span>
										</div>
										~
										<div class="col">
											<span><input type="date" name="proj_apply_deadline"
												class="form-control" required></span>
										</div>
									</div>
									<!-- end row -->
								</div>


								<div class="form-group">
									<label>프로젝트 수행기간 <span class="required">*</span></label>
									<div class="row">
										<div class="col">
											<span><input type="date" name="proj_start_date"
												class="form-control" required></span>
										</div>
										~
										<div class="col">
											<span><input type="date" name="proj_end_date"
												class="form-control" required></span>
										</div>
										<div class="col">
											<span class="input_add" style="padding-left: 10px;"><input
												type="checkbox" id="cntiPlanYn" name="cntiPlanYn" value="Y">
												<label for="cntiPlanYn">연장가능</label></span>
										</div>
									</div>
									<!-- end row -->
								</div>

								<div class="form-group">
									<label for="project-budget">프로젝트 예상금액 <span
										class="required">*</span></label>
									<div class="row">
										<div class="col">
											<span><input type="text" name="proj_estimate"
												class="form-control" placeholder="100,000" required></span>
										</div>
										<div class="col">
											<span>원</span>
										</div>
										<div class="col">
											<span class="input_add" style="padding-left: 10px;"><input
												type="checkbox" id="negoYn" name="negoYn" value="Y">
												<label for="negoYn">협의가능</label></span> <span class="input_add"><input
												type="checkbox" id="travelExpYn" name="travelExpYn"
												value="Y"> <label for="travelExpYn">출장비포함</label></span>
										</div>
									</div><!-- end row -->
									
								</div>

								<div class="form-group">
									<label for="exampleFormControlSelect1">프로젝트 필요인원 <span
										class="required">*</span></label>
										 <select class="form-control"
										name="proj_reqr_person" required>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
									</select>
								</div>

								<div class="form-group">
									<label for="project-budget">필요기술 <span class="required">*</span></label>
									<select class="form-control" name="proj_reqr" required>
										<option>웹개발</option>
										<option>응용개발</option>
										<option>시스템개발</option>
										<option>모바일개발</option>
										<option>DBA/데이터베이스</option>
										<option>네트워크/서버/보안</option>
										<option>기획/마케팅</option>
										<option>웹디자인/퍼블리싱</option>
										<option>분석/설계/PM</option>
										<option>게임</option>
										<option>IT 강의</option>
										<option>동영상제작/편집</option>
										<option>빅데이터/AI(인공지능)</option>
									</select> 
									<select class="form-control" name="proj_reqr_skill" required>
										<option>JSP</option>
										<option>PHP</option>
										<option>ASP.NET</option>
										<option>ASP</option>
										<option>JavaScript</option>
										<option>Ajax</option>
										<option>Jquery</option>
										<option>NodeJS</option>
										<option>Vue.js</option>
										<option>React.js</option>
										<option>Angular.js</option>
										<option>Ruby</option>
										<option>Ruby on Rails</option>
										<option>MiPlatform</option>
										<option>Nexacro platform</option>
										<option>XPLATFORM</option>
										<option>GO</option>
										<option>Oracle</option>
										<option>MS-SQL</option>
										<option>MySQL</option>
										<option>DB2</option>
									</select>
								</div>



								<div class="form-group">
									<label for="exampleFormControlSelect1">프로젝트 진행상태 <span
										class="required">*</span></label>
										 <select class="form-control"
										name="proj_type" required>
										<option value="1">아이디어만 있습니다</option>
										<option value="2">진행 중입니다</option>
							
									</select>
								</div>

								<div class="form-group">
									<label for="recurit-condition">모집요건 <span
										class="required">*</span></label> <input type="text"
										name="proj_career" class="form-control"
										placeholder="ex)자바 경력 3년 이상" required>
								</div>


								<div class="form-group">
									<label for="project-manager">PM유무 <span
										class="required">*</span></label>
									<div class="custom-control custom-radio mb-3">
										<input type="radio" id="customRadio1" name="proj_pm"
											class="custom-control-input" value="1" required checked="checked"> <label
											class="custom-control-label" for="customRadio1">유</label>
									</div>
									<div class="custom-control custom-radio">
										<input type="radio" id="customRadio2" name="proj_pm"
											class="custom-control-input" value="2" required> <label
											class="custom-control-label" for="customRadio2">무</label>
									</div>
								</div>

							</div>
							<!-- col-xl-6 -->

							<div class="col-xl-5">

								<div class="form-group">
									<label for="working_status">근무형태 <span class="required">*</span></label>
									<input type="text" name="proj_work_type" class="form-control"
										placeholder="1 집 2 회사" required>
								</div>



								<div class="form-group">
									<label for="working_area">근무지역 <span class="required">*</span></label>
									<select class="form-control" name="proj_work_place" required>
										<option>전국</option>
										<option>서울</option>
										<option>부산</option>
										<option>대구</option>
										<option>인천</option>
										<option>광주</option>
										<option>대전</option>
										<option>울산</option>
										<option>세종</option>
										<option>경기</option>
										<option>강원</option>
										<option>충북</option>
										<option>충남</option>
										<option>전북</option>
										<option>전남</option>
										<option>경북</option>
										<option>경남</option>
										<option>제주</option>
									</select>
								</div>


								<div class="form-group">
									<label for="working_time">근무시간 <span class="required">*</span></label>
									<input type="text" name="proj_work_time" class="form-control"
										placeholder="ex)월-금 9시-6시" required>
								</div>
								<div class="form-group">
									<label for="private_equip">개인장비 <span class="required">*</span></label>
									<input type="text" name="proj_work_equip" class="form-control"
										placeholder="1필수 2제공" required>
								</div>
								<div class="form-group">
									<label for="well_fare">복리후생 <span class="required">*</span></label>
									<input type="text" name="proj_walfare" class="form-control"
										placeholder="1음식 제공  2음식 미제공" required>
								</div>



								<div class="form-group mt-3 mt-xl-0">
									<label for="project_now" class="mb-0">프로젝트 진행상황</label>
									<p class="text-muted font-14">Recommended PDF type</p>

									<form action="/" method="post" class="dropzone dz-clickable"
										id="myAwesomeDropzone" data-plugin="dropzone"
										data-previews-container="#file-previews"
										data-upload-preview-template="#uploadPreviewTemplate">
										<div class="dz-message needsclick">
											<i class="h3 text-muted dripicons-cloud-upload"></i>
											<h4>Drop files here or click to upload.</h4>
										</div>
									</form>

									<!-- Preview -->
									<div class="dropzone-previews mt-3" id="file-previews"></div>

									<!-- file preview template -->
									<div class="d-none" id="uploadPreviewTemplate">
										<div class="card mt-1 mb-0 shadow-none border">
											<div class="p-2">
												<div class="row align-items-center">
													<div class="col-auto">
														<img data-dz-thumbnail="" src="#"
															class="avatar-sm rounded bg-light" alt="">
													</div>
													<div class="col pl-0">
														<a href="javascript:void(0);"
															class="text-muted font-weight-bold" data-dz-name=""></a>
														<p class="mb-0" data-dz-size=""></p>
													</div>
													<div class="col-auto">
														<!-- Button -->
														<a href="" class="btn btn-link btn-lg text-muted"
															data-dz-remove=""> <i class="dripicons-cross"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- end file preview template -->
								</div>

								<div class="form-group">
									<label for="project_overview">프로젝트 상세설명</label>
									<textarea class="form-control" name="proj_detail" rows="5">&lt;프로젝트 제반사항&gt;
예시) 필요기능, 동작환경, 현재상황, 산출물
                                </textarea>
								</div>



								<div class="form-group" align="center">
									<input class="btn btn-default" type="reset" value="취소">
									<input class="btn btn-default" type="submit" value="등록">
								</div>
							</div>
							<!-- end col-->
						</div>
						<!-- end row -->

					</div>
					<!-- end card-body -->
				</div>
				<!-- end card-->
			</div>
			<!-- end col-->
		</div>

	</form>
	</div>


	<!-- Footer -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>

</html>