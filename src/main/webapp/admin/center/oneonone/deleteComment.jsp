<%@page import="dao.OneononeCommentDao"%>
<%@page import="vo.OneononeComment"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	
	if (member == null) {
		response.sendRedirect("../../../member/loginform.jsp?err=req&job="+URLEncoder.encode("고객센터", "utf-8"));
		return;
	}

	//요청 파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	int cno = Integer.parseInt(request.getParameter("cno")); 
	
	
	// oneononeComment 생성해서 요청파라미터 값 및 관리자정보 저장하기
	OneononeCommentDao oneononeCommentDao = OneononeCommentDao.getInstance();
	OneononeComment oneononeComment = oneononeCommentDao.getCommentByNo(cno);
	
	oneononeComment.setDeleted("Y");
	oneononeCommentDao.updateCommentByNo(oneononeComment);
	
	// detail.jsp를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("detail.jsp?no=" +no);
%>