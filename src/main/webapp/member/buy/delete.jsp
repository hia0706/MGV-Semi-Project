<%@page import="vo.Payment"%>
<%@page import="dao.PaymentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	if (member == null) {
		response.sendRedirect("../login/form.jsp?err=req&job=" + URLEncoder.encode("내역삭제", "utf-8"));
		return;
	}
	
	PaymentDao paymentDao = PaymentDao.getInstance();
	Payment payment = paymentDao.getPaymentById(loginId);
	
	payment.setDelete("Y");
	
	paymentDao.updatePayment(payment);
	
	response.sendRedirect("paylist.jsp");
	
	
	
%>