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

//캘린더
document.addEventListener('DOMContentLoaded', function () {

    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        selectable: true,
        headerToolbar: {
            left: 'prev',
            center: 'title',
            right: 'next'
        },
        select: function (info) {
            var meet_contents = prompt('일정을 입력하세요!');
            var vo = {
                'meet_contents': meet_contents,
                'meet_datetime': info.startStr,
                'meet_type': 0,
                'meet_req_mem': $('#meet_req_mem').val()
            };
            calendar.addEvent({
                title: meet_contents,
                start: info.startStr,
                allDay: true
            }); // add event
            $.ajax({
                data: JSON.stringify(vo),
                contentType: 'application/json',
                dataType: 'json',
                url: '/schedule/' + vo.meet_req_mem,
                type: 'post',
                success: function () {
                    alert("seuccess enter your schedule!");
                    location.href="/member/partners/profile_info";
                },
                error: function () {
                    alert('error');
                }
            });

        }
    });
    calendar.render();

});