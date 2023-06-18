<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String err = request.getParameter("err");
	String job = request.getParameter("job");
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
<title>
	로그인 &#60; 회원서비스 | 영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<body onLoad="document.form.id.focus()">
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="로그인"/>
</jsp:include>
<div class="container" style="max-width: 600px;">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">로그인</h1>
      	</div>
   	</div>
   	<div class="row mb-3">
   		<div class="col-12">
   		
<%
	if ("fail".equals(err)) {
%>		
			<div class="alert alert-danger">
				<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 일치하지 않습니다.
			</div>
<%
	} else if ("disabled".equals(err)) {
%>		
		<div class="alert alert-danger">
			<strong>로그인 실패</strong> 탈퇴한 회원은 로그인할 수 없습니다.
		</div>
<%
	} else if ("admin".equals(err)) {
%>		
		<div class="alert alert-danger">
			<strong>로그인 실패</strong> 관리자 계정입니다. 관리자로 로그인 하세요.
		</div>
<%
	} else if ("member".equals(err)) {
%>		
		<div class="alert alert-danger">
			<strong>로그인 실패</strong> 회원 계정은 관리자로 로그인할 수 없습니다.
		</div>
<%
	} else if ("req".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>로그인 필요</strong> [<%=job %>]은/는 로그인 후 이용가능한 서비스입니다.
		</div>
<% 
	} else if ("회원목록조회".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>로그인 필요</strong> [<%=job %>]는 관리자만 이용가능합니다.
		</div>
<% 
	} else if ("탈퇴복구".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>로그인 필요</strong> [<%=job %>]는 관리자만 이용가능한 서비스입니다.
		</div>
<% 
	} else if ("결제내역".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>로그인 필요</strong> [<%=job %>]은 로그인 후 이용가능한 서비스입니다.
		</div>
<% 
	}
%>
   			<p>아이디, 비밀번호를 입력하고 로그인하세요</p>
   			<form class="border bg-light p-3" name="form" method="post" action="login.jsp">
   				<div class="form-group mb-2 w-75">
   					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" id="ck-type" name="type" value="MEMBER" checked="checked">
  						<label class="form-check-label" for="inlineRadio1">회원</label>
					</div>
   					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" id="ck-type" name="type" value="ADMIN" >
  						<label class="form-check-label" for="inlineRadio1">관리자</label>
					</div>
   				</div>
   				
   				<!-- 회원 넘버를 어떻게 추가해야할지 -->
   				
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">아이디</label>
   					<input type="text" class="form-control" id="id" name="id" />
   				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">비밀번호</label>
   					<input type="password" class="form-control" id="pwd" name="password" />
   				</div>
   				<div class="text-end mb-3 w-75">		
   					<button type="submit" class="btn btn-primary">로그인</button>
   				</div>
   			</form>
   		</div>
   	</div>
</div>
</body>
</html>