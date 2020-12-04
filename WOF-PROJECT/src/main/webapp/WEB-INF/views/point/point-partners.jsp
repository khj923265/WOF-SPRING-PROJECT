<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file = "../includes/header.jsp"%>	
<%@ include file = "point-charging-partners.jsp"%>
<%@ include file = "point-withdraw.jsp"%>
	

	
	<title>포인트 관리</title>
	<!--
	<***** 나은 변경사항 *****>
	[argon.css]
	1. #5E72E4 -> #1ABC9C
	2. #525F7F-> #6C7581
	<********************>
	-->

	<!-- Side nav [나중에 이어붙이기]-->

    
  


<!-- Sidenav -->
<nav
	class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white"
	id="sidenav-main">
	<div class="scrollbar-inner">
		<!-- Brand -->
		<div class="sidenav-header  align-items-center">
			<a href="${pageContext.request.contextPath }/main"><img
				alt=""
				src="${pageContext.request.contextPath }/resources/template/assets/img/brand/logo_transparent.png"
				style="height: 50px; width: 100px; margin-left: 10px;"> </a>
		</div>
		<div class="navbar-inner">
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Nav items -->
				<br> <br>

				<h3 class="nav-item">
					<a class="nav-" href="dashboard_partners.jsp"> <i
						class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">마이페이지</span>
					</a>
				</h3>
				<br>
				<div class="col-12">
					<span class="avatar avatar-sm rounded-circle"> <img
						alt="Image placeholder"
						src="/resources/template/assets/img/theme/team-4.jpg">
					</span>
				</div>
				<h4>이름</h4>
				<br> <br>
				<ul class="navbar-nav">

					<li class="nav-item"><a class="nav-link"
						href="project_apply_detail.jsp"> <i
							class="ni ni-badge text-orange"></i> <span class="nav-link-text">제안
								및 지원</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="project_apply_detail.jsp"> <i
							class="ni ni-bullet-list-67 text-default"></i> <span
							class="nav-link-text">공지사항</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/partners/profile_info.jsp">
							<i class="ni ni-settings-gear-65"></i> <span
							class="nav-link-text">프로필 관리</span>
					</a></li>
				</ul>
				<!-- Divider -->
				<hr class="my-3">
				<!-- Navigation -->
				<ul class="navbar-nav mb-md-3">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/qna/question-register-partners">
							<i class="ni ni-archive-2"></i> <span class="nav-link-text">1:1문의</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/point/point_partners">
							<i class="ni ni-money-coins"></i> <span class="nav-link-text">포인트
								관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/Penalty/listPenaltyPartners.do">
							<i class="ni ni-palette"></i> <span class="nav-link-text">페널티
								관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/community/partners_community_list">
							<i class="ni ni-palette"></i> <span class="nav-link-text">커뮤니티 게시판
								</span>
					</a></li>					
				</ul>
			</div>
		</div>
	</div>
</nav>
<!-- End side nav -->

<div class="main-content" id="panel">   

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
  <div class="container-fluid mt--6">
 <!-- ①잔여포인트 확인 section  -->            
 <!-- ②포인트 충전/송금 --> 
 	 <div class="row inline" id="manage-client-point">
        <div class="col">
          <div class="card">
          <div class="card-header border-0">
              <h3 class="mb-0">보유 포인트</h3>
          </div>
            <div class="card-body row inline mt--2">
                    <!-- ①잔여포인트 확인 section  -->
                    <div class="col-6 inline text-center py-2" style="background-color: #D1D4D8">
                        <h2 style="color: #444D58;">잔여 포인트</h2>
                    </div>
                    <div class="col-6 inline text-center py-2" 
                    		style="background-color: #D1D4D8; border-left-style:dotted; 
                    		border-left-color: gray; border-left-width: 1px;">
                        <h2 class="col-12 inline" style="color: #444D58;">충전 / 인출</h2>
                    </div>
                    <div class="col-6 inline text-center" id="totalPoint" id="totalPoint">
                        <div class="row inline" style="background-color: #EDEFF2;" >
                            <!-- ②포인트 충전/송금 -->
                            <div class="col-12 text-center py-4">
                            <b style="color:green; font-size: 30px"><fmt:formatNumber value="${totalpoint }" pattern="#,###" /></b>&nbsp;<b style="font-size: 20px">P</b>
                        	</div>
                        </div>
                    </div>
                    <div class="col-6 inline">
                        <div class="row inline" style="background-color: #EDEFF2; border-left-style:dotted;  
                    		border-left-color: gray; border-left-width: 1px;">
                            <div class="col-6 text-center py-3">
                                <a type="button" class="btn ml-2 pl-6 pr-6" name="charge" data-toggle="modal" 
                                data-target="#modal-charging-form" style="background-color: #86A6D1" ><h2 style="color: white;">충&nbsp;전</h2></a>
                            </div>
                            <!--  href = "javascript:popup()" target = "_self"  -->
                            <div class="col-6 text-center py-3">
                                <a type="button" class="btn btn-secondary ml-1 pl-6 pr-6" name="withdraw" data-toggle="modal" 
                                data-target="#modal-withdraw-form"><h2>인&nbsp;출</h2></a>
                            </div>
                            <!-- <div class="col-6 text-center py-6">
                            	<a type="button" class="btn btn-success ml-2" name="pointTest" value="test" id="popup2">테스트</a>
                            </div> -->
    				<!-- <div class="vl"></div> -->
    					</div>
    				</div>	
	     </div> <!-- end of card-body -->
      	</div> <!-- end of card -->
    </div> <!-- end of col -->
  </div> <!-- end of row (id="manage-client-point") -->
