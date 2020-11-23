<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>client_info_insert.jsp</title>
	
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
	<!-- Main content -->
	<div class="main-content" id="panel">

	<!-- Header & Menu -->
	<jsp:include page="../../includes/header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-lg-5 col-md-7 mt-5">
				<div class="card bg-secondary border-0 mb-0">
					<!-- card -->
					<div class="card-header bg-transparent pb-5">
						<form class="form-inline" action="client_info_insert.do"
							method="post">
							<h1 class="col-md-12">클라이언트 추가정보입력</h1>
							<div class="container">
								<div class="row">
									<div class="form-group col-md-12 mt-3">
										<label for="example-name-input"
											class="form-control-label col-md-5">사업자번호 :</label>
										<div class="col-md-7">
											<input class="form-control" type="text"
												name="client_business_reg_num">
										</div>
									</div>
									<div class="form-group col-md-12 mt-3">
										<label for="example-name-input"
											class="form-control-label col-md-5">회사명 :</label>
										<div class="col-md-7">
											<input class="form-control" type="text" name="client_name">
										</div>
									</div>
									<div class="form-group col-md-12 mt-3">
										<label for="example-name-input"
											class="form-control-label col-md-5">전화번호 :</label>
										<div class="col-md-7">
											<input class="form-control" type="text" name="client_phone">
										</div>
									</div>
									<div class="form-group col-md-12 mt-3">
										<label for="exampleFormControlSelect1" class="col-md-5">회사지역:</label>
										<select class="form-control col-md-7" name="client_address1">
											<option>전국</option>
											<option>서울</option>
											<option>경기도</option>
											<option>부산</option>
											<option>대구</option>
											<option>인천</option>
											<option>광주</option>
											<option>대전</option>
											<option>울산</option>
											<option>세종</option>
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
									<div class="form-group col-md-12 mt-3">
										<label for="example-name-input"
											class="form-control-label col-md-5">자세한 주소 :</label>
										<div class="col-md-7">
											<input class="form-control" type="text"
												name="client_address2">
										</div>
									</div>
								</div>
							</div>
							<p class="col-md-12 mt-3">추가정보 미입력시 이용에 제한이 있을 수 있습니다.</p>
							<div class="col-md-12 text-center">
								<button class="col-md-3 btn btn-primary mt-3" type="submit">입력</button>
								<button class="btn btn-primary mt-3" type="button"
									onclick="location.href='/kosta202-project/client/dashboard_client.jsp'">건너뛰기</button>
							</div>
						</form>
					</div>
					<!-- card -->
				</div>
			</div>
		</div>


	<!-- footer -->
	<jsp:include page="../../includes/footer.jsp"></jsp:include>
	
	</div>
	</div>
</body>
</html>