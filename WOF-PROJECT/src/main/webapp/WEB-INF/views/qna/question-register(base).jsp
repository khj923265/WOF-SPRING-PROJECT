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



	<!-- Q&A -->
	<div class="header bg-primary pb-6">
		<div class="container-fluid">
			<div class="header-body">
				<div class="row align-items-center py-4">
					<div class="col-lg-6 col-7">
						<h6 class="h2 text-white d-inline-block mb-0">문의하기</h6>
						<nav aria-label="breadcrumb"
							class="d-none d-md-inline-block ml-md-4">
							<ol class="breadcrumb breadcrumb-links breadcrumb-dark">
								<li class="breadcrumb-item"><a href="dashboard.html"><i
										class="fas fa-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
								<li class="breadcrumb-item active" aria-current="page">1:1문의</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Q&A 질문 폼 -->
	<div class="container-fluid mt--6">
		<div class="row">
			<div class="col-xl-10 order-xl-1 center">
				<div class="card">
					<div class="card-header">
						<div class="row align-items-center">
							<div class="col-10">
								<h3 class="mb-0">1:1 문의하기</h3>
							</div>

						</div>
					</div>
					
					<div class="card-body">
						<form action="/qna/question-register" method="post">
							<!-- <h6 class="heading-small text-muted mb-4">문의 정보</h6> -->
							
							<div >
							<input type="hidden" name="QUEST_ID" value=${member.member_no }> 
							</div>
							
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-username">문의유형</label>
											<!-- //quest_type => "0:, 1:, 2:, 3:" -->
											<input id="input-username" class="form-control"
												placeholder="선택" name="quest_type" value="문의유형">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-email">이름</label>
											<div class="form-control" name="real_name" readonly="readonly">${member.real_name }</div>
											<%-- <input type="email" id="input-email" class="form-control"
												value="${member.realname }"> --%>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-first-name">휴대폰 번호</label>
											<input type="text" id = "phoneNum" class="form-control" name="quest_userphone"
												maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$"  placeholder="000-0000-0000" >
												<!-- id="input-first-name" -->
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-last-name">이메일주소</label>
											<div class="form-control" name="userid" readonly="readonly">${member.userid }</div>
											<input type="hidden" name="senderMail">
										</div>
									</div>
									<div>
										<input type="hidden" name="receiveMail" value="jaeeunlim0329@gmail.com">
									</div>	
								</div>
								
						<div class="row"></div>
							</div>
							<hr class="my-4" />
							<!-- Description -->
							<div class="pl-lg-4">
								<div class="form-group">
									<label class="form-control-label">문의 내용</label>
									<textarea rows="10" class="form-control"
										placeholder="문의내용을 선택 후 문의내용을 자세하게 작성해주세요.&#13;&#10;자세한 내용을 함께 보내주시면 더욱 신속히 답변드릴 수 있습니다."></textarea>
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

							<div class="text-center">
								<button  href="#!" class="btn btn-lg btn-secondary" style="font-size: 16px ; padding-left: 100px; padding-right: 100px">취&nbsp;&nbsp;소</button> 
								<button	type="submit" class="btn btn-lg btn-primary" style="font-size: 16px ; padding-left: 100px; padding-right: 100px">등&nbsp;&nbsp;록</button>
							</div>
						</form>
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
	  
	});
	</script>
	
	<script>
	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else if(str.length < 11){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 3);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 4);
	          tmp += '-';
	          tmp += str.substr(7);
	          return tmp;
	      }
	  
	      return str;
	}

	var phoneNum = document.getElementById('phoneNum');

	phoneNum.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}

	</script>
	
	
	
<%@ include file = "../includes/footer.jsp"%>