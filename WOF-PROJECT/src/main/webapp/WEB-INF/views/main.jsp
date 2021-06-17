<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>WOF's 메인 페이지</title>

    <!--main bootstrap  -->
    <link rel="icon" href="/resources/template/assets/img/brand/favicon.png" type="image/png">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="/resources/template/assets/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/template/assets/css/animate.css">
    <link rel="stylesheet" href="/resources/template/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/template/assets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/template/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/template/assets/css/aos.css">
    <link rel="stylesheet" href="/resources/template/assets/css/ionicons.min.css">
    <link rel="stylesheet" href="/resources/template/assets/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/template/assets/css/jquery.timepicker.css">
    <link rel="stylesheet" href="/resources/template/assets/css/flaticon.css">
    <link rel="stylesheet" href="/resources/template/assets/css/icomoon.css">
    <link rel="stylesheet" href="/resources/template/assets/css/style.css">
</head>


<body>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="member"/>
</sec:authorize>
<!-- Top navbar -->
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/main">WOF</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#ftco-nav" aria-controls="ftco-nav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span>Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="${pageContext.request.contextPath }/project/create"
                                        class="nav-link">프로젝트 등록</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath }/project/list"
                                        class="nav-link">프로젝트 찾기</a></li>
                <li class="nav-item"><a href="/map/project_map_manage"
                                        class="nav-link">프로젝트 맵</a></li>
                <li class="nav-item"><a
                        href="${pageContext.request.contextPath }/partners/list?member_no=${member.member_no}"
                        class="nav-link">파트너스 찾기</a></li>
                <li class="nav-item"><a href="Client/partnersListAction.do"
                                        class="nav-link">프로젝트 맵</a></li>
                <li class="nav-item"><a href="contact.html" class="nav-link">공지사항</a></li>

                <li class="nav-item">
                    <sec:authorize access="isAuthenticated()">
                        <a class="nav-link"
                           href="/customlogout"><i class="ni ni-user-run"></i> <span>로그아웃</span> </a>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <a class="nav-link"
                           href="/member/customlogin"><i class="ni ni-user-run"></i> <span>로그인</span> </a>
                    </sec:authorize>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->


<div class="hero-wrap js-fullheight">
    <div class="overlay"></div>
    <div class="container-fluid px-0">
        <div
                class="row d-md-flex no-gutters slider-text align-items-end js-fullheight justify-content-end">
            <img class="one-third align-self-end order-md-last img-fluid"
                 src="/resources/template/assets/img/undraw_work_time_lhoj.svg"
                 alt="">
            <div
                    class="one-forth d-flex align-items-center ftco-animate js-fullheight">
                <div class="text mt-5">
                    <p class="mb-4 mt-5 pt-5">
                        We have <span class="number" id="countProject"></span> great job
                        offers you deserve!
                    </p>
                    <h2>아직도 일자리 구하러 이리저리 하세요?</h2>
                    <h1>전 집에서 WOF해요!</h1>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid px-0 -->
</div>
<!-- /.hero-wrap js-fullheight -->


