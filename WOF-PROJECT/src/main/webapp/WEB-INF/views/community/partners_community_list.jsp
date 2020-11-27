
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>


<div class="main-content" id="panel">

	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body"><h1>파트너스들만의 비밀 공간</h1>
			<h3>- 게시글을 이용하여 서로 소통해보세요.</h3></div>
		</div>
	</div>

	<div class="container mt--7">
		<!-- Table -->
		<div class="row">
			<div class="col">
				<div class="card shadow">
					<div class="card-header border-0">
						<h3 class="mb-0">파트너스 커뮤니티 게시판</h3>
						<div align="right">
						<sec:authorize access="isAuthenticated()">
						<button id="regBtn" type="button" class="btn btn-default">새
								글 등록하기</button>
						</sec:authorize>
							
						</div>

					</div>
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
										#번호</th>
									<th scope="col"><i class="ni ni-map-big ml-1"></i> 제목</th>
									<th scope="col"><i class="ni ni-circle-08"></i> 작성자</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i> 작성일</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i> 수정일</th>
									<!-- <th scope="col"><i class="ni ni-air-baloon ml-1"></i> 조회수</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="pboard" items="${list }">
									<tr>
										<td><c:out value="${pboard.bno }" /></td>
										<td><a class='move'
											href='<c:out value="${pboard.bno }"/>'> <c:out
													value="${pboard.title }" />
													<b>[<c:out value="${pboard.replyCnt }"/>]</b></a></td>
										<td><c:out value="${pboard.writer }" /></td>
										<td><fmt:parseDate var="dt" value="${pboard.regdate }"
												pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dt }"
												pattern="yyyy/MM/dd" /></td>
										<td><fmt:parseDate var="dt" value="${pboard.updateDate }"
												pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dt }"
												pattern="yyyy/MM/dd" /></td>
												<%-- <td><c:out value="${pboard.viewscnt }" /></td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class='row'>
							<div class="col-lg-12">

								<form id='searchForm' action="/community/partners_community_list" method='get'>
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

										<h4 class="modal-title" id="myModalLabel">Working Free</h4>
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

<!-- list end -->



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
										"커뮤니티 게시판 게시글" + parseInt(result)
												+ "번이 작성되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn")
								.on(
										"click",
										function() {
											var au = "${member.auth}";
											
											console.log("auth: " + au);
											
									 		if(au != "ROLE_PARTNERS") {
												alert("죄송하지만, 파트너스만 작성이 가능한 게시판입니다.");
												return;
											} 
											self.location = "/community/partners_community_register";
										});
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
								.on(
										"click",
										function(e) {
											
											

											e.preventDefault();
											
											
											var au = "${member.auth}";
											
											console.log("auth: " + au);
											
									 		if(au != "ROLE_PARTNERS") {
												alert("죄송하지만, 파트너스만 확인할 수 있습니다.");
												return;
											} 

									 		
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm
													.attr("action",
															"/community/partners_community_get");
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


<!-- Footer -->
<%@ include file="../includes/footer.jsp"%>
