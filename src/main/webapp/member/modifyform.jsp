<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="javax.swing.RepaintManager"%>
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
<title> 
	회원 정보 수정 &#60; 회원서비스 | 영화 그 이상의 감동. MGV
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

<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">회원 정보 수정</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>회원 정보를 확인하고, 수정하세요.</p>
			
			<form class="border bg-light p-3" method="post" action="modify.jsp"> 
				<input type="hidden" name="id" value="<%=member.getId() %>"> 
				<div class="form-group mb-2">
				</div>

				<div class="form-group mb-2">
					<label class="form-label">이름</label>
					<input type="text" class="form-control" name="name" value="<%=member.getName() %>"/>
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password" value="<%=member.getPassword() %>"/>
				</div>
				<div class="form-group mb-2">
				 <label class="form-label"></label><br />
				 	<input type="text" maxlength="5" id="zipcode" name="zipcode" style="width:100px" placeholder="우편번호" readonly="readonly" /> 
					<a id="btn" class="btn text-black btn-outline-primary btn-sm ">우편번호검색</a>
					<br /> 
				 <label class="form-label"></label><br />
					<input type="text" class="form-control" name="address1" style="width:400px" placeholder="주소" readonly="readonly" />
					<input type="text" class="form-control" name="address2" style="width:300px" placeholder="상세주소" />
				</div>
				<div class="form-group mb-2">
					<label class="form-label"></label>
					<input type="text" class="form-control" name="discountPrice" value="<%= %>"/>
				</div>
				
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
<%
	if (member.getId().equals(loginId)) {
%>					
					<button type="submit" class="btn btn-primary btn-sm">수정</button>
<%
	}
%>

				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>