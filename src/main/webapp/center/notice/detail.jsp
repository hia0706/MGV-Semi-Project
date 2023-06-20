<%@page import="vo.Notice"%>
<%@page import="dao.NoticeDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	int no = Integer.parseInt(request.getParameter("no"));

	NoticeDao noticeDao = NoticeDao.getInstance();
	Notice notice = noticeDao.getNoticeByNo(no);
	
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>공지사항 &#60; MGV 고객센터</title>
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
  <a href="../faq/list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="list.jsp" class="list-group-item list-group-item-action">공지사항</a>
    <a class="list-group-item list-group-item-action disabled" style="color:gray; font-size:15px;">
  		MGV 고객센터 <br> 
  		Dream center <br><br>
  		TEL 0607-0620<br> 
  		<img src="../../images/center/clock.png" width="13" height="13"> 10:00~19:00
  </a>
					</div>
				</div>
    	</div>
    	<div class="col-9">
        	<h1 class="fs-2 p-2">공지사항</h1>
	
		<hr>
			<a style="font-size : 19px;">[지점] [<%=notice.getTheater().getName() %>] <%=notice.getTitle() %></a><br>
			<a style="font-size : 12px;">영화관 <%=notice.getTheater().getName() %> | </a>
			<a style="font-size : 12px;">등록일 <%=notice.getCreateDate() %></a>
		<hr>
			<a>
				<br>
				안녕하세요<br>
				MGV <%=notice.getTheater().getName() %>지점입니다.<br><br>
				<%=notice.getContent() %><br><br>
				감사합니다.<br><br>
			</a>
		<hr>
		
		<div style="text-align: center; padding:30px;">
				<a href="list.jsp" class="btn btn-secondary btn-sm">목록</a>
		</div>
		</div>
      </div>
</div>
</body>
</html>










