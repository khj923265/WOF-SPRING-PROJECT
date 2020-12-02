<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../includes/header-point-detail.jsp"%>	
	


	<title>포인트 충전</title>
	
	<!-- Main content -->
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="card bg-secondary border-0 mb-0">
					<div class="text-primary text-center mt-2 mb-3">
						<b>포인트 충전</b>
					</div>

				<div ng-app="ngRequiredApp" ng-controller="ngRequiredCtrl">
					<form action="charging" method="post" name="charging">
						<div >
							<input type="hidden" name="point_owner" value=${member.member_no }> 
						</div>
						<div class="form-group col-11 center">
							<label for="example-text-input" class="form-control-label">충전 금액</label> 
								<input class="form-control" type="text" id="input-amount" 
										name="point_amount" placeholder="금액을 입력해주세요" required>
										<!-- onkeyup="inputNumberAutoComma(this)" -->
						</div>
						<div class="form-group col-11 center">
							<label for="example-search-input" class="form-control-label">메모 입력</label> 
							<input class="form-control" type="search" value="충전" id="input-contents"
									 name="point_contents" required>
						</div>
						<div class="form-group col-11 center">
							<label for="example-password-input" class="form-control-label">비밀번호 확인</label> 
								<input class="form-control input-pw" type="password" id="userpw" name="userpw" 
										placeholder="비밀번호 입력" required>
								<div class="check_font" id="pwCheck" name="pwCheck"></div>		
						</div>
						
					  <div class="text-center">
							<input ng-disabled="charging.$error.required" type="button" class="btn btn-primary my-4" 
									data-toggle="modal" onclick="btnDisabled()"  data-target="#exampleModal" value="충전하기">
									
							<!-- 충전 확인 모달창 -->
						<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        						<button type="submit" class="btn btn-primary" onclick="closePopup()">확인</button>
      						</div>
    						</div>
  						</div>
						</div>									
					  </div>
					</form>
				</div>	
					
				</div>
			</div>
		</div>
	</div>
	
