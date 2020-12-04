<%@page import="org.wof.domain.ProjectVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


   <!-- Header & Menu -->
   <%@ include file="../includes/header.jsp" %>

   <!-- Sub menu -->
   <%@ include file="menu.jsp"%> 
   

   <!-- Main Content -->
   <!-- top start-->
   <div class="main-content" id="panel">

   
   
<%--   <div class="container">--%>
<%--   --%>
<%--         <!-- 제목 -->--%>
<%--         <div class="row mt-3">--%>
<%--            <h3></h3>--%>
<%--         </div>--%>
         
<%--      <div class="row mb-3">--%>
<%--            <div class="col-lg-3 col-3"></div>--%>
<%--            <div class="col-lg-6 col-7">--%>
<%--               <form class="navbar-search navbar-search-light form-inline mr-sm-3"--%>
<%--               id="searchForm" action="/partners/list" method="get">--%>
<%--                  <div class="form-group mb-0">--%>
<%--                     <div--%>
<%--                        class="input-group input-group-alternative input-group-merge mr-2">--%>
<%--                        <div class="input-group-prepend">--%>
<%--                           <span class="input-group-text"><i class="fas fa-search"></i></span>--%>
<%--                        </div>--%>
<%--                        <input type="text" name="keyword" class="form-control" placeholder="Search" />--%>
<%--                        &lt;%&ndash; value='<c:out value="${pageMaker.standard.keyowrd }"/>' />--%>
<%--                        <input type="hidden" name='type' value='<c:out value="${pageMaker.standard.type }"/>' /> &ndash;%&gt;--%>
<%--                        <input type="hidden" name='member_no' value='${member.member_no}'>--%>
<%--                        <input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}' />--%>
<%--                        <input type="hidden" name='amount' value = '${pageMaker.standard.amount}' />--%>
<%--                     </div>--%>
<%--                     <button class="btn btn-secondary">Search</button>--%>
<%--                  </div>--%>
<%--               </form>--%>
<%--            </div>--%>
<%--         </div>--%>


   <!-- Page content -->
<%--            <div class="row">--%>
            <!-- 체크박스 -->
<%--            <div class="col-sm-3" style="margin-top: 30px;">--%>
<%--               <div class="row">--%>
<%--                  <div class="col-sm-12" >--%>
<%--                  <div class="pl-3 shadow-sm rounded bg-white position-relative" id="findquick" >--%>
<%--                              --%>
<%--                              --%>
<%--                              <h5 class="h3">프로젝트 카테고리</h5>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck1"> <label--%>
<%--                                    class="custom-control-label" for="customCheck1">개발</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck2"> <label--%>
<%--                                    class="custom-control-label" for="customCheck2">디자인</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck3"> <label--%>
<%--                                    class="custom-control-label" for="customCheck3">기획</label>--%>
<%--                              </div>--%>
<%--                              <br>--%>

<%--                              <h5 class="h3">프로젝트 분야</h5>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck4"> <label--%>
<%--                                    class="custom-control-label" for="customCheck4">#웹</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck5"> <label--%>
<%--                                    class="custom-control-label" for="customCheck5">#애플리케이션</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck6"> <label--%>
<%--                                    class="custom-control-label" for="customCheck6">#커머스,쇼핑몰</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck7"> <label--%>
<%--                                    class="custom-control-label" for="customCheck7">#일반 소프트웨어</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck8"> <label--%>
<%--                                    class="custom-control-label" for="customCheck8">#퍼블리싱</label>--%>
<%--                              </div>--%>
<%--                           --%>
<%--                              --%>
<%--                              <br>--%>
<%--                                          --%>
<%--                                 --%>
<%--                                 --%>
<%--                                 --%>
<%--                              --%>
<%--                              --%>

