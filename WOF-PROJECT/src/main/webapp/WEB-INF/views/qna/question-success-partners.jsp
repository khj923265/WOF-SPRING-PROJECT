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
	<!-- Main content -->
	<div class="main-content" id="panel">

	<!-- Q&A -->
	<div class="header bg-primary pb-6">
		<div class="container-fluid">
			<div class="header-body">
				<div class="row align-items-center py-4">
					<div class="col-lg-6 col-7">
						<h6 class="h2 text-white d-inline-block mb-0">1:1 문의</h6>
						<nav aria-label="breadcrumb"
							class="d-none d-md-inline-block ml-md-4">
							<ol class="breadcrumb breadcrumb-links breadcrumb-dark">
								<li class="breadcrumb-item"><a href="dashboard.html"><i
										class="fas fa-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
								<li class="breadcrumb-item active" aria-current="page">1:1 문의</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Q&A 질문보내기 성공 시 -->
	<div class="container-fluid mt-2">
		<div class="row">
			<div class="col">
				<div class="card">
					<!-- Card header -->
					<div class="card-header border-0">
						<h3 class="mb-0">이메일 전송 완료</h3>
						<h2 class="mb-0"><small>빠른 시일 내에 답변드리겠습니다.</small></h2>
					</div>
					
					<div class="card-body border-0">
						<input type="button" id = "backtoPage" value="미이페이지로 돌아가기" 
								onClick="moving()"> 
					</div>	
				</div>
			</div>
		</div>
	</div>
</div>					

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
function moving() {
	location.href= "dashboard_client.jsp";
}
</script>

<%@ include file = "../includes/footer.jsp"%>		
