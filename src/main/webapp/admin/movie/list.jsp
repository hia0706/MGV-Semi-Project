<%@page import="vo.Movie"%>
<%@page import="dao.ManagerMovieDao"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다
	
	ManagerMovieDao managerMovieDao = ManagerMovieDao.getInstance();

	List<Movie> movieList = managerMovieDao.getMovies();
	
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
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../../admin/nav.jsp">
   <jsp:param value="manu" name="영화"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">상영중인 영화 목록</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>상영중인 영화를 확인하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">영화순위</th>
						<th style="width: 45%;">제목</th>
						<th style="width: 10%;">개봉일</th>
					</tr>
				</thead>
				<tbody>
			
<% for (Movie movie : movieList) { %>			
				
					<tr class="align-middle">
						<td><%=movie.getRank() %></td>
						<td><a href="detail.jsp?no=<%=movie.getNo() %>" class="text-black text-decoration-none"><%=movie.getTitle() %></td>
						<td><%=movie.getReleaseDate() %></td>
					</tr>
					
<% } %>			

			
				</tbody>
			</table>
			
			<div class="text-end">
					<a href="insertform.jsp" class="btn btn-primary btn-sm">새 영화 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
