<%@page import="dao.ManagerMovieDao"%>
<%@page import="service.SampleService"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
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
<jsp:include page="../common/nav.jsp" />

<c:set var="managerMovieDao" value="<%= ManagerMovieDao.getInstance() %>" />
<c:set var="movies" value="${managerMovieDao.getMovieChart()}" />

<div class="container">
	<h1 style="padding: 5px 0px 15px;
    		   margin-bottom: 32px;
               border-bottom: 3px solid;">
    	무비 차트
  	</h1>
	<div style="display: flex;flex-wrap: wrap;">
		<c:forEach var="movie" items="${movies}">
			<div style='display: inline-block;margin-right:100px;'>
				<p style="background:#fb4357; color: white; font-weight:bold; text-align: center">순위: ${movie.rank}</p>
				<p><img src="${movie.getMainPoster()}" style='height:260px;'></p>
				<p>
					<strong>
		                <c:choose>
		                    <c:when test="${fn:length(movie.title) > 10}">
		                        ${fn:substring(movie.title, 0, 10)}...
		                    </c:when>
		                    <c:otherwise>
		                        ${movie.title}
		                    </c:otherwise>
		                </c:choose>
					</strong>
				</p>
				<p>개봉일: ${movie.getStringFormattedDate()}</p>
				<p>누적 관객수: <fmt:formatNumber value="${movie.audiCnt}"/></p>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>