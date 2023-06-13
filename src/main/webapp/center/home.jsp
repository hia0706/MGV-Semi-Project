<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
    
<title>
	MGV 고객센터
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container">
	<div class="bg-light p-3">
		<a href="lostitem/list.jsp">분실물 문의</a>
		<a href="oneonone/insertform.jsp">1:1 문의</a>
		<a href="faq/list.jsp">자주 묻는 질문</a>
		<a href="notice/list.jsp">공지사항</a>
		

	</div>
</div>
</body>
</html>