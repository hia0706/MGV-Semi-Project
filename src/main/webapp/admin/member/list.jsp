<%@page import="java.net.URLEncoder"%>
<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../../member/login/form.jsp?err=admin&job="+URLEncoder.encode("회원관리", "utf-8"));
		return;
	}
	// 회원 목록
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

	MemberDao memberDao = MemberDao.getInstance();
	
	int totalRows = memberDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);

	List<Member> memberList = memberDao.getAdminMembers(pagination.getBegin(), pagination.getEnd());
	
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>회원 관리 &#60; 관리자</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="회원 관리"/>
</jsp:include>
<div class="container">
<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">전체 회원 리스트</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 회원 목록을 확인하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>탈퇴여부</th>
						<th>가입날짜</th>
						<th>수정날짜</th>
					</tr>
				</thead>
				<tbody>
<%
	for (Member member : memberList) {
%>
					<tr>						
						<td><a href="detail.jsp?id=<%=member.getId() %>" class="text-black text-decoration-none"><%=member.getId()%></a></td>
						<td><a href="detail.jsp?id=<%=member.getId() %>" class="text-black text-decoration-none"><%=member.getName()%></a></td>
						<td><%=member.getBirth()%></td>
						<td><%=member.getTel()%></td>
						<td><%=member.getEmail()%></td>
						<td>
<%
	if ("No".equals(member.getDisabled())) {
%>						
							<span class="badge text-bg-success" >사용중</span>
<%
	} else if ("Yes".equals(member.getDisabled())) {
%>
							<span class="badge text-bg-secondary">탈퇴</span>
<%
	}	
%>
						</td>	
						<td><%=member.getCreateDate()%></td>
						<td><%=member.getUpdateDate()%></td>
					</tr>
<%
}
%>
				</tbody>
			</table>
			
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo-1%>" class="page-link">이전</a>
					</li>
<%
for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
					<li class="page-item <%=pageNo == num ? "active" : ""%>" >
						<a href="list.jsp?page=<%=num%>" class="page-link"><%=num%></a>
					</li>
<%
}
%>
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo+1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
			
			<div class="text-end">
				<a href="../center/oneonone/list.jsp" class="btn btn-info btn-sm">문의내역</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>