<%@ include file = "../includes/footer.jsp"%>		


	<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
	
		<script>
			//팝업창 닫을 때, 부모창 새로고침
			function closePopup() {
        	window.opener.location.reload();
        	window.close();
        	}
		</script>
		
		<!-- <script type="text/javascript">
		window.opener.location.reload();
		window.close();
		</script> -->

		
		
		
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
		function check() {
			if(!pwCheck){
				alert("비밀번호가 일치하지 않습니다.");
				return false;	
			}
		}
	</script>
	
	<script>
	<!--[-_.]?-->
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
    // 여기에 코드를 작성하세요.
    btnDisabled();

    //$('#email-input').on('input', setToggleEmail);
    //$('#password-input').on('input', setTogglePwd);
    
    $('#input-amount').on('input', setAmount);
    $('#input-contents').on('input', setContents);
    $('.input-pw').on('input', setPw);
    
    var amount = 0;
    var contents = 0;
    var pw = 0;

    // 토글 변수를 사용해서 입력값의 유무 상태를 기록한다.(입력값 없을 시 0)
    // 이를 통해 입력값을 지울 경우 입력값이 없는 상태로 업데이트 가능하다.
    // judgeBtn 함수를 호출하여 버튼 활성화 여부를 결정한다.
    function setAmount() {
      var input = $('input-amount').val();
      if(input.length > 0) {
    	  amount = 1;
      } else {
    	  amount = 0;
      }
      judgeBtn();
    }

    function setContents() {
      var input = $('#input-contents').val();
      if(input.length > 0) {
    	  contents = 1;
      } else {
    	  contents = 0;        
      }
      judgeBtn();
    }

    function setPw() {
        var input = $('#input-pw').val();
        if(input.length > 0) {
        	pw = 1;
        } else {
        	pw = 0;        
        }
        judgeBtn();
      }
    
    // 버튼 활성화 여부를 결정하는 함수
    function judgeBtn() {
      if (amount === 1 && contents === 1 && pw === 1 ) {
        btnEnabled();
      } else {
        btnDisabled();
      }
    }

    function btnDisabled() {
      $('#submit-btn').css('background-color', '#9b9b9b');
      // 버튼이 비활성화되었을 때 마우스오버 효과를 없애기 위한 코드
      setShadowNone();
      $('#submit-btn').attr('disabled', true);
      // console.log('btnDisabled');
    }

    function btnEnabled() {
      $('#submit-btn').css('background-color', '#1bbc98');
      // 아래 코드도 버튼 활성화가 가능하다.
      // $('#submit-btn').attr('disabled', false);
      $('#submit-btn').removeAttr('disabled');
      $('#submit-btn').on('mouseover', setShadow);
      $('#submit-btn').on('mouseleave', setShadowNone);
    }

    function setShadow() {
      console.log('setShadow');
      $('#submit-btn').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
    }

    function setShadowNone() {
      $('#submit-btn').css('box-shadow', 'none');
    }

  </script>
	
	<!-- <script>
	 window.onload = function () {
		document.getElementById('input_amount').addEventListener('blur',idChecker);
		document.getElementById('input_contents').addEventListener('blur',emailChecker);
		document.getElementById('input_pw').addEventListener('blur',pwChecker);
	
	 	var chargingCheck = document.getElementById('charging'); //가입버튼 비활성화 초기설정
	 	chargingCheck.disabled = true; // true : 비활성화, false : 활성화
	 	chargingCheck.style.backgroundColor = '#BDBDBD';
	 	chargingCheck.style.color = '#FFFFFF';
	 };
	 
	 var request = new XMLHttpRequest();
	 var idFlag = false;
	 var emailFlag = false;
	 var pwFlag = false;

	 function idChecker() {
		var inputId = document.getElementById('input_amount').value;
		
		if(inputId != ''){
			var url = '/point/point_check.controller'
			request.open('POST', url, true);
			request.onreadystatechange = callback;
			request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			request.send('id='+inputId);
			}else if(inputId == '' || inputId == 'undifined'){
				var resultStr = '충전 금액을 입력해주세요.';
				document.getElementById('id_checker').innerHTML = resultStr;
				idFlag = false;
				chargingChecker(); //버튼 체크
			}
				
		}
	 
	 function callback() {
		if(request.readyState == 4){
			if(request.status == 200){
				var resultXml = request.responseXML;
				var checkResult = resultXml.getElementByTagName('result')[0].childNodes[0].nodeValue;
				
				var resultStr = '';
				if(checkResult == 'true'){
					resultStr += '<span id="result_true"></span>';
					idFlag = true;
					chargingChecker();
				}else{
					resultStr += '<span id="result_false">충전 금액을 입력해주세요.</span>';
					idFlag = false;
					chargingChecker();
				}
				document.getElementById('id_checker').innerHTML = resultStr;
			}
		}
	}
	 
	 function pwChecker() {
		 var pw = document.getElementById('input_pw').value;
		 var pwTwo = document.getElementById('input_pw2').value;
		 var resultStr = '';
		 
		 if(pw != '' && pwTwo != ''){
			 if(pw == pwTwo){
				 resultStr = '<span id="result_ture">비밀번호가 일치합니다.</span>';
				 pwFlag = true;
				 chargingChecker();
			 }else{
				 resultStr = '<span id="result_ture">비밀번호가 다릅니다.</span>';
				 pwFlag = false;
				 chargingChecker();
			 }
		 }
		 
		 if(pw == '' || pw == 'undifined' || pwTwo == '' || pwTwo == 'undifined'){
			 resultStr = '비밀번호를 입력해주세요.';
			 document.getElementById('pw_checker').innerHTML = resultStr;
			 pwFlag = false;
			 chargingChecker();
		 }
		 
	}
	 
	 function emailChecker() {
		var email =  document.getElementById('input_contents').value;
		if(email != ''){
				emailFlag = true;
				chargingChecker();
			}
		if(email == '' || email == 'undifined'){
			emailFlag = false;
			chargingChecker();
			}
		}
	 
	 function chargingChecker() {
		var chargingCheck = document.getElementById('charging');
		if(idFlag == true && pwFlag == true && emailFlag == true){
				chargingCheck.disabled = false;
			 	chargingCheck.style.backgroundColor = '#FFFFFF';
			 	chargingCheck.style.color = '#000000';
			}else{
				chargingCheck.disabled = true;
			 	chargingCheck.style.backgroundColor = '#BDBDBD';
			 	chargingCheck.style.color = '#FFFFFF';
			}
		}
	 
	</script> -->

	