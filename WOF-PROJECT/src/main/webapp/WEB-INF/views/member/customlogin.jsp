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
                console.log(data);
                if (data == 1){
                    alert("탈퇴된 회원입니다.");
                    return false;
                }else if (data == 2) {
                    alert("휴면회원 입니다.");
                    return false;
                }else if (data == 3){
                    alert("아이디가 없습니다.");
                    return false;
                }else if (data == 4){
                    alert("카카오로 로그안하세요.");
                    return false;
                }else if (data == 6){
                    alert("비밀번호를 확인하세요");
                    return false;
                } else{
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
    //핸드폰 - 자동 생성
    var autoHypenPhone = function(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }

        return str;
    }

    var phoneNum = document.getElementById('userphone');

    phoneNum.onkeyup = function(){
        this.value = autoHypenPhone( this.value ) ;
    }
    var phoneNumPW = document.getElementById('userphonePW');

    phoneNumPW.onkeyup = function(){
        this.value = autoHypenPhone( this.value ) ;
    }

    function findIdForm(){
        var memberVO = {
            "real_name":$('#real_name').val(),
            "userphone":$('#userphone').val()
        };
        $.ajax({
            url: '/member/findIdForm',
            type: 'POST',
            datatype: 'json',
            data: JSON.stringify(memberVO),
            contentType : 'application/json',
            success: function(data) {
                console.log(data)
                if (data.userid=="anonymousUser"){
                    alert("이름 or 번호를 확인하세요.");
                }else {
                alert(data.userid+" 입니다.");
                }
            },
            error: function() {
                alert('error!');
            }

        });
    }

    function findPwForm(){
        var memberVO = {
            "userid":$('#useridPW').val(),
            "real_name":$('#real_namePW').val(),
            "userphone":$('#userphonePW').val()
        };
        $.ajax({
            url: '/member/findPwForm',
            type: 'POST',
            datatype: 'json',
            data: JSON.stringify(memberVO),
            contentType : 'application/json',
            success: function(data) {
                console.log(data)
                if (data.userpw == "anonymousUser"){
                    alert("아이디 or 이름 or 번호를 확인하세요.");
                }else {
                    alert(data.userpw+" 입니다." +
                        "로그인 후 반드시 비밀번호를 변경하세요");
                }
            },
            error: function() {
                alert('error!');
            }

        });
    }




</script>