<%@page import="vo.Theater"%>
<%@page import="java.util.List"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.ManagerTheaterDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<%
	//요청 URL - http://localhost/mgv/board/list.jsp
	// 요청 URL - http://localhost/app3/board/list.jsp?page=3
	int pageNo = StringUtils.stringToInt(request.getParameter("page"),1);
		
	// 전체 데이터 개수 조회
	ManagerTheaterDao managerTheaterDao = new ManagerTheaterDao();
	String disable = "Y";
	int totalRows = managerTheaterDao.getTotalRows(disable);
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	// 데이터 조회
	List<Theater> theaterList = managerTheaterDao.getAllTheaters(pagination.getBegin(), pagination.getEnd());
	
%>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../manager-nav.jsp">
	<jsp:param value="manu" name="극장"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">삭제된 극장 목록</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>극장 목록을 확인하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">번호</th>
						<th style="width: 15%;">지역</th>
						<th style="width: 20%;">극장명</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
<%
	for(Theater theater : theaterList) {
		if("Y".equals(theater.getDisable())) {
%>
					<tr class="align-middle">
						<td><a href="detail.jsp?no=<%=theater.getNo() %>" class="text-black text-decoration-none"><%=theater.getNo() %></a></td>
						<td><a href="detail.jsp?no=<%=theater.getNo() %>" class="text-black text-decoration-none"><%=theater.getLocation().getName() %></a></td>
						<td><%=theater.getName() %></td>
						<td><a href="detail.jsp?no=<%=theater.getNo() %>" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
<%
		}
	}
%>					
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-end">
    	<a href="form.jsp" class="btn btn-primary btn-sm">새 극장 등록</a>
    	<a href="list.jsp" class="btn btn-primary btn-sm">등록된 극장</a>
    </div>
	
	<div class="row mb-3">
		<div class="col-12">
						<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="deletelist.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
<%
	for(int num = pagination.getBeginPage() ; num <= pagination.getEndPage(); num++) {
%>	
					
					<li class = "page-item <%=pageNo == num ? "active" : "" %>">
						<a href="deletelist.jsp?page=<%=num %>" class="page-link"><%=num %></a>
					</li>
<%
	}
%>
					
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="deletelist.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>