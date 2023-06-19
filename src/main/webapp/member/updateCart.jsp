<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");

	CartDao cartDao = CartDao.getInstance();
	cartDao.updateCart(loginId);
	
	response.sendRedirect("../home.jsp");	
	
%>