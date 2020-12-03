<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../includes/header-point-detail.jsp"%>	


<div class="row">
  <div class="col-md-6">
     
<div class="modal fade" id="modal-withdraw-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
   <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
      <div class="modal-content">
        	
<div class="modal-body p-0">
            	
<div class="card bg-secondary border-0 mb-0" style="width: 500px">

    <div class="card-header bg-transparent pb-3">
        <div class="text-muted text-center mt-2 mb-3"><large>인출하기</large></div>
    </div>
    
    <div class="card-body px-lg-5 py-lg-5">
    
        <div class="text-center text-muted mb-4">
            <small>아래 내용을 입력 후, '인출' 버튼을 눌러주세요~~!</small>
        </div>
        
        <form role="form" action="withdraw" method="post" name="withdraw" >
        	<div>
				<input type="hidden" name="point_owner" value=${member.member_no }> 
			</div>
        
        	<div class="text-right text mute mb-3">
        	 	<small>출금가능 포인트 :&nbsp;</small> <b style="color:green">${member.total_point }</b> &nbsp;P
        	</div>
        
            <div class="form-group mb-3">
              <label for="example-text-input" class="form-control-label">인출 금액</label>
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-money-coins""></i></span>
                    </div>
                    <input class="form-control" type="text" id="input-amount" name="point_amount" placeholder="금액을 입력해주세요." required>
                </div>
            </div>
            
            <div class="form-group">
              <label for="example-search-input" class="form-control-label">메모 입력</label> 
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-align-center"></i></span>
                    </div>
                    <input class="form-control" type="text" id="input-contents" name="point_contents" placeholder="ex) 인출" required>
                </div>
            </div>
            
            <!-- <div class="form-group">
              <label for="example-password-input" class="form-control-label">비밀번호 확인</label> 
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" type="password" id="userpw" name="userpw" placeholder="비밀번호를 입력해주세요." required>
                    <div class="check_font" id="pwCheck" name="pwCheck"></div>
                </div>
            </div> -->
            
            <div class="form-group">
              <label for="example-password-input" class="form-control-label">본인확인</label> 
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" type="password" id="userpw" name="userpw" placeholder="비밀번호를 입력해주세요." required>
                    <div class="check_font" id="pwCheck" name="pwCheck"></div>
                </div>
                
                <div class="col-5 mt-3 ml--3">
					<button type="submit" class="btn btn-secondary my-3"" id="example-password-input2">인증번호 발송</button>
				</div>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-primary my-6" data-toggle="modal" data-target="#exampleModal" >인출</button>
            </div>
            
        </form>
        
    </div> <!-- end of card body -->
</div> <!-- end of card -->

</div> <!-- end of modal body -->
            
        </div> <!-- end of modal-content -->
    </div> <!-- end of modal-dialog -->
</div> <!-- end of modal fade -->


  </div> <!-- end of col -->
  
</div> <!-- end of row -->	

<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>

<script>
		//<충전 금액>입력 => 숫자만 가능, 천단위 콤마
		function inputNumberAutoComma(obj) {
			// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
			var deleteComma = obj.value.replace(/\,/g, "");
			// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
			if (isFinite(deleteComma) == false) {
				alert("문자는 입력하실 수 없습니다.");
				obj.value = "";
				return false;
			}
			// 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
			obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
		}
		// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
		function inputNumberWithComma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
		}
		// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
		function inputNumberRemoveComma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, "");
		}
	</script>
	
	<script>
	// 비밀번호 일치여부 확인
		function check() {
			if(!pwCheck){
				alert("비밀번호가 일치하지 않습니다.");
				return false;	
			}
		}
	</script>
	
	<script>
	// 비밀번호 일치여부 확인
	
	var pwCheck = false;
	var expPw = /^[0-9a-zA-Z]([0-9a-zA-Z])[0-9a-zA-Z]([0-9a-zA-Z])[a-zA-Z]{2,3}$/i;
	
	// 유효성 검사(1 = 중복 / 0 != 중복)
	$('#userpw').blur(function() {
		// id = "id_reg" / name = "userId"
		var userpw = $('#userpw').val();
		
		$.ajax({
			url : '/point/pwCheck?userpw='+ userpw,
			type : 'get',
			success : function(data) {
		
			parseInt(data);
			
			console.log("1 = 일치 / 0 = 불일치 : "+ data);	
			if (data == 0){
				$("#pwCheck").text("비밀번호 불일치");
				$("#pwCheck").css("color", "red");
			}else if (data == 1){
					$("#pwCheck").text("비밀번호 일치");
					$("#pwCheck").css("color", "green");
					//$("#reg_submit").attr("disabled", true);
					pwCheck = true;
				}
			}
		,error:function(request,status,error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	
		})		
	})
	</script>
	