<%--                              <h5 class="h3">프로젝트 기술</h5>--%>
<%--                            --%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck20"> <label--%>
<%--                                    class="custom-control-label" for="customCheck20">C/C++/C#</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck21"> <label--%>
<%--                                    class="custom-control-label" for="customCheck21">Java</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck22"> <label--%>
<%--                                    class="custom-control-label" for="customCheck22">JavaScript</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck23"> <label--%>
<%--                                    class="custom-control-label" for="customCheck23">Swift</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck24"> <label--%>
<%--                                    class="custom-control-label" for="customCheck24">Perl</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck25"> <label--%>
<%--                                    class="custom-control-label" for="customCheck25">Ruby</label>--%>
<%--                              </div>--%>
<%--                              <div class="custom-control custom-checkbox">--%>
<%--                                 <input type="checkbox" class="custom-control-input"--%>
<%--                                    id="customCheck26"> <label--%>
<%--                                    class="custom-control-label" for="customCheck26">Python</label>--%>
<%--                              </div>--%>
<%--                       --%>
<%--                              <br>--%>

<%--                              <h5 class="h3">근무지역</h5>--%>
<%--                              --%>
<%--                           <div class="row">--%>
<%--                               <div class="col">--%>
<%--                               <select class="form-control"  name="proj_work_place" onChange="cat1_change(this.value,proj_work_place1)" >--%>
<%--                                 <option selected>-선택-</option>--%>
<%--                                 <option value='1'>서울</option>--%>
<%--                                 <option value='2'>부산</option>--%>
<%--                                 <option value='3'>대구</option>--%>
<%--                                 <option value='4'>인천</option>--%>
<%--                                 <option value='5'>광주</option>--%>
<%--                                 <option value='6'>대전</option>--%>
<%--                                 <option value='7'>울산</option>--%>
<%--                                 <option value='8'>강원</option>--%>
<%--                                 <option value='9'>경기</option>--%>
<%--                                 <option value='10'>경남</option>--%>
<%--                                 <option value='11'>경북</option>--%>
<%--                                 <option value='12'>전남</option>--%>
<%--                                 <option value='13'>전북</option>--%>
<%--                                 <option value='14'>제주</option>--%>
<%--                                 <option value='15'>충남</option>--%>
<%--                                 <option value='16'>충북</option>--%>
<%--                                   </select>--%>
<%--                              </div>--%>
<%--                              --%>
<%--                            --%>
<%--                           </div><!-- row -->--%>
<%--                           --%>
<%--                           <br>--%>
<%--                           --%>
<%--                           </div>--%>
<%--                        </div>--%>
<%--                     </div>--%>
<%--                  </div>--%>

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
                                        <input type="checkbox" class="custom-control-input" id="searchCheck1" value="S"
                                        <c:out value="${pageDto.standard.keyword == '개발'? 'checkeded' : ''}"/>>
                                        <label class="custom-control-label" for="searchCheck1">개발</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="searchCheck2" value="S"
                                        <c:out value="${pageDto.standard.keyword == '디자인'? 'checkeded' : ''}"/>>
                                        <label class="custom-control-label" for="searchCheck2">디자인</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="searchCheck3" value="S"
                                        <c:out value="${pageDto.standard.keyword == '기획'? 'checkeded' : ''}"/>>
                                        <label class="custom-control-label" for="searchCheck3">기획</label>
                                    </div>
                                </div>
                            </div>

                            <h4>프로젝트 분야</h4>
                            <div class="row pb-3">
                                <div class="col">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="searchCheck4" value="S"
                                        <c:out value="${pageDto.standard.keyword == '웹'? 'checkeded' : ''}"/>>
                                        <label class="custom-control-label" for="searchCheck4">웹</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="searchCheck5" value="S"
                                        <c:out value="${pageDto.standard.keyword == '어플리케이션'? 'checkeded' : ''}"/>>
                                        <label class="custom-control-label" for="searchCheck5">어플리케이션</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="searchCheck6" value="S"
                                        <c:out value="${pageDto.standard.keyword == '커머스'? 'checkeded' : ''}"/>>
                                        <label class="custom-control-label" for="searchCheck6">커머스</label>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="pageNum" value="${pageDto.standard.pageNum } ">
                            <input type="hidden" name="amount" value="${pageDto.standard.amount }">
                            <input type="hidden" name="type" value="">
                            <input type="hidden" name="keyword" value="">
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

                    <div class="row shadow-sm p-4 bg-white rounded mb-3 ml-3" >


                        <div class="col-sm-12" >
                            <div class="row align-items-center"  >

                                <h2 class="card-title text-uppercase text-muted mb-0 mr-2">
                                        ${project.getProj_id()}
                                    <a   href='/project/read?proj_id=<c:out value="${project.getProj_id()}"/>'>${project.getProj_title()}</a>
                                        <%-- <a class="move" href='<c:out value="${project.getProj_id()}"/>'>${project.getProj_title()}</a> --%>



                                    <span class="justify-content-center">
                                       <i id="related_proj" class="ni ni-favourite-28 mt-2" >
                                       <input type="hidden" value="${project.getProj_id()}" name="related_proj" id="related">
                                       </i>
                                    </span>&nbsp;&nbsp;&nbsp;&nbsp;

                                </h2>

                                <fmt:parseDate value="2020-12-04" var="strPlanDate" pattern="yyyy-MM-dd"/>
                                <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                                <fmt:parseDate value="${project.getProj_apply_deadline()}" var="endPlanDate" pattern="yyyy-MM-dd"/>
                                <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>


                                <i class="ni ni-notification-70 mr-2"></i>
                                <span  style="color: red;">마감  ${endDate - strDate}일 전</span>

                            </div>
                        </div>


                        <p class="mt-3 mb-0 text-sm">
                            <i class="ni ni-check-bold mr-3"></i><span
                                class="text-success mr-2">${project.getProj_career()}</span>
                            <i class="ni ni-money-coins mr-3"></i><span
                                class="text-success mr-2">${project.getProj_estimate()}
                                    원</span>
                        </p>

                        <p class="mt-3 mb-0 text-sm ">
                            <i class="ni ni-album-2"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span
                                class="text-success mr-2">${project.getProj_start_date()}</span>
                            <i class="ni ni-album-2"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span
                                class="text-success mr-2">${project.getProj_end_date()}</span>
                        </p>

                        <p class="mt-3 mb-0 text-sm" >
                            <i class="ni ni-time-alarm mr-3"></i><span
                                class="text-success mr-2">${project.getProj_work_time()}</span>
                            <i class="ni ni-compass-04 mr-3"></i><span
                                class="text-success mr-2">${project.getProj_work_place()}</span>
                        </p>

                        <div class="mt-3 mr-3 text-sm ">
                                 <span class="text-nowrap">
                                            <c:set var="TextValue"
                                                   value="${project.getProj_detail()}" />
                                         ${fn:substring(TextValue,0,70)}<br>${fn:substring(TextValue,71,140)}
                                    <br>${fn:substring(TextValue,141,210)}...
                                 </span>
                        </div>

                        <p class="mt-3 mb-0 text-sm">
                            <i class="ni ni-chart-bar-32 mr-3"></i><span
                                class="text-warning mr-2">${project.getApply_mem()}명지원</span>
                        </p>
                    </div>
                </c:forEach>
            </div>
            <!— project list —>

        </div><!— /.row —>

    </div><!— /.container-fluid —>



            

         <!-- list -->
