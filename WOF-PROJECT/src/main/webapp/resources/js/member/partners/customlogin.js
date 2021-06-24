const loginservice = {

    check: function () {
        const memberVO = {
            "userid": $('#userid').val(),
            "userpw": $('#userpw').val()
        }

        if (!document.login.userpw.value) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        $.ajax({
            url: '/member/loginIdPwCheck',
            type: 'POST',
            contentType: 'application/json',
            datatype: 'json',
            data: JSON.stringify(memberVO),
            success: function (data) {
                console.log(data);
                if (data === 1) {
                    alert("탈퇴된 회원입니다.");
                    return false;
                } else if (data === 2) {
                    alert("휴면회원 입니다.");
                    return false;
                } else if (data === 3) {
                    alert("아이디가 없습니다.");
                    return false;
                } else if (data === 4) {
                    alert("카카오로 로그안하세요.");
                    return false;
                } else if (data === 6) {
                    alert("비밀번호를 확인하세요");
                    return false;
                } else {
                    document.login.submit();
                }
            }, error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })
    },

    //엔터키 눌렀을 시 로그인버튼 실행
    enterkey: function () {
        if (window.event.keyCode === 13) {

            // 엔터키가 눌렸을 때 실행할 내용
            loginservice.check();
        }
    },


    findIdForm: function () {
        const memberVO = {
            "real_name": $('#real_name').val(),
            "userphone": $('#userphone').val()
        };
        $.ajax({
            url: '/member/findIdForm',
            type: 'POST',
            datatype: 'json',
            data: JSON.stringify(memberVO),
            contentType: 'application/json',
            success: function (data) {
                console.log(data)
                if (data.userid === "anonymousUser") {
                    alert("이름 or 번호를 확인하세요.");
                } else {
                    alert(data.userid + " 입니다.");
                }
            },
            error: function () {
                alert('error!');
            }

        });
    },

    findPwForm: function () {
        const memberVO = {
            "userid": $('#useridPW').val(),
            "real_name": $('#real_namePW').val(),
            "userphone": $('#userphonePW').val()
        };
        $.ajax({
            url: '/member/findPwForm',
            type: 'POST',
            datatype: 'json',
            data: JSON.stringify(memberVO),
            contentType: 'application/json',
            success: function (data) {
                console.log(data)
                if (data.userpw === "anonymousUser") {
                    alert("아이디 or 이름 or 번호를 확인하세요.");
                } else {
                    alert(data.userpw + " 입니다." +
                        "로그인 후 반드시 비밀번호를 변경하세요");
                }
            },
            error: function () {
                alert('error!');
            }

        });
    }


}//end loginservice


//핸드폰 - 자동 생성
    const autoHypenPhone = function (str) {
    str = str.replace(/[^0-9]/g, '');
    let tmp = '';
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
}

const phoneNum = document.getElementById('userphone');

phoneNum.onkeyup = function () {
    this.value = autoHypenPhone(this.value);
}
const phoneNumPW = document.getElementById('userphonePW');

phoneNumPW.onkeyup = function () {
    this.value = autoHypenPhone(this.value);
}