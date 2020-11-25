<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file = "../includes/header.jsp"%>	
	<!-- 로그인한 상태에 보여줄 태그 -->
	<%-- <sec:authorize access="isAuthenticated()">
 	 	<a href="">로그아웃</a>
	</sec:authorize> --%>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="member"/>	
	</sec:authorize>
	
	<title>포인트 관리</title>
	<!--
	<***** 나은 변경사항 *****>
	[argon.css]
	1. #5E72E4 -> #1ABC9C
	2. #525F7F-> #6C7581
	<********************>
	-->

	<!-- Side nav [나중에 이어붙이기]-->

    
 <!-- breadcrumb [포인트 관리] -->
	 <div class="header bg-primary pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <div class="row align-items-center py-4">
            <div class="col-lg-6 col-7">
              <h6 class="h2 text-white d-inline-block mb-0">포인트 관리</h6>
              <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                  <li class="breadcrumb-item"><a href="dashboard.html"><i class="fas fa-home"></i></a></li>
                  <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
                  <li class="breadcrumb-item active" aria-current="page">포인트 관리</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
 <!-- end of breadcrumb -->    
    
 <!-- Body of contents  -->    
 <!-- 포인트 관리  -->
    <div class="container mt--6">
      <div class="row" id="manage-client-point">
        <div class="col">
          <div class="card">
            <div class="card-header">
            <div>
 <!-- ①잔여포인트 확인 section  -->            
            	<table class="table point-view col-lg-3 col-3">
				 <tr>
				  <th>잔여 포인트</th>
				  <th>포인트 충전/송금</th>
				 </tr>
 <!-- ②포인트 충전/송금 -->  	
 				  <tr> 																<!-- ajax -->
 				  <td><form action="getPointTotal" method="get" name="getPointTotal"><b>${member.total_point }</b>&nbsp;P</form></td>	
            	  <td>              		
            	  	<a type="button" class="btn btn-primary ml-2" name="charge" value="충전"
            	  		href = "javascript:popup()" target = "_self">충전</a>
            	    	<!-- href = "javascript:popup()" target = "_self" -->	
  			  		<a type="button" class="btn btn-secondary ml-2" name="withdraw" value="인출"
  			  			href = "javascript:popup2()" target = "_self">인출</a>
  			  	  </td>
  			  	  </tr>
            	</table>
            </div>
            </div>
            
             </div> <!-- end of card -->
          </div> <!-- end of col -->
 
        </div> <!-- end of row (id="manage-client-point") -->

 <!-- 포인트  이용내역  -->
    <div class="container mt--2">
      <!-- ①title -->    
      <div class="row">
        <div class="col">
          <div class="card">
            <!-- Card header -->
            <div class="card-header border-0">
              <h3 class="mb-0">포인트 이용내역</h3>
            </div>
 <!-- end of ①title -->              
            
 <!-- ②contents(테이블 형식)-->
     <div class="input-group mb-3">
  		<div class="input-group-prepend ">
  			<select class="custom-select ml-2 col-md-3" id="inputGroupSelect01">
    			<option selected>선택</option>
    			<option value="1">입금+출금</option>
    			<option value="2">입금</option>
    			<option value="3">출금</option>
  			</select>
  			<input type="text" class="custom-select2 ml-1" id="inputGroupSelect01" placeholder="내용 or 금액"></input>
  			<button type="button" class="btn btn-primary ml-1">조회</button>
  		</div>	
	 </div>
      
        <div class="table-responsive">
          <table class="table align-items-center table-flush">
            <thead class="thead-light">
                  <tr>
                    <th scope="col" class="sort" data-sort="status">일자</th>
                    <th scope="col" class="sort" data-sort="name">예금주명</th>
                    <th scope="col" class="sort" data-sort="name">내용</th>
                    <th scope="col" class="sort" data-sort="point">증감</th>
                    <th scope="col" class="sort" data-sort="point">잔여포인트</th>
                    <th scope="col"></th>
                  </tr>
            </thead>
            <tbody class="list">
              <c:choose>
               <c:when test="${empty getList }">
               		<tr><td colspan="5" align="center">포인트 사용내역이 없습니다.</td></tr>
               </c:when>
               <c:when test="${!empty getList }">
             	<c:forEach items="${getList }" var="point">
                  <tr>
                    <th scope="row">
                      <div class="media align-items-center">
                        <div class="media-body">
                          <span class="name mb-0 text-sm"><fmt:formatDate value="${point.point_chg_date }" pattern="yyyy-MM-dd"/></span>
                        </div>
                      </div>
                    </th>
                    <td class="name1">
                    	<c:out value="${member.real_name }"/> 
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                        <span class="status text-primary"><c:out value="${point.point_contents }"/></span>
                      </span>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <span class="입출금  mr-2 text-info"><c:out value="${point.point_amount }"/></span>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <span class="remaining mr-2"><b><c:out value="${point.point_balance }"/></b></span>
                      </div>
                    </td>
                    <td class="text-right">
                      <div class="dropdown">
                        <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="fas fa-ellipsis-v"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                          <a class="dropdown-item" href="#">자주쓰는계좌 등록</a>
                        </div>
                      </div>
                    </td>
                  </tr>
          		</c:forEach>      
          	   </c:when>
          	 </c:choose>	  
            </tbody>
          </table>
        </div>
   <!-- end of Body -->    
           
   <!-- Footer of 포인트 이용내역 -->
            <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                 <c:if test="${pageMaker.prev }">
                  <li class="page-item "> <!-- disabled -->
                    <a class="page-link" href="${pageMaker.startPage -1 }" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">이전</span>
                    </a>
                  </li>
                 </c:if>
                 
                 <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                  <li class="page-item ${pageMaker.standard.pageNum == num ? 'active' : '' }">
                    <a class="page-link" href="${num }">${num }</a>
                  </li>
                  <!-- <li class="page-item">
                    <a class="page-link" href="#">2 <span class="sr-only">(현재페이지)</span></a>
                  </li> -->
                </c:forEach>
                
                 <c:if test="${pageMaker.next }">
                  <li class="page-item">
                    <a class="page-link" href="${pageMaker.endPage +1 }">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">다음</span>
                    </a>
                  </li>
                  </c:if> 
                </ul>
              </nav>
            </div>
            <form action="/point/admin" id="actionForm" method="get">
            	<input type="hidden" name="pageNum" value="${pageMaker.standard.pageNum }">
            	<input type="hidden" name="amount" value="${pageMaker.standard.amount }">            	
            </form>
   <!-- end of footer -->
            
          </div>
        </div>
      </div>
	</div>
  </div>
  
  	<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
  	<script type="text/javascript">
  	
  		var actionForm = $("#actionForm");
  		
  		$(document).ready(function() {
			
  			$(".page-item a").on("click", function(e){
  				e.preventDefault();
  				
  	  			console.log('click');
  	  			
  	  			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
  	  			
  	  			actionForm.submit();
  	  			
  			});

  		});
  	</script>	
  	
	<script>
        function popup(){
            var url = "/point/charging";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
	<script>
        function popup2(){
            var url = "/point/withdraw";
            var name = "popup test2";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>    
  
<%@ include file = "../includes/footer.jsp"%>
