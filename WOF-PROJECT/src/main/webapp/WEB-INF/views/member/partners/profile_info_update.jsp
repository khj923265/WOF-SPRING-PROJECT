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
								<div class="col-4 text-right">
									<button type="button" class="btn btn-success">수정하기</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<h6 class="heading-small text-muted mb-4">추가정보</h6>
							<form action="" method="post">
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
									<div class="row my-3 pt-6">
										<div class="col-6 col-md-2 pr-0 text-right">이메일 :</div>
										<div class="col-6 col-md-4 text-left">${member.userid}</div>
										<div class="col-6 col-md-2 pr-0 text-right">경력 :</div>
										<div class="col-6 col-md-4 text-left">${partners.career}</div>
									</div>
									<div class="row my-3 pt-5">
										<div class="col-6 col-md-2 pr-0 text-right">전화번호 :</div>
										<input type="text" name="userphone"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="${member.userphone}"/>
										<div class="col-6 col-md-2 pr-0 text-right">보유기술 :</div>
										<input type="text" name="skill"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="ex)JAVA"/>
									</div>
									<div class="row my-3 pt-5">
										<div class="col-6 col-md-2 pr-0 text-right">선호지역 :</div>
										<input type="text" name="prefered_area"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="선호지역"/>
										<div class="col-6 col-md-2 pr-0 text-right">해시태그 :</div>
										<input type="text" name="hashtag"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="ex)#JAVA"/>
									</div>
									<div class="row my-3 pt-5">
										<div class="col-6 col-md-2 pr-0 text-right">비밀번호 변경 :</div>
										<input type="text" name="userpw"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="ex)${member.userphone}"/>
										<div class="col-6 col-md-2 pr-0 text-right">비밀번호 확인 :</div>
										<input type="text" name="userpwch"
											class="form-control form-control-muted col-6 col-md-4 "
											placeholder="ex)${member.userphone}"/>
									</div>
								</div>
							</div>
							</form>
							<hr class="my-4" />
							<!-- Address -->
							<h6 class="heading-small text-muted mb-4">이력서 관리</h6>
							<div>
								<ul
									class="nav nav-pills nav-fill flex-column flex-sm-row col-12"
									id="tabs-text" role="tablist">
									<li class="nav-item col-3"><a
										class="nav-link mb-sm-3 mb-md-0 active" id="tabs-text-1-tab"
										data-toggle="tab" href="#tabs-text-1" role="tab"
										aria-controls="tabs-text-1" aria-selected="true">프로젝트/경력
											사항</a></li>
									<li class="nav-item col-3"><a
										class="nav-link mb-sm-3 mb-md-0" id="tabs-text-2-tab"
										data-toggle="tab" href="#tabs-text-2" role="tab"
										aria-controls="tabs-text-2" aria-selected="false">자기소개/MBTI</a>
									</li>
								</ul>
							</div>
							<div class="col-12 mt-3">
								<button type="button" class="btn btn-primary col-12">
									<i class="ni ni-fat-add text-warning" style="font-size: 20px"></i>추가등록
								</button>
							</div>

							<!-- start list -->
							<div class="table-responsive mt-4">
								<table class="table align-items-center">
									<thead class="thead-light">
										<tr>
											<th scope="col" class="sort" data-sort="name">프로젝트/회사명</th>
											<th scope="col" class="sort" data-sort="skil">기술/역할</th>
											<th scope="col" class="sort" data-sort="field">분야</th>
											<th scope="col" class="sort" data-sort="tesk">담당업무</th>
											<th scope="col" class="sort" data-sort="completion">날짜</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody class="list">

										<tr>
											<th scope="row">
												<div class="media align-items-center">
													<div class="media-body">
														<span class="name mb-0 text-sm">kosta202 프로젝트</span>
													</div>
												</div>
											</th>
											<td class="skil">JAVA,개발</td>
											<td><span class="badge badge-dot mr-4"> <i
													class="bg-warning"></i> <span class="field">웹솔루션</span>
											</span></td>
											<td>
												<div>
													<span class="tesk">영화정보 및 체크인 정보 관리 시스템 설계</span>
												</div>
											</td>
											<td>
												<div class="d-flex align-items-center">
													<span>2020.10.19</span>
												</div>
											</td>
											<td class="text-right">
												<div>
													<button type="button" class="btn btn-success">수정하기</button>
													<button type="button" class="btn btn-danger">삭제하기</button>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="media align-items-center">
													<div class="media-body">
														<span class="name mb-0 text-sm">kosta202 프로젝트</span>
													</div>
												</div>
											</th>
											<td class="skil">JAVA,개발</td>
											<td><span class="badge badge-dot mr-4"> <i
													class="bg-warning"></i> <span class="field">웹솔루션</span>
											</span></td>
											<td>
												<div>
													<span class="tesk">영화정보 및 체크인 정보 관리 시스템 설계</span>
												</div>
											</td>
											<td>
												<div class="d-flex align-items-center">
													<span>2020.10.19</span>
												</div>
											</td>
											<td class="text-right">
												<div>
													<button type="button" class="btn btn-success">수정하기</button>
													<button type="button" class="btn btn-danger">삭제하기</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- end list -->
							<!-- Description -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="../../includes/footer.jsp"%>