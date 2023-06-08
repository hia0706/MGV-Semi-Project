<%@page import="util.DateUtils"%>
<%@page import="dao.ManagerMovieDao"%>
<%@page import="java.util.Date"%>
<%@page import="vo.Movie"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 세션에서 로그인된 사용자 정보를 조회
	
	// 세션에 속성으로 저장된 로그인한 타입 조회하기
	
	// 요청 파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	int rank = Integer.parseInt(request.getParameter("rank"));
	String title = request.getParameter("title");
	String genre = request.getParameter("genre");
	String director = request.getParameter("director");
	String cast = request.getParameter("cast");
	String description = request.getParameter("description");
	Date releaseDate = DateUtils.toDate(request.getParameter("releaseDate"));
	
	
	// Movie객체를 생성해서 요청파라미터 값 저장
	Movie movie = new Movie();
	movie.setNo(no);
	movie.setRank(rank);
	movie.setTitle(title);
	movie.setGenre(genre);
	movie.setDirector(director);
	movie.setCast(cast);
	movie.setDescription(description);
	movie.setReleaseDate(releaseDate);
	
	// 업무로직 수행 - 새 영화정보를 저장시킨다. 
	ManagerMovieDao managerMovieDao = ManagerMovieDao.getInstance();
	managerMovieDao.insertMovie(movie);
	
	// 재요청URL 응답
	response.sendRedirect("list.jsp");

%>