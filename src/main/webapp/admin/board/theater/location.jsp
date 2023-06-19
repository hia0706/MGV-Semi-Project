<%@page import="dao.TheaterBoardDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.Theater"%>
<%@page import="java.util.List"%>
<%@page import="dao.TheaterDao"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%
	int locationNo = Integer.parseInt(request.getParameter("no"));

	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	List<Theater> theaters = theaterBoardDao.getTheatersByLocationNo(locationNo);
	
	Gson gson = new Gson();
	String text = gson.toJson(theaters);	
	
	out.write(text);
%>
