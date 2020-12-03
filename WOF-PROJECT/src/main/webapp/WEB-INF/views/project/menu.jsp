<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="header pb-2 pt-5 md-8">
      <div class="container">
         <div class="header-body">
            <!-- Card stats -->
            <div class="row">
               <div class="col">
               <a class="btn btn-secondary bg-white"
                     href="${pageContext.request.contextPath}/project/recommend?member_no=${member.member_no}">추천 프로젝트</a>
                  <a class="btn btn-secondary bg-white"
                     href="${pageContext.request.contextPath}/project/followlist?member_no=${member.member_no}">관심 프로젝트</a> 
                     <a class="btn btn-secondary bg-white"
                     href="${pageContext.request.contextPath}/project/apply_project?member_no=${member.member_no}">지원한 프로젝트</a>
               </div>
            </div>
         </div>
      </div>
   </div>