<%--         <div class="col-sm-9 mt-4">--%>
<%--         --%>
<%--                        <c:forEach var="project" items="${list}">--%>

<%--                           <div class="row shadow-sm p-4 bg-white rounded mb-3 ml-3" >--%>
<%--                           --%>
<%--                           --%>
<%--                              <div class="col-sm-12" >--%>
<%--                                 <div class="row align-items-center"  >--%>

<%--                                    <h2 class="card-title text-uppercase text-muted mb-0 mr-2">--%>
<%--                                       ${project.getProj_id()}--%>
<%--                                       <a   href='/project/read?proj_id=<c:out value="${project.getProj_id()}"/>'>${project.getProj_title()}</a> --%>
<%--                                       &lt;%&ndash; <a class="move" href='<c:out value="${project.getProj_id()}"/>'>${project.getProj_title()}</a> &ndash;%&gt;--%>
<%--                                    --%>
<%--                                    --%>
<%--                                    --%>
<%--                                     <span class="justify-content-center">--%>
<%--                                       <i id="related_proj" class="ni ni-favourite-28 mt-2" >--%>
<%--                                       <input type="hidden" value="${project.getProj_id()}" name="related_proj" id="related">--%>
<%--                                       </i>--%>
<%--                                    </span>&nbsp;&nbsp;&nbsp;&nbsp;--%>

