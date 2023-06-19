<%@page import="dao.ManagerTheaterDao"%>
<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//파라미터 극장번호
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	//극장번호로 극장정보 가져오기
	TheaterDao theaterDao = TheaterDao.getInstance();
	Theater theater = theaterDao.getTheaterByNo(theaterNo);
	
	theater.setDisabled("Y");
	
	ManagerTheaterDao managerTheaterDao = new ManagerTheaterDao();
	managerTheaterDao.updateTheater(theater);
	
	response.sendRedirect("detail.jsp?no=" + theaterNo);
%>