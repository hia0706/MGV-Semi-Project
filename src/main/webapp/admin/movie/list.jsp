<%@page import="dto.Pagination"%>
<%@page import="vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="util.StringUtils"%>
<%@page import="dao.ManagerMovieDao"%>
<%@page import="service.SampleService"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%
	int pageNo = StringUtils.stringToInt(request.getParameter("page"),1);
	
	// 전체 데이터 개수 조회
	ManagerMovieDao managerMovieDao = ManagerMovieDao.getInstance();
	
	
	int totalRows =managerMovieDao.getTotalRows();
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	// 데이터 조회
	List<Movie> movies= managerMovieDao.getMovies(pagination.getBegin(), pagination.getEnd());
	
	%>

<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>영화 관리 &#60; 관리자</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
   <jsp:param value="menu" name="영화"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">전체 영화 목록</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 영화를 확인하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">영화순위</th>
						<th style="width: 45%;">제목</th>
						<th style="width: 10%;">개봉일</th>
						<th style="width: 10%;">극장 스케쥴 관리</th>
					</tr>
				</thead>
				<tbody>
			
<%for (Movie movie : movies) {%>
				
					<tr class="align-middle">
						<td><%=movie.getRank() %></td>
						<td><a href="detail.jsp?no=<%=movie.getNo() %>" class="text-black text-decoration-none"><%=movie.getTitle() %></a></td>
						<td><%=movie.getStringFormattedDate()%></td>
						<td><a href="schedule.jsp?no=<%=movie.getNo()%>&title=<%=movie.getTitle() %>" class="btn">관리</a></td>
					</tr>
					
<%} %>

			
				</tbody>
			</table>
			
			<div class="text-end">
					<a href="dbdownload.jsp" class="btn btn-success btn-sm">영화 db 다운로드</a>
					<a href="dbupload.jsp" class="btn btn-light btn-sm">영화 db 업로드</a>
					<a href="updatechart.jsp" class="btn btn-primary btn-sm">영화차트 업데이트</a>
			</div>
		</div>
	</div>
	

							<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
<%
	for(int num = pagination.getBeginPage() ; num <= pagination.getEndPage(); num++) {
%>	
					
					<li class = "page-item <%=pageNo == num ? "active" : "" %>">
						<a href="list.jsp?page=<%=num %>" class="page-link"><%=num %></a>
					</li>
<%
	}
%>
					
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
	
</div>
</body>
</html>
