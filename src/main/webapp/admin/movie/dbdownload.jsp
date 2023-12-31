<%@page import="java.util.HashSet"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="vo.Movie"%>
<%@page import="dao.ManagerMovieDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

JsonParser parser = new JsonParser();
String dbPath=System.getenv("PROJECT_HOME")+"\\src\\main\\webapp\\admin\\movie\\moviedb.json";
Object obj = parser.parse(new BufferedReader(new FileReader(dbPath)));
JsonArray aj= (JsonArray) obj;
Gson gson= new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").setPrettyPrinting().create();


Movie[] movies= gson.fromJson(aj, Movie[].class);


ManagerMovieDao managerMovieDao= ManagerMovieDao.getInstance();
HashSet<Integer> movieNos= 	managerMovieDao.getMovieNos();

for (Movie movie: movies){
	if (movieNos.contains(movie.getNo())){
		managerMovieDao.updateMovie(movie);
	}else {
		managerMovieDao.insertMovie(movie);
	}
}




response.sendRedirect("list.jsp");

%>