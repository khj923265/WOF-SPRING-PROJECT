<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Header -->
<%@ include file="../includes/header.jsp"%>



<style>

.uploadResult {
	width: 100%;
	background-color: #288cff; 
}

.uploadResult ul{
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

</style>
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
						<h3 class="mb-0">커뮤니티 게시글 작성</h3>
					</div>


					<div class="row">
						<div class="col-lg-10">
							<div class="card-body">
								<div class="panel panel-default">

									<div class="panel-body">
										<form role="form"
											action="/community/partners_community_register" method="post">
											<input type ="hidden" name = "${_csrf.parameterName }" value="${_csrf.token }"/>
											<div class="form-group">
												<label>제목</label><input class="form-control" name="title">
											</div>

											<div class="form-group">
												<label>작성자</label><input class="form-control" name="writer"
												value='<sec:authentication property="principal.username"/>' readonly="readonly">
											</div>

											<div class="form-group">
												<label>내용</label>
												<textarea class="form-control" rows="3" name="content"></textarea>
											</div>

											<button type="submit" class="btn btn-default">등록하기</button>

										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class = "col-lg-10">
							<div class = "card-body">
								<div class="panel panel-default">
								<div class ="panel-heading"></div>
									<div class="panel-body">
										<h3>파일 업로드</h3>
										<div class="form-group uploadDiv">
											<input type ="file" name='uploadFile' multiple>
										</div>
										
										<div class='uploadResult'>
											<ul>
											
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(e) {

		  var formObj = $("form[role='form']");
		  
		  $("button[type='submit']").on("click", function(e){
		    
		    e.preventDefault();
		    
		    console.log("submit clicked");
		    
		    var str = "";
		    
		    $(".uploadResult ul li").each(function(i, obj){
		      
		      var jobj = $(obj);
		      
		      console.dir(jobj);
		      console.log("-------------------------");
		      console.log(jobj.data("filename"));
		      
		      
		      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		      
		    });
		    
		    console.log(str);
		    
		    formObj.append(str).submit();
		    
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
				contentType: false,
				data:formData, type: 'POST',
					dataType: 'json',
					success: function(result) {
						console.log(result);
						showUploadResult(result);
					}
			}); // end ajax
		  });  
	  
	  
	  function showUploadResult(uploadResultArr){
		    
		    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		    
		    var uploadUL = $(".uploadResult ul");
		    
		    var str ="";
		    
		    $(uploadResultArr).each(function(i, obj){
		    
		        /* //image type
		        if(obj.image){
		          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
		          str += "<li><div>";
		          str += "<span> "+ obj.fileName+"</span>";
		          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		          str += "<img src='/display?fileName="+fileCallPath+"'>";
		          str += "</div>";
		          str +"</li>";
		        }else{
		          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
		            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		              
		          str += "<li><div>";
		          str += "<span> "+ obj.fileName+"</span>";
		          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		          str += "<img src='/resources/img/attach.png'></a>";
		          str += "</div>";
		          str +"</li>";
		        } */
				//image type
				
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
	  
	  
	  $(".uploadResult").on("click", "button", function(e){
		    
		    console.log("delete file");
		      
		    var targetFile = $(this).data("file");
		    var type = $(this).data("type");
		    
		    var targetLi = $(this).closest("li");
		    
		    $.ajax({
		      url: '/deleteFile',
		      data: {fileName: targetFile, type:type},
		      dataType:'text',
		      type: 'POST',
		        success: function(result){
		           alert(result);
		           
		           targetLi.remove();
		         }
		    }); //$.ajax
		   });
	  
	});
		  
</script>
<!-- Footer -->
<%@ include file="../includes/footer.jsp"%>


