<%@page import="java.util.function.Function"%>
<%@page import="org.wof.domain.MemberVO"%>
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
	<title>login.jsp</title>
	
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
		function check() {
			if (!document.login.mem_userpw.value) {
				alert("비밀번호를 입력하세요");
				return false;
			}
		}
	</script>
</head>

<body>
	<!-- Header & Menu -->
    <%@ include file="../includes/header.jsp" %>
	<!-- Main content -->
	<div class="main-content" id="panel">
		<div class="header bg-gradient-primary pt-5 pb-3">
			<div class="container">
				<div class="header-body text-center mb-7">
					<div class="row justify-content-center pb-3">
						<div class="col-xl-5 col-lg-6 col-md-8 px-5">
							<h1 class="text-white">로그인</h1>
							<p class="text-lead text-white">WORF에 오신 것을 환영합니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="separator separator-bottom separator-skew zindex-100">
				<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none"
					version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    
   <div class="container mt--8 pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">
            <div class="card-body px-lg-5 py-lg-5">
              <form action="/login" method="post" onsubmit="return check()">
                  <sec:csrfInput/>
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control" placeholder="Email" type="email" name="userid">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Password" type="password" name="userpw">
                  </div>
                </div>
                  <div>
                      <input type="checkbox" name="remember-me">로그인 상태 유지
                  </div>
                <div class="text-center">
                  <input type="submit" class="btn btn-primary my-4" value="로그인">
                </div>
              </form>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-6">
              <a href="#" class="text-light"><small>아이디/비밀번호 찾기(coomingsoon)</small></a>
            </div>
            <div class="col-6 text-right">
              <a href="signup" class="text-light"><small>회원가입</small></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	<!-- Footer -->
    <%@ include file="../includes/footer.jsp" %>
</body>
</html>