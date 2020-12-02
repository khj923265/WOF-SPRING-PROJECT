<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="FiedIdForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="min-width: 600px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="col-md-12 form-inline">
                        <div class="col-md-12">
                            <div class="row my-3 pt-5 inline">
                                <div class="col-6 col-md-2 pr-0 text-right align-self-center">이름 :</div>
                                <input type="text" name="real_name" id="real_name"
                                       class="form-control form-control-muted col-6 col-md-4 "
                                       placeholder="ex)홍길동"/>
                                <div class="col-6 col-md-2 pr-0 text-right align-self-center">전화번호 :</div>
                                <input type="text" name="userphone"
                                       class="form-control form-control-muted col-6 col-md-4 "
                                       placeholder="-없이 입력하세요." id="userphone"
                                       maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$"/>
                            </div>
                            <div class="row pt-3 inline">
                                <div class="col-6 text-center">
                                    <input type="button" class="btn btn-success" onclick="return findIdForm()"
                                           value="아이디 찾기"/>
                                </div>
                                <div class="col-4 text-center">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- end list -->