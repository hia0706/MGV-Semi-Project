<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@page import="javax.swing.RepaintManager"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 로그인처리
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String type = request.getParameter("type");
	
	if ("MEMBER".equals(type)) {
		MemberDao memberDao = MemberDao.getInstance();
		Member member = memberDao.getMemberById(id);
		if (member == null) {
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
		if (!member.getPassword().equals(password)) {
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
		
		session.setAttribute("loginId", member.getId());
		session.setAttribute("loginType", "MEMBER");
		
		response.sendRedirect("home.jsp");
	}
	
	
%>