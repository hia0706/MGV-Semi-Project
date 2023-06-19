<%@page import="vo.Payment"%>
<%@page import="dao.PaymentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	PaymentDao paymentDao = PaymentDao.getInstance();
	Payment payment = paymentDao.getPaymentByNo(no);
	
	payment.setDelete("Y");
	
	paymentDao.updatePayment(payment);
	
	response.sendRedirect("paylist.jsp");
	
	
	
%>