<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>WOF ver.Spring</title>

    <!-- Favicon -->
    <link rel="icon" href="/resources/template/assets/img/brand/favicon.png" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="/resources/template/assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="/resources/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
          type="text/css">
    <!-- Argon CSS -->
    <link rel="stylesheet" href="/resources/template/assets/css/argon.css?v=1.2.0" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/template/assets/css/argon.css" media="all"/>
    <link href='/resources/calendar/fullcalendar-5.4.0/lib/main.css' rel='stylesheet'/>
    <script src='/resources/calendar/fullcalendar-5.4.0/lib/main.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%--<script type='text/javascript'>--%>
    <%--document.addEventListener('DOMContentLoaded', function() {--%>
    <%--	  var calendarEl = document.getElementById('calendar');--%>
    <%--	  var calendar = new FullCalendar.Calendar(calendarEl, {--%>
    <%--	    selectable: true,--%>
    <%--	    headerToolbar: {--%>
    <%--	      left: 'prev',--%>
    <%--	      center: 'title',--%>
    <%--	      right: 'next'--%>
    <%--	    },--%>
    <%--        eventSources: [{--%>

    <%--            events: function(start, end, timezone, callback) {--%>

    <%--                $.ajax({--%>
    <%--                    url: '/schedule/list',--%>
    <%--                    type: 'GET',--%>
    <%--                    dataType: "json",--%>
    <%--                    data: JSON.parse(vo),--%>
    <%--                    error: function() {--%>
    <%--                        alert('error!');--%>
    <%--                    },--%>
    <%--                    success: function(data) {--%>
    <%--                        callback(data);--%>
    <%--                    }--%>

    <%--                });--%>

    <%--            },--%>

    <%--        }],--%>
    <%--	    select: function(info) {--%>
    <%--	      alert('enter your schedule !');--%>
    <%--	      var meet_contents = prompt('enter your schedule!');--%>
    <%--	      var vo = {--%>
    <%--	    		  'meet_contents' : meet_contents,--%>
    <%--	    		  'meet_datetime' : info.endStr,--%>
    <%--	    		  'meet_type' : 0,--%>
    <%--	    		  'meet_req_mem' : $('#meet_req_mem').val()--%>
    <%--	    	      };--%>
    <%--	      calendar.addEvent({--%>
    <%--	         title: meet_contents,--%>
    <%--	         start: info.endStr,--%>
    <%--	         allDay: true--%>
    <%--	      }); // add event--%>
    <%--		$.ajax({--%>
    <%--        		data: JSON.stringify(vo),--%>
    <%--    	        contentType:'application/json',--%>
    <%--    	        dataType:'json',--%>
    <%--    	        url:'/schedule/'+vo.meet_req_mem,--%>
    <%--    	        type:'post',--%>
    <%--    	        success:function(resp){--%>
    <%--    	            alert("seuccess enter your schedule!");--%>
    <%--    	        },--%>
    <%--    	        error:function(){--%>
    <%--    	            alert('error');--%>
    <%--    	        }--%>
    <%--    	    });--%>
    <%--	      --%>
    <%--	    }  --%>
    <%--	  });--%>
    <%--	  calendar.render();--%>
    <script type='text/javascript'>

        document.addEventListener('DOMContentLoaded', function () {

            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                selectable: true,
                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                select: function (info) {
                    alert('enter your schedule !');
                    var meet_contents = prompt('enter your schedule!');
                    var vo = {
                        'meet_contents': meet_contents,
                        'meet_datetime': info.endStr,
                        'meet_type': 0,
                        'meet_req_mem': $('#meet_req_mem').val()
                    };
                    calendar.addEvent({
                        title: meet_contents,
                        start: info.endStr,
                        allDay: true
                    }); // add event
                    $.ajax({
                        data: JSON.stringify(vo),
                        contentType: 'application/json',
                        dataType: 'json',
                        url: '/schedule/' + vo.meet_req_mem,
                        type: 'post',
                        success: function (resp) {
                            alert("seuccess enter your schedule!");
                        },
                        error: function () {
                            alert('error');
                        }
                    });

                }
            });
            calendar.render();

        });
    </script>


</head>

