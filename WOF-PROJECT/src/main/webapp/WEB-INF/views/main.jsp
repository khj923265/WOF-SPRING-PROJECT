<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description"
          content="Start your development with a Dashboard for Bootstrap 4.">
    <meta name="author" content="Creative Tim">
    <title>Welcome to Working Free(WOF)</title>
    <!-- Favicon -->
    <link rel="icon" href="/resources/template/assets/img/brand/favicon.png"
          type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet"
          href="/resources/template/assets/vendor/nucleo/css/nucleo.css"
          type="text/css">
    <link rel="stylesheet"
          href="/resources/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
          type="text/css">
    <!-- Page plugins -->
    <!-- Argon CSS -->
    <link rel="stylesheet"
          href="/resources/template/assets/css/argon.css?v=1.2.0" type="text/css">
</head>

<body>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="member" />
</sec:authorize>
<!-- Main content -->
<div class="main-content" id="panel">

    <!-- Topnav -->
    <nav
            class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
        <a href="${pageContext.request.contextPath }/main"><img alt=""
                                                                src="/resources/template/assets/img/brand/logo_transparent.png"
                                                                style="height: 50px; width: 100px; margin-left: 10px;"> </a>
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <!-- Navbar links -->
                <ul class="navbar-nav align-items-center  ml-md-auto">
                    <li class="nav-item mr-0 mr-md-2"><a class="nav-link"
                                                         href="${pageContext.request.contextPath }/project/create"><span
                            class="nav-link-text">프로젝트 등록</span></a></li>
                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath }/project/list"><span
                            class="nav-link-text">프로젝트 찾기</span></a></li>
                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath }/partners/list?member_no=${member.member_no}"><span
                            class="nav-link-text">파트너스 찾기</span></a></li>
                    <li class="nav-item"><a class="nav-link active"
                                            href="${pageContext.request.contextPath }/project/project_map_manage.jsp">
                        <span class="nav-link-text">프로젝트 맵</span>
                    </a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><span
                            class="nav-link-text">공지사항</span></a>
                    </li>
                    <li class="nav-item">
                        <sec:authorize access="isAuthenticated()">
                        <a class="dropdown-item" href="/customlogout">
                            <i class="ni ni-user-run"></i> <span>로그아웃</span>
                        </a>
                        </sec:authorize>
                        <sec:authorize access="isAnonymous()">
                        <a class="dropdown-item" href="/member/customlogin">
                            <i class="ni ni-user-run"></i> <span>로그인</span>
                        </a>
                    <li class="nav-item">
                        <a class="nav-link" href="/member/signup">
                            <i class="ni ni-user-run"></i> <span>회원가입</span>
                        </a>
                    </li>
                    </sec:authorize>
                    </li>
                </ul>
                <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
                    <li class="nav-item dropdown"><a class="nav-link pr-0"
                                                     href="#" role="button" data-toggle="dropdown"
                                                     aria-haspopup="true" aria-expanded="false">
                        <div class="media align-items-center">
									<span class="avatar avatar-sm rounded-circle"> <img
                                            alt="Image placeholder"
                                            src="/resources/template/assets/img/theme/team-4.jpg">
									</span>
                            <div class="media-body  ml-2  d-none d-lg-block">
                                <span class="mb-0 text-sm  font-weight-bold">${member.real_name }</span>
                            </div>
                        </div>
                    </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome!</h6>
                            </div>
                            <sec:authorize access="isAuthenticated()">
                                <c:if test="${member.auth == 'ROLE_CLIENT' }">
                                    <a href="/client/dashboard_client?member_no=${member.member_no}"
                                       class="dropdown-item"> <i class="ni ni-single-02"></i>
                                        <span>마이페이지</span>
                                    </a>
                                </c:if>
                                <c:if test="${member.auth == 'ROLE_PARTNERS' }">
                                    <a href="/partners/dashboard_partners?member_no=${member.member_no}"
                                       class="dropdown-item"> <i class="ni ni-single-02"></i>
                                        <span>마이페이지</span>
                                    </a>
                                    <a href="/member/partners/profile_info"
                                    class="dropdown-item"> <i
                                        class="ni ni-settings-gear-65"></i> <span>회원정보수정</span>
                                </c:if>
                                </a> <a id="qnaBtn" href="/project/qna"
                                        class="dropdown-item"> <i
                                    class="ni ni-calendar-grid-58"></i> <span>문의사항</span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item"
                                   href="/customlogout"><i class="ni ni-user-run"></i> <span>로그아웃</span> </a>
                            </sec:authorize>
                            <sec:authorize access="isAnonymous()">
                                <a class="dropdown-item"
                                   href="/member/customlogin"><i class="ni ni-user-run"></i> <span>로그인</span> </a>
                            </sec:authorize>
                        </div> <!-- .dropdown-menu dropdown-menu-right --></li>
                </ul>
            </div>
            <!-- .collapse navbar-collapse -->
        </div>
        <!-- .container-fluid -->
    </nav>
    <!-- Header -->
    <!-- Header -->
    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-10"></div>
                    <div class="col">
                        <nav aria-label="breadcrumb"
                             class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="/"><i
                                        class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">Main</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- Card stats -->
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card card-stats">
                            <!-- Card body -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="card-title text-uppercase text-muted mb-0">등록된 프로젝트</h5>
                                        <span class="h2 font-weight-bold mb-0" id="countProject"></span>
                                    </div>
                                    <div class="col-auto">
                                        <div
                                                class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                                            <i class="ni ni-active-40"></i>
                                        </div>
                                    </div>
                                </div>
                                <p class="mt-3 mb-0 text-sm">
                                    <i class="fa fa-arrow-up text-success mr-2"></i><span class="text-success mr-2" id="countDiff">

										</span>
                                    <span class="text-nowrap">지난 달 대비</span>
                                </p>
                            </div>
                        </div>
                    </div>


                </div><!-- /.row -->
            </div>
        </div>
    </div>

    <!-- Page content -->
    <div class="container-fluid mt--6">
        <div class="row">
            <div class="col-xl">
                <div class="card">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="mb-0">조달청 나라장터 공고</h3>
                            </div>
                            <div class="col text-right">
                                <a href="#!" class="btn btn-sm btn-primary">See all</a>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <!-- Projects table -->
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                            <tr>
                                <th scope="col">입찰공고번호</th>
                                <th scope="col">Visitors</th>
                                <th scope="col">Unique users</th>
                                <th scope="col">Bounce rate</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td id="publicNo"></td>
                                <td>4,569</td>
                                <td>340</td>
                                <td><i class="fas fa-arrow-up text-success mr-3"></i>
                                    46,53%</td>
                            </tr>
                            <tr>
                                <th scope="row">/argon/index.html</th>
                                <td>3,985</td>
                                <td>319</td>
                                <td><i class="fas fa-arrow-down text-warning mr-3"></i>
                                    46,53%</td>
                            </tr>
                            <tr>
                                <th scope="row">/argon/charts.html</th>
                                <td>3,513</td>
                                <td>294</td>
                                <td><i class="fas fa-arrow-down text-warning mr-3"></i>
                                    36,49%</td>
                            </tr>
                            <tr>
                                <th scope="row">/argon/tables.html</th>
                                <td>2,050</td>
                                <td>147</td>
                                <td><i class="fas fa-arrow-up text-success mr-3"></i>
                                    50,87%</td>
                            </tr>
                            <tr>
                                <th scope="row">/argon/profile.html</th>
                                <td>1,795</td>
                                <td>190</td>
                                <td><i class="fas fa-arrow-down text-danger mr-3"></i>
                                    46,53%</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div><!-- /.row -->
        <!-- Footer -->
        <footer class="footer pt-0">
            <div class="row align-items-center justify-content-lg-between">
                <div class="col-lg-6">
                    <div class="copyright text-center  text-lg-left  text-muted">
                        &copy; 2020 <a href="https://www.creative-tim.com"
                                       class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <ul
                            class="nav nav-footer justify-content-center justify-content-lg-end">
                        <li class="nav-item"><a href="https://www.creative-tim.com"
                                                class="nav-link" target="_blank">Creative Tim</a></li>
                        <li class="nav-item"><a
                                href="https://www.creative-tim.com/presentation"
                                class="nav-link" target="_blank">About Us</a></li>
                        <li class="nav-item"><a href="http://blog.creative-tim.com"
                                                class="nav-link" target="_blank">Blog</a></li>
                        <li class="nav-item"><a
                                href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
                                class="nav-link" target="_blank">MIT License</a></li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>
    <!-- END Page content -->
