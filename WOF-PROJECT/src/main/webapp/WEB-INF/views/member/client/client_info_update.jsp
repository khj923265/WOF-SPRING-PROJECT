<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- Header & Menu -->
<%@include file="../../includes/header.jsp"%>
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
                                <h1 class="mb-0">회사정보 수정</h1>
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
<%@include file="../../includes/footer.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //현재비밀번호 인증
    function pwcheck(){
        var userpw = $('#userpw').val();
        var member_no ="${member.member_no}";
        var ischeckpw = false;
        console.log(userpw);
        $.ajax({
            url : '/member/pwcheck',
            type : 'post',
            contentType: 'application/json',
            datatype: 'json',
            data : JSON.stringify({"member_no":member_no,"userpw":userpw}),
            success : function (data){
                console.log(data);
                parseInt(data);

                if (data == 1){
                    $("#pwcheck").text("인증완료!!!");
                    ischeckpw = true;
                }else if (data == 0){
                    $("#pwcheck").text("인증X");
                }
            },error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
        })
    }

    //수정하기 버튼
    function infoUpdate(){
        if (!ischeckId){
            alert("비밀번호 인증을 확안하세요.")
            return false;
        }else if (document.infoupdate.userpw !== document.infoupdate.userpwch){
            alert("비밀번호가 다릅니다.")
            return false;
        }else {
            return true;
        }
    }

    //회원탈퇴
    function memberDelete() {
        if (confirm("정말 삭제하시겠습니까??") == true){    //확인
            document.withdrawal.click();
        }else{   //취소
            return false;
        }
    }

    //핸드폰 번호 자동'-'생성
    var autoHypenPhone = function(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }

        return str;
    }

    var phoneNum = document.getElementById('userphone');

    phoneNum.onkeyup = function(){
        this.value = autoHypenPhone( this.value ) ;
    }
    var telNum = document.getElementById('tel');

    telNum.onkeyup = function(){
        this.value = autoHypenPhone( this.value ) ;
    }

    //카카오 주소API 실행 함수
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>