<body>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="member"/>
</sec:authorize>
<!-- Main content -->
<div class="main-content" id="panel">

    <!-- Topnav -->
    <nav
            class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
        <a href="${pageContext.request.contextPath }/main"><img
                alt=""
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
                                            href="${pageContext.request.contextPath }/map/project_map_manage">
                        <span class="nav-link-text">프로젝트 맵</span>
                    </a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><span
                            class="nav-link-text">공지사항</span></a></li>
                    <li class="nav-item">
                        <sec:authorize access="isAuthenticated()">
                            <a class="dropdown-item"
                               href="/customlogout"><i class="ni ni-user-run"></i> <span>로그아웃</span> </a>
                        </sec:authorize>
                        <sec:authorize access="isAnonymous()">
                            <a class="dropdown-item"
                               href="/member/customlogin"><i class="ni ni-user-run"></i> <span>로그인</span> </a>
                        </sec:authorize>
                    </li>

                    <li class="nav-item d-xl-none">
                        <!-- Sidenav toggler -->
                        <div class="pr-3 sidenav-toggler sidenav-toggler-dark"
                             data-action="sidenav-pin" data-target="#sidenav-main">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line"></i> <i
                                    class="sidenav-toggler-line"></i> <i
                                    class="sidenav-toggler-line"></i>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item d-sm-none"><a class="nav-link" href="#"
                                                      data-action="search-show" data-target="#navbar-search-main"> <i
                            class="ni ni-zoom-split-in"></i></a></li>
                    <li class="nav-item dropdown"><a class="nav-link" href="#"
                                                     role="button" data-toggle="dropdown" aria-haspopup="true"
                                                     aria-expanded="false"> <i class="ni ni-bell-55"></i></a>
                        <div
                                class="dropdown-menu dropdown-menu-xl  dropdown-menu-right  py-0 overflow-hidden">
                            <!-- Dropdown header -->
                            <div class="px-3 py-3">
                                <h6 class="text-sm text-muted m-0">
                                    You have <strong class="text-primary">13</strong>
                                    notifications.
                                </h6>
                            </div>
                            <!-- List group -->
                            <div class="list-group list-group-flush">
                                <a href="#!" class="list-group-item list-group-item-action">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <!-- Avatar -->
                                            <img alt="Image placeholder"
                                                 src="/resources/template/assets/img/theme/team-1.jpg"
                                                 class="avatar rounded-circle">
                                        </div>
                                        <div class="col ml--2">
                                            <div
                                                    class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h4 class="mb-0 text-sm">John Snow</h4>
                                                </div>
                                                <div class="text-right text-muted">
                                                    <small>2 hrs ago</small>
                                                </div>
                                            </div>
                                            <p class="text-sm mb-0">Let's meet at Starbucks at 11:30.
                                                Wdyt?</p>
                                        </div>
                                    </div>
                                </a> <a href="#!" class="list-group-item list-group-item-action">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <!-- Avatar -->
                                        <img alt="Image placeholder"
                                             src="/resources/template/assets/img/theme/team-2.jpg"
                                             class="avatar rounded-circle">
                                    </div>
                                    <div class="col ml--2">
                                        <div
                                                class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <h4 class="mb-0 text-sm">John Snow</h4>
                                            </div>
                                            <div class="text-right text-muted">
                                                <small>3 hrs ago</small>
                                            </div>
                                        </div>
                                        <p class="text-sm mb-0">A new issue has been reported for
                                            Argon.</p>
                                    </div>
                                </div>
                            </a> <a href="#!" class="list-group-item list-group-item-action">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <!-- Avatar -->
                                        <img alt="Image placeholder"
                                             src="/resources/template/assets/img/theme/team-3.jpg"
                                             class="avatar rounded-circle">
                                    </div>
                                    <div class="col ml--2">
                                        <div
                                                class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <h4 class="mb-0 text-sm">John Snow</h4>
                                            </div>
                                            <div class="text-right text-muted">
                                                <small>5 hrs ago</small>
                                            </div>
                                        </div>
                                        <p class="text-sm mb-0">Your posts have been liked a lot.</p>
                                    </div>
                                </div>
                            </a> <a href="#!" class="list-group-item list-group-item-action">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <!-- Avatar -->
                                        <img alt="Image placeholder"
                                             src="/resources/template/assets/img/theme/team-4.jpg"
                                             class="avatar rounded-circle">
                                    </div>
                                    <div class="col ml--2">
                                        <div
                                                class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <h4 class="mb-0 text-sm">John Snow</h4>
                                            </div>
                                            <div class="text-right text-muted">
                                                <small>2 hrs ago</small>
                                            </div>
                                        </div>
                                        <p class="text-sm mb-0">Let's meet at Starbucks at 11:30.
                                            Wdyt?</p>
                                    </div>
                                </div>
                            </a> <a href="#!" class="list-group-item list-group-item-action">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <!-- Avatar -->
                                        <img alt="Image placeholder"
                                             src="/resources/template/assets/img/theme/team-5.jpg"
                                             class="avatar rounded-circle">
                                    </div>
                                    <div class="col ml--2">
                                        <div
                                                class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <h4 class="mb-0 text-sm">John Snow</h4>
                                            </div>
                                            <div class="text-right text-muted">
                                                <small>3 hrs ago</small>
                                            </div>
                                        </div>
                                        <p class="text-sm mb-0">A new issue has been reported for
                                            Argon.</p>
                                    </div>
                                </div>
                            </a>
                            </div>
                            <!-- View all -->
                            <a href="#!"
                               class="dropdown-item text-center text-primary font-weight-bold py-3">View
                                all</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown"><a class="nav-link" href="#"
                                                     role="button" data-toggle="dropdown" aria-haspopup="true"
                                                     aria-expanded="false"> <i class="ni ni-ungroup"></i>
                    </a>
                        <div
                                class="dropdown-menu dropdown-menu-lg dropdown-menu-dark bg-default  dropdown-menu-right">
                            <div class="row shortcuts px-4">
                                <a href="#!" class="col-4 shortcut-item"> <span
                                        class="shortcut-media avatar rounded-circle bg-gradient-red">
										<i class="ni ni-calendar-grid-58"></i>
								</span><small>Calendar</small>
                                </a> <a href="#!" class="col-4 shortcut-item"> <span
                                    class="shortcut-media avatar rounded-circle bg-gradient-orange">
										<i class="ni ni-email-83"></i>
								</span><small>Email</small>
                            </a> <a href="#!" class="col-4 shortcut-item"> <span
                                    class="shortcut-media avatar rounded-circle bg-gradient-info">
										<i class="ni ni-credit-card"></i>
								</span><small>Payments</small>
                            </a> <a href="#!" class="col-4 shortcut-item"> <span
                                    class="shortcut-media avatar rounded-circle bg-gradient-green">
										<i class="ni ni-books"></i>
								</span><small>Reports</small>
                            </a> <a href="#!" class="col-4 shortcut-item"> <span
                                    class="shortcut-media avatar rounded-circle bg-gradient-purple">
										<i class="ni ni-pin-3"></i>
								</span><small>Maps</small>
                            </a> <a href="#!" class="col-4 shortcut-item"> <span
                                    class="shortcut-media avatar rounded-circle bg-gradient-yellow">
										<i class="ni ni-basket"></i>
								</span><small>Shop</small>
                            </a>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
                    <li class="nav-item dropdown"><a class="nav-link pr-0"
                                                     href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                                                     aria-expanded="false">
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
                            <c:if test="${member.auth == 'ROLE_CLIENT' }">
                                <a href="${pageContext.request.contextPath }/client/dashboard_client?member_no=${member.member_no}"
                                    class="dropdown-item"> <i class="ni ni-single-02"></i>
                                    <span>My dashboard</span>
                                </a>
                            </c:if>
                            <c:if test="${member.auth == 'ROLE_PARTNERS' }">
                                <a href="${pageContext.request.contextPath }/partners/profile_info"
                                   class="dropdown-item"> <i class="ni ni-single-02"></i>
                                    <span>My meeting</span>
                                </a>
                            </c:if>
                            <a href="#!" class="dropdown-item"> <i
                                    class="ni ni-settings-gear-65"></i> <span>Settings</span>
                            </a> <a href="#!" class="dropdown-item"> <i
                                class="ni ni-calendar-grid-58"></i> <span>Activity</span>
                        </a> <a href="#!" class="dropdown-item"> <i
                                class="ni ni-support-16"></i> <span>Support</span>
                        </a>
                            <div class="dropdown-divider"></div>
                            <sec:authorize access="isAuthenticated()">
                                <a class="dropdown-item"
                                   href="/customlogout"><i class="ni ni-user-run"></i> <span>로그아웃</span> </a>
                            </sec:authorize>
                            <sec:authorize access="isAnonymous()">
                                <a class="dropdown-item"
                                   href="/member/customlogin"><i class="ni ni-user-run"></i> <span>로그인</span> </a>
                            </sec:authorize>
                        </div>
                        <!-- .dropdown-menu dropdown-menu-right --></li>
                </ul>
            </div>
            <!-- .collapse navbar-collapse -->
        </div>
        <!-- .container-fluid -->
    </nav>
</div>