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
								<li class="breadcrumb-item active" aria-current="page">문의 내역</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Q&A 질문 폼 -->
	<div class="container-fluid mt-2">
		<div class="row">
			<div class="col">
				<div class="card">
					<!-- Card header -->
					<div class="card-header border-0">
						<h3 class="mb-0">문의 내역</h3>
					</div>
					<!-- Light table -->
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<!-- 문의번호 / 제목 / 작성일 / 답변여부  -->
									<th scope="col" class="sort" data-sort="budget">문의번호</th>
									<th scope="col" class="sort" data-sort="name">제목</th>
									<th scope="col" class="sort" data-sort="status">작성일</th>
									<th scope="col" class="sort" data-sort="completion">답변여부</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody class="list">
								<tr>
									<td scope="row">
										<div class="align-items-center">
											<span class="name mb-0 text-sm">1</span>
										</div>
									</td>
									<td class="budget text-primary">클라이언트 찜하기가 안됩니다.</td>
									<td><span class="status">2020.10.20 16:10</span></td>
									<td>
										<div class="d-flex align-items-center">
											<!-- <span class="completion mr-2">60%</span> -->
											<div>
												<div>
													<span class="badge badge-info">답변 대기</span>
												</div>
												<!-- <div class="progress">
													<div class="progress-bar bg-warning" role="progressbar"
														aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
														style="width: 60%;"></div>
												</div> -->
											</div>
										</div>
									</td>
									<td class="text-right">
										<div class="dropdown">
											<a class="btn btn-sm btn-icon-only text-light" href="#"
												role="button" data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
											</a>
											<div
												class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
												<a class="dropdown-item" href="#">채팅</a>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Card footer -->
					<div class="card-footer py-4">
						<nav aria-label="...">
							<ul class="pagination justify-content-end mb-0">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1"> <i class="fas fa-angle-left"></i> <span
										class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">2 <span
										class="sr-only">(current)</span></a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"> <i
										class="fas fa-angle-right"></i> <span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>

		</div>
	</div>
	
<%@ include file = "../includes/footer.jsp"%>		
