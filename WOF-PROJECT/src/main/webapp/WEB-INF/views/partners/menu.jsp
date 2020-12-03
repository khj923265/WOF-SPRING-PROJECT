<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="header pb-4 pt-5 md-8">
		<div class="container">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row">
					<div class="col">
						<a class="btn btn-secondary bg-white"
							href="${pageContext.request.contextPath }/partners/followlist?member_no=${member.member_no }">관심 파트너스 관리</a> 
							<a class="btn btn-secondary bg-white"
							href="${pageContext.request.contextPath }/partners/recommend?member_no=${member.member_no }">추천 파트너스</a>
							 <a class="btn btn-secondary bg-white"
							href="${pageContext.request.contextPath}/partners/applystate?member_no=${member.member_no }">파트너스 지원현황</a>
							<a class="btn btn-secondary bg-white"
							href="${pageContext.request.contextPath}/partners/appliedpartners?member_no=${member.member_no }&proj_id=${ProjectVO.proj_id}">파트너스 선택</a>
							<a class="btn btn-secondary bg-white"
							   href="${pageContext.request.contextPath}/partners/appliedpartners?member_no=${member.member_no }&proj_id=${ProjectVO.proj_id}">계약현황</a>
						<button type="button" class="btn btn-secondary bg-white">계약완료</button>
					</div>
				</div>
			</div>
		</div>
	</div>