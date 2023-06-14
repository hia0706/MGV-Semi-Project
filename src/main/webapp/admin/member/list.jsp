<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@page import="dao.AdminMemberDao"%>
<%@page import="java.util.List"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 회원 목록
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

	AdminMemberDao adDao = AdminMemberDao.getInstance();
	
	int totalRows = adDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);

	List<Member> memberList = adDao.getMembers(pagination.getBegin(), pagination.getEnd());
	
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
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
	<jsp:param name="menu" value="상품"/>
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
						<th>회원 번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>연락처</th>
						<th>가입날짜</th>
						<th>수정날짜</th>
						<th>탈퇴여부</th>
					</tr>
				</thead>
				<tbody>
<%
	for (Member member : memberList) {
%>
					<tr>						
<%-- 						<td><%=member.getNo()%></td>
						<td><%=member.getId()%></td>
						<td><%=member.getName()%></td>
						<td><%=member.getBirth()%></td>
						<td><%=member.getTel()%></td>
						<td><%=member.getCreateDate()%></td>
						<td><%=member.getUpdateDate()%></td>
						<td><%="No".equals(member.getDisabled) ? "사용중" : "탈퇴" %></td> --%>
						<td>1</td>
						<td>hong</td>
						<td>홍길동</td>
						<td>1993-02-23</td>
						<td>010-1234-1234</td>
						<td>2023-06-14</td>
						<td>2023-06-14</td>
						<td>사용중</td>
					</tr>
					<tr>						
						<td>2</td>
						<td>hong</td>
						<td>홍길동</td>
						<td>1993-02-23</td>
						<td>010-1234-1234</td>
						<td>2023-06-14</td>
						<td>2023-06-14</td>
						<td>사용중</td>
					</tr>
					<tr>						
						<td>3</td>
						<td>hong</td>
						<td>홍길동</td>
						<td>1993-02-23</td>
						<td>010-1234-1234</td>
						<td>2023-06-14</td>
						<td>2023-06-14</td>
						<td>사용중</td>
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
				<a href="#" class="btn btn-primary btn-sm">???</a>
				<a href="#" class="btn btn-primary btn-sm">문의내역</a>
				<a href="#" class="btn btn-primary btn-sm">???</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>