<section class="ftco-section services-section bg-primary">
    <div class="container ">
        <div class="row d-flex">
            <div class="col-md-2 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="media-body" id="publicNo">
                        <h3 class="heading mb-3">입찰공고번호</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="media-body" id="publicTitle">
                        <h3 class="heading mb-3">입찰공고명</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-2 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="media-body" id="publicCompany">
                        <h3 class="heading mb-3">공고기관명</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-2 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="media-body" id="publicEnd">
                        <h3 class="heading mb-3">입찰마감일</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-2 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="media-body" id="publicEstimate">
                        <h3 class="heading mb-3">예산금액</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section testimony-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 text-center heading-section ftco-animate">
                <span class="subheading">Testimonial</span>
                <h2 class="mb-4">고객 만족도 후기</h2>
            </div>
        </div>
        <div class="row ftco-animate">
            <div class="col-md-12">
                <div class="carousel-testimony owl-carousel ftco-owl">
                    <div class="item">
                        <div class="testimony-wrap py-4 pb-5">
                            <div class="user-img mb-4"
                                 style="background-image: url(/resources/template/assets/img/person_1.jpg)">
                           <span
                                   class="quote d-flex align-items-center justify-content-center">
                              <i class="icon-quote-left"></i>
                           </span>
                            </div>
                            <div class="text">
                                <p class="mb-4">개발지식이 부족했던 저희를 알기 쉽게 설명도 해주시고 개발 도중 생기는 이슈들을 공유하면서 해결해주셔서 감사했습니다. Ios
                                    개발도 함께 하고싶습니다.</p>
                                <p class="name">hongbum27</p>
                                <span class="position">파트너스 rocateer2015</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4 pb-5">
                            <div class="user-img mb-4"
                                 style="background-image: url(/resources/template/assets/img/person_2.jpg)">
                           <span
                                   class="quote d-flex align-items-center justify-content-center">
                              <i class="icon-quote-left"></i>
                           </span>
                            </div>
                            <div class="text">
                                <p class="mb-4">외주파트너와 일하는건 처음이라 계약전에 이것저것 조항을 명시했었는데 기우였습니다. 의도만 잘 전달하면 나머진 꼼꼼하게 잘
                                    해주셨습니다. 심플한게 가장어려운법인데 ...</p>
                                <p class="name">ginsu2018</p>
                                <span class="position">클라이언트 nm00mn</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4 pb-5">
                            <div class="user-img mb-4"
                                 style="background-image: url(/resources/template/assets/img/person_3.jpg)">
                           <span
                                   class="quote d-flex align-items-center justify-content-center">
                              <i class="icon-quote-left"></i>
                           </span>
                            </div>
                            <div class="text">
                                <p class="mb-4">제안 드린 양식에 맞게 최단 시간내에 프로그램을 완성해주셨습니다. 다음에도 작업요청 드리고 싶네요^^</p>
                                <p class="name">civitan95</p>
                                <span class="position">클라이언트 kangsoftware</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4 pb-5">
                            <div class="user-img mb-4"
                                 style="background-image: url(/resources/template/assets/img/person_1.jpg)">
                           <span
                                   class="quote d-flex align-items-center justify-content-center">
                              <i class="icon-quote-left"></i>
                           </span>
                            </div>
                            <div class="text">
                                <p class="mb-4">쇼핑몰 솔루션 구입,서버관리까지 같은 회사에서 구입해 사용중이었습니다. 당연히 그렇게 하면 잘 관리해 줄거라 믿었는데 이게 그게
                                    아니더군요. 얼마전부터 쇼핑몰이 계속 ...</p>
                                <p class="name">hi7979</p>
                                <span class="position">파트너스 creduo</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4 pb-5">
                            <div class="user-img mb-4"
                                 style="background-image: url(/resources/template/assets/img/person_1.jpg)">
                           <span
                                   class="quote d-flex align-items-center justify-content-center">
                              <i class="icon-quote-left"></i>
                           </span>
                            </div>
                            <div class="text">
                                <p class="mb-4">적극적인 자세로 프로젝트에 임해주시고.. 빠르게 처리해주셔서 감사합니다. 기술적인 부분이나 업무 협조는 아주 잘되었습니다. 향후
                                    관련한 프로젝트가 있다면 다시한번 …</p>
                                <p class="name">xtopable</p>
                                <span class="position">클라이언트 alicerabbit</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">About</h2>
                    <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                    <ul
                            class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                        <li class="ftco-animate"><a href="#"><span
                                class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span
                                class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span
                                class="icon-instagram"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Employers</h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block">How it works</a></li>
                        <li><a href="#" class="py-2 d-block">Register</a></li>
                        <li><a href="#" class="py-2 d-block">Post a Job</a></li>
                        <li><a href="#" class="py-2 d-block">Advance Skill
                            Search</a></li>
                        <li><a href="#" class="py-2 d-block">Recruiting Service</a></li>
                        <li><a href="#" class="py-2 d-block">Blog</a></li>
                        <li><a href="#" class="py-2 d-block">Faq</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-md-4">
                    <h2 class="ftco-heading-2">Workers</h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block">How it works</a></li>
                        <li><a href="#" class="py-2 d-block">Register</a></li>
                        <li><a href="#" class="py-2 d-block">Post Your Skills</a></li>
                        <li><a href="#" class="py-2 d-block">Job Search</a></li>
                        <li><a href="#" class="py-2 d-block">Emploer Search</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Have a Questions?</h2>
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span
                                    class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
                            <li><a href="#"><span class="icon icon-phone"></span><span
                                    class="text">+2 392 3929 210</span></a></li>
                            <li><a href="#"><span class="icon icon-envelope"></span><span
                                    class="text">info@yourdomain.com</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">

                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script>
                    All rights reserved | This template is made with <i
                        class="icon-heart text-danger" aria-hidden="true"></i> by <a
                        href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </div>
