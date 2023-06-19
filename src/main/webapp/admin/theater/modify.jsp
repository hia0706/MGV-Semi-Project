<%@page import="dao.TheaterDao"%>
<%@page import="dao.ManagerTheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="vo.Theater"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회

	int tno = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address1")+request.getParameter("address2");
	String parkingInfo = request.getParameter("parkingInfo");
	String parkingFee = request.getParameter("parkingFee");
	
	TheaterDao theaterDao = TheaterDao.getInstance();
	
	Theater theater = theaterDao.getTheaterByNo(tno);
	theater.setNo(tno);
	theater.setName(name);
	theater.setAddress(address);
	theater.setTel(tel);
	theater.setParkingInfo(parkingInfo);
	theater.setParkingFee(parkingFee);
	

	
	// 업무로직 수행 - 새 상품정보를 db에 저장시킨다.
	ManagerTheaterDao managerTheaterDao = new ManagerTheaterDao();
	managerTheaterDao.updateTheater(theater);
	
	// 재요청 URL응답
	response.sendRedirect("list.jsp");
%>