<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
              <form action="/login" method="post" name="login" id="login">
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control" placeholder="Email" type="email"
                           name="userid" id="userid" onkeyup="loginservice.enterkey()">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Password" type="password"
                           name="userpw" id="userpw" onkeyup="loginservice.enterkey()">
                  </div>
                </div>
                  <div>
                      <input type="checkbox" name="remember-me">로그인 상태 유지
                  </div>
                <div class="text-center">
                  <input type="button" class="btn btn-primary my-4" onclick="loginservice.check()" value="로그인">
                </div>
              </form>
                <div class="text-center">
                  <a class="center" href="https://kauth.kakao.com/oauth/authorize?client_id=99f3b410c68833a20809dc9bf060d24e&redirect_uri=http://localhost:8081/member/kakaologin&response_type=code"><img src="/resources/img/kakao_login_button.png"></a>
                </div>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-8">
                <a type="button" class="text-light" id="targetFindIdForm" data-toggle="modal" data-target="#FiedIdForm"><small>아이디/</small></a>
                <a type="button" class="text-light" id="targetFindPwForm" data-toggle="modal" data-target="#FiedPwForm"><small>비밀번호 찾기</small></a>
            </div>
            <div class="col-4 text-right">
              <a href="/member/signup" class="text-light"><small>회원가입</small></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<%--modal--%>
<%@ include file="./find_id_form.jsp" %>
<%@ include file="./find_pw_form.jsp" %>
<!-- Footer -->
<%@ include file="../includes/footer.jsp" %>
<script src='/resources/js/member/partners/customlogin.js'></script>
