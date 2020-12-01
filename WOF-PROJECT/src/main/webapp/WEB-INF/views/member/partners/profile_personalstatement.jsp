<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="row pt-3 inline c">
    <div class="col-1"></div>
    <div class="col-8 text-left">자기소개</div>
    <button type="button" class="col-2 btn btn-success" onclick="profileManagement.profileupdate()">수정하기</button>
    <input class="form-control col-10 pt-3 center"type="text" style="width: 800px;height: 300px"
        name="profile" id="profile" value="${partners.profile}">

</div>