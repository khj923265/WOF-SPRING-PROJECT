<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../includes/header-point-detail.jsp"%>	

	<title>포인트 충전</title>
	
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="card bg-secondary border-0 mb-0">
					<div class="text-primary text-center mt-2 mb-3">
						<b>결제 버튼 테스트</b>
					</div>

					<form action="/point/paymentIn" method="post" name="paymentIn">
							<input type="hidden" name="client" value=${member.member_no }>
							<input type="hidden" name="point_amount" value="200000">
							<input type="hidden" name="point_contents" value="프로젝트 대금 결제 Test">
							
							<%-- <input type="hidden" name="client" value=${member.member_no }>
							<input type="hidden" name="point_amount" value="${PROJ_ESTIMATE }">
							<input type="hidden" name="point_contents" value="${PROJ_TITLE }">
							<input type="hidden" name="point_chg_date" value="${Proj_start_date }"> --%>
					  <div class="text-center">
							<button type="submit" class="btn btn-primary my-4" value="충전하기"></button>
					  </div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file = "../includes/footer.jsp"%>		

	<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
