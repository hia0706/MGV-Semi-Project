<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	int payment = Integer.parseInt(request.getParameter("payment"));
	int productNo = Integer.parseInt(request.getParameter("no"));
%>
