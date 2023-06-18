<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@page import="javax.swing.RepaintManager"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String type = request.getParameter("type");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("form.jsp?err=fail");
		return;
	}
	
	if (!member.getPassword().equals(password)) {
		response.sendRedirect("form.jsp?err=fail");
		return;
	}
	
	if ("Yes".equals(member.getDisabled())) {
		response.sendRedirect("form.jsp?err=disabled");
		return;
	}
	
	session.setAttribute("loginId", member.getId());
	
	if ("MEMBER".equals(type)) {
		if ("ADMIN".equals(member.getType())) {
		
			response.sendRedirect("form.jsp?err=admin");
			return;
		}
		session.setAttribute("loginType", "MEMBER");
		response.sendRedirect("/mgv/home.jsp");
		
	} else if ("ADMIN".equals(type)) {
		if ("MEMBER".equals(member.getType())) {
			
			response.sendRedirect("form.jsp?err=member");
			return;
		}
		session.setAttribute("loginType", "ADMIN");
		response.sendRedirect("/mgv/admin/home.jsp");
	}
%>