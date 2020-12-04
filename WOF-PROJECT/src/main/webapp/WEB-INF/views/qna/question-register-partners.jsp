<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../includes/header.jsp"%>	
<!--
<***** 나은 변경사항 *****>
[argon.css]
1. #5E72E4 -> #1ABC9C
2. #525F7F-> #6C7581
<********************>
-->

<style>

.uploadResult {
	width: 100%;
	background-color: #288cff; 
}

.uploadResult ul{
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

</style>



	<!-- Q&A -->
	<div class="header bg-primary pb-6">
		<div class="container-fluid">
			<div class="header-body">
				<div class="row align-items-center py-4">
					<div class="col-lg-6 col-7">
						<h6 class="h2 text-white d-inline-block mb-0">문의하기</h6>
						<nav aria-label="breadcrumb"
							class="d-none d-md-inline-block ml-md-4">
							<ol class="breadcrumb breadcrumb-links breadcrumb-dark">
								<li class="breadcrumb-item"><a href="dashboard.html"><i
										class="fas fa-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
								<li class="breadcrumb-item active" aria-current="page">1:1문의</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- Sidenav -->
<%-- <nav
	class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white"
	id="sidenav-main">
	<div class="scrollbar-inner">
		<!-- Brand -->
		<div class="sidenav-header  align-items-center">
			<a href="${pageContext.request.contextPath }/main"><img
				alt=""
				src="${pageContext.request.contextPath }/resources/template/assets/img/brand/logo_transparent.png"
				style="height: 50px; width: 100px; margin-left: 10px;"> </a>
		</div>
		<div class="navbar-inner">
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Nav items -->
				<br> <br>

				<h3 class="nav-item">
					<a class="nav-" href="dashboard_partners.jsp"> <i
						class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">마이페이지</span>
					</a>
				</h3>
				<br>
				<div class="col-12">
					<span class="avatar avatar-sm rounded-circle"> <img
						alt="Image placeholder"
						src="/resources/template/assets/img/theme/team-4.jpg">
					</span>
				</div>
				<h4>이름</h4>
				<br> <br>
				<ul class="navbar-nav">

					<li class="nav-item"><a class="nav-link"
						href="project_apply_detail.jsp"> <i
							class="ni ni-badge text-orange"></i> <span class="nav-link-text">제안
								및 지원</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="project_apply_detail.jsp"> <i
							class="ni ni-bullet-list-67 text-default"></i> <span
							class="nav-link-text">공지사항</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/partners/profile_info.jsp">
							<i class="ni ni-settings-gear-65"></i> <span
							class="nav-link-text">프로필 관리</span>
					</a></li>
				</ul>
				<!-- Divider -->
				<hr class="my-3">
				<!-- Navigation -->
				<ul class="navbar-nav mb-md-3">
					<li class="nav-item"><a class="nav-link"
						href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
							<i class="ni ni-archive-2"></i> <span class="nav-link-text">문의하기</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/point/admin">
							<i class="ni ni-money-coins"></i> <span class="nav-link-text">포인트
								관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/Penalty/listPenaltyPartners.do">
							<i class="ni ni-palette"></i> <span class="nav-link-text">페널티
								관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/community/partners_community_list">
							<i class="ni ni-palette"></i> <span class="nav-link-text">커뮤니티 게시판
								</span>
					</a></li>					
				</ul>
			</div>
		</div>
	</div>
</nav> --%>
<!-- End side nav -->



	<!-- Q&A 질문 폼 -->
	<div class="container-fluid mt--6">
		<div class="row">
			<div class="col-xl-10 order-xl-1 center">
				<div class="card">
					<div class="card-header">
						<div class="row align-items-center">
							<div class="col-10">
								<h3 class="mb-0">1:1 문의하기</h3>
							</div>

						</div>
					</div>
					
					<div class="card-body">
						<form >
							<!-- <h6 class="heading-small text-muted mb-4">문의 정보</h6> -->
							
							<div >
							<input type="hidden" name="quest_id" id="quest_id" value=${member.member_no }> 
							</div>
							
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-last-name">이메일주소</label>
											<div class="form-control" name="userid" readonly="readonly">
											${member.userid }
											</div>
											<input type="hidden" name="senderMail">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-first-name">휴대폰 번호</label>
											<input type="text" id = "phoneNum" class="form-control" name="quest_userphone"
												maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$"  placeholder="000-0000-0000" >
												<!-- id="input-first-name" -->
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label class="form-control-label" for="input-first-name">문의 제목</label>
											<input type="text" id = "phoneNum" class="form-control" name="quest_title"
													placeholder="제목을 입력해주세요." >
										</div>
									</div>
									<div>
										<input type="hidden" name="quest_writer" value="${member.real_name }">
									</div>
									<div>
										<input type="hidden" name="quest_receiveMail" value="woflala@gmail.com">
									</div>	
								</div>
								
						<div class="row"></div>
							</div>
							<hr class="my-4" />
							<!-- Description -->
							<div class="pl-lg-4">
								<div class="form-group">
									<label class="form-control-label">문의 내용</label>
									<textarea rows="10" class="form-control" name="quest_contents"
										placeholder="문의내용을 선택 후 문의내용을 자세하게 작성해주세요.&#13;&#10;자세한 내용을 함께 보내주시면 더욱 신속히 답변드릴 수 있습니다."></textarea>
								</div>
							</div>
							
							
							<div class="text-center">
								<button  href="#!" class="btn btn-lg btn-secondary" style="font-size: 16px ; padding-left: 100px; padding-right: 100px">취&nbsp;&nbsp;소</button> 
								<button	type="submit" id="quest_send" class="btn btn-lg btn-primary" style="font-size: 16px ; padding-left: 100px; padding-right: 100px">등&nbsp;&nbsp;록</button>
							</div>
						</form>
						<span style="color:red;">${message}</span>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script>
		
		var quest = {
				quest_id : $("#quest_id").val(), //member_no
				quest_userphone : $("#quest_userphone").val(), //직접입력(연락처)
				quest_title : $("#quest_title").val(), //직접입력(제목)
				quest_contents :$("#quest_contents").val(), //직접입력(내용)
				quest_receiveMail : $("#quest_receiveMail").val(), //(hidden)고정 : 관리자Email
				quest_writer : $("quest_writer").val() //(hidden) real_name
		}
		
		$('#quest_send').click(function(){
			$.ajax({
				url : '/qna/question-send',
				type : 'POST',
				data : quest,
				success : function(data) {
				console.log("1 = 일치 / 0 = 불일치 : "+ quest);
				}
				,error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			});	
		});
			
	</script>


	
	<script>
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

	var phoneNum = document.getElementById('phoneNum');

	phoneNum.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}
	</script>
	
	
<%@ include file = "../includes/footer.jsp"%>