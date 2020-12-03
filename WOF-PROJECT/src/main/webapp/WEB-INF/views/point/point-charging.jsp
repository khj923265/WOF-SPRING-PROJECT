<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../includes/header-point-detail.jsp"%>

<div class="row">
  <div class="col-md-6">
     
<div class="modal fade" id="modal-charging-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
   <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
      <div class="modal-content">
        	
<div class="modal-body p-0">
            	
<div class="card bg-secondary border-0 mb-0">

    <div class="card-header bg-transparent pb-3">
        <div class="text-muted text-center mt-2 mb-3"><large>충전하기</large></div>
    </div>
    
    <div class="card-body px-lg-5 py-lg-5">
    
        <div class="text-center text-muted mb-4">
            <small>아래 내용을 입력 후, '충전' 버튼을 눌러주세요~~!</small>
        </div>
        
        <form role="form" action="charging" method="post" name="charging" >
        
          <div id="input_text">
        	<div>
				<input type="hidden" name="point_owner" value=${member.member_no }> 
			</div>
        
            <div class="form-group mb-3">
              <label for="example-text-input" class="form-control-label">충전 금액</label>
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-money-coins"></i></span>
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
                    <input class="form-control" type="text" id="input-contents" name="point_contents" placeholder="ex) 충전" required>
                </div>
            </div>
            
            <div class="form-group">
              <label for="example-password-input" class="form-control-label">비밀번호 확인</label> 
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" type="password" id="userpw" name="userpw" placeholder="비밀번호를 입력해주세요." required>
                    <div class="check_font" id="pwCheck" name="pwCheck"></div>
                </div>
            </div>
            
          	<div class="form-group">
              <label for="example-password-input" class="form-control-label">본인확인</label> 
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" type="password" id="inputCertifiedNumber" name="userpw" placeholder="인증번호 입력	" required>
                    <button id="sendPhoneNumber">인증번호 전송</button>
                    <button id="checkBtn" disabled="">인증번호 확인</button>
                </div>
            </div>
           </div> 
            
            
            
            <div class="text-center">
                <input type="submit" class="btn btn-primary my-6" data-toggle="modal" 
                	   id="TestBtn" disabled="true"  data-target="#exampleModal" value="충전">
            </div>
            
            	<!-- 충전 확인 모달창 -->
						<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  						<div class="modal-dialog modal-dialog-centered" role="document">
    						<div class="modal-content">
    						
      						<div class="modal-header">
        						<h5 class="modal-title" id="exampleModalLabel">충전</h5>
        						<button type="button" id = "charging" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        						</button>
      						</div>
      						
      						<div class="modal-body">
        						충전하시겠습니까?
      						</div>
      						
      						<div class="modal-footer">
        						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        						<input type="submit" class="btn btn-primary" value="확인">
        								
      						</div>
      						
    						</div>
  						</div>
						</div>	 -->
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


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
	 $(function () {
		$("#input_text").on('input',function(){
			if($("input_text").val()=='')
				$("#TestBtn").attr("disabled",true);
			else
				$("#TestBtn").attr("disabled",false);
		});
	})
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
	
	<script>
        $('#sendPhoneNumber').click(function(){
            let phoneNumber = $('#inputPhoneNumber').val();
            Swal.fire('인증번호 발송 완료!')

            $.ajax({
                type: "GET",
                url: "/check/sendSMS",
                data: {
                    "phoneNumber" : phoneNumber
                },
                success: function(res){
                    $('#checkBtn').click(function(){
                        if($.trim(res) ==$('#inputCertifiedNumber').val()){
                            Swal.fire(
                                '인증성공!',
                                '휴대폰 인증이 정상적으로 완료되었습니다.',
                                'success'
                            )

                            $.ajax({
                                type: "GET",
                                url: "/update/phone",
                                data: {
                                    "phoneNumber" : $('#inputPhoneNumber').val()
                                }
                            })
                            document.location.href="/point/point-charging";
                        }else{
                            Swal.fire({
                                icon: 'error',
                                title: '인증오류',
                                text: '인증번호가 올바르지 않습니다!',
                                footer: '<a href="/point/point-charging">다음에 인증하기</a>'
                            })
                        }
                    })


                }
            })
        });
</script>

 <!--  <script>
    function sendSMS(pageName){
 
        console.log("문자를 전송합니다.");
        $("#smsForm").attr("action", pageName + ".do"); //위에 있는 폼태그를 컨트롤러로 전송한다.
        $("#smsForm").submit();
    }
  </script>
	 -->

 <!--  <script>
  var count = 0; /* 문자 중복을 막기 위한 인증번호 */
   
 $(document).ready(function() {

    $("#send").click(function() {
       
       var number = Math.floor(Math.random() * 100000) + 100000;
          if(number>100000){
             number = number - 10000;
          }

          $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
       
       var to = $("#to").val();
       
       if(to == "" || to == null){
          alert("빈칸이나 공백을 채워주세요");
       }
       
       else {
       var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
          
          if(con_test == true){
               
             if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
                 
               $.ajax({
                   url:"sendSms.do",
                   type:"post",
                   data:{to: $("#to").val(),
                        text: $("#text").val()
                        },
                 success:function(){
                   alert("해당 휴대폰으로 인증번호를 발송했습니다");
                   count++;
                   
                   alert(count);
                   },
                   error(){
                      
                   }
                   
                });
             } else {
                alert("인증번호가 이미 발송되었습니다.")
             }
          
          }
             else if(con_test == false){
                
             }
         }   
    })
    $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
       alert($("#text").val());
       var userNum = $("#userNum").val();
       
       var sysNum = $("#text").val();         
       
       if(userNum == null || userNum == ""){
          alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       }     
       else{     
          if(userNum.trim() == sysNum.trim()){
              alert("성공");
           }
           else {
              alert("실패");
           }          
       }
    });
  });
  </script> -->


