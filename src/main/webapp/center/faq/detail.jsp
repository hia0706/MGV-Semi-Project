<%@page import="vo.Faq"%>
<%@page import="dao.FaqDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	int no = Integer.parseInt(request.getParameter("no"));

	FaqDao faqDao = FaqDao.getInstance();
	Faq faq = faqDao.getFaqByNo(no);
	
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

<div class="container mt-3">
	<div class="row">
		<div class="col-3">
    				<div class="card">
       	  		<div class="card-header text-center" >고객센터</div>
            		<div class="list-group">
  <a href="../home.jsp" class="list-group-item list-group-item-action">고객센터 홈</a>
  <a href="../lostitem/list.jsp" class="list-group-item list-group-item-action">분실물 문의</a>
  <a href="../oneonone/insertform.jsp" class="list-group-item list-group-item-action">1:1 문의</a>
  <a href="list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="../notice/list.jsp" class="list-group-item list-group-item-action">공지사항</a>
					</div>
				</div>
    	</div>
    	<div class="col-9">
        	<h1 class="fs-2 p-2">자주 묻는 질문</h1>
	
		<hr>
			<a style="font-size : 17px;"><%=faq.getTitle() %><strong></strong></a><br>
			<a style="font-size : 12px;"><%=faq.getCreateDate() %></a>
		<hr>
			<a><%=faq.getContent() %></a>
		<hr>
		
		<div style="text-align: center; padding:30px;">
				<a href="list.jsp" class="btn btn-secondary btn-sm">목록</a>
		</div>
		</div>
	</div>
</div>
</body>
</html>










