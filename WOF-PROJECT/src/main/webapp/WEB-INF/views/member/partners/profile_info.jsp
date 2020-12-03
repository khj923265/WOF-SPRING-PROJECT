<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- Header & Menu -->
<%@include file="../../includes/header.jsp" %>
<!-- Main content -->
<div class="main-content" id="panel">
    <!-- Page content -->
    <div class="container-fluid mt-10">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h1 class="mb-0">프로필/프로젝트 관리</h1>
                            </div>
                            <div class="col-3 text-right">
                                <button type="button" class="btn btn-success" id="targetProfileForm" data-toggle="modal"
                                        data-target="#PartnersProfileUpdateForm">회원정보 수정하기
                                </button>
                            </div>
                            <div class="col-1 text-right">
                                <input name="withdrawal" type="button" class="btn btn-danger"
                                       onclick="return profileManagement.memberDelete()" value="회원탈퇴">
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <h6 class="heading-small text-muted mb-4">추가정보</h6>
                        <div class="col-md-12 form-inline">
                            <div class="card card-profile col-md-6">
                                <div id='calendar'></div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-9 text-right">
                                        <h1>${member.real_name }</h1>
                                    </div>
                                </div>
                                <div class="row my-3 pt-6">
                                    <div class="col-6 col-md-2 pr-0 text-right">이메일 :</div>
                                    <div class="col-6 col-md-4 text-left">${member.userid}</div>
                                    <input type="hidden" id="meet_req_mem" value="${member.member_no}">
                                    <div class="col-6 col-md-2 pr-0 text-right">경력 :</div>
                                    <div class="col-6 col-md-4 text-left">4년차</div>
                                </div>
                                <div class="row my-3 pt-5">
                                    <div class="col-6 col-md-2 pr-0 text-right">전화번호 :</div>
                                    <div class="col-6 col-md-4 text-left">${member.userphone}</div>
                                    <div class="col-6 col-md-2 pr-0 text-right">보유기술 :</div>
                                    <div class="col-6 col-md-4 text-left">${partners.skill}</div>
                                </div>
                                <div class="row my-3 pt-5">
                                    <div class="col-6 col-md-2 pr-0 text-right">선호지역 :</div>
                                    <div class="col-6 col-md-4 text-left">${partners.prefered_area }</div>
                                    <div class="col-6 col-md-2 pr-0 text-right">해시태그 :</div>
                                    <div class="col-6 col-md-4 text-left">${partners.hashtag }</div>
                                </div>
                            </div>
                        </div>
                        <hr class="my-4"/>
                        <!-- Address -->
                        <h6 class="heading-small text-muted mb-4">이력서 관리</h6>


                        <div class="nav-wrapper">
                            <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text"
                                role="tablist">
                                <li class="nav-item col-3">
                                    <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab"
                                       data-toggle="tab" href="#tabs-icons-text-1" role="tab"
                                       aria-controls="tabs-icons-text-1" aria-selected="true">
                                        <i class="ni ni-badge mr-2"></i>프로젝트/경력 사항</a>
                                </li>
                                <li class="nav-item col-3">
                                    <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab"
                                       href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2"
                                       aria-selected="false">
                                        <i class="ni ni-circle-08 mr-2"></i>자기소개</a>
                                </li>
                                <li class="nav-item col-3">
                                    <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab"
                                       href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3"
                                       aria-selected="false">
                                        <i class="ni ni-calendar-grid-58 mr-2"></i>프로젝트 일정</a>
                                </li>
                                <li class="nav-item col-1"></li>
                                <li class="nav-item col-2">
                                    <button type="button" class="btn btn-primary" id="targetProfileInsertForm"
                                            data-toggle="modal" data-target="#ProfileInsertForm">프로젝트/경력 등록하기
                                    </button>
                                </li>
                            </ul>
                        </div>


                        <div class="card shadow">
                            <div class="card-body">
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel"
                                         aria-labelledby="tabs-icons-text-1-tab">
                                        <%@include file="./project_profile_list.jsp" %>
                                    </div>
                                    <div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel"
                                         aria-labelledby="tabs-icons-text-2-tab">
                                        <%@include file="./profile_personalstatement.jsp" %>
                                    </div>
                                    <div class="tab-pane fade" id="tabs-icons-text-3" role="tabpanel"
                                         aria-labelledby="tabs-icons-text-3-tab">
                                        <%@include file="./project_meetinglist.jsp" %>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Description -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--	modal	--%>
<%@ include file="./project_profile_insert_form.jsp" %>
<%@ include file="./project_profile_update_form.jsp" %>
<%@ include file="./profile_form.jsp" %>
<%@ include file="./calendar_edit.jsp"%>
<!-- footer -->
<%@ include file="../../includes/footer.jsp" %>
<script src='/resources/js/member/partners/profileManagement.js'></script>
<script src='/resources/js/member/partners/meeting.js'></script>