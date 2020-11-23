<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>project_add_comp.jsp</title>
	
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
</head>

<body>
	<!-- Header & Menu -->
	<jsp:include page="../includes/header.jsp"></jsp:include>


	<!-- Main content -->
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-lg-6 col-md-8 mt-6">
				<div class="card bg-secondary border-0 mb-0">
					<!-- card -->
					<div class="card-header bg-transparent pb-5">
						<div>
							<h1>프로젝트 등록 완료</h1>
							<hr class="my-4" />
						</div>

						<p class="subtitle-1 mb16">프로젝트를 등록해 주셔서 감사합니다.</p>
						<p class="body-2 text600 mb32">
							등록해주신 프로젝트는 워프의 내부 검수 후 지원자 모집을 시작하며, 검수에는 최대 24시간이 소요됩니다.<br>
							필요시 워프 매니저가 유선 및 이메일 연락을 할 수 있습니다.
						</p>
						<div class="mb48">
							<a class="btn btn-gray btn-11-24" href="listProject.do" style="margin-right: 16px;">
								마이페이지로 가기
							</a>
							<a class="btn btn-client btn-11-24" href="insertProjectForm.do">
								다른 	프로젝트 등록하기
							</a>
						</div>
						<div class="project-submit-complete-guide">
							<p class="body-3 ordering-guide text600 mb8">
								<span class="ordering-guide-option text600">1.</span><span
									class="ordering-guide-body text600">모든 프로젝트는 워프의 내부 검수 후
									지원자 모집을 시작하며, 검수에는 <b>최대 24시간</b>이 소요됩니다.
								</span>
							</p>
							<p class="body-3 ordering-guide text600 mb8">
								<span class="ordering-guide-option text600">2.</span><span
									class="ordering-guide-body text600">검수 결과는 <b>이메일과
										SMS를 통해 발송</b>해드리며, <a class="link-text"
									href="/client/manage/project/submitted/"
									style="font-weight: 500;">[검수 중]</a>에서 프로젝트를 확인할 수 있습니다.
								</span>
							</p>
							<p class="body-3 ordering-guide text600">
								<span class="ordering-guide-option text600">3.</span><span
									class="ordering-guide-body text600">문의는 <a
									class="link-text" href="/faq/" style="font-weight: 500;">[자주
										묻는 질문]</a> 또는 고객센터를 이용해 주세요. (고객센터 : 02-6925-4849 / help@wof.com)
								</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>
