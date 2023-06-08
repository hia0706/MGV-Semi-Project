<%@page import="dao.ManagerTheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="vo.Theater"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int tno = Integer.parseInt(request.getParameter("tno"));
	String name = request.getParameter("name");
	int lno = Integer.parseInt(request.getParameter("lno"));
	String tel = request.getParameter("tel");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	Theater theater = new Theater();
	theater.setNo(tno);
	theater.setName(name);
	theater.setAddress1(address1);
	theater.setAddress2(address2);
	theater.setTel(tel);
	
	Location location = new Location();
	location.setNo(lno);
	theater.setLocation(location);
	
	// 업무로직 수행 - 새 상품정보를 db에 저장시킨다.
	ManagerTheaterDao managerTheaterDao = new ManagerTheaterDao();
	managerTheaterDao.insertTheater(theater);
	
	// 재요청 URL응답
	response.sendRedirect("list.jsp");
%>