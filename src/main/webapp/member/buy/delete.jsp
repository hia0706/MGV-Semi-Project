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
	PaymentDao paymentDao = PaymentDao.getInstance();
	if (member == null) {
		response.sendRedirect("../login/form.jsp?err=req&job=" + URLEncoder.encode("내역삭제", "utf-8"));
		return;
	}

	int no = Integer.parseInt(request.getParameter("no"));
	paymentDao.deletePaymentByNo(no);
	
	response.sendRedirect("paylist.jsp");
	
	
	
%>