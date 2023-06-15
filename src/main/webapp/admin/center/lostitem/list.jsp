<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Lostitem"%>
<%@page import="dao.LostitemDao"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	// 세션에서 로그인된 사용자 아이디 조회
	String id = (String) session.getAttribute("loginId");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../../member/loginform.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}
	
	LostitemDao lostitemDao = LostitemDao.getInstance();
	List<Lostitem> lostitemList = lostitemDao.getLostitems();

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
	.btn.btn-xs {--bs-btn-padding-y: .40rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .95rem;}
	
	table {
	   text-align: center;
	}
	
</style>
</head>
<body>


<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>


<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">전체 분실물 문의 내역</h1>
      	</div>
   	</div>
	<div class="clearfix">
		<ul class="dot-list">
			<li>고객들이 접수한 분실물 문의내역을 확인하세요.</li>
		</ul>
			
			<table class="table">
				<thead>
					<tr class="table-light" > 
						<th style="width: 5%;">번호</th>
						<th style="width: 10%;">극장</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 10%;">접수상태</th>
						<th style="width: 10%;">등록일</th>
					</tr>
				</thead>
				<tbody>
				
<% for (Lostitem lostitem : lostitemList) { %>				
				
					<tr>
						<td><%=lostitem.getNo() %></td>
						<td>MGV</td>
						<td style="text-align:left">
							<a href="detail.jsp?no=<%=lostitem.getNo() %>" class="text-black text-decoration-none">
								<%=lostitem.getTitle() %>
							</a>
						</td>
						
<% if ("N".equals(lostitem.getAnswered())) { %>
						<td>미답변</td>
<% } else {%>
						<td>답변완료</td>
<% } %>

						<td><%=lostitem.getCreateDate() %></td>
					</tr>

<% } %>				
					
				</tbody>
			</table>
	</div>
</div>
</body>
</html>