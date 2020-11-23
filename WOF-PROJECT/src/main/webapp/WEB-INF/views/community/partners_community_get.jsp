<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>


<!-- Main Content -->

<div class="main-content" id="panel">

	<div class="header pb-8 pt-5 md-8">
		<div class="container">
			<div class="header-body"></div>
		</div>
	</div>

	<!-- Main content -->
	<div class="container mt--7">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header border-0">
						<h3 class="mb-0">커뮤니티 게시글</h3>
					</div>


					<div class="row">
						<div class="col-lg-10">
							<div class="card-body">
								<div class="panel panel-default">


									<div class="panel-body">
										<div class="form-group">
											<label>글 번호</label><input class="form-control" name="bno"
												value='<c:out value="${pboard.bno }"/>' readonly="readonly">
										</div>
										<div class="form-group">
											<label>제목</label><input class="form-control" name="title"
												value='<c:out value="${pboard.title }"/>'
												readonly="readonly">
										</div>

										<div class="form-group">
											<label>작성자</label><input class="form-control" name="writer"
												value='<c:out value="${pboard.writer }"/>'
												readonly="readonly">
										</div>

										<div class="form-group">
											<label>내용</label>
											<textarea class="form-control" rows="3" name="content"
												readonly="readonly"><c:out
													value="${pboard.content }" /></textarea>
										</div>
										<button data-oper="modify" class="btn btn-default">글
											수정</button>
										<button data-oper="list" class="btn btn-info">글 목록</button>

										<form id='operForm'
											action="/community/partners_community_modify" method="get">
											<input type='hidden' id='bno' name='bno'
												value='<c:out value="${pboard.bno }"/>'> <input
												type='hidden' name='pageNum'
												value='<c:out value="${standard.pageNum }"/>'> <input
												type='hidden' name='amount'
												value='<c:out value="${standard.amount }"/>'> <input
												type='hidden' name='keyword'
												value='<c:out value="${standard.keyword }"/>'> <input
												type='hidden' name='type'
												value='<c:out value="${standard.type }"/>'>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class='bigPictureWrapper'>
			<div class='bigPicture'></div>
		</div>



		<style>
