<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
	<!-- Header & Menu -->
	<%@include file="../../includes/header.jsp"%>
	<!-- Main content -->
	<div class="main-content" id="panel">
		<!-- Page content -->
		<div class="container-fluid mt-10">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="row align-items-center">
								<div class="col-8">
									<h1 class="mb-0">프로필 관리</h1>
								</div>
							</div>
						</div>
						<div class="card-body">
							<h6 class="heading-small text-muted mb-4">추가정보</h6>
							<form method="post">
							<div class="col-md-12 form-inline">
								<div class="card card-profile col-md-4">
									<img src="../template/assets/img/theme/img-1-1000x600.jpg"
										alt="Image placeholder" class="card-img-top">
									<div class="row justify-content-center">
										<div class="col-lg-3 order-lg-2">
											<div class="card-profile-image">
												<a href="#"> <img
													src="../template/assets/img/theme/team-4.jpg"
													class="rounded-circle">
												</a>
											</div>
										</div>
									</div>
									<div
										class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
									</div>
									<div class="card-body pt-0">
										<div class="row">
											<div class="col">
												<div
													class="card-profile-stats d-flex justify-content-center">
													<div>
														<span class="heading">4년차</span> <span class="description">경력</span>
													</div>
													<div>
														<span class="heading">JAVA</span> <span
															class="description">주요기술</span>
													</div>
													<div>
														<span class="heading">서울</span> <span class="description">희망지역</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-8">
									<div class="row">
										<div class="col-12">
											<h1>${memeber.real_name}</h1>
										</div>
									</div>
									<div class="row my-3 pt-2 inline">
										<div class="col-6 col-md-2 pr-0 text-right">이메일 :</div>
										<div class="col-6 col-md-4 text-left">${member.userid}</div>
										<div class="col-6 col-md-2 pr-0 text-right">경력 :</div>
										<div class="col-6 col-md-4 text-left">${partners.career}</div>
									</div>
									<div class="row my-3 pt-5 inline">
										<div class="col-6 col-md-2 pr-0 text-right">전화번호 :</div>
										<input type="text" name="userphone" class="form-control form-control-muted col-6 col-md-4 "
											placeholder="${member.userphone}" id="userphone" value="${member.userphone}"
											   maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$"/>
										<div class="col-6 col-md-2 pr-0 text-right">보유기술 :</div>
										<input type="text" name="skill"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="ex)JAVA"/>
									</div>
									<div class="row my-3 pt-5 inline clearfix">
										<div class="col-6 col-md-2 pr-0 text-right">선호지역 :</div>
										<input type="text" name="prefered_area"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="선호지역" value="${partner.prefered_area}"/>
										<div class="col-6 col-md-2 pr-0 text-right">해시태그 :</div>
										<input type="text" name="hashtag"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="ex)#JAVA" value="${partner.hashtag}"/>
									</div>
									<div class="row my-12 pt-5 inline">
										<div class="col-2 pr-0 text-right">현재 비빌번호 :</div>
										<input type="password" id="userpw"
											   class="form-control form-control-muted col-4 col-offset-1"
											   placeholder="password"/>
										<button type="button" onclick="pwcheck()"
												class="btn btn-primary col-2">비밀번호 확인</button>
										<div class="col-4" id="pwcheck"></div>
									</div>
									<div class="row my-3 pt-5 inline">
										<div class="col-6 col-md-2 pr-0 text-right">비밀번호 변경 :</div>
										<input type="password" name="userpw"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="password"/>
										<div class="col-6 col-md-2 pr-0 text-right">비밀번호 확인 :</div>
										<input type="password" name="userpwch"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="password"/>
									</div>
									<input type="hidden" name="member_no" value="${member.member_no}">
									<div class="row pt-3 inline">
										<div class="col-4 text-right">
											<input type="submit" class="btn btn-success" onsubmit="return infoUpdate()"
											formaction="/member/partnersinfoupdate" value="수정하기"/>
										</div>
										<div class="col-4 text-right">
											<input name="withdrawal" type="submit" class="btn btn-danger" formaction="/member/withdrawal"
													onsubmit="memberDelete()" value="회원탈퇴(누르지마세여!)"/>
										</div>
									</div>
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- footer -->
<%@include file="../../includes/footer.jsp"%>
<script>
	//현재비밀번호 인증
	function pwcheck(){
		var userpw = $('#userpw').val();
		var member_no ="${member.member_no}";
		var ischeckpw = false;
		console.log(userpw);
		$.ajax({
			url : '/member/pwcheck',
			type : 'post',
			contentType: 'application/json',
			datatype: 'json',
			data : JSON.stringify({"member_no":member_no,"userpw":userpw}),
			success : function (data){
				console.log(data);
				parseInt(data);

				if (data == 1){
					$("#pwcheck").text("인증완료!!!");
					ischeckpw = true;
				}else if (data == 0){
					$("#pwcheck").text("인증X");
				}
			},error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		})
	}

	//수정하기 버튼
	function infoUpdate(){
		if (!ischeckId){
			alert("비밀번호 인증을 확안하세요.")
			return false;
		}else if (document.infoupdate.userpw !== document.infoupdate.userpwch){
			alert("비밀번호가 다릅니다.")
			return false;
		}else {
			return true;
		}
	}

	//회원탈퇴
	function memberDelete() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			document.withdrawal.click();
		}else{   //취소
			return false;
		}
	}

	//핸드폰 번호 자동'-'생성
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
</script>