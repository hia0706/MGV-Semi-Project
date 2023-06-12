<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	String disabled = request.getParameter("disabled");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	
	if ("Yes".equals(member.getDisabled())) {
		response.sendRedirect("detail.jsp?err=req&job=" + URLEncoder.encode("정보수정", "utf-8"));
		return;
	}
	member.setDisabled("Yes");
	
	memberDao.updateMember(member);
	
	response.sendRedirect("detail.jsp");
	
%>