</div>
<!-- Argon Scripts -->
<!-- Core -->
<script
        src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
<script
        src="/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/template/assets/vendor/js-cookie/js.cookie.js"></script>
<script
        src="/resources/template/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script
        src="/resources/template/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Optional JS -->
<script
        src="/resources/template/assets/vendor/chart.js/dist/Chart.min.js"></script>
<script
        src="/resources/template/assets/vendor/chart.js/dist/Chart.extension.js"></script>
<!-- Argon JS -->
<script src="/resources/template/assets/js/argon.js?v=1.2.0"></script>
</body>

<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // KTW
        // DB에 저장된 총 프로젝트 수를 구한다.
        $.ajax({
            type: "get",
            url: "/main/countProject",
            dataType: "json",
            success: function(data) {

                $({ val : 0 }).animate({ val : data }, {
                    duration: 1000,
                    step: function() {
                        var num = numberWithCommas(Math.floor(this.val));
                        $("#countProject").text(num + "개");
                    },
                    complete: function() {
                        var num = numberWithCommas(Math.floor(this.val));
                        $("#countProject").text(num + "개");
                    }
                });

                function numberWithCommas(x) {
                    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }
            }
        });//END $.ajax()

        // 접속일 기준 이전 달과 현재 달의 프로젝트 개수를 구한 뒤, 증가율을 계산한다.
        $.ajax({
            type: "get",
            url: "/main/countDiffProject",
            dataType: "json",
            success: function(data) {
                $("#countDiff").text(data+ "%");
            }
        });//END $.ajax()

        // 공공DB에서 값을 받아온다.
        // CORS 정책때문에 뷰에서 바로 요청을 할 수 없고, 동일 도메인의 서버에서 요청을 해줘야 한다.
        $.ajax({
            type: "get",
            url: "/main/publicDB",
            success: function(data) {
                console.log(data.bidNtceNo)
                $("#publicNo").text(data.bidNtceNo)
            }
        });//END $.ajax()

    });//END $(document).ready()

</script>

</html>