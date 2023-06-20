<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="vo.Movie"%>
<%@page import="dao.ManagerMovieDao"%>
<%@page import="com.google.gson.JsonArray"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
      String q = request.getParameter("q");
	
	ManagerMovieDao dao=ManagerMovieDao.getInstance();
	Movie movie=dao.getMovieByTitle(q);
	
	String json="";
	if (movie!=null){
	
	movie.setPosterURL(movie.getMainPoster());

	}else{
		movie=new Movie();
		movie.setNo(0);
	}
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
    json =gson.toJson(movie);
%>
<%= json %>