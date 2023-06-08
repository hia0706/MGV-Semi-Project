<%@page import="dao.ManagerTheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="vo.Theater"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int tno = Integer.parseInt(request.getParameter("tno"));
	String name = request.getParameter("name");
	int lno = Integer.parseInt(request.getParameter("lno"));
	String tel = request.getParameter("tel");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	Theater theater = new Theater();
	Location location = new Location();
	theater.setLocation(location);
	
	theater.setNo(tno);
	theater.setName(name);
	location.setNo(lno);
	theater.setAddress1(address1);
	theater.setAddress2(address2);
	theater.setTel(tel);
	
	ManagerTheaterDao managerTheaterDao = new ManagerTheaterDao();
	managerTheaterDao.insertTheater(theater);
	
	response.sendRedirect("list.jsp");
%>