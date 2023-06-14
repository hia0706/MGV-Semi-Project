<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.AdminMemberDao"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");	

	AdminMemberDao amDao = AdminMemberDao.getInstance();
	Member member = amDao.getMemberById(loginId);
	if(loginId == null) {
		response.sendRedirect("../member/loginform.jsp?err&job=" + URLEncoder.encode("복구기능", "utf-8"));
		return;
	}
	if (!"ADMIN".equals(loginType)) {
		response.sendRedirect("../admin/member/detail.jsp?err=type");
		return;
	}
	
	
	
%>