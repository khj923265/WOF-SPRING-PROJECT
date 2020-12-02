<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp" %>

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
					<p class="text-muted mb-2">${project.getProj_type()}</p>
					<p class="text-muted mb-2">${project.getProj_career()}</p>
					<p class="text-muted mb-2">${project.getProj_pm()}</p>
					<p class="text-muted mb-2">${project.getProj_work_type()}</p>
					<p class="text-muted mb-2">${project.getProj_work_place()}</p>
					<p class="text-muted mb-2">${project.getProj_work_time()}</p>
					<p class="text-muted mb-2">${project.getProj_work_equip()}</p>
					<p class="text-muted mb-2">${project.getProj_walfare()}</p>

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
					<h4 class="mt-0 mb-3">Comments (258)</h4>

					<textarea class="form-control form-control-light mb-2"
						placeholder="Write message" id="example-textarea" rows="3"></textarea>
					<div class="text-right">
						<div class="btn-group mb-2">
							<button type="button"
								class="btn btn-link btn-sm text-muted font-18">
								<i class="dripicons-paperclip"></i>
							</button>
						</div>
						<div class="btn-group mb-2 ml-2">
							<button type="button" class="btn btn-primary btn-sm">Submit</button>
						</div>
					</div>

	<input class="form-control" type= "hidden" name="member_no" id="member_no"	value='${member.member_no}' readonly="readonly">
	<input class="form-control" type= "hidden" name="real_name" id="real_name"	value='${member.real_name}' readonly="readonly">

				
					<div class="media mt-2">
						<div class="media-body">
							<div class = "chat">
							
											
						</div>
					</div>
				</div>

					<div class="text-center mt-2">
						<a href="javascript:void(0);" class="text-danger">Load more </a>
					</div>
				</div>
				<!-- end card-body-->
			</div>
			<!-- end card-->
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
												<h5 class="h3">${member.getRealname()}</h5>
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
													<i class="ni education_hat mr-2"></i>등록한 프로젝트
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>진행 중인 프로젝트
												</div>
												<div>
													<i class="ni education_hat mr-2"></i>완료한 프로젝트
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

						<div class="card" style="height:300px; margin-top: 20px; ">
							<div class="card-body">
								<h5 class="card-title mb-3">Files</h5>
								<!-- 산출물 -->
								<div class="card mb-1 shadow-none border" >
									<form action="insertFileAction.do" method="post"
										enctype="multipart/form-data">
										파일번호 : <input type="text" name="file_id"><br>
										프로젝트번호 : <input type="text" name="apply_id"><br>
										회원번호 : <input type="text" name="mem_id"><br>
										파일선택하기<br> <input type="file" name="fname">
										
									</form>
								</div>
								<div class="card mb-1 shadow-none border"></div>
								
								<div class="" align="center">
									<input " id="fileUpload"  type="button" value="파일업로드">
								</div>
							</div><!-- card body -->
						</div><!-- card -->
								
								
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






<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
            
		<div class="modal-footer">
		        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
		      </div>          </div>
		          <!-- /.modal-content -->
		        </div>
		        <!-- /.modal-dialog -->
		      </div>
		      <!-- /.modal -->




<script type="text/javascript" src="/resources/template/bootstrap/js/reply.js"></script>

<script>
$(document).ready(function () {
	  
	  var projValue = '<c:out value="${board.getProj_id}"/>';
	  var replyUL = $(".chat");
	  
	    showList(1);
	    
	function showList(page){
		
		  console.log("show list " + page);
	    
	    replyService.getList({proj_id:projValue,page: page|| 1 }, function(replyCnt, list) {
	      
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
	    	   +list[i].p_rno+"] "+list[i].p_rmem+"</strong>"; 
	       str +="    <small class='pull-right text-muted'>"
	           +replyService.displayTime(list[i].replyDate)+"</small></div>";
	       str +="    <p>"+list[i].p_rcont+"</p></div></li>";
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

	    
	/*     function showList(page){
	      
	      replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
	        
	        var str="";
	       if(list == null || list.length == 0){
	        
	        replyUL.html("");
	        
	        return;
	      }
	       for (var i = 0, len = list.length || 0; i < len; i++) {
	           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
	           str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
	           str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
	           str +="    <p>"+list[i].reply+"</p></div></li>";
	         }


	    replyUL.html(str);

	      });//end function
	      
	   }//end showList */
	   
	    var modal = $(".modal");
	    var modalInputReply = modal.find("input[name='reply']");
	    var modalInputReplyer = modal.find("input[name='replyer']");
	    var modalInputReplyDate = modal.find("input[name='replyDate']");
	    
	    var modalModBtn = $("#modalModBtn");
	    var modalRemoveBtn = $("#modalRemoveBtn");
	    var modalRegisterBtn = $("#modalRegisterBtn");
	    
	    $("#modalCloseBtn").on("click", function(e){
	    	
	    	modal.modal('hide');
	    });
	    
	    $("#addReplyBtn").on("click", function(e){
	      
	      modal.find("input").val("");
	      modalInputReplyDate.closest("div").hide();
	      modal.find("button[id !='modalCloseBtn']").hide();
	      
	      modalRegisterBtn.show();
	      
	      $(".modal").modal("show");
	      
	    });
	    

	    modalRegisterBtn.on("click",function(e){
	      
	      var reply = {
	            reply: modalInputReply.val(),
	            replyer:modalInputReplyer.val(),
	            bno:bnoValue
	          };
	      replyService.add(reply, function(result){
	        
	        alert(result);
	        
	        modal.find("input").val("");
	        modal.modal("hide");
	        
	        //showList(1);
	        showList(-1);
	        
	      });
	      
	    });


	  //댓글 조회 클릭 이벤트 처리 
	    $(".chat").on("click", "li", function(e){
	      
	      var rno = $(this).data("rno");
	      
	      replyService.get(rno, function(reply){
	      
	        modalInputReply.val(reply.reply);
	        modalInputReplyer.val(reply.replyer);
	        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
	        .attr("readonly","readonly");
	        modal.data("rno", reply.rno);
	        
	        modal.find("button[id !='modalCloseBtn']").hide();
	        modalModBtn.show();
	        modalRemoveBtn.show();
	        
	        $(".modal").modal("show");
	            
	      });
	    });
	  
	    
	/*     modalModBtn.on("click", function(e){
	      
	      var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
	      
	      replyService.update(reply, function(result){
	            
	        alert(result);
	        modal.modal("hide");
	        showList(1);
	        
	      });
	      
	    });

	    modalRemoveBtn.on("click", function (e){
	    	  
	  	  var rno = modal.data("rno");
	  	  
	  	  replyService.remove(rno, function(result){
	  	        
	  	      alert(result);
	  	      modal.modal("hide");
	  	      showList(1);
	  	      
	  	  });
	  	  
	  	}); */

	    modalModBtn.on("click", function(e){
	    	  
	   	  var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
	   	  
	   	  replyService.update(reply, function(result){
	   	        
	   	    alert(result);
	   	    modal.modal("hide");
	   	    showList(pageNum);
	   	    
	   	  });
	   	  
	   	});


	   	modalRemoveBtn.on("click", function (e){
	   	  
	   	  var rno = modal.data("rno");
	   	  
	   	  replyService.remove(rno, function(result){
	   	        
	   	      alert(result);
	   	      modal.modal("hide");
	   	      showList(pageNum);
	   	      
	   	  });
	   	  
	   	});

	 
	});

	</script>
	
	
	
	<!-- Footer -->
	<%@ include file="../includes/footer.jsp" %>