</div> <!-- end of container -->


 <!-- 포인트  이용내역  -->
    <div class="container-fluid mt--2">
      <!-- ①title -->    
      <div class="row inline">
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
          <table class="table align-items-center table-flush" id="table">
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
            <tbody class="list" id="listBody">
              <c:choose>
               <c:when test="${empty getList }">
               		<tr><td colspan="5" align="center">포인트 사용내역이 없습니다.</td></tr>
               </c:when>
               <c:when test="${!empty getList }">
             	<c:forEach items="${getList }" var="point">
                  <tr>
                    <td scope="row">
                      <div class="media align-items-center">
                        <div class="media-body">
                          <span class="name mb-0 text-sm"><fmt:formatDate value="${point.point_chg_date }" pattern="yyyy-MM-dd"/></span>
                        </div>
                      </div>
                    </td>
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
                        <span class="입출금  mr-2 text-info"><fmt:formatNumber  value="${point.point_amount }" pattern="#,###" /></span>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <span class="remaining mr-2"><b><fmt:formatNumber value="${point.point_balance }" pattern="#,###" /></b></span>
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
            <tr id='addbtn'><td colspan='5'><div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div>  </td></tr>
            
          </table>
        </div>
       </div>
   <!-- end of Body -->    
           
   <!-- Footer of 포인트 이용내역 -->
   <%--          <div class="card-footer py-4">
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
            <form action="/point/point_partners" id="actionForm" method="get">
            	<input type="hidden" name="pageNum" value="${pageMaker.standard.pageNum }">
            	<input type="hidden" name="amount" value="${pageMaker.standard.amount }">            	
            </form> --%>
   <!-- end of footer -->
          </div>
        </div>
      </div>
	</div>
</div>	
</div> 
  	<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	
  	
  	<script>
  	<script >
  	function moreList(){
  	    $.ajax({
  	        url :"/point/point_partners",
  	        type :"POST",
  	        cache : false,
  	        dataType:'json',
  	        data :"conectType="+conectType +"&eDate="+eDate+"&sDate="+sDate+"&codeId="+codeId+"&limit="+limit,
  	        success :function(data){
  	            //console.log(data);
  	            var content="";
  	            for(var i=0; i<data.hashMapList.length; i++){
  	                content +=
  	                "<tr>"+
  	                    "<td>"+data.hashMapList[i].point_reg_date+"</td>"+
  	                    "<td>"+data.hashMapList[i].real_name+"</td>"+
  	                    "<td>"+data.hashMapList[i].point_contents+"</td>"+
  	                    "<td>"+data.hashMapList[i].point_amount+"</td>"+
  	                  	"<td>"+data.hashMapList[i].point_balance+"</td>"+
  	                "</tr>";
  	            }
  	            content+="<tr id='addbtn'><td colspan='5'><div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div>  </td></tr>";
  	            $('#addbtn').remove();//remove btn
  	            $(content).appendTo("#table");
  	        }, error:function(request,status,error){
  	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  	           }
  	    });
  	};
  	</script>

  	
  	
  	
  	
  	<script>
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
        var popup2 = document.getElementById('popup2');
        	popup2.addEventListener('click',function (){
            var url = "/point/pointTest";
            var name = "pointTest";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        })
    </script>  

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
	
<%@ include file = "../includes/footer.jsp"%>
