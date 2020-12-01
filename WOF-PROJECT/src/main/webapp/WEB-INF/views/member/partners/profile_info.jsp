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
								<div class="col-2 text-right">
									<button type="button" class="btn btn-success" id="targetProfileForm" data-toggle="modal" data-target="#PartnersProfileUpdateForm">수정하기</button>
								</div>
								<div class="col-2 text-right">
									<input name="withdrawal" type="button" class="btn btn-danger"
										   onclick="return memberDelete()" value="회원탈퇴">
								</div>

								<!-- Button trigger modal -->
<%--								<div class="col-4 text-right">--%>
<%--									<a class="btn btn-success"--%>
<%--									   href="javascript:void(0)" onclick="profileManagement.openForm(${member.userid})">수정하기</a>--%>
<%--								</div>--%>

							</div>
						</div>
						<div class="card-body">
							<h6 class="heading-small text-muted mb-4">추가정보</h6>
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
											<h1>${member.real_name }</h1>
										</div>
									</div>
									<div class="row my-3 pt-6">
										<div class="col-6 col-md-2 pr-0 text-right">이메일 :</div>
										<div class="col-6 col-md-4 text-left">${member.userid}</div>
										<div class="col-6 col-md-2 pr-0 text-right">경력 :</div>
										<div class="col-6 col-md-4 text-left">4년차</div>
									</div>
									<div class="row my-3 pt-5">
										<div class="col-6 col-md-2 pr-0 text-right">전화번호 :</div>
										<div class="col-6 col-md-4 text-left">${member.userphone}</div>
										<div class="col-6 col-md-2 pr-0 text-right">보유기술 :</div>
										<div class="col-6 col-md-4 text-left">${partners.skill}</div>
									</div>
									<div class="row my-3 pt-5">
										<div class="col-6 col-md-2 pr-0 text-right">선호지역 :</div>
										<div class="col-6 col-md-4 text-left">${partners.prefered_area }</div>
										<div class="col-6 col-md-2 pr-0 text-right">해시태그 :</div>
										<div class="col-6 col-md-4 text-left">${partners.hashtag }</div>
									</div>
								</div>
							</div>
							<hr class="my-4" />
							<!-- Address -->
							<h6 class="heading-small text-muted mb-4">이력서 관리</h6>


							<div class="nav-wrapper">
								<ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
									<li class="nav-item col-3">
										<a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true">
											<i class="ni ni-calendar-grid-58 mr-2"></i>프로젝트/경력 사항</a>
									</li>
									<li class="nav-item col-3">
										<a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false">
											<i class="ni ni-bell-55 mr-2"></i>자기소개</a>
									</li>
									<li class="col-4"></li>
									<li class="nav-item col-2">
										<button type="button" class="btn btn-primary" id="targetProfileInsertForm" data-toggle="modal" data-target="#ProfileInsertForm">프로젝트/경력 등록하기</button>
									</li>
								</ul>
							</div>


							<div class="card shadow">
								<div class="card-body">
									<div class="tab-content" id="myTabContent">
										<div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
											<%@include file="./project_profile_list.jsp"%>


										</div>
										<div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
											<%@include file="./profile_personalstatement.jsp"%>


										</div>
									</div>
								</div>
							</div>





							<!-- Description -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./project_profile_insert_form.jsp"%>
	<%@ include file="./project_profile_update_form.jsp"%>
	<%@ include file="./profile_form.jsp"%>
	<!-- footer -->
	<%@ include file="../../includes/footer.jsp"%>
<script src='/resources/js/member/partners/profileManagement.js'></script>
<script>

	function profileinsert(){
		if (document.$('#name').value == null){
			alert("프로젝트 명을 입력하세요.");
			return false;
		}else if (document.$('#skill').value == null){
			alert("기술/역할을 입력하세요.");
			return false;
		}else if (document.$('#field').value == null){
			alert("분야를 입력하세요.");
			return false;
		}else if (document.$('#responsibilities').value == null){
			alert("담당업무을 입력하세요.");
			return false;
		}else if (document.$('#date').value == null){
			alert("시작날짜를 입력하세요.");
			return false;
		}else if (document.$('#date2').value == null){
			alert("종료날짜를 입력하세요.");
			return false;
		}
	}
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

	//회원정보 수정하기 버튼
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
		if (confirm("정말 탈퇴하시겠습니까??" +
				"* 탈퇴 후 한달뒤엔 모든 정보가 사라집니다.") == true){    //확인
			location.href="/member/withdrawal?userid=${member.userid}";
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