<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="ProfileInsertForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="min-width: 1300px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">프로젝트 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="main-content" id="panel">
                    <!-- Page content -->
                    <div class="container-fluid mt-10">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="table-responsive mt-4">
                                            <form action="/member/projectprofileinsert" method="post">
                                                <input type="hidden" name="userid" id="userid" value="${member.userid}">
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
                                                    <tbody class="list" >
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="media align-items-center">
                                                                <div class="media-body">
                                                                <span class="name mb-0 text-sm">
                                                                    <input class="form-control" type="text" name="name" id="name" placeholder="프로젝트명/회사명"></span>
                                                                </div>
                                                            </div>
                                                        </th>
                                                        <td class="skil"><input class="form-control" name="skill" id="skill" type="text" placeholder="기술/역할"></td>
                                                        <td>
                                                        <span class="badge badge-dot mr-4">
                                                            <span class="field">
                                                                <input class="form-control" type="text" name="field" id="field" placeholder="분야"></span>
                                                        </span>
                                                        </td>
                                                        <td>
                                                            <div>
											            	<span class="tesk">
                                                                <input type="text" name="responsibilities" id="responsibilities"
                                                                          placeholder="담당업무" class="form-control"></span>
                                                            </div>
                                                        </td>
                                                        <td>
											                <span>시작일 :<input type="date" name="startdate" id="startdate"
                                                                              class="form-control" required></span>
                                                            <span>종료일 :<input type="date" name="enddate" id="enddate"
                                                                              class="form-control" required></span>
                                                        </td>
                                                        <td class="text-right">
                                                            <div>
                                                                <button type="submit" class="btn btn-success" onsubmit="profileinsert()">등록</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </form>
                                        </div>

                                        <!-- Description -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- end list -->