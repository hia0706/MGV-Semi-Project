<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="dao.OneononeDao"%>
<%@page import="vo.Member"%>
<%@page import="vo.Oneonone"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 신규 1:1 문의글을 등록시킨다.
	
	// 세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../member/login/form.jsp?err=req&job="+URLEncoder.encode("문의내역 확인", "utf-8"));
		return;
	}
		

	// 요청 파라미터값 조회
	int locationNo = Integer.parseInt(request.getParameter("locationNo"));
	int theaterNo = Integer.parseInt(request.getParameter("theaterNo"));
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// OneonOne객체를 생성해서 요청파라미터값 저장하기
	Oneonone oneonone = new Oneonone();
	oneonone.setLocation(new Location(locationNo));
	oneonone.setTheater(new Theater(theaterNo));
	oneonone.setTitle(title);
	oneonone.setContent(content);
	
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