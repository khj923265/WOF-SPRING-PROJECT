<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp" %>
	
<style>
.uploadResult1 ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
		align-items: center;
}
.uploadResult1 ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}
</style>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.member" var="member"/>   
</sec:authorize>

	<!-- Main Content -->
	<div class="main-content" id="panel">
	<div class="row">
		<div class="col-xl-7 col-lg-5" style="margin-left: 80px; margin-top: 50px;">
			<!-- project card -->
			<div class="card d-block">
				<div class="card-body">
					<div class="dropdown float-right">
						<a href="#" class="dropdown-toggle arrow-none card-drop"
							data-toggle="dropdown" aria-expanded="false"> <i
							class="dripicons-dots-3"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<!-- item-->
							
							
							<a href="/project/update?proj_id=${project.getProj_id()}" class="dropdown-item">
								<i class="mdi mdi-pencil mr-1"></i>Edit</a>
									<!-- item-->
							<a class="dropdown-item" data-toggle="modal" href="#myModal">
							 <i class="mdi mdi-delete mr-1"></i>Delete</a>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item"><i
										class="mdi mdi-email-outline mr-1"></i>Invite</a>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item"><i
										class="mdi mdi-exit-to-app mr-1"></i>Leave</a>


							
						</div>
					</div>
					<!-- project title-->
					
					<%-- 
						<input type='hidden' id='proj_id' name='proj_id' value='<c:out value="${project.getProj_id}"/>'>
						<input type='hidden' name='pageNum' value='<c:out value="${stand.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${stand.amount}"/>'> --%>
				
						
					<h3 class="mt-0">${project.getProj_title()}</h3>
					<div class="badge badge-secondary mb-3">Ongoing</div>
					<div class="badge badge-secondary mb-3">마감임박</div>

					<h5>Project Overview:</h5>

					<p class="text-muted mb-2">${project.getProj_reqr_skill()}</p>
					<%-- <p class="text-muted mb-2">${project.getProj_type()}</p> --%>
					<p class="text-muted mb-2">${project.getProj_career()}</p>
					<%-- <p class="text-muted mb-2">${project.getProj_pm()}</p>
					<p class="text-muted mb-2">${project.getProj_work_type()}</p> 
					<p class="text-muted mb-2">${project.getProj_work_place()}</p>--%>
					<p class="text-muted mb-2">${project.getProj_work_time()}</p>
					<%-- <p class="text-muted mb-2">${project.getProj_work_equip()}</p>
					<p class="text-muted mb-2">${project.getProj_walfare()}</p> --%>

					<p class="text-muted mb-4">${project.getProj_detail()}</p>

					<div class="row">
						<div class="col-md-4">
							<div class="mb-4">
								<h5>Start Date</h5>
								<p>${project.getProj_start_date()}</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="mb-4">
								<h5>End Date</h5>
								<p>${project.getProj_end_date()}</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="mb-4">
								<h5>Budget</h5>
								<p>${project.getProj_estimate()}</p>
							</div>
						</div>
					</div>

					<div>
						<h5>Team Members:</h5>
						${project.getProj_reqr_person()}
					</div>

				</div>
				<!-- end card-body-->

			</div>
			<!-- end card-->

			<div class="card">
				<div class="card-body">
					<h4 class="mt-0 mb-3">Comments <b>(<c:out value="${project.getProj_replyCnt()}" />)</b></h4>
					<input type="checkbox" value="secret" id="secretReply">비밀글로 쓰기

					<textarea class="form-control form-control-light mb-2"
						placeholder="Write message" id="reply_contents" rows="3" name="reply_contents" onkeyup="val(this);"></textarea>
						
					<div class="text-right">
						<div class="btn-group mb-2 ml-2">
							<button id="registerBtn"  type="button" class="btn btn-primary btn-sm">Submit</button>
						</div>
					</div>

	<input class="form-control"  type="hidden" name="member_no" id="member_no"	value='${member.member_no}' readonly="readonly">
	<input class="form-control" type="hidden"  name="real_name" id="real_name"	value='${member.real_name}' readonly="readonly">
	
				
					
							<ul class="chat">	
							
								<c:forEach var="project_reply" items="${replylist}">
									<div class="media mt-2">
										<div class="media-body">
											<h5 class="mt-0">${project_reply.getReplyer()}</h5>
											
											<div class="row">
												<div class="col">
													<span>${project_reply.getReply()}</span>
												</div><!-- col -->
												
												
											<c:if test="${member.member_no == project_reply.getReplyer()}">	
												<div class="col" style="text-align: right;">
														<div id="modifyBtn" type="text" class="" value="수정" style="display: inline;"><a href="/replies/{rno}">수정</a></div>
														<div id="removeBtn" type="text" class="" value="삭제" style="display: inline;"><a href="/replies/{rno}">삭제</a></div>
												</div><!-- col -->
											</c:if>
											
											</div><!-- row -->
										</div>
									</div>
								</c:forEach>
								
								   
							</ul>
					
					

					<div class="panel-footer">
						<a href="javascript:void(0);" class="text-danger">Load more </a>
					</div>
				</div>	<!-- end card-body-->
				
				
			</div><!-- end card-->
			<sec:authorize access="isAuthenticated()">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title mb-3">파일 목록</h5>
					<div class="panel-body">
						<div class='uploadResult1'>
							<ul>
							</ul>
						</div>
					</div>	
				</div>
			</div>
			</sec:authorize>
						

		</div>
		<!-- end col -->

		<div class="col-lg-5 col-xl-3" style="margin-left: 80px; margin-top: 50px;">
			<div class="card" >
				<div class="card-body">
					<h5 class="card-title mb-3">Profile</h5>
					<div class="mt-3 chartjs-chart" style="height: 320px;">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class="">
									<div class="row">
										<div class="col">
											<div class="text-left">
												<h5 class="h3">${member.getReal_name()}</h5>
												<div class="h5 mt-4">
													<i class="ni business_briefcase-24 mr-2"></i>
													${member.getUserid()}
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>
													${member.getUserphone()}
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>★★★☆☆
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>등록한 프로젝트  : 4
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>진행 중인 프로젝트  : 1
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>완료한 프로젝트  : 1
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
									<canvas id="line-chart-example" width="324"
										style="display: block; height: 190px; width: 288px;"
										class="chartjs-render-monitor" height="360"></canvas>
								</div>
							</div>
						</div>
						<!-- end card-->
						<%-- ${member.member_no}
						${partners.member_no }
						${checkAuth.member_no } --%>
						<c:out value="${checkAuth.member_no }"/>
						<input type="hidden" name = "checkAuth" value="${checkAuth.member_no }">
					
	
						<sec:authorize access="isAuthenticated()">
						<c:if test="${partners.member_no eq member.member_no }">
						<div class="card" style="height:300px; margin-top: 20px; ">
							<div class="card-body">
								<h5 class="card-title mb-3">파일 관리</h5>
								<!-- 산출물 -->
								<div class="panel-body">
										<div class="form-group uploadDiv">
											<input type ="file" name='uploadFile' multiple>
										</div>
										
										<div class='uploadResult'>
											<ul>
											
											</ul>
										</div>
								</div>
								<div class="card mb-1 shadow-none border"></div>
								
								
								<form role="form" action="/project/fileup" method="post">
									<button type="submit" class="">파일 올리기</button>
									<input type="hidden" name='proj_id' value='${project.getProj_id()}'>
									<input class="form-control" type= "hidden" name="member_no" id="member_no"	value='${member.member_no}'>
								</form>
							<br>
							
						
						
						
							</div><!-- card body -->
						</div><!-- card -->
						</c:if>
						</sec:authorize>


						<div class="" align="center">
							<input class="btn btn-default" id="chatConnect"  type="button" value="채팅하기">
							<input class="btn btn-default" id="applyButton" type="button" value="지원하기">
						</div>
					
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>





	<!-- Footer -->
	<%@ include file="../includes/footer.jsp" %>

			<!-- 프로젝트 삭제 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">경고창</h4>
						</div>
						<div class="modal-body">
							<p>정말로 삭제하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
							<a href="/project/delete?proj_id=${project.getProj_id()}"><button
									type="button" class="btn btn-primary">삭제</button></a>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->





			<script type="text/javascript"
				src="/resources/template/bootstrap/js/reply.js"></script>


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
	    
	    
	    
	    var memau = "${partners.member_no }";
	    
	    var memaa = "${applyregister.member_no}";
	   alert(memaa);
	    
 		if(memau != "${member.member_no}") {
			alert("본인이 진행중인 프로젝트만 파일 업로드가 가능합니다.");
			return;
		} else {
		    formObj.append(str).submit();
		    alert("파일이 업로드 완료.");
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
		  
</script><!-- 파일업로드 -->


<script>
	$(document).ready(function() {
		(function() {
			var proj_id = '<c:out value="${project.getProj_id()}"/>';

			$.getJSON("/project/getAttachList", {
				proj_id : proj_id
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
				$(".uploadResult1 ul").html(str);
				
			});
		})();
		
		$(".uploadResult1").on("click", "li", function(e) {
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




	<!--프로젝트 댓글달기-->
	<script type="text/javascript" src="/resources/js/reply.js"></script>

	<script>
	$(document).ready(function () {
		  
		  var pnoValue = '<c:out value="${project.getProj_id()}"/>';
		  var replyUL = $(".chat");
		  
		    showList(1);
		    
		function showList(page){
			
			console.log("show list " + page);
		    
		    replyService.getList({pno:pnoValue,page: page|| 1 }, function(replyCnt, list) {
		      
		    console.log("replyCnt: "+ replyCnt );
		    console.log("list: " + list);
		    console.log(list);
		    
		    if(page == -1){
		      pageNum = Math.ceil(replyCnt/10.0);
		      showList(pageNum);
		      return;
		    }
		      
		     var str="";
		     
		     if(list == null || list.length == 0){
		       return;
		     }
		     
		     for (var i = 0, len = list.length || 0; i < len; i++) {
		       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
		       str +="  <div><div class='header'><strong class='primary-font'>["
		    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
		       str +="    <small class='pull-right text-muted'>"
		           +replyService.displayTime(list[i].replyDate)+"</small></div>";
		       str +="    <p>"+list[i].reply+"</p><c:if test='${member.member_no == project_reply.getReplyer()}'><div class='col' style='text-align: right;'>"
		       		+"<div id='modifyBtn' type='text' class='' value='수정' style='display: inline;'><a href='/replies/{rno}'>수정</a></div>&nbsp;"
					+"<div id='removeBtn' type='text' class='' value='삭제' style='display: inline;'><a href='/replies/{rno}'>삭제</a></div></div></li>"
					+"</div></c:if>";
		     }
		     
		     replyUL.html(str);
		     
		     showReplyPage(replyCnt);

		 
		   });//end function
		     
		 }//end showList
		 
		 
		    
		    var pageNum = 1;
		    var replyPageFooter = $(".panel-footer");
		    
		    function showReplyPage(replyCnt){
		      
		      var endNum = Math.ceil(pageNum / 10.0) * 10;  
		      var startNum = endNum - 9; 
		      
		      var prev = startNum != 1;
		      var next = false;
		      
		      if(endNum * 10 >= replyCnt){
		        endNum = Math.ceil(replyCnt/10.0);
		      }
		      
		      if(endNum * 10 < replyCnt){
		        next = true;
		      }
		      
		      var str = "<ul class='pagination pull-right'>";
		      
		      if(prev){
		        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		      }
		      
		      for(var i = startNum ; i <= endNum; i++){
		        
		        var active = pageNum == i? "active":"";
		        
		        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		      }
		      
		      if(next){
		        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		      }
		      
		      str += "</ul></div>";
		      
		      console.log(str);
		      
		      replyPageFooter.html(str);
		    }
		     
		    replyPageFooter.on("click","li a", function(e){
		       e.preventDefault();
		       console.log("page click");
		       
		       var targetPageNum = $(this).attr("href");
		       
		       console.log("targetPageNum: " + targetPageNum);
		       
		       pageNum = targetPageNum;
		       
		       showList(pageNum);
		     });     
		    
		    
		    function val(e){
		    	var someText = document.getElementById("reply_contents").value;
		    	alert(someText);
		    }
		    
		    
		    $('#secretReply').click(function(){
		    	if($(this).is(':checked')){
		    		alert("비밀글로 설정되었습니다.");
		    	}
		    })
		  

		    $("#registerBtn").on("click",function(e){
		      
		    	var text = document.getElementById("reply_contents").value;
			 	alert(text+"를 입력하시겠습니까?");
			 	var mem = $("#member_no").val();
			 	
			 	
			 		
		    	
		      var reply = {
		            reply: text,
		            replyer: mem,
		            pno:pnoValue
		          };
		      replyService.add(reply, function(result){
		    	  console.log("댓글내용 : "+text);
		        
		        //showList(1);
		        showList(-1);
		        
		      });
		      
		    });
		    
		    
		  
		    $("#modifyBtn").on("click", function(e){
		    	  
		     	  var reply = {/* rno: data("rno"),  */ reply: reply_contents.val()};
		     	  
		     	  replyService.update(reply, function(result){
		     	        
		     	    alert(result);
		     	    modal.modal("hide");
		     	    showList(pageNum);
		     	    
		     	  });
		     	  
		     	});


		    $("#removeBtn").on("click", function (e){
		     	  
		     	  var rno = modal.data("rno");
		     	  
		     	  replyService.remove(rno, function(result){
		     	        
		     	      alert(result);
		     	      modal.modal("hide");
		     	      showList(pageNum);
		     	      
		     	  });
		     	  
		     	}); 
		  
		 
		});

		</script>
		
		
	<!-- 채팅api 연결 -->	
	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
	$(document).ready(function () {
		 $("#chatConnect").on("click", function(e){
		
			var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
			(function(){
			var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
			s1.async=true;
			s1.src='https://embed.tawk.to/5fc83af6920fc91564ccef4d/default';
			s1.charset='UTF-8';
			s1.setAttribute('crossorigin','*');
			s0.parentNode.insertBefore(s1,s0);
			})();
			
		 });
		
		<!--End of Tawk.to Script-->

	});
	</script>