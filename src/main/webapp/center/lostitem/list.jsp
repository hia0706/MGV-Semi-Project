<%@page import="vo.Lostitem"%>
<%@page import="dao.LostitemDao"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
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
				<a href="insertform.jsp" class="btn btn-outline-dark btn-xs" style="float:right;">분실물 문의</a>
			</li>
			<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
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