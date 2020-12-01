var profileManagement = {
    openForm: function (userId){
        $.ajax({
            url: '/member/projectprofileinfo?userid='+userId,
            type: 'GET',
            dataType: "json",
            success: function(data) {
                //data draw
                profileManagement.draw(data);
                $('#targetProfileUpdateForm').click();
            },
            error: function() {
                alert('error!');
            }
        });
    },
    profileupdate: function(){
        var partnersVO = {
            "member_no": "${member.member_no}",
            "profile": $('#profile').val()
        };
        console.log(partnersVO);
        $.ajax({
            url: '/member/profileupdate',
            type: 'POST',
            datatype: 'json',
            data: JSON.stringify(partnersVO),
            contentType : 'application/json',
            success: function() {
                alert('수정되었습니다.');
            },
            error: function() {
                alert('error!');
            }

        });

    },
    draw: function (data){
        $('#nameform').val(data.name);
        $('#skillform').val(data.skill);
        $('#fieldform').val(data.field);
        $('#responsibilitiesform').val(data.responsibilities);
        $('#startdateform').val(data.startdate);
        $('#enddateform').val(data.enddate);

    },
    projectProfileDelete: function(no) {
    if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        location.href="/member/projectprofiledelete?no="+no;
    }else{   //취소
        return false;
    }
}

}