<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) request.getParameter("loginId");
	String loginType = (String) request.getParameter("loginType");
	String disabled = request.getParameter("disabled");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	
	member.setDisabled("Yes");
	
	memberDao.updateMember(member);
	
	response.sendRedirect("detail.jsp");
	
%>