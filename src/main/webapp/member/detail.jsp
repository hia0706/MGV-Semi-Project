<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
<title>
	내 정보 &#60; 회원서비스 | 영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="MEMBER"/>
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
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="table-dark " style="width: 10%;">아이디</th>
						<td style="width: 40%;"><%=member.getId() %></td>
						<th class="table-dark" style="width: 10%;">이름</th>
						<td style="width: 40%;"><%=member.getName() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 10%;">성별</th>
						<td style="width: 40%;"><%=member.getGender() %></td>
						<th class="table-dark" style="width: 10%;">생년월일</th>
						<td style="width: 40%;"><%=member.getBirth() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 10%;">연락처</th>
						<td style="width: 40%;"><%=member.getTel() %></td>
						<th class="table-dark" style="width: 10%;">이메일</th>
						<td style="width: 40%;"><%=member.getEmail() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width:10%;">주소</th>
						<td style="width: 90%;" colspan="3"><%=member.getZipcode() +", " + member.getAddress1() + ", " + member.getAddress2() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 10%;">가입일자</th>
						<td style="width: 90%;" colspan="3"><%=member.getCreateDate() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 10%;">추천인</th>
						<td style="width: 40%;"><%=member.getReferee() == null ? "" : member.getReferee() %></td>
						<th class="table-dark" style="width: 10%;">탈퇴여부</th>
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
			<a href="orderlist.jsp?id=<%=member.getId() %>" class="btn btn-outline-primary">구매내역</a>
			<a href="modifyform.jsp?id=<%=member.getId() %>" class="btn btn-outline-warning">수정하기</a>
			<a href="disable.jsp" class="btn btn-outline-danger">탈퇴하기</a>
		</div>
	</div>
	
</div>
</body>
</html>