<%@page import="vo.Lostitem"%>
<%@page import="dao.LostitemDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	int no = Integer.parseInt(request.getParameter("no"));
	
	LostitemDao lostitemDao = LostitemDao.getInstance();
	Lostitem lostitem = lostitemDao.getLostitemByNo(no);

	
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">나의 문의내역</h1>
      	</div>
   	</div>
	<div class="clearfix">
		<ul class="dot-list">
			<li>고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.</li>
		</ul>
	</div>
		<hr>
			<a style="font-size : 17px;"><strong><%=lostitem.getTitle() %></strong></a><br>
			<a style="font-size : 12px;"><%=lostitem.getCreateDate() %></a>
		<hr>
			<a><%=lostitem.getContent() %></a>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		<hr>
			<a>직원의 댓</a>
		<hr>
		
		<div style="text-align: center; padding:30px;">
				<a href="list.jsp" class="btn btn-secondary btn-sm">목록</a>
				<a href="delete.jsp" class="btn btn-secondary btn-sm">삭제</a>
		</div>
	
			

      
</div>
</body>
</html>