.uploadResult {
	width: 100%;
	background-color: #288cff;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>



		<div class="row">
			<div class="col-lg-10">
				<div class="card-body">
					<div class="panel panel-default">

						<div class="panel-heading"></div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<h3>파일 목록</h3>

							<div class='uploadResult'>
								<ul>
								</ul>
							</div>
						</div>
					</div>
					<!--  end panel-body -->
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>

	</div>
</div>




<div class="container mt--10">
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header border-0">
					<i class="ni ni-tie-bow"></i> 댓글
					<div align="right">
						<button id='addReplyBtn' class='btn btn-primary'>댓글 달기</button>
					</div>
				</div>
				<div class="card-body">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="list-group">

							</ul>
						</div>

						<div class="panel-footer"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>댓글</label> <input class="form-control" name='reply'
						value='댓글을 작성해주세요.'>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='replyer'
						value='replyer'>
				</div>
				<div class="form-group">
					<label>작성일</label> <input class="form-control" name='replyDate'
						value='1995-04-22 00:13'>
				</div>

			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">작성</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!--댓글 처리 js 선언  -->
<script type="text/javascript" src="/resources/js/communityreply.js"></script>
<!-- 댓글 처리 스크립트 -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var bnoValue = '<c:out value="${pboard.bno}"/>';
						var replyUL = $(".list-group");

						showList(1);

						function showList(page) {

							console.log("show list" + page);

							replyService
									.getList(
											{
												bno : bnoValue,
												page : page || 1
											},
											function(replyCnt, list) {

												console.log("replyCnt : "
														+ replyCnt);
												console.log("list : " + list);
												console.log(list);

												if (page == -1) {
													pageNum = Math
															.ceil(replyCnt / 10.0);
													showList(pageNum);
													return;
												}

												var str = "";

												if (list == null
														|| list.length == 0) {

													return;
												}

												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class = 'list-group-item' data-rno = '" + list[i].rno + "'>";
													str += " <div><div class = 'header'><strong class = 'primary-font'>["
															+ list[i].rno
															+ "] "
															+ list[i].replyer
															+ "</strong>";
													str += "  <small class='pull-right text-muted'>"
															+ replyService
																	.displayTime(list[i].replyDate)
															+ "</small></div>";
													str += "    <p>"
															+ list[i].reply
															+ "</p><div></li>";
												}

												replyUL.html(str);

												showReplyPage(replyCnt);

											});
						} // end showList

						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");

						function showReplyPage(replyCnt) {
							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;

							var prev = startNum != 1;
							var next = false;

							if (endNum * 10 >= replyCnt) {
								endNum = Math.ceil(replyCnt / 10.0);
							}

							if (endNum * 10 < replyCnt) {
								next = true;
							}

							var str = "<ul class ='pagination justify-content-end'>";

							if (prev) {
								str += "<li class='page-item disabled'><a class = 'page-link' href='"
										+ (startNum - 1) + "'>prev</a></li>";

							}

							for (var i = startNum; i <= endNum; i++) {
								var active = pageNum == i ? "active" : "";

								str += "<li class='page-item'"+ active + "'><a class='page-link' href = '"+ i +"'>"
										+ i + "</a></li>";

							}

							if (next) {
								str += "<li class='page-item disabled'><a class= 'page-link' href='"
										+ (endNum + 1) + "'>Next</a></li>";
							}

							str += "</ul></div>";

							console.log(str);

							replyPageFooter.html(str);

						}

						replyPageFooter.on("click", "li a", function(e) {
							e.preventDefault();
							console.log("page click");

							var targetPageNum = $(this).attr("href");

							console.log("targetPageNum : " + targetPageNum);

							pageNum = targetPageNum;

							showList(pageNum);

						});

						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal
								.find("input[name='replyer']");
						var modalInputReplyDate = modal
								.find("input[name='replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						$("#addReplyBtn").on("click", function(e) {
							modal.find("input").val("");
							modalInputReplyDate.closest("div").hide();
							modal.find("button[id != 'modalCloseBtn']").hide();

							modalRegisterBtn.show();

							$(".modal").modal("show");

						});

						modalRegisterBtn.on("click", function(e) {
							var reply = {
								reply : modalInputReply.val(),
								replyer : modalInputReplyer.val(),
								bno : bnoValue
							};

							replyService.add(reply, function(result) {

								alert(result);

								modal.find("input").val("");
								modal.modal("hide");

								showList(-1);

							});

						});

						$(".list-group")
								.on(
										"click",
										"li",
										function(e) {
											var rno = $(this).data("rno");

											replyService
													.get(
															rno,
															function(reply) {
																modalInputReply
																		.val(reply.reply);

																modalInputReplyer
																		.val(reply.replyer);
																modalInputReplyDate
																		.val(
																				replyService
																						.displayTime(reply.replyDate))
																		.attr(
																				"readonly",
																				"readonly");
																modal
																		.data(
																				"rno",
																				reply.rno);

																modal
																		.find(
																				"button[id != 'modalCloseBtn']")
																		.hide();
																modalModBtn
																		.show();
																modalRemoveBtn
																		.show();

																$(".modal")
																		.modal(
																				"show");
															});
										});

						modalModBtn.on("click", function(e) {
							var reply = {
								rno : modal.data("rno"),
								reply : modalInputReply.val()
							};

							replyService.update(reply, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
						});

						modalRemoveBtn.on("click", function(e) {
							var rno = modal.data("rno");

							replyService.remove(rno, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
						});

					});
</script>


<script type="text/javascript">
	$(document).ready(
			function() {

				var operForm = $("#operForm");

				$("button[data-oper='modify']").on(
						"click",
						function(e) {

							operForm.attr("action",
									"/community/partners_community_modify")
									.submit();
						});

				$("button[data-oper='list']").on(
						"click",
						function(e) {

							operForm.find("#bno").remove();
							operForm.attr("action",
									"/community/partners_community_list")
							operForm.submit();
						});
			});
</script>

<script>
	$(document).ready(function() {
		(function() {
			var bno = '<c:out value="${pboard.bno}"/>';

			$.getJSON("/community/getAttachList", {
				bno : bno
			}, function(arr) {
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach) {
					
					if(attach.fileType) {
						var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
						
						str += "<li data-path='"+ attach.uploadPath+"'data-uuid='"+attach.uuid+"'data-filename='"+attach.fileName+"'data-tyoe='"+attach.fileType+"'><div>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					} else {
						str += "<li data-path = '"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'data-filename='"+attach.fileName+"'data-type='"+attach.fileType+"'><div>";
						str += "<span>" + attach.fileName + "</span><br/>";
						str += "<img src = '/resources/img/attach.png'>";
						str += "</div>";
						str += "</li>";
					}
				});
				$(".uploadResult ul").html(str);
				
			});
		})();
		
		$(".uploadResult").on("click", "li", function(e) {
			console.log("view image file");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
			
			if(liObj.data("type")) {
				showImage(path.replace(new RegExp(/\\/g), "/"));
			} else {
				self.location = "/download?fileName="+ path
			}
		});

	});
</script>
<!-- Footer -->
<%@ include file="../includes/footer.jsp"%>
