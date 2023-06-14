<%@page import="dao.LostitemDao"%>
<%@page import="dao.LostitemCommentDao"%>
<%@page import="vo.Member"%>
<%@page import="vo.Lostitem"%>
<%@page import="vo.LostitemComment"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//요청 파라미터값 조회
	int lostitemNo = Integer.parseInt(request.getParameter("lostitemNo"));
	String content = request.getParameter("content");
	
	// 세션에 속성으로 저장된 로그인한 고객의 아이디 조회하기
	String id = (String) session.getAttribute("loginId");
	
	// lostitemComment객체를 생성해서 요청파라미터 값 밑 관리자정보 저장하기
	LostitemComment lostitemComment = new LostitemComment();
	lostitemComment.setContent(content);
	lostitemComment.setLostitem(new Lostitem(lostitemNo));
	lostitemComment.setMember(new Member(id));
	
	// Comment객체에 저장된 커멘트정보를 테이블에 저장시킨다.
	LostitemCommentDao lostitemCommentDao = LostitemCommentDao.getInstance();
	lostitemCommentDao.insertComment(lostitemComment); 
	
	// 글번호로 게시글 정보 조회
	LostitemDao lostitemDao = LostitemDao.getInstance();
	Lostitem lostitem = lostitemDao.getLostitemByNo(lostitemNo);
	
	// 게시글 정보를 "답변완료"로 update
	lostitem.setAnswered("Y"); 
	lostitemDao.updateLostitem(lostitem);
	
	// detail.jsp를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("detail.jsp?no=" +lostitemNo);
%>