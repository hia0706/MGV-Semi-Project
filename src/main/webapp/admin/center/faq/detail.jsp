<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Faq"%>
<%@page import="dao.FaqDao"%>
<%@page import="java.util.List"%>
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
<jsp:include page="../..//nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">자주 묻는 질문</h1>
      	</div>
   	</div>
	
		<hr>
			<a style="font-size : 17px;"><%=faq.getTitle() %><strong></strong></a><br>
			<a style="font-size : 12px;"><%=faq.getCreateDate() %></a>
		<hr>
			<a><%=faq.getContent() %></a>
		<hr>
		
		<div style="text-align: center; padding:30px;">
				<a href="modifyform.jsp?no=<%=faq.getNo() %>" class="btn btn-secondary btn-sm">수정</a>
				<a href="list.jsp" class="btn btn-secondary btn-sm">목록</a>
				<a href="delete.jsp?no=<%=faq.getNo() %>" class="btn btn-secondary btn-sm">삭제</a>
				

			
		</div>
</div>
</body>
</html>










