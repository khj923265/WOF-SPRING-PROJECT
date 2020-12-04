<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- Header & Menu -->
<%@ include file="../includes/header.jsp"%>


<div class="container-fluid">
	<!-- breadcrumb -->
	<div class="row align-items-center mt-3">
		<div class="col-9"></div>
		<div class="col">
			<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
				<ol class="breadcrumb breadcrumb-links breadcrumb-dark">
					<li class="breadcrumb-item">
						<a href="/"><i class="fas fa-home"></i></a>
					</li>
					<li class="breadcrumb-item">프로젝트 찾기</li>
					<li class="breadcrumb-item">프로젝트 목록</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- breadcrumb -->
	
	<!-- search side bar -->
	<div class="row">
		<div class="col-3">
			<div class="card" id="sidebox">
				<div class="card-header text-center pb-1">
					<h3>맞춤 프로젝트</h3>
				</div>
				
				<div class="card-body">
					<form id="searchForm" class="form-group" action="/project/list" method="get">
						<h4>프로젝트 구분</h4>
						<div class="row pb-3">
							<div class="col">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input">
									<label class="custom-control-label" for="searchCheck1">개발</label>
								</div>
							</div>
							<div class="col">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="searchCheck2">
									<label class="custom-control-label" for="searchCheck2">디자인</label>
								</div>
							</div>
							<div class="col">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="searchCheck3">
									<label class="custom-control-label" for="searchCheck3">기획</label>
								</div>
							</div>
						</div>
						
						<h4>프로젝트 분야</h4>
						<div class="row pb-3">
							<div class="col">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="searchCheck4">
									<label class="custom-control-label" for="searchCheck4">웹</label>
								</div>
							</div>
							<div class="col">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="searchCheck5">
									<label class="custom-control-label" for="searchCheck5">앱</label>
								</div>
							</div>
							<div class="col">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="searchCheck6">
									<label class="custom-control-label" for="searchCheck6">커머스</label>
								</div>
							</div>
						</div>
						
						<input type="hidden" name="pageNum" value="${pageDto.standard.pageNum } ">
						<input type="hidden" name="amount" value="${pageDto.standard.amount }">
						<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
					</form>	
				</div><!-- /.card-body -->
				
				<div class="card-footer">
					<!-- pagination -->
					<nav aria-label="Page navigation">
						<ul class="pagination pagination-sm justify-content-center">
							<c:if test="${pageDto.prev }">
								<li class="page-item">
									<a class="page-link" href="${pageDto.startPage - 1 }" tabindex="-1">
									<i class="fa fa-angle-left"></i>
									<span class="sr-only">Prev</span>
									</a>
								</li>
							</c:if>
					
							<c:forEach var="num" begin="${pageDto.startPage }" end="${pageDto.endPage }">
								<li class="page-item ${pageDto.standard.pageNum == num ? 'active':'' }">
									<a class="page-link" href="${num }">
									<c:out value="${num }" />
									</a>
								</li>
							</c:forEach>
					
							<c:if test="${pageDto.next }">
								<li class="page-item">
									<a class="page-link" href="${pageDto.endPage + 1 }">
									<i class="fa fa-angle-right"></i>
									<span class="sr-only">Next</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
					
					<form id="pagingActionForm" action="/project/list" method="get">
						<input type="hidden" name="pageNum" value="${pageDto.standard.pageNum }">
						<input type="hidden" name="amount" value="${pageDto.standard.amount }">
					</form>
					<!-- pagination -->
				</div>
			</div>
		</div><!-- /.col-3 -->
		
		<!-- project list -->
		<div class="col">
			<c:forEach var="project" items="${list}">
				<div class="card">
					<div class="card-header">
						<h4>
							<a href='/project/read?proj_id=<c:out value="${project.proj_id }"/>'>
								<c:out value="${project.rn }" />_${project.proj_title }
							</a>
						</h4>
					</div>
					<div class="card-body">
						<p class="card-text">${project.proj_detail }</p>
					</div>
					<div class="card-footer">
						<a href="/project/read?proj_id=<c:out value='${project.proj_id }' />" class="btn btn-primary">프로젝트 상세보기</a>
					</div>
				</div><!-- /.card -->
			</c:forEach>
		</div>
		<!-- project list -->
		
	</div><!-- /.row -->
	
