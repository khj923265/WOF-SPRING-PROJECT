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

					<form action="charging" method="post">
						<div >
							<input type="hidden" name="point_owner" value=${member.member_no }> 
						</div>
						<div class="form-group col-11 center">
							<label for="example-text-input" class="form-control-label">충전 금액</label> 
								<input class="form-control" type="text" id="point-amount" 
										name="point_amount" placeholder="금액을 입력해주세요">
										<!-- onkeyup="inputNumberAutoComma(this)" -->
						</div>
						<div class="form-group col-11 center">
							<label for="example-search-input" class="form-control-label">메모 입력</label> 
							<input class="form-control" type="search" value="충전"
									id="example-search-input" name="point_contents">
						</div>
						<div class="form-group col-11 center">
							<label for="example-password-input" class="form-control-label">비밀번호 확인</label> 
								<input class="form-control" type="password" id="userpw" name="userpw" 
										placeholder="비밀번호 입력" required>
								<div class="check_font" id="pwCheck" name="pwCheck"></div>		
						</div>
						
						
					  <div class="text-center">
							<button type="button" class="btn btn-primary my-4" 
									data-toggle="modal" data-target="#exampleModal">충전하기</button>
									
							<!-- 충전 확인 모달창 -->
						<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  						<div class="modal-dialog modal-dialog-centered" role="document">
    						<div class="modal-content">
      						<div class="modal-header">
        						<h5 class="modal-title" id="exampleModalLabel">충전</h5>
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
	
<%@ include file = "../includes/footer.jsp"%>		

	<!-- 
		<script>
			//팝업창 닫을 때, 부모창 새로고침
			function closePopup() {
        	window.opener.location.reload();
        	window.close();
		</script>
	 -->
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
	<!--[-_.]?-->
	var pwCheck = true;
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
					pwCheck = false;
				}
			}
		,error:function(request,status,error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	
	})		
});
	</script>

	<!--  if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#pwCheck").text("사용중인 아이디입니다 :p");
						$("#pwCheck").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(userpw)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#pwCheck").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(userpw == ""){
							
							$('#pwCheck').text('아이디를 입력해주세요 :)');
							$('#pwCheck').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#pwCheck').text("비밀번호는 대소문자, 숫자, 특수문자 포함 8자리 이상만 가능합니다 :)");
							$('#pwCheck').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
	-->		
	