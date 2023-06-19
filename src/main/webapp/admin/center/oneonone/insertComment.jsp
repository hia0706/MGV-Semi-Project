<%@page import="dao.OneononeDao"%>
<%@page import="dao.OneononeCommentDao"%>
<%@page import="vo.Oneonone"%>
<%@page import="vo.OneononeComment"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//요청 파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("content");
	
	// 세션에 속성으로 저장된 로그인한 고객의 아이디 조회하기
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
	
	// oneononeComment객체를 생성해서 요청파라미터 값 밑 관리자정보 저장하기
	OneononeComment oneononeComment = new OneononeComment();
	oneononeComment.setContent(content);
	oneononeComment.setOneonone(new Oneonone(no));
	oneononeComment.setMember(new Member(id));

	// Comment객체에 저장된 커멘트정보를 테이블에 저장시킨다.
	OneononeCommentDao oneononeCommentDao = OneononeCommentDao.getInstance();
	oneononeCommentDao.insertComment(oneononeComment);
	
	// 글번호로 게시글 정보 조회
	OneononeDao oneononeDao = OneononeDao.getInstance();
	Oneonone oneonone = oneononeDao.getOneononeByNo(no);
	
	// 게시글 정보를 "답변완료"로 update
	oneonone.setAnswered("Y");
	oneononeDao.updateOneonone(oneonone);

	// detail.jsp를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("detail.jsp?no=" +no);
%>