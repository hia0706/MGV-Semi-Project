<%@page import="util.DateUtils"%>
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

String[] schedules = request.getParameterValues("q[]");
int movieNo= Integer.parseInt(request.getParameter("mNo"));
String date=request.getParameter("date");
ScheduleDao sDao= ScheduleDao.getInstance();
sDao.clearDailySchedules(date, movieNo);



for (String s : schedules){
	Schedule schedule= new Schedule();
	String[] ss= s.split("-");
	int tNo=Integer.parseInt(ss[1]);
	int timeNo=Integer.parseInt(ss[2]);
	schedule.setKey(date+"&"+movieNo+"&"+tNo+"&"+timeNo);
	schedule.setMovieNo(movieNo);
	schedule.setTimeNo(timeNo);
	schedule.setTheaterNo(tNo);
	schedule.setOpenDate(DateUtils.toDate(date));
	sDao.insertSchedule(schedule);
}


%>

