<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!-- start list -->
<div class="table-responsive mt-4">
    <table class="table align-items-center">
        <thead class="thead-light">
        <tr>
            <th scope="col" class="sort" data-sort="name">프로젝트/회사명</th>
            <th scope="col" class="sort" data-sort="skil">기술/역할</th>
            <th scope="col" class="sort" data-sort="field">분야</th>
            <th scope="col" class="sort" data-sort="tesk">담당업무</th>
            <th scope="col" class="sort" data-sort="completion">날짜</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody class="list" id="list">

        <c:forEach items="${profilelist}" var="profile">
            <tr>
                <th scope="row">
                    <div class="media align-items-center">
                        <div class="media-body">
                            <span class="name mb-0 text-sm">${profile.name}</span>
                        </div>
                    </div>
                </th>
                <td class="skil">${profile.skill}</td>
                <td><span class="badge badge-dot mr-4"> <i
                        class="bg-warning"></i> <span class="field">${profile.field}</span>
											</span></td>
                <td>
                    <div>
                        <span class="tesk">${profile.responsibilities}</span>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <span>${profile.startdate}</span>
                           -
                        <span>${profile.enddate}</span>
                    </div>
                </td>
                <td class="text-right">
                    <div>
                        <a class="btn btn-success"
                           href="javascript:void(0)" onclick="profileManagement.openForm(${profile.no})">수정하기</a>
                        <a class="btn btn-danger"
                           href="javascript:void(0)" onclick="profileManagement.projectProfileDelete(${profile.no})">삭제하기</a>
                        <button hidden="hidden" type="button" class="btn btn-success" id="targetProfileUpdateForm" data-toggle="modal" data-target="#ProfileUpdateForm">수정하기</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>