<%@include file="../includes/header.jsp"%>
<h1>client</h1>

<p>principal : <sec:authentication property="principal"/></p>
<p>MemberVO : <sec:authentication property="principal.member"/></p>
<p>사용자 이름 : <sec:authentication property="principal.member.real_name"/></p>
<p>사용자 아이디 : <sec:authentication property="principal.member.userid"/></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>
${client.member_no}
<a href="/customlogout">Logout</a>

<%@include file="../includes/footer.jsp"%>
