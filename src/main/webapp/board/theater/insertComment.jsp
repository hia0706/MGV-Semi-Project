<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.TboardCommentDao"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="vo.Member"%>
<%@page import="vo.TboardComment"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");

	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("댓글등록", "utf-8"));
		return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("content");
	
	// 댓글 객체 생성후 댓글 정보 담기
	TboardComment tboardComment = new TboardComment();
	tboardComment.setContent(content);
	
	Member member = new Member();
	member.setId(loginId);
	tboardComment.setMember(member);

	TheaterBoard theaterBoard = new TheaterBoard();
	theaterBoard.setNo(boardNo);
	tboardComment.setTheaterBoard(theaterBoard);
	
	// 정보가 담긴 댓글 객체를 insert 한다.
	TboardCommentDao tboardCommentDao = TboardCommentDao.getInstance();
	tboardCommentDao.insertCommentToTboard(tboardComment);
	
	// boardNo로 게시물을 조회한다.
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	TheaterBoard theaterBoard2 = theaterBoardDao.getTheaterBoardByNo(boardNo);
	
	// 조회된 게시물의 commentCnt를 +1하여 저장한다.
	theaterBoard2.setCommentCnt(theaterBoard2.getCommentCnt() + 1);
	
	// commentCnt가 1증가한 게시물 정보를 DB에 UPDATE한다.
	theaterBoardDao.updateTheaterBoard(theaterBoard2);
	
	// url 재요청
	response.sendRedirect("detail.jsp?no="+boardNo);
	
%>