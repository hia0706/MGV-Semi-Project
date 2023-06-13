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
		response.sendRedirect("../../member/loginform.jsp?err=fail");
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


<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">분실물 문의</h1>
      	</div>
   	</div>
	<div class="clearfix">
		<ul class="dot-list">
			<li>
				MGV에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요.
			</li>
			<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
		</ul>
			
				<div class="border bg-light p-3">
				<form id="lostitem" class="row g-3" method="post" action="insert.jsp" >
	 				
	 				<div class="col-md-12">
						<label class="form-label">이름</label>
						<input type="text" class="form-control" name="name"/>
					</div>
					<div class="col-md-6">
						<label class="form-label">연락처</label>
						<input type="text" class="form-control" name="tel"/>
					</div>
					<div class="col-md-6">
						<label class="form-label">이메일</label>
						<input type="text" class="form-control" name="email"/>
					</div>
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
				<button type="button" class="btn btn-secondary btn-sm" onclick="formsubmit()">등록</button>
			</div>
	</div>
</div>
<script type="text/javascript">
	function formsubmit() {
		
		let insertform = document.getElementById("lostitem");
		insertform.submit();
	}	
</script>
</body>
</html>








