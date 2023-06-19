<%@page import="vo.Product"%>
<%@page import="vo.Member"%>
<%@page import="vo.Payment"%>
<%@page import="dao.PaymentDao"%>
<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");

	CartDao cartDao = CartDao.getInstance();
	cartDao.updateCart(loginId);
	
	response.sendRedirect("../member/buy/paylist.jsp");	
	
%>