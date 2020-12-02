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
								<c:forEach var="quest" items="${getList }">
									<tr>
										<td scope="row">
											<div class="align-items-center">
												<span class="name mb-0 text-sm"><c:out value="${quest.quest_no }" /></span>
											</div>	
										</td>
										<td class="budget text-primary">
											<a class='move'
											href='<c:out value="${quest.quest_no }"/>'> 
											<c:out value="${quest.quest_title }" />
											</a>
										</td>
										<td>
											<span class="status">
												<fmt:parseDate var="dt" value="${quest.quest_reg_date }"
													pattern="yyyy-MM-dd" /> 
												<fmt:formatDate value="${dt }"
													pattern="yyyy/MM/dd" />
											</span>		
										</td>
										
										<td>
											<div class="d-flex align-items-center">
												<div>
													<span class="badge badge-info">답변 대기</span>
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
								</c:forEach>
								
								
							</tbody>
							
									
						</table>
						
						<div class='row'>
							<div class="col-lg-12">

								<form id='searchForm' action="/qna/question-list" method='get'>
									<select name='type'>
										<option value=""
											<c:out value="${pageMaker.standard.type == null?'selected':''}"/>>--</option>
										<option value="T"
											<c:out value="${pageMaker.standard.type eq 'T'?'selected':''}"/>>제목</option>
										<option value="C"
											<c:out value="${pageMaker.standard.type eq 'C'?'selected':''}"/>>내용</option>
										<option value="W"
											<c:out value="${pageMaker.standard.type eq 'W'?'selected':''}"/>>작성자</option>
										<option value="TC"
											<c:out value="${pageMaker.standard.type eq 'TC'?'selected':''}"/>>제목
											or 내용</option>
										<option value="TW"
											<c:out value="${pageMaker.standard.type eq 'TW'?'selected':''}"/>>제목
											or 작성자</option>
										<option value="TWC"
											<c:out value="${pageMaker.standard.type eq 'TWC'?'selected':''}"/>>제목
											or 내용 or 작성자</option>
									</select> <input type='text' name='keyword'
										value='<c:out value="${pageMaker.standard.keyword}"/>' /> <input
										type='hidden' name='pageNum'
										value='<c:out value="${pageMaker.standard.pageNum}"/>' /> <input
										type='hidden' name='amount'
										value='<c:out value="${pageMaker.standard.amount}"/>' />
									<button class='btn btn-default'>검색</button>
								</form>
							</div>
						</div>

						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-end">
								<c:if test="${pageMaker.prev }">
									<li class="page-item disabled"><a class="page-link"
										href="${pageMaker.startPage }" aria-label="Previous"> <i
											class="fa fa-angle-left"></i><span class="re-only">Prev</span></a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li
										class="page-item ${pageMaker.standard.pageNum == num ? 'active':''}">
										<a href="${num }" class="page-link">${num }</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="page-item disabled"><a class="page-link"
										href="${pageMaker.endPage +1}" aria-label="Next"> <i
											class="fa fa-angle-right"></i><span class="sr-only">Next</span></a></li>
								</c:if>
							</ul>
							<!-- page -->
						</nav>

						<form id='actionForm' action="/community/partners_community_list"
							method='get'>
							<input type='hidden' name='pageNum'
								value="${pageMaker.standard.pageNum }"> <input type='hidden'
								name='amount' value="${pageMaker.standard.amount }">
							<input type='hidden' name ="type" value='<c:out value="${pageMaker.standard.type }"/>'>
							<input type='hidden' name="keyword" value='<c:out value="${pageMaker.standard.keyword }"/>'>
						</form>

						<!-- Modal  추가 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">

										<h4 class="modal-title" id="myModalLabel">WOF</h4>
									</div>
									<div class="modal-body">처리가 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">확인</button>

									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
						
				</div>
			</div>
		</div>
	</div>
</div>					


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"문의사항" + parseInt(result)
												+ "번이 작성되었습니다.");
							}

							$("#myModal").modal("show");
						}

						var actionForm = $("#actionForm");

						$(".page-item a").on(
								"click",
								function(e) {
									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on("click",
										function(e) {

											e.preventDefault();
									 		
											actionForm
													.append("<input type='hidden' name='quest_no' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm
													.attr("action",
															"/qna/question-get");
											actionForm.submit();
										});
						
						var searchForm = $("#searchForm");
						
						$("#searchForm button").on("click", function(e) {
							
							if(!searchForm.find("option:selected").val()) {
								alert("검색 종류를 선택해야합니다.");
								return false;
							}
							
							if(!searchForm.find("input[name='keyword']").val()) {
								alert("키워드를 입력해야합니다.");
								return false;
							}
							
							searchForm.find("input[name='pageNum']").val("1");
							e.preventDefault();
							
							searchForm.submit();
							
						});
					});
</script>
						

	
<%@ include file = "../includes/footer.jsp"%>		
