const profileManagement = {
    openForm: function (userId) {
        $.ajax({
            url: '/member/projectprofileinfo?userid=' + userId,
            type: 'GET',
            dataType: "json",
            success: function (data) {
                //data draw
                profileManagement.draw(data);
                $('#targetProfileUpdateForm').click();
            },
            error: function () {
                alert('error!');
            }
        });
    },
    draw: function (data) {
        $('#nameform').val(data.name);
        $('#skillform').val(data.skill);
        $('#fieldform').val(data.field);
        $('#responsibilitiesform').val(data.responsibilities);
        $('#startdateform').val(data.startdate);
        $('#enddateform').val(data.enddate);
        $('#noform').val(data.no);

    },
    //프로필 수정
    profileupdate: function () {
        var partnersVO = {
            "member_no": $('#member_no').val(),
            "profile": $('#profile').val()
        };
        console.log(partnersVO);
        $.ajax({
            url: '/member/profileupdate',
            type: 'POST',
            datatype: 'json',
            data: JSON.stringify(partnersVO),
            contentType: 'application/json',
            success: function () {
                alert('수정되었습니다.');
            },
            error: function () {
                alert('error!');
            }

        });

    },
    //프로젝트/경력 수정
    projectProfileUpdate:function (){
        if (document.$('#nameform').value == null) {
            alert("프로젝트명을 입력하세요.");
            return false;
        } else if (document.$('#skillform').value == null) {
            alert("기술/역할을 입력하세요.");
            return false;
        } else if (document.$('#fieldform').value == null) {
            alert("분야를 입력하세요.");
            return false;
        } else if (document.$('#responsibilitiesform').value == null) {
            alert("담당업무을 입력하세요.");
            return false;
        } else if (document.$('#dateform').value == null) {
            alert("시작날짜를 입력하세요.");
            return false;
        } else if (document.$('#date2form').value == null) {
            alert("종료날짜를 입력하세요.");
            return false;
        }

    },
    projectProfileDelete: function (no) {
        if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
            location.href = "/member/projectprofiledelete?no=" + no;
        } else {   //취소
            return false;
        }
    },

    profileinsert: function () {
        if (document.$('#name').value == null) {
            alert("프로젝트명을 입력하세요.");
            return false;
        } else if (document.$('#skill').value == null) {
            alert("기술/역할을 입력하세요.");
            return false;
        } else if (document.$('#field').value == null) {
            alert("분야를 입력하세요.");
            return false;
        } else if (document.$('#responsibilities').value == null) {
            alert("담당업무을 입력하세요.");
            return false;
        } else if (document.$('#date').value == null) {
            alert("시작날짜를 입력하세요.");
            return false;
        } else if (document.$('#date2').value == null) {
            alert("종료날짜를 입력하세요.");
            return false;
        }
    },
    //현재비밀번호 인증
    pwcheck: function () {
        var userpw = $('#userpw').val();
        var member_no = $('#member_no').val();
        var ischeckpw = false;
        console.log(userpw);
        $.ajax({
            url: '/member/pwcheck',
            type: 'post',
            contentType: 'application/json',
            datatype: 'json',
            data: JSON.stringify({"member_no": member_no, "userpw": userpw}),
            success: function (data) {
                console.log(data);
                parseInt(data);

                if (data == 1) {
                    $("#pwcheck").text("인증완료!!!");
                    ischeckpw = true;
                } else if (data == 0) {
                    $("#pwcheck").text("인증X");
                }
            }, error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })
    },
    //회원정보 수정하기 버튼
    infoUpdate: function () {
        if (!ischeckId) {
            alert("비밀번호 인증을 확안하세요.")
            return false;
        } else if (document.infoupdate.userpw !== document.infoupdate.userpwch) {
            alert("비밀번호가 다릅니다.")
            return false;
        } else {
            return true;
        }
    },
    //회원탈퇴
    memberDelete: function () {
        if (confirm("정말 탈퇴하시겠습니까??" +
            "* 탈퇴 후 한달뒤엔 모든 정보가 사라집니다.") == true) {    //확인
            location.href = "/member/withdrawal?userid=${member.userid}";
        } else {   //취소
            return false;
        }
    }

}


//핸드폰 번호 자동'-'생성
var autoHypenPhone = function (str) {
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if (str.length < 4) {
        return str;
    } else if (str.length < 7) {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    } else if (str.length < 11) {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    } else {
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

phoneNum.onkeyup = function () {
    this.value = autoHypenPhone(this.value);
}

//미팅관련 함수
$(function () {
    $("#deleteMeetingBtn").on('click', function () {
        var meet_id = $(this).val();
        var $contents = $(this).parents('tr');
        $.ajax({
            contentType: 'application/json',
            dataType: 'json',
            url: '/schedule/' + meet_id,
            type: 'DELETE',
            success: function (resp) {
                alert('삭제 완료되었습니다.');
                $contents.remove();

            },
            error: function () {
                alert('what is error?');
            }
        })
    })
});