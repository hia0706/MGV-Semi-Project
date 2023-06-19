<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	MemberDao memberDao	= MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	
	String err = request.getParameter("err");
	String job = request.getParameter("job");

%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>
	로그인 &#60; 회원서비스 | 영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body onLoad="document.form.password.focus()">
<div class="container" style="max-width: 600px;">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">인증하기</h1>
      	</div>
   	</div>
<%
	 if ("fail".equals(err)) {
%>		
		<div class="alert alert-danger">
			<strong>이용제한</strong> 비밀번호가 일치하지 않습니다.
		</div>
<%
	} else if ("disabled".equals(err)) {
%>		
		<div class="alert alert-danger">
			<strong>이용제한</strong> 탈퇴한 회원은 이용할 수 없습니다.
		</div>
<%
	} else if ("정보수정".equals(err)) {
%>		
		<div class="alert alert-danger">
			<strong>이용제한</strong> [<%=job %>] 서비스는 로그인 후 사용가능한 서비스 입니다. 
		</div>
<%
	} 
%> 
   	<div class="row mb-3">
   		<div class="col-12">
   			<p>비밀번호를 입력하고 <strong style="font-size: 20px;"><%=member.getName() %></strong>님의 정보를 변경하세요</p>
   			<form class="border bg-light p-3" name="form" method="post" action="pwdCheck.jsp" >
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">아이디</label>
   					<input type="text" class="form-control" id="id" name="id" value="<%=member.getId() %>" disabled/>
   				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">비밀번호</label>
   					<input type="password" class="form-control" id="pwd" name="password" />
   				</div>
   				<div class="text-end mb-3 w-75">		
   					<button type="submit" class="btn btn-warning">수정하기</button>
   				</div>
   			</form>
   		</div>
   	</div>
</div>
</body>
</html>