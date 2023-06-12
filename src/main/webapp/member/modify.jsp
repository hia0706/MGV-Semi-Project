<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="java.sql.Date"%>
<%@page import="java.awt.PageAttributes.OrientationRequestedType"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	if ("Yes".equals(member.getDisabled())) {
		response.sendRedirect("detail.jsp?err=disabled");
		return;
	}
	
	member.setName(name);
	member.setPassword(password);
	member.setBirth(birth);
	member.setTel(tel);
	member.setEmail(email);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	
	memberDao.updateMember(member);
	
	response.sendRedirect("detail.jsp?id=" + loginId);
	
%>
