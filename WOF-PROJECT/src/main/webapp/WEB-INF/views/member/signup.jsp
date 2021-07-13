<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp" %>

	<!-- Main content -->
	<div class="container">
      <div class="row justify-content-center text-center">
        <div class="col-lg-5 col-md-7 mt-5">
          <div class="card bg-secondary border-0 mb-0">
          <!-- card -->
            <div class="card-header bg-transparent pb-5">
            	<div>
            		<h1>회원가입</h1>
            		<hr class="my-4"/>
            	</div>
            	<form method="post" action="signup" name="user" onsubmit="return check()">
            	<div class="custom-control custom-radio custom-control-inline">
				  <input type="radio" id="customRadioInline1" name="auth" value="ROLE_CLIENT" class="custom-control-input" checked="checked">
				  <label class="custom-control-label" for="customRadioInline1">Client</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
				  <input type="radio" id="customRadioInline2" name="auth" value="ROLE_PARTNERS" class="custom-control-input">
				  <label class="custom-control-label" for="customRadioInline2">Partners</label>
				</div>
				<p class="mt-3">선택한 이용목적에 따라 서비스 이용에 차이가 발생합니다.</p>
			    <div class="container">
			    	<div class="row">
						<div class="form-group col-md-12 mt-3 form-inline">
					        <label for="example-email-input" class="form-control-label col-md-5 align-self-center">이메일:(아이디) :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="email" name="userid" id="userid">
					        </div>
						</div>
						<div class="form-group col-md-12 form-inline">
<%--							<button class="btn btn-primary col-md-4" id="id-check" type="button" onclick="idCheck()">ID중복체크</button>--%>
							<div class="check-font col-md-12" id="check"></div>
						</div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-password-input" class="form-control-label col-md-5 align-self-center">비밀번호 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="password" name="userpw"
								   placeholder="8자이상 특수문자포함"
								   pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$">
					        </div>
					    </div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-password-input" class="form-control-label col-md-5 align-self-center">비밀번호 확인 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="password" name="userpwck">
					        </div>
					    </div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-name-input" class="form-control-label col-md-5 align-self-center">이름 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="text" name="real_name">
					        </div>
					    </div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-tel-input" class="form-control-label col-md-5 align-self-center">전화번호 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="text" name="userphone"
								id="userphone" maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$">
					        </div>
					    </div>
				    </div>
			    </div>
			    <button class="btn btn-primary mt-2" type="submit">회원가입</button>
			    </form>
            </div>
            <!-- card -->
          </div>
        </div>
      </div>
    </div>
<!-- Footer -->
<%@ include file="../includes/footer.jsp" %>
<!-- js -->
<%@ include file="../../../resources/js/member/signup/signUp.js"%>