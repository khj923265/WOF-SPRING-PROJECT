<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
						<h3 class="mb-0">문의 내역</h3>
					</div>

				<form>
					<div class="row">
						<div class="col-lg-10">
							<div class="card-body">
								<div class="panel panel-default">


									<div class="panel-body">
										<div class="form-group">
											<label>글 번호</label>
											<input class="form-control" name="quest_no"
												value='<c:out value="${quest.quest_no }"/>' readonly="readonly">
										</div>
										<div class="form-group">
											<label>제목</label>
											<input class="form-control" name="quest_title"
												value='<c:out value="${quest.quest_title }"/>' readonly="readonly">
												
										</div>

										<div class="form-group">
											<label>작성자</label>
											<input class="form-control" name="quest_writer"
												value='<c:out value="${quest.quest_writer }"/>' readonly="readonly">
										</div>

										<div class="form-group">
											<label>내용</label>
											<textarea class="form-control" rows="3" name="quest_contents" readonly="readonly">
											 	<c:out value="${quest.quest_contents }" />
											</textarea>
										</div>
										
											<button data-oper="delete" class="btn btn-default">글삭제</button>
											<button data-oper="list" class="btn btn-info">글 목록</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</form>	
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document)
.ready(
		function() {

			var formObj = $("form");

			$('button')
					.on("click",function(e) {
							
								e.preventDefault();

								var operation = $(this)
										.data("oper");

								console.log(operation);

								if (operation === 'delete') {
									formObj
											.attr("action",
													"/qna/question-remove")
											.attr("method", "post");
								} else if (operation === 'list') {
									formObj
											.attr("action",
													"/qna/question-list")
											.attr("method", "get");
									
									var pageNumTag = $("input[name='pageNum']").clone();
									var amountTag = $("input[name='amount']").clone();
									var keywordTag = $("input[name='keyword']").clone();
									var typeTag = $("input[name='type']").clone();
									
									formObj.empty();
									formObj.append(pageNumTag);
									formObj.append(amountTag);
									formObj.append(keywordTag);
									formObj.append(typeTag);
									
								}
								formObj.submit();
					});
		});








	$(document).ready(
			function() {

				var operForm = $("#operForm");
				
				$("button[data-oper='delete']").on(
						"click",
						function(e) {

							operForm.attr("action",
									"/community/partners_community_modify")
									.submit();
						});
				

				$("button[data-oper='list']").on(
						"click",
						function(e) {

							operForm.find("#quest_no").remove();
							operForm.attr("action", "/qna/question-list")
							operForm.submit();
						});
			});
</script>

<script>
	$(document).ready(function() {
		(function() {
			var bno = '<c:out value="${quest.quest_no}"/>';

			$.getJSON("/qna/getAttachList", {
				quest_no : quest_no
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
