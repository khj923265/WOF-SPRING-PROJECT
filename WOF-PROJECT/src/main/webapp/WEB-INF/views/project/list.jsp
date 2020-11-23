<%@page import="org.wof.domain.ProjectVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>프로젝트 목록보기</title>
	
	<!-- Favicon -->
	<link rel="icon" href="${pageContext.request.contextPath }/template/assets/img/brand/favicon.png" type="image/png">
	<!-- Fonts -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
	<!-- Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/template/assets/vendor/nucleo/css/nucleo.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
	<!-- Argon CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/template/assets/css/argon.css?v=1.2.0" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/argon.css" media="all" />
	<style type="text/css">
		.red {
			color: red;
		}
	</style>
</head>

<body>
	<!-- Header & Menu -->
	<jsp:include page="../includes/header.jsp" />


	<!-- Main Content -->
	<div class="header pb-6 container">
		<div class="container-fluid">
			<div class="header-body text-right ">
				<div class="row py-4">
					<div class="col-lg-6 col-7">
						<form
							class="navbar-search navbar-search-light form-inline mr-sm-3"
							id="navbar-search-main">
							<div class="form-group mb-0">
								<div
									class="input-group input-group-alternative input-group-merge mr-2">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-search"></i></span>
									</div>
									<input class="form-control" placeholder="Search" type="text"
										value="searchKey">
								</div>
								<button type="button" class="btn btn-secondary">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Page content -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-4">
				<div class="container-fluid mt--6">
					<div class="row">

						<div class="card card-profile">

							<div
								class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
								<div class="d-flex justify-content-between"></div>
							</div>
							<div class="card-body pt-0">
								<div class="container">
									<div class="row col justify-content-center">
										<div class="col-lg-3 order-lg-2"></div>
									</div>

									<div class="row">
										<div class="col"></div>
									</div>
									<div class="text-left">
										<h3>*맞춤 프로젝트</h3>
										&nbsp;
										<h5 class="h3">프로젝트 카테고리</h5>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck1"> <label
												class="custom-control-label" for="customCheck1">개발</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck2"> <label
												class="custom-control-label" for="customCheck2">디자인</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck3"> <label
												class="custom-control-label" for="customCheck3">기획</label>
										</div>
										&nbsp;

										<h5 class="h3">프로젝트 분야</h5>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck4"> <label
												class="custom-control-label" for="customCheck4">웹</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck5"> <label
												class="custom-control-label" for="customCheck5">어플리케이션</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck6"> <label
												class="custom-control-label" for="customCheck6">커머스,
												쇼핑몰</label>
										</div>
										&nbsp;

										<h5 class="h3">프로젝트 기술</h5>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck7"> <label
												class="custom-control-label" for="customCheck7">Java</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck8"> <label
												class="custom-control-label" for="customCheck8">node.js</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck9"> <label
												class="custom-control-label" for="customCheck9">PHP</label>
										</div>
										&nbsp;

										<h5 class="h3">지역</h5>
										<div>
											<select class="form-control" id="exampleFormControlSelect1">
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
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- list -->
			<div class="col-8 container-fluid mt--6">
				<div class="row">
					<div class="col">
						<div class="card">
							<!-- Card header -->
							<div class="card-header border-0">
								<h3 class="mb-0">프로젝트 리스트</h3>
							</div>
							<!-- card body -->
							<div class="card card-stats">




								<c:forEach var="project" items="${list}">

									<!-- Card body -->
									<div class="ml-3 mt-3 mb-3 card-body">

										<div class="row">
											<div class="col-12 row text-center ">

												<h2 class="card-title text-uppercase text-muted mb-0 mr-2">
													${project.getProj_id()} <a
														href="detailProject.do?proj_id=${project.getProj_id()}">${project.getProj_title()}</a>
												</h2>
												<span class="justify-content-center">
													<i id="related_proj" class="ni ni-favourite-28 mt-2" >
													<input type="hidden" value="${project.getProj_id()}" name="related_proj" id="related">
													</i>
												</span>
												<%-- <button>${project.getProj_status()}</button> --%>

											</div>
										</div>

										<p class="mt-3 mb-0 text-sm">
											<i class="ni ni-check-bold mr-3"></i><span
												class="text-success mr-2">${project.getProj_career()}</span>
											<i class="ni ni-key-25 mr-3"></i><span
												class="text-success mr-2">${project.getProj_estimate()}
												원</span>
										</p>

										<p class="mt-3 mb-0 text-sm">
											<i class="ni ni-single-02 mr-3"></i><span
												class="text-success mr-2">${project.getProj_walfare()}명</span>
											<i class="ni ni-time-alarm mr-3"></i><span
												class="text-success mr-2">${project.getProj_work_time()}</span>
											<i class="ni ni-compass-04 mr-3"></i><span
												class="text-success mr-2">${project.getProj_work_place()}</span>
										</p>

										<div class="mt-3 mr-3 text-sm">
											<span class="text-nowrap"> <%--  <c:choose>
           <c:when test="${project.getProj_detail()}" > 60}">
   					${fn:substring(TextValue,0,60)}<br>${fn:substring(TextValue,61,120)}
   					<br>${fn:substring(TextValue,121,180)}<br>${fn:substring(TextValue,181,TextValue.length())}
   			</c:when>
   			<c:otherwise>
   				<c:out value="${fn:substring(TextValue,0,TextValue.length())}"/>
   			</c:otherwise>	
  
    </c:choose> --%> <c:set var="TextValue"
													value="${project.getProj_detail()}" />
												${fn:substring(TextValue,0,60)}<br>${fn:substring(TextValue,61,120)}
												<br>${fn:substring(TextValue,121,180)}<br>${fn:substring(TextValue,181,240)}
												<br>${fn:substring(TextValue,241,300)} <br>${fn:substring(TextValue,301,360)}...
											</span>
										</div>

										<p class="mt-3 mb-0 text-sm">
											<i class="ni ni-chart-bar-32 mr-3"></i><span
												class="text-success mr-2">3명지원</span>
										</p>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- list end -->

	<!-- Footer -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
	
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script type="text/javascript">
	
	$(function() {
		
		$(".ni-favourite-28").click(function() {
			$(this).toggleClass("red");
			var related_proj = $(this).find("input").val();
			if ($(this).hasClass("red") === true) { /* if($(".ni-favourite-28").hasClass("color") === true){ */
				alert("관심 프로젝트로 등록되었습니다.");
				$.ajax({
					url : "FollowProjectInsertAction.do",
					type : "post",
					data : {
						"related_proj" : related_proj
					},
					success : function(result) {
					},
					error : function(error) {
					}
				})
			}

			else {
				alert("관심 프로젝트에서 해제되었습니다.");
				$.ajax({
					url : "FollowProjectDeleteAction.do",
					type : "related_proj",
					data : {
						"related_proj" : related_proj
					},
					success : function(result) {
						alert(result);
						warning.success("관심 파트너스에 삭제되었습니다!")
					},
					error : function(error) {
						toastr.error("관심 파트너스가 삭제되지 않았습니다.")
					}
				})
			}
			
		})
		
	});
	function followProject() {

		$('#related_proj').toggleClass("red");
		var related_proj = $('#related').val();
		if ($('#related_proj').hasClass("red") === true) { /* if($(".ni-favourite-28").hasClass("color") === true){ */
			alert("관심 프로젝트로 등록되었습니다.");
			$.ajax({
				url : "FollowProjectInsertAction.do",
				type : "post",
				data : {
					"related_proj" : related_proj
				},
				success : function(result) {
				},
				error : function(error) {
				}
			})
		}

		else {
			alert("관심 프로젝트에서 해제되었습니다.");
			$.ajax({
				url : "FollowProjectDeleteAction.do",
				type : "related_proj",
				data : {
					"related_proj" : related_proj
				},
				success : function(result) {
					alert(result);
					warning.success("관심 파트너스에 삭제되었습니다!")
				},
				error : function(error) {
					toastr.error("관심 파트너스가 삭제되지 않았습니다.")
				}
			})
		}

	}
	</script>
</body>

</html>