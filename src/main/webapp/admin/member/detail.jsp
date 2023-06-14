<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String err = request.getParameter("err");
	String id = request.getParameter("id");	

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getDetailMemberById(id);
	
	
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>회원관리 &#60; 관리자</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../admin/nav.jsp">
	<jsp:param name="menu" value="ADMIN"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">회원 상세 정보</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>회원 상세정보를 확인하세요</p>
			<table class="table table-bordered ">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th class="table-dark">아이디</th>
						<td colspan="3"><%=member.getId() %></td>
					</tr>	
					<tr>
						<th class="table-dark ">이름</th>
						<td ><%=member.getName() %></td>
						<th class="table-dark" >성별</th>
						<td ><%=member.getGender() %></td>
					</tr>
					<tr>
						<th class="table-dark " >비밀번호</th>
						<td ><%=member.getPassword() %></td>
						<th class="table-dark" >생년월일</th>
						<td ><%=member.getBirth() %></td>
					</tr>
					<tr>
						<th class="table-dark" >연락처</th>
						<td ><%=member.getTel() %></td>
						<th class="table-dark" >이메일</th>
						<td ><%=member.getEmail() %></td>
					</tr>
					<tr>
						<th class="table-dark" >주소</th>
						<td colspan="3"><%=member.getAddress1() + ", " + member.getAddress2() %></td>
					</tr>
					<tr>
						<th class="table-dark" >가입일자</th>
						<td><%=member.getCreateDate() %></td>
						<th class="table-dark" >수정일자</th>
						<td><%=member.getUpdateDate() %></td>
					</tr>
					<tr>
						<th class="table-dark">추천인</th>
						<td><%=member.getReferee() == null ? "" : member.getReferee() %></td>
						<th class="table-dark">탈퇴여부</th>
						<td>
<%
	if ("No".equals(member.getDisabled())) {
%>						
							<span class="badge text-bg-success" style="width: 20%;">사용중</span>
<%
	} else if ("Yes".equals(member.getDisabled())) {
%>
							<span class="badge text-bg-secondary" style="width: 20%">탈퇴</span>
<%
	}	
%>
						</td>					
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 text-end">
			<a href="list.jsp" class="btn btn-outline-secondary">목록</a>
			<a href="../center/oneonone/list.jsp?id=<%=member.getId() %>" class="btn btn-outline-info">문의내역</a>
<%
	if ("No".equals(member.getDisabled())) {
%>
			<a href="enable.jsp?id=<%=member.getId() %>" class="btn btn-outline-primary">복구</a>
<%
	}
%>	
		</div>
	</div>
	
</div>
</body>
</html>