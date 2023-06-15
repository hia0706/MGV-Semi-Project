<%@page import="vo.Notice"%>
<%@page import="dao.NoticeDao"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다
	String id = (String) session.getAttribute("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../../member/loginform.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}
	
	// 요청 파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 요청파라미터로 전달받은 글 번호로 글조회
	NoticeDao noticeDao = NoticeDao.getInstance();
	Notice notice = noticeDao.getNoticeByNo(no);
	
	notice.setTitle(title);
	notice.setContent(content);
	
	noticeDao.updatenotice(notice);
	
	response.sendRedirect("detail.jsp?no=" +no);
	
%>