<%--                                    </h2>--%>
<%--                                    --%>
<%--                                 <fmt:parseDate value="2020-12-04" var="strPlanDate" pattern="yyyy-MM-dd"/>--%>
<%--                                 <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>--%>
<%--                                 <fmt:parseDate value="${project.getProj_apply_deadline()}" var="endPlanDate" pattern="yyyy-MM-dd"/>--%>
<%--                                 <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>--%>


<%--                                    <i class="ni ni-notification-70 mr-2"></i>--%>
<%--                                    <span  style="color: red;">마감  ${endDate - strDate}일 전</span>     --%>

<%--                                 </div>--%>
<%--                                 </div>--%>
<%--                              --%>

<%--                              <p class="mt-3 mb-0 text-sm">--%>
<%--                                 <i class="ni ni-check-bold mr-3"></i><span--%>
<%--                                    class="text-success mr-2">${project.getProj_career()}</span>--%>
<%--                                 <i class="ni ni-money-coins mr-3"></i><span--%>
<%--                                    class="text-success mr-2">${project.getProj_estimate()}--%>
<%--                                    원</span>--%>
<%--                              </p>--%>
<%--                              --%>
<%--                               <p class="mt-3 mb-0 text-sm ">--%>
<%--                                 <i class="ni ni-album-2"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span--%>
<%--                                    class="text-success mr-2">${project.getProj_start_date()}</span>--%>
<%--                                 <i class="ni ni-album-2"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span--%>
<%--                                    class="text-success mr-2">${project.getProj_end_date()}</span>--%>
<%--                              </p> --%>

<%--                              <p class="mt-3 mb-0 text-sm" >--%>
<%--                                 <i class="ni ni-time-alarm mr-3"></i><span--%>
<%--                                    class="text-success mr-2">${project.getProj_work_time()}</span>--%>
<%--                                 <i class="ni ni-compass-04 mr-3"></i><span--%>
<%--                                    class="text-success mr-2">${project.getProj_work_place()}</span>--%>
<%--                              </p>--%>

<%--                              <div class="mt-3 mr-3 text-sm ">--%>
<%--                                 <span class="text-nowrap">--%>
<%--                                            <c:set var="TextValue"--%>
<%--                                       value="${project.getProj_detail()}" />--%>
<%--                                    ${fn:substring(TextValue,0,70)}<br>${fn:substring(TextValue,71,140)}--%>
<%--                                    <br>${fn:substring(TextValue,141,210)}...--%>
<%--                                 </span>--%>
<%--                              </div>--%>

<%--                              <p class="mt-3 mb-0 text-sm">--%>
<%--                                 <i class="ni ni-chart-bar-32 mr-3"></i><span--%>
<%--                                    class="text-warning mr-2">${project.getApply_mem()}명지원</span>--%>
<%--                              </p>--%>
<%--                           </div>--%>
<%--                        </c:forEach>--%>

