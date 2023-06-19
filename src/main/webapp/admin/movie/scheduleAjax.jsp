<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="dao.TheaterDao"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Schedule"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.ScheduleDao"%>
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
      int movieNo = Integer.parseInt(request.getParameter("qNo"));
      String scheduleDate = request.getParameter("qDate");
	
	
	ScheduleDao dao=ScheduleDao.getInstance();
	List<Schedule> schedules = dao.getSchedules(scheduleDate, movieNo);
	
	List<String> list = new ArrayList<>();
	for (Schedule schedule : schedules){
	String s=schedule.getTheaterNo()+" "+schedule.getTimeNo();
	list.add(s);
	}
	
	
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
  	String json=gson.toJson(list);
%>
<%= json %>