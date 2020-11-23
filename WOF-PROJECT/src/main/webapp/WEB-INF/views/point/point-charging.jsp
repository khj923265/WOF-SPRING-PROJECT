<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
	<jsp:include page="../includes/header-point-detail.jsp"></jsp:include>

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
						<div class="form-group col-11 center">
							<label for="example-text-input" class="form-control-label">충전
								금액</label> <input class="form-control" type="text" id="point-amount"
								name="point_amount" placeholder="금액을 입력해주세요">
							<!-- onkeyup="inputNumberAutoComma(this)" -->
						</div>
						<div class="form-group col-11 center">
							<label for="example-search-input" class="form-control-label">메모
								입력</label> <input class="form-control" type="search" value="충전"
								id="example-search-input" name="point_contents">
						</div>
						<div class="form-group col-11 center">
							<label for="example-password-input" class="form-control-label">비밀번호 확인
								</label> <input class="form-control" type="password"
								id="example-password-input">
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary my-4">충전하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 
		<script type="text/javascript">
			//팝업창 닫을 때, 부모창 새로고침
			opener.document.location.reload();
			self.close();
		</script>
	 -->

	<script type="text/javascript">
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
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>	