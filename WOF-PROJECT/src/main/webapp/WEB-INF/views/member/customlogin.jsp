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
                           name="userid" id="userid" onkeyup="enterkey()">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Password" type="password"
                           name="userpw" id="userpw" onkeyup="enterkey()">
                  </div>
                </div>
                  <div>
                      <input type="checkbox" name="remember-me">로그인 상태 유지
                  </div>
                <div class="text-center">
                  <input type="button" class="btn btn-primary my-4" onclick="check()" value="로그인">
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
<script type="text/javascript">
    function check() {
        var id = $('#userid').val();

        if (!document.login.userpw.value) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        $.ajax({
            url : '/member/loginIdCheck?userid='+id,
            type : 'get',
            success : function (data){
                parseInt(data);
                if (data == 1){
                    alert("탈퇴된 회원입니다.");
                    return false;
                }else if (data == 2) {
                    alert("휴면회원 입니다.");
                    return false;
                }else if (data == 3){
                    alert("아이디가 없습니다.");
                }else {
                    document.login.submit();
                }
            },error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
        })
    }

    //엔터키 눌렀을 시 로그인버튼 실행
    function enterkey() {
        if (window.event.keyCode == 13) {

            // 엔터키가 눌렸을 때 실행할 내용
            check();
        }
    }
</script>
	<!-- Footer -->
    <%@ include file="../includes/footer.jsp" %>
</body>
</html>