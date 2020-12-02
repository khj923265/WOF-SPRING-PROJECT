<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="modal fade" id="calendarEditBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">일정 변경하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/member/meetingupdate" method="post">
            <div class="modal-body">
                <div class="form-group">
                    <label for="example-text-input" class="form-control-label">일정내용</label>
                    <input class="form-control" type="text" value="${meet.meet_contents}" name="meet_contents" id="meet_contents">
                </div>
                <div class="form-group">
                    <label for="example-date-input" class="form-control-label">날짜</label>
                    <input class="form-control" type="date" value="${meet.meet_datetime}" name="meet_datetime" id="meet_datetime">
                </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" value="${member.member_no}" name="meet_req_mem">
                <button type="submit"  class="btn btn-primary" id="meetingUpdateBtn">수정하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
            </form>
        </div>
    </div>
</div>