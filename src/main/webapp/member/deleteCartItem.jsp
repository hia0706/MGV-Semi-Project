<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	int cartNo = Integer.parseInt(request.getParameter("no"));

	CartDao cartDao = CartDao.getInstance();
	cartDao.deleteCartItem(cartNo);
	
	// 재요청 URL 보내기
	response.sendRedirect("user-cart.jsp");
%>