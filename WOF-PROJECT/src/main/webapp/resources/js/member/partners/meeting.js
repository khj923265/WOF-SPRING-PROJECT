var meetingService = {
    openForm: function (meet_id) {
        $.ajax({
            url: '/member/meetingupdate?meet_id=' + meet_id,
            type: 'GET',
            dataType: "json",
            success: function (data) {
                //data draw
                meetingService.draw(data);
                $('#updateMeetingBtn').click();
            },
            error: function () {
                alert('error!');
            }
        });
    },
    draw: function (data) {
        $('#meet_contents').val(data.meet_contents);
        $('#meet_datetime').val(data.meet_datetime);
    }
}