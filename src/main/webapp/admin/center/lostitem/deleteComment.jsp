<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.LostitemDao"%>
<%@page import="dao.LostitemCommentDao"%>
<%@page import="vo.Member"%>
<%@page import="vo.Lostitem"%>
<%@page import="vo.LostitemComment"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	String type = (String) session.getAttribute("loginType");		
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터", "utf-8"));
		return;
	}
	
	if (!"ADMIN".equals(type)) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}

	//요청 파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	int cno = Integer.parseInt(request.getParameter("cno")); 
	
	
	// lostitemComment객체를 생성해서 요청파라미터 값 밑 관리자정보 저장하기
	LostitemCommentDao lostitemCommentDao = LostitemCommentDao.getInstance();
	LostitemComment lostitemComment = lostitemCommentDao.getCommentByNo(cno);
	
	lostitemComment.setDeleted("Y");
	lostitemCommentDao.updateCommentByNo(lostitemComment); 
		
	
	// detail.jsp를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("detail.jsp?no=" +no);
%>