<%--                  <!-- pagination -->--%>
<%--                        <nav aria-label="Page navigation">--%>
<%--                           <ul class="pagination justify-content-center">--%>
<%--                              <c:if test="${pageDto.prev }">--%>
<%--                                 <li class="page-item">--%>
<%--                                    <a class="page-link" href="${pageDto.startPage - 1 }" tabindex="-1">--%>
<%--                                    <i class="fa fa-angle-left"></i>--%>
<%--                                    <span class="sr-only">Prev</span>--%>
<%--                                    </a>--%>
<%--                                 </li>--%>
<%--                              </c:if>--%>
<%--   --%>
<%--                              <c:forEach var="num" begin="${pageDto.startPage }" end="${pageDto.endPage }">--%>
<%--                                 <li class="page-item ${pageDto.standard.pageNum == num ? 'active':'' }">--%>
<%--                                    <a class="page-link" href="${num }">--%>
<%--                                    <c:out value="${num }" />--%>
<%--                                    </a>--%>
<%--                                 </li>--%>
<%--                              </c:forEach>--%>
<%--                              --%>
<%--                              <c:if test="${pageDto.next }">--%>
<%--                                 <li class="page-item">--%>
<%--                                    <a class="page-link" href="${pageDto.endPage + 1 }">--%>
<%--                                    <i class="fa fa-angle-right"></i>--%>
<%--                                    <span class="sr-only">Next</span>--%>
<%--                                    </a>--%>
<%--                                 </li>--%>
<%--                              </c:if>--%>
<%--                           </ul>--%>
<%--                        </nav>--%>
<%--                        --%>
<%--                        <form id="pagingActionForm" action="/project/list" method="get">--%>
<%--                           <input type="hidden" name="pageNum" value="${pageDto.standard.pageNum }">--%>
<%--                           <input type="hidden" name="amount" value="${pageDto.standard.amount }">--%>
<%--                        </form>--%>
<%--                        <!-- pagination -->--%>




<%--                     </div>--%>
<%--                  </div>--%>
<%--               </div>   --%>
<%--            </div>--%>

   <!-- list end -->
   </div>
   <div id="frogue-container" class="position-right-bottom" data-chatbot="f397ce6d-a5db-4fc4-b8d4-4f2c9c143b34" data-user="nannanru@gmail.com" data-init-key="value"></div>

   
   <!-- Footer -->
   <%@ include file="../includes/footer.jsp" %>
   
   <script type="text/javascript">
      // $(document).ready(function() {
      //
      //
      //    $(window).scroll(function(){
      //       var scrollTop = $(document).scrollTop();
      //       if (scrollTop < 0) {
      //        scrollTop = 0;
      //       }
      //       $("#findquick").stop();
      //       $("#findquick").animate( { "top" : scrollTop });
      //       });
      //
      //
      //    var pagingActionForm = $("#pagingActionForm");
      //
      //    $(".page-item a").on("click", function(e) {
      //       e.preventDefault();
      //
      //       pagingActionForm.find("input[name='pageNum']").val($(this).attr("href"));
      //       pagingActionForm.submit();
      //    });


              // $(".move").on("click", function(e){
              //     e.preventDefault();
              //     pagingActionForm.append("<input type='hidden' name='proj_id' value='"+ $(this).attr("href")+"'>");
              //     pagingActionForm.attr("action","/project/read");
              //     pagintActionForm.submit();
              // });
      // });
      // KTW
      // 페이지 번호 클릭 시 <form> 태그를 이용해서 처리
      $(document).ready(function() {
          var pagingActionForm = $("#pagingActionForm");

          $(".page-item a").on("click", function(e) {
              e.preventDefault();

              pagingActionForm.find("input[name='pageNum']").val($(this).attr("href"));
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
                  //alert(searchForm.find("input:checked").val());
                  var type = searchForm.find('input:checked').val();
                  var keyword = searchForm.find('input:checked').next().text();

                  //alert(type, keyword)

                  searchForm.find("input[name='type']").val(type);
                  searchForm.find("input[name='keyword']").val(keyword);

                  searchForm.submit();

              }
              else {
                  searchForm.find("input[name='type']").val("");
                  searchForm.find("input[name='keyword']").val("");

                  searchForm.submit();
              }
          });//END $("#searchForm input:checkbox").change()


      });//END $(document).ready()


(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script> 

