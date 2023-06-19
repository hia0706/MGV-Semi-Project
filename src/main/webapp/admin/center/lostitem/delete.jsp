<%@page import="vo.Lostitem"%>
<%@page import="dao.LostitemDao"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	String type = (String) session.getAttribute("loginType");			

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("문의글 삭제", "utf-8"));
		return;
	}
	
	if (!"ADMIN".equals(type)) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}

	//요청파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));

	LostitemDao lostitemDao = LostitemDao.getInstance();
	Lostitem lostitem = lostitemDao.getLostitemByNo(no);
	
	lostitem.setDeleted("Y");
	lostitemDao.updateLostitem(lostitem);
	
	response.sendRedirect("list.jsp"); 
%>