</footer>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
                stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none"
                stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
    </svg>
</div>


<script
        src="/resources/template/assets/js/jquery.min.js"></script>
<script
        src="/resources/template/assets/js/jquery-migrate-3.0.1.min.js"></script>
<script
        src="/resources/template/assets/js/popper.min.js"></script>
<script
        src="/resources/template/assets/js/bootstrap.min.js"></script>
<script
        src="/resources/template/assets/js/jquery.easing.1.3.js"></script>
<script
        src="/resources/template/assets/js/jquery.waypoints.min.js"></script>
<script
        src="/resources/template/assets/js/jquery.stellar.min.js"></script>
<script
        src="/resources/template/assets/js/owl.carousel.min.js"></script>
<script
        src="/resources/template/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/template/assets/js/aos.js"></script>
<script
        src="/resources/template/assets/js/jquery.animateNumber.min.js"></script>
<script
        src="/resources/template/assets/js/scrollax.min.js"></script>
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script
        src="/resources/template/assets/js/google-map.js"></script>
<script src="/resources/template/assets/js/main.js"></script>

</body>

<script
        src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
    $(document)
        .ready(
            function () {

                // KTW
                // DB에 저장된 총 프로젝트 수를 구한다.
                $.ajax({
                    type: "get",
                    url: "/main/countProject",
                    dataType: "json",
                    success: function (data) {

                        $({
                            val: 0
                        }).animate(
                            {
                                val: data
                            },
                            {
                                duration: 1000,
                                step: function () {
                                    var num = numberWithCommas(Math
                                        .floor(this.val));
                                    $("#countProject").text(num);
                                },
                                complete: function () {
                                    var num = numberWithCommas(Math
                                        .floor(this.val));
                                    $("#countProject").text(num);
                                }
                            });

                        function numberWithCommas(x) {
                            return x.toString().replace(
                                /\B(?=(\d{3})+(?!\d))/g, ",");
                        }
                    }
                });//END $.ajax()

                // 접속일 기준 이전 달과 현재 달의 프로젝트 개수를 구한 뒤, 증가율을 계산한다.
                /* $.ajax({
                    type : "get",
                    url : "/main/countDiffProject",
                    dataType : "json",
                    success : function(data) {
                        $("#countDiff").text(data + "%");
                    }
                });//END $.ajax() */

                // 공공DB에서 값을 받아온다.
                // CORS 정책때문에 뷰에서 바로 요청을 할 수 없고, 동일 도메인의 서버에서 요청을 해줘야 한다.
                $
                    .ajax({
                        type: "get",
                        url: "/main/publicDB",
                        dataTypd: "text",
                        success: function (data) {
                            //console.log(JSON.parse(data))
                            var result = JSON.parse(data);
                            var result2 = result.response.body.items;

                            for (var i = 0; i < result2.length; i++) {
                                $("#publicNo")
                                    .append(
                                        "<p>"
                                        + result2[i].bidNtceNo
                                        + "</p>");
                                $("#publicTitle")
                                    .append(
                                        "<p>"
                                        + result2[i].bidNtceNm
                                        + "</p>");
                                $("#publicCompany")
                                    .append(
                                        "<p>"
                                        + result2[i].ntceInsttNm
                                        + "</p>");
                                $("#publicEnd")
                                    .append(
                                        "<p>"
                                        + result2[i].bidClseDt
                                        + "</p>");
                                $("#publicEstimate")
                                    .append(
                                        "<p>"
                                        + numberWithCommas(result2[i].presmptPrce)
                                        + "</p>");
                            }

                            function numberWithCommas(x) {
                                return x.toString().replace(
                                    /\B(?=(\d{3})+(?!\d))/g,
                                    ",");
                            }
                        }
                    });//END $.ajax()

            });//END $(document).ready()
</script>

</html>