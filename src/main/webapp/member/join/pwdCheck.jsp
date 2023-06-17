<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	String password = request.getParameter("password");
	
	MemberDao memberDao	= MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	if (!member.getPassword().equals(password)) {
		response.sendRedirect("pwdCheckform.jsp?err=fail");
		return;
	}

	response.sendRedirect("../info/modifyform.jsp?id=" + member.getId());
	
%>