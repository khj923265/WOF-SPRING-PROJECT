<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- 로그인한 상태에 보여줄 태그 -->
	<sec:authorize access="isAuthenticated()">
  		<a href="">로그아웃</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="member"/>	
	</sec:authorize>
<!--
<***** 나은 변경사항 *****>
[argon.css]
1. #5E72E4 -> #1ABC9C
2. #525F7F-> #6C7581
<********************>
-->

	<jsp:include page="../includes/header.jsp"></jsp:include>

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

	<!-- Q&A 질문 폼 -->
	<div class="container-fluid mt--6">
		<div class="row">
			<div class="col-xl-8 order-xl-1">
				<div class="card">
					<div class="card-header">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">1:1 문의</h3>
							</div>

						</div>
					</div>
					<div class="card-body">
						<form>
							<h6 class="heading-small text-muted mb-4">문의 정보</h6>
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-username">문의유형</label>
											<input id="input-username" class="form-control"
												placeholder="선택" value="문의유형">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-email">이름</label>
											<input type="email" id="input-email" class="form-control"
												placeholder="이름">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-first-name">연락처</label>
											<input type="text" id="input-first-name" class="form-control"
												placeholder="000-0000-0000" value="000-0000-0000">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-last-name">이메일주소</label>
											<input type="text" id="input-last-name" class="form-control"
												placeholder="wof@example.com" value="wof@example.com">
										</div>
									</div>
								</div>
								<div class="row"></div>
							</div>
							<hr class="my-4" />
							<!-- Description -->
							<div class="pl-lg-4">
								<div class="form-group">
									<label class="form-control-label">문의 내용</label>
									<textarea rows="4" class="form-control"
										placeholder="문의내용을 입력해주세요 :D"></textarea>
								</div>
							</div>
							<div class="text-center">
								<a href="#!" class="btn btn-sm btn-secondary">취소</a> <a
									href="#!" class="btn btn-sm btn-primary">등록</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- Footer -->
		<jsp:include page="../includes/footer.jsp"></jsp:include>

	</div>
	</div>
</body>

</html>