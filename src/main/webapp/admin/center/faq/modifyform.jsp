<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);

	
	if (member == null) {
		response.sendRedirect("../../../member/loginform.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}

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
	.btn.btn-sm {--bs-btn-padding-y: .40rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .95rem; width: 100px;}
	
	
</style>
</head>
<body>


<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">자주 묻는 질문</h1>
      	</div>
   	</div>
	<div class="clearfix">
		<ul class="dot-list">
			<li>
				자주 묻는 질문을 수정해주세요.
			</li>
		</ul>
			
				<div class="border bg-light p-3">
				<form id="modify" class="row g-3" method="post" action="modify.jsp" >
	 				
	 				
	 				<div class="col-md-12">
						<label class="form-label">제목</label>
						<input type="text" class="form-control" name="title"/>
					</div>
	  				<div class="col-md-12">
						<label class="form-label">내용</label>
						<textarea rows="10" class="form-control" name="content"></textarea>
					</div>
					
					
				</form>
			</div>
			<div style="text-align: center; padding:30px;">
				<button type="button" class="btn btn-secondary btn-sm" onclick="formsubmit()">수정</button>
			</div>
	</div>
</div>
<script type="text/javascript">
	function formsubmit() {
		
		let insertform = document.getElementById("modify");
		insertform.submit();
	}	
</script>
</body>
</html>



