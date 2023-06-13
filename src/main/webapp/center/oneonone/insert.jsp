<%@page import="dao.OneononeDao"%>
<%@page import="vo.Member"%>
<%@page import="vo.Oneonone"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 신규 1:1 문의글을 등록시킨다.
	
	// 세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");

	

	// 요청 파라미터값 조회
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// OneonOne객체를 생성해서 요청파라미터값 저장하기
	Oneonone oneonone = new Oneonone();
	oneonone.setTitle(title);
	oneonone.setContent(content);
	
	Member member = new Member();
	member.setId(id);
	member.setName(name);
	member.setTel(tel);
	member.setEmail(email);
	oneonone.setMember(member);
	
	// 업무로직 수행 - 세 1:1문의글 정보를 저장시킨다.
	OneononeDao oneononeDao = OneononeDao.getInstance();
	oneononeDao.insertOneonOne(oneonone);
	
	// 재요청URL 응답
	response.sendRedirect("insertform.jsp");
%>