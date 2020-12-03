<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <%@include file="../includes/header.jsp"%>



<div class="main-content" id="panel">

	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body"><h1>공지사항</h1>
		</div>
	</div>
	</div>
	<div class="container mt--7">
		<!-- Table -->
		<div class="row">
			<div class="col">
				<div class="card shadow">
					<div class="card-header border-0">
						<h3 class="mb-0"></h3>
						<div align="right">
						<button id="regBtn" type="button" class="btn btn-default">공지사항 등록하기</button>
						</div>

					</div>
					<div class="table-responsive">
						<table class="table align-items-center table-dark">
							<thead class="thead-dark">
								<tr>
									<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
										#번호</th>
									<th scope="col"><i class="ni ni-map-big ml-1"></i> 제목</th>
									<th scope="col"><i class="ni ni-circle-08"></i> 작성자</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i> 작성일</th>
									<!-- <th scope="col"><i class="ni ni-air-baloon ml-1"></i> 조회수</th> -->
								</tr>
							</thead>
							<tbody class="list">
								<c:forEach var="noticeVO" items="${list }">
									<tr>
										<td><c:out value="${noticeVO.nno }" /></td>
										<td><a class='move'
											href='<c:out value="${noticeVO.nno }"/>'> <c:out
													value="${noticeVO.title }" />
										</a></td>
										<td><c:out value="${noticeVO.nwriter }" /></td>
										<td><c:out value="${noticeVO.nrdate }" /></td>
										<%-- <td><fmt:parseDate var="dt" value="${noticeVO.nrdate }"
												pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dt }"
												pattern="yyyy/MM/dd" /></td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>


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

						<form id='actionForm' action="/admin/admin_notice"
							method='get'>
							<input type='hidden' name='pageNum'
								value="${pageMaker.standard.pageNum }"> <input type='hidden'
								name='amount' value="${pageMaker.standard.amount }">
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
										"공지사항 등록이 작성되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn")
								.on(
										"click",
										function() {
											
											/* console.log("auth: " + au);
											
									 		if(au != "ROLE_ADMIN") {
												alert("죄송하지만, 관리자만 작성이 가능한 게시판입니다.");
												return;
											}  */
											self.location = "/admin/notice_register";
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
											
											
											actionForm
													.append("<input type='hidden' name='nno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm
													.attr("action",
															"/admin/notice_get");
											actionForm.submit();
										});
						
						
					});
</script>
<%@include file="../includes/footer.jsp"%>
