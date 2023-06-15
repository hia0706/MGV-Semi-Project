<%@page import="vo.Notice"%>
<%@page import="dao.NoticeDao"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	
	if (member == null) {
		response.sendRedirect("../../../member/loginform.jsp?err=req&job="+URLEncoder.encode("문의글 삭제", "utf-8"));
		return;
	}

	//요청파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));

	NoticeDao noticeDao = NoticeDao.getInstance();
	Notice notice = noticeDao.getNoticeByNo(no);
	
	notice.setDeleted("Y");
	noticeDao.updatenotice(notice);
	
	response.sendRedirect("list.jsp"); 
%>