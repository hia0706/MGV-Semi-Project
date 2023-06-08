<%@page import="dao.ManagerTheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="vo.Theater"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
<<<<<<< HEAD
	// 요청 파라미터 조회
=======
>>>>>>> feature/hawon
	int tno = Integer.parseInt(request.getParameter("tno"));
	String name = request.getParameter("name");
	int lno = Integer.parseInt(request.getParameter("lno"));
	String tel = request.getParameter("tel");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	Theater theater = new Theater();
<<<<<<< HEAD
	theater.setNo(tno);
	theater.setName(name);
=======
	Location location = new Location();
	theater.setLocation(location);
	
	theater.setNo(tno);
	theater.setName(name);
	location.setNo(lno);
>>>>>>> feature/hawon
	theater.setAddress1(address1);
	theater.setAddress2(address2);
	theater.setTel(tel);
	
<<<<<<< HEAD
	Location location = new Location();
	location.setNo(lno);
	theater.setLocation(location);
	
	// 업무로직 수행 - 새 상품정보를 db에 저장시킨다.
	ManagerTheaterDao managerTheaterDao = new ManagerTheaterDao();
	managerTheaterDao.insertTheater(theater);
	
	// 재요청 URL응답
=======
	ManagerTheaterDao managerTheaterDao = new ManagerTheaterDao();
	managerTheaterDao.insertTheater(theater);
	
>>>>>>> feature/hawon
	response.sendRedirect("list.jsp");
%>