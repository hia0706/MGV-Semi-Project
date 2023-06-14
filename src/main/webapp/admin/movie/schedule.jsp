<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@page import="dao.ManagerMovieDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">


<%
//세션에서 로그인타입 속성획득
	String loginType = (String) session.getAttribute("loginType");

//로그인타입 관리자아니면 로그인으로 리다이렉트시킴
	if (!"ADMIN".equals(loginType)){
		response.sendRedirect("../member/login.jsp");
		return;
	}
	

%>

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
   <jsp:param value="menu" name="영화"/>
</jsp:include>
<c:set var="no" value="${param.no}" />
<c:set var="managerMovieDao" value="${ManagerMovieDao.getInstance()}" />
<c:set var="movie" value="${managerMovieDao.getMovieByNo(no)}" />
<c:set var="theaterDao" value="${TheaterDao.getInstance()}" />
<c:set var="theaters" value="${theaterDao.getAllTheaters()}" />



<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">${movie.title} 상영할 극장 목록</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 극장을 확인하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">극장명</th>
						<th style="width: 45%;">지역</th>
						<th style="width: 10%;">날짜선택</th>
						<th style="width: 10%;">스케쥴 등록/해제</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="theaters" items="${theater}">
				
					<tr class="align-middle">
						<td><a href="" class="text-black text-decoration-none">${theater.name}</a></td>
						<td>${theater.location}</td>
						<td>${movie.getStringFormattedDate()}</td>
						<td><a href="schedule.jsp?no=${movie.no}" class="btn">등록</a></td>
					</tr>
					
</c:forEach>	

			
				</tbody>
			</table>
			
		</div>
	</div>
</div>
</body>
</html>
