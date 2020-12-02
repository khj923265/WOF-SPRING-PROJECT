<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="table-responsive mt-4">
    <table class="table align-items-center">
        <thead class="thead-light">
        <tr>
            <th scope="col" class="sort" data-sort="name">프로젝트/회사명</th>
            <th scope="col" class="sort" data-sort="skil">일정 카테고리</th>
            <th scope="col" class="sort" data-sort="tesk">일정내용</th>
            <th scope="col" class="sort" data-sort="completion">날짜</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody class="list">
        <c:forEach var="meet" items="${meets}">
            <tr class="contents">
                <th scope="row">
                    <div class="media align-items-center">
                        <div class="media-body">
                            <span class="name mb-0 text-sm" id="type">${meet.meet_type}</span>
                        </div>
                    </div>
                </th>

                <td><span class="badge badge-dot mr-4"> <i
                        class="bg-warning"></i> <span class="field">웹솔루션</span>
											</span></td>
                <td>
                    <div>
                        <span class="tesk" id="contetns">${meet.meet_contents}</span>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <span id="datetime">${meet.meet_datetime}</span>
                    </div>
                </td>
                <td class="text-right">
                    <div>
                        <a class="btn btn-success"
                           href="javascript:void(0)" onclick="meetingService.openForm('${meet.meet_id}')">수정하기</a>
                        <button type="button" hidden="hidden" id="updateMeetingBtn" class="btn btn-success" data-toggle="modal" data-target="#calendarEditBtn">수정하기</button>
                        <button onclick="deleteClick();" class="btn btn-danger" id="deleteMeetingBtn" value="${meet.meet_id}">삭제하기</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>