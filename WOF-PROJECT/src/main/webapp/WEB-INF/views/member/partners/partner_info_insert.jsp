<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>partner_info_insert.jsp</title>
	
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
	<jsp:include page="../../includes/header.jsp"></jsp:include>


	<!-- Main content -->
	<div class="main-content" id="panel">
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-lg-5 col-md-7 mt-5">
				<div class="card bg-secondary border-0 mb-0">
					<!-- card -->
					<div class="card-header bg-transparent pb-5">
						<form class="form-inline" action="partners_info_insert.do"
							method="post">
							<h1 class="col-md-12">파트너스 추가정보입력</h1>
							<div class="col-md-12 text-left mt-4 form-inline text-center">
								<label class="col-md-5 text-center">성별 :</label>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="customRadioInline1" name="partner_sex"
										value="1" class="custom-control-input" checked="checked">
									<label class="custom-control-label" for="customRadioInline1">남</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="customRadioInline2" name="partner_sex"
										value="2" class="custom-control-input"> <label
										class="custom-control-label" for="customRadioInline2">여</label>
								</div>
							</div>

							<div class="container">
								<div class="row">
									<div class="form-group col-md-12 mt-3">
										<label for="example-date-input"
											class="form-control-label col-md-5">생년월일 :</label>
										<div class="col-md-7">
											<input class="form-control" type="date" value="2018-11-23"
												name="partner_birthday">
										</div>
									</div>
									<div class="form-group col-md-12 mt-3">
										<label for="exampleFormControlSelect1" class="col-md-5">보유기술:</label>
										<select class="form-control col-md-7" name="partner_skill1">
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
											<option>IT강의</option>
											<option>동영상제작/편집</option>
											<option>빅데이터/AI(인공지능)</option>
										</select>
									</div>
									<div class="form-group col-md-12">
										<label for="exampleFormControlSelect1" class="col-md-5"></label>
										<select class="form-control col-md-7" name="partner_skill2">
											<option>JSP</option>
											<option>PHP</option>
											<option>APS.NET</option>
											<option>ASP</option>
											<option>JavaScript</option>
											<option>Ajax</option>
											<option>Jquery</option>
											<option>Node.JS</option>
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
											<option>My-SQL</option>
											<option>DB2</option>
										</select>
									</div>
									<div class="form-group col-md-12 mt-3">
										<label for="example-name-input"
											class="form-control-label col-md-5">해시태그 :</label>
										<div class="col-md-7">
											<input class="form-control" type="text" value="#센스#JAVA"
												name="partner_hashtag">
										</div>
									</div>
									<div class="form-group col-md-12 mt-3">
										<label for="example-date-input"
											class="form-control-label col-md-5">프로젝트 투입 가능일:</label>
										<div class="col-md-7">
											<input class="form-control" type="date" value="2018-11-23"
												name="partner_start_date">
										</div>
									</div>
									<div class="form-group col-md-12 mt-3">
										<label for="exampleFormControlSelect1" class="col-md-5">선호지역:</label>
										<select class="form-control col-md-7" name="partner_loca">
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
								</div>
							</div>
							<p class="col-md-12 mt-3">추가정보 미입력시 이용에 제한이 있을 수 있습니다.</p>
							<div class="col-md-12 text-center">
								<button class="col-md-3 btn btn-primary mt-3" type="submit">입력</button>
								<a class="btn btn-primary mt-3" href="/kosta202-project/partners/profile_info.jsp">건너뛰기</a>
							</div>
						</form>
					</div>
					<!-- card -->
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>
</html>