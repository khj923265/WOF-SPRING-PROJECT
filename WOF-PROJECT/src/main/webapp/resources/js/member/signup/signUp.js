const signUpService = {
    check : function (){
        if(!document.user.userid.value){
            alert("비밀번호를 입력하세요.")
            return false;
        }else if(document.user.userpw.value !== document.user.userpwck.value){
            alert("비밀번호를 다시 입력하세요.")
            return false;
        }else if(!document.user.real_name.value){
            alert("이름을 입력하세요.")
            return false;
        }else if(!document.user.userphone.value){
            alert("번호를 입력하세요.")
            return false;
        }else if (!isCheckId){
            alert("아이디 중복확인을 하세요.")
            return false;
        }
    },
    autoHypenPhone : function (str) {
        str = str.replace(/[^0-9]/g, '');
        let tmp = '';
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
    },
}
let isCheckId = false;
const expId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
$('#userid').blur(function(){
    let id = $('#userid').val();

    $.ajax({
        url : '/member/idCheck?userid='+id,
        type : 'get',
        success : function (data){
            console.log(data);
            if (data == 1){
                $("#check").text("사용중인 아이디입니다.");
            }else if (data == 0){
                if (!expId.test(id)){
                    $("#check").text("이메일 형식이 아닙니다.");
                }else {
                    $("#check").text("사용가능한 아이디입니다.");
                    isCheckId = true;
                }
            }
        }
        ,error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
    })
});
const phoneNum = document.getElementById('userphone');

phoneNum.onkeyup = function(){
    this.value = signUpService.autoHypenPhone( this.value );
}