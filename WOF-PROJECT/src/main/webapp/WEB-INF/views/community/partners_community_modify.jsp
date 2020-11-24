<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>


<!-- Main content -->

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
						<h3 class="mb-0">게시물 수정하기</h3>
					</div>


					<div class="row">
						<div class="col-lg-10">
							<div class="card-body">
								<div class="panel panel-default">


									<div class="panel-body">
										<form role="form"
											action="/community/partners_community_modify" method="post">
											<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
											
											<input type='hidden' name='pageNum' value='<c:out value="${standard.pageNum }"/>'>
											<input type='hidden' name='amount' value='<c:out value="${standard.amount }"/>'>
											<input type='hidden' name='keyword' value='<c:out value="${standard.keyword }"/>'>
											<input type='hidden' name='type' value='<c:out value="${standard.type }"/>'>
											<div class="form-group">
												<label>글 번호</label><input class="form-control" name="bno"
													value='<c:out value="${pboard.bno }"/>' readonly="readonly">
											</div>

											<div class="form-group">
												<label>제목</label><input class="form-control" name="title"
													value='<c:out value="${pboard.title }"/>'>
											</div>

											<div class="form-group">
												<label>작성자</label><input class="form-control" name="writer"
													value='<c:out value="${pboard.writer }"/>'
													readonly="readonly">
											</div>

											<div class="form-group">
												<label>내용</label>
												<textarea class="form-control" rows="3" name="content"><c:out
														value="${pboard.content }" /></textarea>
											</div>

											<div class="form-group">
												<label>작성일</label> <input class="form-control"
													name="regDate"
													value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${pboard.regdate }"/>'
													readonly="readonly">
											</div>
											<div class="form-group">
												<label>수정일</label> <input class="form-control"
													name='updateDate'
													value="${pboard.updateDate }"
													<%-- value='<fmt:formatDate pattern="yyyy/MM/dd"  value="${pboard.updateDate}" />'  --%>readonly="readonly">
											</div>

											<sec:authentication property="principal" var="pinfo"/>
											<sec:authorize access="isAuthenticated()">
											<c:if test="${pinfo.username eq pboard.writer }">
											<button type="submit" data-oper='modify'
												class="btn btn-default">글 수정</button>
											<button type="submit" data-oper='remove'
												class="btn btn-danger">글 삭제</button>
											</c:if>

											</sec:authorize>

											<button type="submit" data-oper='list' class="btn btn-info">글
												목록</button>
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
							<div class="form-group uploadDiv">
								<input type="file" name = 'uploadFile' multiple="multiple">
							</div>

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var formObj = $("form");

						$('button')
								.on(
										"click",
										function(e) {

											
											e.preventDefault();

											var operation = $(this)
													.data("oper");

											console.log(operation);

											if (operation === 'remove') {
												formObj
														.attr("action",
																"/community/partners_community_remove");
											} else if (operation === 'list') {
												formObj
														.attr("action",
																"/community/partners_community_list")
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
</script>

<script>
$(document).ready(function() {
	(function() {
		var bno = '<c:out value = "${pboard.bno}"/>';
		
		$.getJSON("/community/getAttachList", {bno:bno}, function(arr) {
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach) {
				
				if(attach.fileType) {
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					
		            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
		            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		            str += "<span> "+ attach.fileName+"</span>";
		            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
		            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		            str += "<img src='/display?fileName="+fileCallPath+"'>";
		            str += "</div>";
		            str +"</li>";
				} else {
		            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
		            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		            str += "<span> "+ attach.fileName+"</span><br/>";
		            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
		            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		            str += "<img src='/resources/img/attach.png'></a>";
		            str += "</div>";
		            str +"</li>";
					
				}
			});
			
			$(".uploadResult ul").html(str);
			
		});
		
	})();
	
	  $(".uploadResult").on("click", "button", function(e){
		    
		    console.log("delete file");
		      
		    if(confirm("파일을 삭제하시겠습니까? ")){
		    
		      var targetLi = $(this).closest("li");
		      targetLi.remove();
		    }
		  });  
	  

	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      return false;
	    }
	    
	    if(regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      return false;
	    }
	    return true;
	  }

	  
	  $("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/uploadAjaxAction',
	      processData: false, 
	      contentType: false,data: 
	      formData,type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 

	      }
	    }); //$.ajax
	    
	  });    

	  function showUploadResult(uploadResultArr){
		    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
			
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}

	    });
	    
	    uploadUL.append(str);
	  }
	
});
</script>

<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/community/partners_community_remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/community/partners_community_list").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
	      
	    }else if(operation === 'modify'){
	        
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
	        });
	        formObj.append(str).submit();
        }
    
	    formObj.submit();
	  });

});
</script>

<!-- footer -->
<%@ include file="../includes/footer.jsp"%>

