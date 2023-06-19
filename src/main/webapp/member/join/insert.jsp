<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 회원으로 회원가입 시킨다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String referee = request.getParameter("referee");
	
	MemberDao memberDao = MemberDao.getInstance();
	if (memberDao.getMemberById(id) != null) {
		response.sendRedirect("join/form.jsp?err=dup");
		return;
	}
	
	Member member = new Member();
	member.setId(id);
	member.setPassword(password);
	member.setName(name);
	member.setGender(gender);
	member.setEmail(email);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	member.setBirth(birth);
	member.setTel(tel);
	member.setReferee(referee);
	
	memberDao.insertMember(member);
	
	response.sendRedirect("/mgv/home.jsp");
%>