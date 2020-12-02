<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- Header & Menu -->
<%@include file="../includes/header.jsp"%>

<div class="main-content" id="panel">
    <!-- Page content -->
    <div class="container-fluid mt-10">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h1 class="mb-0">공지사항</h1>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <h6 class="heading-small text-muted mb-4">추가정보</h6>
                        <form method="post">
                            <div class="col-md-12 form-inline">
                                <div class="col-md-8 center">
                                    <div class="row my-3 pt-2 inline">
                                        <div class="col-6 col-md-2 pr-0 text-right">회사이름 :</div>
                                        <input type="text" name="name" id="name"
                                               class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="ex)${client.name}" value="${client.name}"/>
                                        <div class="col-6 col-md-2 pr-0 text-right">사업자번호 :</div>
                                        <input type="text" name="business_register_no" id="business_register_no"
                                               class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="ex)${client.business_register_no}" value="${client.business_register_no}"/>
                                    </div>
                                    <div class="row my-3 pt-5 inline">
                                        <div class="col-6 col-md-2 pr-0 text-right">담당자번호 :</div>
                                        <input type="text" name="userphone" id="userphone"
                                               class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="ex)${member.userphone}" value="${member.userphone}"/>
                                        <div class="col-6 col-md-2 pr-0 text-right">회사전화번호 :</div>
                                        <input type="text" name="tel" class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="${client.tel}" id="tel" value="${client.tel}"
                                               maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$"/>
                                    </div>
                                    <div class="row my-3 pt-3 inline clearfix">
                                        <div class="col-6 col-md-2 pr-0 text-right">상세주소 :</div>
                                        <input type="text" name="address2" id="address2"
                                               class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="상세주소" value="${client.address2}">
                                        <input type="button" class="col-3 btn btn-primary"
                                               onclick="DaumPostcode()" value="주소찾기">
                                    </div>
                                    <div class="row my-3 pt-3 inline clearfix">
                                        <div class="col-3 col-md-2 pr-0 text-right">주소 :</div>
                                        <input type="text" name="address1" id="address1"
                                               class="form-control form-control-muted col-9"
                                               placeholder="주소" value="${client.address1}"/>
                                    </div>
                                    <div class="row my-12 pt-5 inline">
                                        <div class="col-2 pr-0 text-right">현재 비빌번호 :</div>
                                        <input type="password" id="userpw"
                                               class="form-control form-control-muted col-4"
                                               placeholder="password"/>
                                        <button type="button" onclick="pwcheck()"
                                                class="btn btn-primary col-2">비밀번호 확인</button>
                                        <div class="col-4" id="pwcheck"></div>
                                    </div>
                                    <div class="row my-3 pt-5 inline">
                                        <div class="col-6 col-md-2 pr-0 text-right">비밀번호 변경 :</div>
                                        <input type="password" name="userpw"
                                               class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="password"/>
                                        <div class="col-6 col-md-2 pr-0 text-right">비밀번호 확인 :</div>
                                        <input type="password" name="userpwch"
                                               class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="password"/>
                                    </div>
                                    <input type="hidden" name="member_no" value="${member.member_no}">
                                    <div class="row pt-3 inline">
                                        <div class="col-2"></div>
                                        <div class="col-3 text-center">
                                            <input type="submit" class="btn btn-success" onsubmit="return infoUpdate()"
                                                   formaction="/member/clientinfoupdate" value="수정하기"/>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-3 text-center">
                                            <input name="withdrawal" type="submit" class="btn btn-danger" formaction="/member/clientwithdrawal"
                                                   onsubmit="memberDelete()" value="회원탈퇴"/>
                                        </div>
                                    </div>
                                    <div class="row pt-3 inline">
                                        <div class="col-12 text-left">회사소개</div>
                                        <input type="text" style="width: 800px;height: 100px" name="profile"
                                               id="profile" value="${client.profile}" class="form-control pt-1">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<!-- footer -->
<%@ include file="../includes/footer.jsp"%>