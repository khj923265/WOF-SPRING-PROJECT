<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="PartnersProfileUpdateForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="min-width: 1000px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">추가정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <form method="post" id="profileform" name="profileform">
                        <div class="col-md-12 form-inline">
                            <div class="col-md-12">
                                <div class="row my-3 pt-2 inline">
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">이메일 :</div>
                                    <div class="col-6 col-md-4 text-left">${member.userid}</div>
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">경력 :</div>
                                    <div class="col-6 col-md-4 text-left">${partners.career}</div>
                                </div>
                                <div class="row my-3 pt-5 inline">
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">전화번호 :</div>
                                    <input type="text" name="userphone" class="form-control form-control-muted col-6 col-md-4 "
                                           placeholder="${member.userphone}" id="userphone" value="${member.userphone}"
                                           maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$"/>
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">보유기술 :</div>
                                    <input type="text" name="skill"
                                           class="form-control form-control-muted col-6 col-md-4 "
                                           placeholder="ex)JAVA" value="${partners.skill}"/>
                                </div>
                                <div class="row my-3 pt-5 inline clearfix">
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">선호지역 :</div>
                                    <input type="text" name="prefered_area"
                                           class="form-control form-control-muted col-6 col-md-4 "
                                           placeholder="선호지역" value="${partners.prefered_area}"/>
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">해시태그 :</div>
                                    <input type="text" name="hashtag"
                                           class="form-control form-control-muted col-6 col-md-4 "
                                           placeholder="ex)#JAVA" value="${partners.hashtag}"/>
                                </div>
                                <div class="row my-12 pt-5 inline">
                                    <div class="col-2 pr-0 text-right align-self-center">현재 비빌번호 :</div>
                                    <input type="password" id="userpw"
                                           class="form-control form-control-muted col-4"
                                           placeholder="password"/>
                                    <button type="button" onclick="profileManagement.pwcheck()"
                                            class="btn btn-primary col-2 align-self-center">비밀번호 확인</button>
                                    <div class="col-4" id="pwcheck"></div>
                                </div>
                                <div class="row my-3 pt-5 inline">
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">비밀번호 변경 :</div>
                                    <input type="password" name="userpw"
                                           class="form-control form-control-muted col-6 col-md-4 "
                                           placeholder="password"/>
                                    <div class="col-6 col-md-2 pr-0 text-right align-self-center">비밀번호 확인 :</div>
                                    <input type="password" name="userpwch"
                                           class="form-control form-control-muted col-6 col-md-4 "
                                           placeholder="password"/>
                                </div>
                                <input type="hidden" name="member_no" id="member_no" value="${member.member_no}">
                                <div class="row pt-3 inline">
                                    <div class="col-5 text-right">
                                        <input type="submit" class="btn btn-success" onsubmit="return profileManagement.infoUpdate()"
                                               formaction="/member/partnersinfoupdate" value="수정하기"/>
                                    </div>
                                    <div class="col-4 text-right">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                    </div>
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
<!-- end list -->