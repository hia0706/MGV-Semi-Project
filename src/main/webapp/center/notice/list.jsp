<%@page import="vo.Notice"%>
<%@page import="dao.NoticeDao"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	NoticeDao noticeDao = NoticeDao.getInstance();
	int totalRows = noticeDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	List<Notice> noticeList = noticeDao.getNotice(pagination.getBegin(), pagination.getEnd());

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
					</div>
				</div>
    	</div>
    	<div class="col-9">
        	<h1 class="fs-2 p-2">공지사항</h1>
      		<div>
	
			
			<table class="table">
				<thead>
					<tr class="table-light" > 
						<th style="width: 5%;">번호</th>
						<th style="width: 10%;">극장</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 10%;">등록일</th>
					</tr>
				</thead>
				<tbody>
	
<% for (Notice notice : noticeList) { %>				
				
					<tr>
						<td><%=notice.getNo() %></td>
						<td>MGV</td>
						<td style="text-align:left">
							<a href="detail.jsp?no=<%=notice.getNo() %>" class="text-black text-decoration-none">
								<%=notice.getTitle() %>
							</a>
						</td>
						<td><%=notice.getCreateDate() %></td>
					</tr>

<% } %>				
					
				</tbody>
			</table>
			
			
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
					
	<% for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) { %>					
					
					<li class="page-item <%=pageNo == num ? "active" : "" %>">
						<a href="list.jsp?page=<%=num  %>" class="page-link"><%=num %></a>
					</li>
					
	<% } %>					
					
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
			</div>
		</div>	
	</div>
</div>
</body>
</html>
