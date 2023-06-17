<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	if(loginId == null) {
		response.sendRedirect("../member/login/form.jsp?req&job=" + URLEncoder.encode("탈퇴복구", "utf-8"));
		return;
	}
	
	member.setDisabled("No");
	
	memberDao.updateMember(member);
	
	response.sendRedirect("detail.jsp?id=" + loginId);
	
%>