</div><!-- /.container-fluid -->


<!-- Footer -->
<%@ include file="../includes/footer.jsp"%>


<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	
	// KTW
	// 페이지 번호 클릭 시 <form> 태그를 이용해서 처리
	$(document).ready(function() {
		var pagingActionForm = $("#pagingActionForm");

		$(".page-item a").on("click", function(e) {
			e.preventDefault();
	
			pagingActionForm.find(
					"input[name='pageNum']").val(
					$(this).attr("href"));
			pagingActionForm.submit();
		});

		// 프로젝트 제목 클릭 시 프로젝트 상세보기로 이동하고, 이동할 때 페이징 처리를 위한 정보(pageNum, amount)도 같이 넘겨준다.
		$(".move").on("click", function(e) {
			e.preventDefault();
	
			pagingActionForm.append("<input type='hidden' name='project_no' value='$(this).attr('href')'>");
			pagingActionForm.attr("action", "/project/read");
			pagingActionForm.submit()
	
		});
	});//END $(document).ready()
	
	
	// KTW
	// 스크롤바 움직일 시, 왼쪽 검색 관련 카드도 같이 이동 처리
	$(document).ready(function() {
		var currentPosition = parseInt($("#sidebox").css("top"));
		
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$("#sidebox").stop().animate({"top":position+currentPosition+"px"}, 900);
		});

	});//END $(document).ready()

	
	// KTW
	// 체크박스를 이용한 다중 검색은 검색 버튼을 클릭해야 목록이 표시되고, 지역으로 검색하는 것은 지역 선택 시 바로 목록이 표시
	$(document).ready(function() {
		var searchForm = $("#searchForm");
		var checkbox = $("#searchForm input:checkbox");
		
		checkbox.change(function() {
			if(checkbox.is(":checked")) {
				//alert( searchForm.find("input:checked").next().text() );
				
				
				
			}
		});//END $("#searchForm input:checkbox").change()
		
		$("#searchForm button").on("click", function(e) {
			e.preventDefault();
			
			
			
			searchForm.submit();
		
		});//END $("#searchBtn").on()
		
	});//END $(document).ready()
	
	
	$(function() {

		$(".ni-favourite-28").click(function() {
			$(this).toggleClass("red");
			var related_proj = $(this).find("input").val();
			if ($(this).hasClass("red") === true) { /* if($(".ni-favourite-28").hasClass("color") === true){ */
				alert("관심 프로젝트로 등록되었습니다.");
				$.ajax({
					url : "FollowProjectInsertAction.do",
					type : "post",
					data : {
						"related_proj" : related_proj
					},
					success : function(result) {
					},
					error : function(error) {
					}
				})
			}

			else {
				alert("관심 프로젝트에서 해제되었습니다.");
				$.ajax({
					url : "FollowProjectDeleteAction.do",
					type : "related_proj",
					data : {
						"related_proj" : related_proj
					},
					success : function(result) {
						alert(result);
						warning.success("관심 파트너스에 삭제되었습니다!")
					},
					error : function(error) {
						toastr.error("관심 파트너스가 삭제되지 않았습니다.")
					}
				})
			}

		})

	});
	
	function followProject() {

		$('#related_proj').toggleClass("red");
		var related_proj = $('#related').val();
		if ($('#related_proj').hasClass("red") === true) {
			alert("관심 프로젝트로 등록되었습니다.");
			$.ajax({
				url : "FollowProjectInsertAction.do",
				type : "post",
				data : {
					"related_proj" : related_proj
				},
				success : function(result) {
				},
				error : function(error) {
				}
			})
		}

		else {
			alert("관심 프로젝트에서 해제되었습니다.");
			$.ajax({
				url : "FollowProjectDeleteAction.do",
				type : "related_proj",
				data : {
					"related_proj" : related_proj
				},
				success : function(result) {
					alert(result);
					warning.success("관심 파트너스에 삭제되었습니다!")
				},
				error : function(error) {
					toastr.error("관심 파트너스가 삭제되지 않았습니다.")
				}
			})
		}
		
	};//END followProject()
</script>
